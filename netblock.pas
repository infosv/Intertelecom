unit netblock;
////////////////////////////////////////////////////////////////////////////////
//
//    Unit           :  NETBLOCK
//   Date           :  05.25.2004
//    Description    :  TCPIP network connection blocking unit
//
////////////////////////////////////////////////////////////////////////////////
interface

////////////////////////////////////////////////////////////////////////////////
//    Include units
////////////////////////////////////////////////////////////////////////////////
uses
   Windows,
  MMSystem;

////////////////////////////////////////////////////////////////////////////////
//    IPHLPAPI data structures
////////////////////////////////////////////////////////////////////////////////
type
   PMIB_TCPROW       =  ^MIB_TCPROW;
  MIB_TCPROW        =  packed  record
     dwState:       DWORD;
     dwLocalAddr:   DWORD;
      dwLocalPort:   DWORD;
     dwRemoteAddr:  DWORD;
      dwRemotePort:  DWORD;
  end;

  PMIB_TCPTABLE     =   ^MIB_TCPTABLE;
  MIB_TCPTABLE      =  packed record
      dwNumEntries:  DWORD;
     Table:         Array [0..MaxWord] of  MIB_TCPROW;
  end;

type
  TGetTcpTable      =   function(pTcpTable: PMIB_TCPTABLE; dwSize: PDWORD; bOrder: BOOL):  DWORD; stdcall;
  TSetTcpEntry      =  function(pTcpRow:  PMIB_TCPROW): DWORD; stdcall;

////////////////////////////////////////////////////////////////////////////////
//    IPHLPAPI constants
////////////////////////////////////////////////////////////////////////////////
const
   IPHLPAPI_NAME           =  'iphlpapi.dll';
  GETTCPTABLE_NAME         =  'GetTcpTable';
  SETTCPENTRY_NAME        =  'SetTcpEntry';

const
   MIB_TCP_STATE_DELETE_TCB= 12;

////////////////////////////////////////////////////////////////////////////////
//    NetBlock constants
////////////////////////////////////////////////////////////////////////////////
const
   NB_TABLE_SIZE     =  1024;

const
  NB_BLOCK_NONE     =  0;
   NB_BLOCK_INTERNET =  1;
  NB_BLOCK_ALL      =  2;

////////////////////////////////////////////////////////////////////////////////
//    NetBlock data structures
////////////////////////////////////////////////////////////////////////////////
type
   PNetBlockInfo     =  ^TNetBlockInfo;
  TNetBlockInfo     =  packed  record
     dwBlockMode:   DWORD;
     dwResolution:  DWORD;
      dwTimer:       DWORD;
  end;

////////////////////////////////////////////////////////////////////////////////
//    NetBlock functions
////////////////////////////////////////////////////////////////////////////////
function    SetNetBlock(lpNetBlockInfo: PNetBlockInfo): DWORD;
function    StatNetBlock(lpNetBlockInfo: PNetBlockInfo): DWORD;
procedure   StopNetBlock;

var
  x:       DWORD = 0;

implementation

////////////////////////////////////////////////////////////////////////////////
//    Protected variables
////////////////////////////////////////////////////////////////////////////////
var
   hIphlp:           HMODULE        =  0;
  dwResolution:     DWORD           =  0;
  dwBlockMode:      DWORD          =  0;
  dwTimer:           DWORD          =  0;
  dwProcError:      DWORD          =  0;
   _GetTcpTable:     TGetTcpTable   =  nil;
  _SetTcpEntry:      TSetTcpEntry   =  nil;

procedure NetBlockTimerProc(uTimerID,  uMessage: UINT; dwUser, dw1, dw2: DWORD); stdcall;
var  lpTable:        PMIB_TCPTABLE;
     lpRow:         PMIB_TCPROW;
     bRemove:        Boolean;
     dwReturn:      DWORD;
     dwSize:         DWORD;
begin

  Inc(x);

  // Start with an optimal  table size
  dwSize:=(NB_TABLE_SIZE * SizeOf(MIB_TCPROW)) +  SizeOf(DWORD);

  // Allocate memory for the table
   GetMem(lpTable, dwSize);

  // Get the table
   dwReturn:=_GetTcpTable(lpTable, @dwSize, False);

  // We may  have to reallocate and try again
  if (dwReturn =  ERROR_INSUFFICIENT_BUFFER) then
  begin
     // Reallocate  memory for new table
     ReallocMem(lpTable, dwSize);
     //  Make the call again
     dwReturn:=_GetTcpTable(lpTable,  @dwSize, False);
  end;

  // Check for succes
  if  (dwReturn = ERROR_SUCCESS) then
  begin
     // Iterate the table
      for dwSize:=0 to Pred(lpTable^.dwNumEntries) do
     begin
         // Get the row
        lpRow:=@lpTable^.Table[dwSize];
         // Check for 0.0.0.0 address
        if (lpRow^.dwLocalAddr =  0) or (lpRow^.dwRemoteAddr = 0) then Continue;
        // What  blocking mode are we in
        case dwBlockMode of
           //  Need to check the first two bytes in network address
            NB_BLOCK_INTERNET :  bRemove:=not(Word(Pointer(@lpRow^.dwLocalAddr)^)  = Word(Pointer(@lpRow^.dwRemoteAddr)^));
           //  Need to check all four bytes in network address
            NB_BLOCK_ALL      :  bRemove:=not(lpRow^.dwLocalAddr =  lpRow^.dwRemoteAddr);
        else
           // No checking
            bRemove:=False;
        end;
        // Do we need to  remove the entry?
        if bRemove then
        begin
            // Set entry state
           lpRow^.dwState:=MIB_TCP_STATE_DELETE_TCB;
            // Remove the TCP entry
           _SetTcpEntry(lpRow);
         end;
     end;
  end;

  // Free the table
   FreeMem(lpTable);

end;

function StatNetBlock(lpNetBlockInfo:  PNetBlockInfo): DWORD;
begin

  // Parameter check
  if  not(Assigned(lpNetBlockInfo)) then
     // Null buffer
      result:=ERROR_INVALID_PARAMETER
  else
  begin
     //  Fill in the current settings
     lpNetBlockInfo^.dwResolution:=dwResolution;
      lpNetBlockInfo^.dwBlockMode:=dwBlockMode;
      lpNetBlockInfo^.dwTimer:=dwTimer;
     // Success
      result:=ERROR_SUCCESS;
  end;

end;

function  SetNetBlock(lpNetBlockInfo: PNetBlockInfo): DWORD;
begin

   // Parameter check
  if not(Assigned(lpNetBlockInfo)) then
   begin
     // Treat the same way as if StopNetBlock had been called
      StopNetBlock;
     // Success
     result:=ERROR_SUCCESS;
   end
  else if (@_GetTcpTable = @_SetTcpEntry) then
     // Failed  to load library or get the function pointers
      result:=dwProcError
  else if (lpNetBlockInfo^.dwResolution =  0) then
     // Invalid time specified
      result:=ERROR_INVALID_PARAMETER
  else if  (lpNetBlockInfo^.dwBlockMode > NB_BLOCK_ALL) then
     //  Invalid blocking mode
     result:=ERROR_INVALID_PARAMETER
   else
  begin
     // Kill the current timer if the blocking is  running
     if (dwTimer > 0) then timeKillEvent(dwTimer);
      // Clear timer tracking handle
     dwTimer:=0;
     // Save off  the current block mode and resolution
     dwBlockMode:=lpNetBlockInfo^.dwBlockMode;
      dwResolution:=lpNetBlockInfo^.dwResolution;
     // If  the block mode is NB_BLOCK_NONE then nothing to do
     if  (dwBlockMode = NB_BLOCK_NONE) then
        // Success
         result:=ERROR_SUCCESS
     else
     begin
        // Create  the timer to handle the network blocking
         dwTimer:=timeSetEvent(lpNetBlockInfo^.dwResolution, 0,  @NetBlockTimerProc, 0, TIME_PERIODIC or TIME_CALLBACK_FUNCTION);
         // Check timer handle
        if (dwTimer = 0) then
            // Failure
           result:=GetLastError
        else
            // Succes
           result:=ERROR_SUCCESS;
     end;
   end;

end;

procedure StopNetBlock;
begin

  //  This will stop the current net blocking
  if (dwTimer > 0) then
   begin
     // Kill the timer
     timeKillEvent(dwTimer);
      // Reset all values
     dwBlockMode:=NB_BLOCK_NONE;
      dwResolution:=0;
     dwTimer:=0;
  end;

end;

initialization

   // Load the ip helper api library
  hIphlp:=LoadLibrary(IPHLPAPI_NAME);

   // Attempt to get the function addresses
  if (hIphlp > 0) then
   begin
     @_GetTcpTable:=GetProcAddress(hIpHlp,  GETTCPTABLE_NAME);
     if not(Assigned(@_GetTcpTable)) then
         dwProcError:=GetLastError
     else
     begin
         @_SetTcpEntry:=GetProcAddress(hIpHlp, SETTCPENTRY_NAME);
         if not(Assigned(@_SetTcpEntry)) then dwProcError:=GetLastError
      end;
  end
  else
     // Save off the error
      dwProcError:=GetLastError;

finalization

  // Kill  the timer if running
  if (dwTimer > 0) then  timeKillEvent(dwTimer);

  // Clear functions
   @_GetTcpTable:=nil;
  @_SetTcpEntry:=nil;

  // Free the ip  helper api library
  if (hIphlp > 0) then FreeLibrary(hIphlp);

end.
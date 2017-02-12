Unit mxProtector;
  {$WARNINGS OFF}
{$HINTS OFF}
Interface

// *************************************************************************************
// ** List of used units
// *************************************************************************************

Uses
     Windows,
     SysUtils,
     Dialogs,
     ActiveX,
     ComObj,
     Classes;

{$I MAX.INC}

Const
     mxProtectorVersion = $011F; // ** 1.31 **

Type
     // ************************************************************************
     // ************************************************************************
     // ************************************************************************

     TmxRegistryRootKey = ( rkCurrentUser, rkLocalMachine );

     TmxProtectionType = ( stDayTrial, stPassword, stRegister, stStartTrial, stTimeTrial );
     TmxProtectionTypeSet = Set Of TmxProtectionType;

     TmxProtectionOption = ( poAutoInit, poCheckSytemTime, poPasswordOnce, poUseHardwareKey, poUniqueHardwareID, poWorkAfterExpiration );
     TmxProtectionOptionSet = Set Of TmxProtectionOption;

     TmxRegistrationType = ( rtUnknown, rtRegistered, rtUnRegistered );

     // ************************************************************************
     // ************************************************************************
     // ************************************************************************

     TEventOnCodeData = Procedure( Sender: TObject; Var ACode: String ) Of Object;
     TEventOnReset = Procedure( Sender: TObject; Var Handled: Boolean ) Of Object;
     TEventOnGetRegistryPath = Procedure( Sender: TObject; Var APath: String ) Of Object;
     TEventOnGetString = Procedure( Sender: TObject; Var APath: String; Var AKey: String; Var AResult: String; Var Handled: Boolean ) Of Object;
     TEventOnGetBoolean = Procedure( Sender: TObject; Var APath: String; Var AKey: String; Var AResult: Boolean; Var Handled: Boolean ) Of Object;
     TEventOnPutString = Procedure( Sender: TObject; Var APath: String; Var AKey: String; Var ASavedData: String; Var Handled: Boolean ) Of Object;
     TEventOnPutBoolean = Procedure( Sender: TObject; Var APath: String; Var AKey: String; Var ASavedData: Boolean; Var Handled: Boolean ) Of Object;

     TEventOnGetPassword = Procedure( Sender: TObject; Var Password: String ) Of Object;
     TEventOnWrongPassword = Procedure( Sender: TObject; WrongPassword: String ) Of Object;
     TEventOnStartTrial = Procedure( Sender: TObject; StartsRemained: Integer ) Of Object;
     TEventOnTimeTrial = Procedure( Sender: TObject; DaysRemained: Integer ) Of Object;
     TEventOnDayTrial = Procedure( Sender: TObject; DaysRemained: Integer ) Of Object;
     TEventOnInvalidTimeTrial = Procedure( Sender: TObject; DaysRemained: Integer ) Of Object;
     TEventOnGetSerialNumber = Procedure( Sender: TObject; Var UserName, SerialNumber: String ) Of Object;
     TEventOnGetHardwareID = Procedure( Sender: TObject; Var HardwareID: String ) Of Object;
     TEventOnRegister = Procedure( Sender: TObject; UserName, SerialNumber: String ) Of Object;
     TEventOnCheckRegistration = Procedure( Sender: TObject; Var UserName, SerialNumber: String; Var Registered: Boolean ) Of Object;

     // ************************************************************************
     // ************************************************************************
     // ************************************************************************

     TmxProtector = Class( TComponent )
     Private

          FVersion: Integer;
          FRegistryRootKey: TmxRegistryRootKey;

          FOnCodeData: TEventOnCodeData;
          FOnDeCodeData: TEventOnCodeData;
          FOnReset: TEventOnReset;
          FOnGetRegistryPath: TEventOnGetRegistryPath;
          FOnGetString: TEventOnGetString;
          FOnGetBoolean: TEventOnGetBoolean;
          FOnPutString: TEventOnPutString;
          FOnPutBoolean: TEventOnPutBoolean;

          FPassword: String;
          FCodeKey: String;
          FExpiration: TDateTime;
          FMaxStartNumber: Integer;
          FMaxDayNumber: Integer;
          FUniqueID: String;
          FInternalStrPassword: String;
          FProtectionTypes: TmxProtectionTypeSet;
          FOptions: TmxProtectionOptionSet;
          FUserName: String;

          FRegistration: TmxRegistrationType;

          FOnGetPassword: TEventOnGetPassword;
          FOnWrongPassword: TEventOnWrongPassword;
          FOnValidPassword: TNotifyEvent;
          FOnExpiration: TNotifyEvent;
          FOnStartTrial: TEventOnStartTrial;
          FOnTimeTrial: TEventOnTimeTrial;
          FOnDayTrial: TEventOnDayTrial;
          FOnInvalidSystemTime: TNotifyEvent;
          FOnInvalidSerialNumber: TNotifyEvent;
          FOnInitialization: TNotifyEvent;
          FOnUnknownHardware: TNotifyEvent;
          FOnInvalidHardwareID: TNotifyEvent;
          FOnGetHardwareID: TEventOnGetHardwareID;

          FOnBeforeRegister: TNotifyEvent;
          FOnRegister: TEventOnRegister;
          FOnAfterRegister: TNotifyEvent;
          FOnCheckRegistration: TEventOnCheckRegistration;

          FOnGetSerialNumber: TEventOnGetSerialNumber;
          FOnRegisteredVersion: TNotifyEvent;
          FOnUnRegisteredVersion: TNotifyEvent;

          FFirstAfterStart: Boolean;

          Procedure SetVersion( Value: String );
          Function GetVersion: String;

          Procedure SetProtectionTypes( Value: TmxProtectionTypeSet );
          Procedure SetOptions( Value: TmxProtectionOptionSet );
          Procedure SetPassword( Value: String );
          Procedure SetUserName( Value: String );
          Procedure SetCodeKey( Value: String );
          Procedure SetExpiration( Value: TDateTime );
          Procedure SetMaxStartNumber( Value: Integer );
          Procedure SetMaxDayNumber( Value: Integer );

          Procedure ReadUniqueID( Reader: TReader );
          Procedure WriteUniqueID( Writer: TWriter );
          Procedure ReadUniqueCodeID( Reader: TReader );
          Procedure WriteUniqueCodeID( Writer: TWriter );

          Function Delete_Key: Boolean;
          Function Get_String( AKey, ADefval: String ): String;
          Function Get_Boolean( AKey: String; ADefval: Boolean ): Boolean;
          Procedure Put_String( AKey, AVal: String );
          Procedure Put_Boolean( AKey: String; AVal: Boolean );

          Function InternalGetHardwareID: String;

     Protected

          Function CodePassword( Value: String; Internal: Boolean ): String;
          Function DeCodePassword( Value: String; Internal: Boolean ): String;
          Function IncreaseDate( AValue: TDateTime; ADays, AMonths, AYears: Integer ): TDateTime;
          Procedure DefineProperties( Filer: TFiler ); Override;
          Procedure Loaded; Override;
          Function GetRegistryPath: String;
          Function GetRegistryKey: String;

     Public

          Constructor Create( AOwner: TComponent ); Override;
          Destructor Destroy; Override;

          Procedure Init;
          Procedure Reset;

          Procedure CheckPassword;
          Procedure CheckStartTrial;
          Procedure CheckTimeTrial;
          Procedure CheckDayTrial;
          Procedure CheckRegistration;
          Procedure Registration;
          Function IsRegistered: Boolean;
          Function GetRegisteredUserName: String;

          Function GetDayNumber: Longint;
          Function GetLicencedDayNumber: Longint;
          Function GetHardwareID: String;

          Function GenerateSerialNumber( AUserName: String ): String;

     Published

          Property CodeKey: String Read FCodeKey Write SetCodeKey;
          Property Password: String Read FPassword Write SetPassword;
          Property ProtectionTypes: TmxProtectionTypeSet Read FProtectionTypes Write SetProtectionTypes;
          Property Options: TmxProtectionOptionSet Read FOptions Write SetOptions;
          Property RegistryRootKey: TmxRegistryRootKey Read FRegistryRootKey Write FRegistryRootKey;

          Property Expiration: TDateTime Read FExpiration Write SetExpiration;
          Property MaxStartNumber: Integer Read FMaxStartNumber Write SetMaxStartNumber;
          Property MaxDayNumber: Integer Read FMaxDayNumber Write SetMaxDayNumber;
          Property UserName: String Read FUserName Write SetUserName;

          Property Version: String Read GetVersion Write SetVersion;

          Property OnBeforeRegister: TNotifyEvent Read FOnBeforeRegister Write FOnBeforeRegister;
          Property OnRegister: TEventOnRegister Read FOnRegister Write FOnRegister;
          Property OnAfterRegister: TNotifyEvent Read FOnAfterRegister Write FOnAfterRegister;
          Property OnCheckRegistration: TEventOnCheckRegistration Read FOnCheckRegistration Write FOnCheckRegistration;

          Property OnInitialization: TNotifyEvent Read FOnInitialization Write FOnInitialization;
          Property OnGetPassword: TEventOnGetPassword Read FOnGetPassword Write FOnGetPassword;
          Property OnValidPassword: TNotifyEvent Read FOnValidPassword Write FOnValidPassword;
          Property OnWrongPassword: TEventOnWrongPassword Read FOnWrongPassword Write FOnWrongPassword;
          Property OnExpiration: TNotifyEvent Read FOnExpiration Write FOnExpiration;
          Property OnStartTrial: TEventOnStartTrial Read FOnStartTrial Write FOnStartTrial;
          Property OnTimeTrial: TEventOnTimeTrial Read FOnTimeTrial Write FOnTimeTrial;
          Property OnDayTrial: TEventOnDayTrial Read FOnDayTrial Write FOnDayTrial;
          Property OnInvalidSystemTime: TNotifyEvent Read FOnInvalidSystemTime Write FOnInvalidSystemTime;
          Property OnInvalidSerialNumber: TNotifyEvent Read FOnInvalidSerialNumber Write FOnInvalidSerialNumber;
          Property OnGetSerialNumber: TEventOnGetSerialNumber Read FOnGetSerialNumber Write FOnGetSerialNumber;
          Property OnGetHardwareID: TEventOnGetHardwareID Read FOnGetHardwareID Write FOnGetHardwareID;
          Property OnRegisteredVersion: TNotifyEvent Read FOnRegisteredVersion Write FOnRegisteredVersion;
          Property OnInvalidHardwareID: TNotifyEvent Read FOnInvalidHardwareID Write FOnInvalidHardwareID;
          Property OnUnRegisteredVersion: TNotifyEvent Read FOnUnRegisteredVersion Write FOnUnRegisteredVersion;
          Property OnUnknownHardware: TNotifyEvent Read FOnUnknownHardware Write FOnUnknownHardware;

          Property OnCodeData: TEventOnCodeData Read FOnCodeData Write FOnCodeData;
          Property OnDeCodeData: TEventOnCodeData Read FOnDeCodeData Write FOnDeCodeData;
          Property OnReset: TEventOnReset Read FOnReset Write FOnReset;
          Property OnGetRegistryPath: TEventOnGetRegistryPath Read FOnGetRegistryPath Write FOnGetRegistryPath;
          Property OnGetString: TEventOnGetString Read FOnGetString Write FOnGetString;
          Property OnGetBoolean: TEventOnGetBoolean Read FOnGetBoolean Write FOnGetBoolean;
          Property OnPutString: TEventOnPutString Read FOnPutString Write FOnPutString;
          Property OnPutBoolean: TEventOnPutBoolean Read FOnPutBoolean Write FOnPutBoolean;
     End;

Implementation

Uses Registry;

Const
     mxInternalPassword = 'mxProtector';
     mxRegistryPath = '5C534F4654574152455C436C61737365735C434C5349445C';
     //mxRegistryPath = '\SOFTWARE\Classes\CLSID\';

// *************************************************************************************
// *************************************************************************************
// *************************************************************************************
// ** TmxProtector.Create, 5/21/01 9:30:49 AM
// *************************************************************************************
// *************************************************************************************
// *************************************************************************************

Constructor TmxProtector.Create( AOwner: TComponent );
Var
     I: Integer;
     TempStr: String;
     FGUID: TGUID;
Begin
     Inherited Create( AOwner );

     FProtectionTypes := [ stPassword ];
     FOptions := [ poAutoInit, poCheckSytemTime, poPasswordOnce ];
     FCodeKey := 'Ignore';
     FPassword := '';

     CoCreateGuid( FGUID );
     FUniqueID := GUIDToString( FGUID );
     CoCreateGuid( FGUID );
     TempStr := GUIDToString( FGUID );
     FInternalStrPassword := '';
     FUserName := '';

     For I := 1 To Length( TempStr ) Do FInternalStrPassword := FInternalStrPassword + IntToHex( ( Ord( TempStr[ I ] ) Xor I ), 2 );

     FMaxStartNumber := 0;
     FExpiration := IncreaseDate( Now, 0, 1, 0 );
     FVersion := mxProtectorVersion;

     FFirstAfterStart := TRUE;

     FRegistration := rtUnknown;

     FRegistryRootKey:=rkLocalMachine;
End;

// *************************************************************************************
// ** TmxProtector.Destroy, 5/21/01 9:30:56 AM
// *************************************************************************************

Destructor TmxProtector.Destroy;
Begin
     Inherited Destroy;
End;

// *************************************************************************************
// ** TmxProtector.SetVersion, 5/21/01 9:30:38 AM
// *************************************************************************************

Procedure TmxProtector.SetVersion( Value: String );
Begin
        // *** Does nothing ***
End;

// *************************************************************************************
// ** TmxProtector.GetVersion, 5/21/01 9:30:34 AM
// *************************************************************************************

Function TmxProtector.GetVersion: String;
Begin
     Result := Format( '%d.%d', [ Hi( FVersion ), Lo( FVersion ) ] );
End;

// *************************************************************************************
// ** TmxProtector.SetProtectionTypes, 8/21/01 12:38:52 PM
// *************************************************************************************

Procedure TmxProtector.SetProtectionTypes( Value: TmxProtectionTypeSet );
Begin
     If ( csLoading In ComponentState ) Or ( csDesigning In ComponentState ) Then FProtectionTypes := Value Else
          MessageDlg( 'ProtectionTypes is read-only. ' + #13 + #10 + 'You cannot modify it in run-time.', mtWarning, [ mbOK ], 0 );
End;

// *************************************************************************************
// ** TmxProtector.SetOptions, 8/21/01 1:39:37 PM
// *************************************************************************************

Procedure TmxProtector.SetOptions( Value: TmxProtectionOptionSet );
Begin
     If ( csLoading In ComponentState ) Or ( csDesigning In ComponentState ) Then FOptions := Value Else
          MessageDlg( 'Options is read-only. ' + #13 + #10 + 'You cannot modify it in run-time.', mtWarning, [ mbOK ], 0 );
End;

// *************************************************************************************
// ** TmxProtector.CodePassword, 8/21/01 12:50:41 PM
// *************************************************************************************

Function TmxProtector.CodePassword( Value: String; Internal: Boolean ): String;
Var
     I: Integer;
     S: String;
     CodeKeyStr: String;
     Index: Integer;
     IntIndex: Integer;
Begin
     S := '';
     Index := 1;
     IntIndex := 1;

     If Internal Then
          CodeKeyStr := FInternalStrPassword Else
          CodeKeyStr := FCodeKey;

     If CodeKeyStr <> '' Then
     Begin
          For I := 1 To Length( Value ) Do
          Begin
               S := S + IntToHex( ( ( Ord( Value[ I ] ) Xor Ord( CodeKeyStr[ Index ] ) ) Xor Ord( mxInternalPassword[ IntIndex ] ) ), 2 );
               Inc( Index );
               Inc( IntIndex );
               If Index > Length( CodeKeyStr ) Then Index := 1;
               If IntIndex > Length( mxInternalPassword ) Then IntIndex := 1;
          End
     End
     Else S := Value;

     Result := S;

     If Assigned( FOnCodeData ) Then
      FOnCodeData( Self, Result );
End;

// *************************************************************************************
// ** TmxProtector.DeCodePassword, 8/21/01 12:50:44 PM
// *************************************************************************************

Function TmxProtector.DeCodePassword( Value: String; Internal: Boolean ): String;
Var
     I: Integer;
     S: String;
     CodeKeyStr: String;
     Index: Integer;
     IntIndex: Integer;
Begin
     S := '';
     Index := 1;
     IntIndex := 1;
     I := 1;

     If Internal Then
          CodeKeyStr := FInternalStrPassword Else
          CodeKeyStr := FCodeKey;

     If CodeKeyStr <> '' Then
     Begin
          While I < Length( Value ) Do
          Begin
               S := S + Chr( ( StrToIntDef( '$' + Copy( Value, I, 2 ), 0 ) Xor Ord( mxInternalPassword[ IntIndex ] ) ) Xor Ord( CodeKeyStr[ Index ] ) );
               Inc( I, 2 );
               Inc( Index );
               Inc( IntIndex );
               If Index > Length( CodeKeyStr ) Then Index := 1;
               If IntIndex > Length( mxInternalPassword ) Then IntIndex := 1;
          End
     End
     Else S := Value;

     Result := S;

     If Assigned( FOnDeCodeData ) Then
      FOnDeCodeData( Self, Result );
End;

// *************************************************************************************
// ** TmxProtector.SetPassword, 8/21/01 12:45:50 PM
// *************************************************************************************

Procedure TmxProtector.SetPassword( Value: String );
Begin
     If ( csLoading In ComponentState ) Then FPassword := Value Else
          If ( csDesigning In ComponentState ) Then FPassword := CodePassword( Value, False ) Else
               MessageDlg( 'Password is read-only. ' + #13 + #10 + 'You cannot modify it in run-time.', mtWarning, [ mbOK ], 0 );
End;

// *************************************************************************************
// ** TmxProtector.SetUserName, 8/30/01 10:12:09 AM
// *************************************************************************************

Procedure TmxProtector.SetUserName( Value: String );
Begin
     If ( csLoading In ComponentState ) Then FUserName := Value Else
          If ( csDesigning In ComponentState ) Then FUserName := Value Else
               MessageDlg( 'UserName is read-only. ' + #13 + #10 + 'You cannot modify it in run-time.', mtWarning, [ mbOK ], 0 );
End;

// *************************************************************************************
// ** TmxProtector.SetCodeKey, 8/21/01 12:57:35 PM
// *************************************************************************************

Procedure TmxProtector.SetCodeKey( Value: String );
Var
     S: String;
Begin
     If ( csLoading In ComponentState ) Then FCodeKey := Value Else
          If ( csDesigning In ComponentState ) Then
          Begin
               If FPassword = '' Then FCodeKey := Value Else
               Begin
                    S := DeCodePassword( FPassword, False );
                    FCodeKey := Value;
                    FPassword := CodePassword( S, False );
               End;
          End
          Else
               MessageDlg( 'CodeKey is read-only. ' + #13 + #10 + 'You cannot modify it in run-time.', mtWarning, [ mbOK ], 0 );
End;

// *************************************************************************************
// ** TmxProtector.SetExpiration, 8/21/01 2:03:12 PM
// *************************************************************************************

Procedure TmxProtector.SetExpiration( Value: TDateTime );
Begin
     If ( csLoading In ComponentState ) Or ( csDesigning In ComponentState ) Then FExpiration := Value Else
          MessageDlg( 'Expiration is read-only. ' + #13 + #10 + 'You cannot modify it in run-time.', mtWarning, [ mbOK ], 0 );
End;

// *************************************************************************************
// *** TmxProtector.SetMaxStartNumber, 2001.10.16. 9:46:30
// *************************************************************************************

Procedure TmxProtector.SetMaxStartNumber( Value: Integer );
Begin
     If ( csLoading In ComponentState ) Or ( csDesigning In ComponentState ) Then FMaxStartNumber := Value Else
          MessageDlg( 'StartNumber is read-only. ' + #13 + #10 + 'You cannot modify it in run-time.', mtWarning, [ mbOK ], 0 );
End;

// *************************************************************************************
// *** TmxProtector.SetMaxDayNumber, 2001.10.16. 9:46:36
// *************************************************************************************

Procedure TmxProtector.SetMaxDayNumber( Value: Integer );
Begin
     If ( csLoading In ComponentState ) Or ( csDesigning In ComponentState ) Then FMaxDayNumber := Value Else
          MessageDlg( 'DayNumber is read-only. ' + #13 + #10 + 'You cannot modify it in run-time.', mtWarning, [ mbOK ], 0 );
End;

// *************************************************************************************
// ** TmxProtector.IncDate, 8/21/01 2:10:36 PM
// *************************************************************************************

Function TmxProtector.IncreaseDate( AValue: TDateTime; ADays, AMonths, AYears: Integer ): TDateTime;
Const
     DaysInMonth: Array[ 1..12 ] Of Integer = ( 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 );
Var
     DaysPerMonth: Byte;
     Day, Month, Year: Word;
Begin
     DecodeDate( AValue, Year, Month, Day );

     Inc( Year, AYears );
     Inc( Year, AMonths Div 12 );
     Inc( Month, AMonths Mod 12 );

     If Month < 1 Then
     Begin
          Inc( Month, 12 );
          Dec( Year );
     End Else
          If Month > 12 Then
          Begin
               Dec( Month, 12 );
               Inc( Year );
          End;

     DaysPerMonth := DaysInMonth[ Month ];
     If ( Month = 2 ) And ( ( Year Mod 4 = 0 ) And ( ( Year Mod 100 <> 0 ) Or ( Year Mod 400 = 0 ) ) ) Then Inc( DaysPerMonth );
     If Day > DaysPerMonth Then Day := DaysPerMonth;
     Result := EncodeDate( Year, Month, Day ) + ADays + Frac( AValue );
End;

// *************************************************************************************
// ** TmxProtector.ReadUniqueID, 8/28/01 9:27:12 AM
// *************************************************************************************

Procedure TmxProtector.ReadUniqueID( Reader: TReader );
Begin
     FUniqueID := DecodePassword( Reader.ReadString, TRUE );
End;

// *************************************************************************************
// ** TmxProtector.WriteUniqueID, 8/28/01 9:27:15 AM
// *************************************************************************************

Procedure TmxProtector.WriteUniqueID( Writer: TWriter );
Begin
     Writer.WriteString( CodePassword( FUniqueID, TRUE ) );
End;

// *************************************************************************************
// ** TmxProtector.ReadUniqueCodeID, 8/28/01 9:27:12 AM
// *************************************************************************************

Procedure TmxProtector.ReadUniqueCodeID( Reader: TReader );
Begin
     FInternalStrPassword := Reader.ReadString;
End;

// *************************************************************************************
// ** TmxProtector.WriteUniqueCodeID, 8/28/01 9:27:15 AM
// *************************************************************************************

Procedure TmxProtector.WriteUniqueCodeID( Writer: TWriter );
Begin
     Writer.WriteString( FInternalStrPassword );
End;

// *************************************************************************************
// ** TmxProtector.DefineProperties, 8/21/01 2:56:42 PM
// *************************************************************************************

Procedure TmxProtector.DefineProperties( Filer: TFiler );
Begin
     Inherited DefineProperties( Filer );
     Filer.DefineProperty( 'UniqueCodeID', ReadUniqueCodeID, WriteUniqueCodeID, TRUE );
     Filer.DefineProperty( 'UniqueID', ReadUniqueID, WriteUniqueID, TRUE );
End;

Function TmxProtector.GetRegistryKey: String;
Begin
  Result:=Format( GetRegistryPath + '%s\Info', [ FUniqueID ] );
  If Assigned( OnGetRegistryPath ) Then
    FOnGetRegistryPath( Self, Result ); 
End;

// *************************************************************************************
// ** TmxProtector.Get_String, 8/21/01 3:43:38 PM
// *************************************************************************************

Function TmxProtector.Get_String( AKey, ADefval: String ): String;
Var
  Reg: TRegistry;
  sKey, sPath, sValue: String;
  Handled: Boolean;
Begin
     sPath:=GetRegistryKey;
     sKey:=AKey;
     sValue:=ADefVal;
     Handled:=False;

     If Assigned( FOnGetString ) Then
      FOnGetString( Self, sPath, sKey, sValue, Handled );

     If Not Handled Then
     Begin
      Reg := TRegistry.Create;
      Try
          If FRegistryRootKey = rkCurrentUser Then
            Reg.RootKey := HKEY_CURRENT_USER Else
            Reg.RootKey := HKEY_LOCAL_MACHINE;

          Try
               If Reg.OpenKey( sPath, True ) Then
                    Result := Reg.ReadString( sKey ) Else
                    Result := sValue;
          Except
               Result := sValue;
          End;

      Finally
          Reg.CloseKey;
          Reg.Free;
      End;
     End
      Else Result:=sValue;
End;

// *************************************************************************************
// ** TmxProtector.Get_Boolean, 8/21/01 3:43:40 PM
// *************************************************************************************

Function TmxProtector.Get_Boolean( AKey: String; ADefval: Boolean ): Boolean;
Var
  Reg: TRegistry;
  sKey, sPath: String;
  sValue: Boolean;
  Handled: Boolean;
Begin
     sPath:=GetRegistryKey;
     sKey:=AKey;
     sValue:=ADefVal;
     Handled:=False;

     If Assigned( FOnGetBoolean ) Then
      FOnGetBoolean( Self, sPath, sKey, sValue, Handled );

     If Not Handled Then
     Begin
      Reg := TRegistry.Create;
      Try
          If FRegistryRootKey = rkCurrentUser Then
            Reg.RootKey := HKEY_CURRENT_USER Else
            Reg.RootKey := HKEY_LOCAL_MACHINE;

          Try
               If Reg.OpenKey( sPath, False ) Then
                    Result := Reg.ReadBool( sKey ) Else
                    Result := sValue;
          Except
               Result := sValue;
          End;

      Finally
          Reg.CloseKey;
          Reg.Free;
      End;
     End
      Else Result:=SValue;
End;

// *************************************************************************************
// ** TmxProtector.Put_String, 8/21/01 3:43:44 PM
// *************************************************************************************

Procedure TmxProtector.Put_String( AKey, AVal: String );
Var
  Reg: TRegistry;
  sKey, sPath, sValue: String;
  Handled: Boolean;
Begin
     sPath:=GetRegistryKey;
     sKey:=AKey;
     sValue:=AVal;
     Handled:=False;

     If Assigned( FOnPutString ) Then
      FOnPutString( Self, sPath, sKey, sValue, Handled );

     If Not Handled Then
     Begin
      Reg := TRegistry.Create;
      Try
          If FRegistryRootKey = rkCurrentUser Then
            Reg.RootKey := HKEY_CURRENT_USER Else
            Reg.RootKey := HKEY_LOCAL_MACHINE;

          Reg.OpenKey( sPath, True );
          Reg.WriteString( sKey, sValue );
      Finally
          Reg.CloseKey;
          Reg.Free;
      End;
     End;
End;

// *************************************************************************************
// ** TmxProtector.Put_Boolean, 8/21/01 3:43:47 PM
// *************************************************************************************

Procedure TmxProtector.Put_Boolean( AKey: String; AVal: Boolean );
Var
  Reg: TRegistry;
  sKey, sPath: String;
  sValue: Boolean;
  Handled: Boolean;
Begin
     sPath:=GetRegistryKey;
     sKey:=AKey;
     sValue:=AVal;
     Handled:=False;

     If Assigned( FOnPutBoolean ) Then
      FOnPutBoolean( Self, sPath, sKey, sValue, Handled );

     If Not Handled Then
     Begin
      Reg := TRegistry.Create;
      Try
          If FRegistryRootKey = rkCurrentUser Then
            Reg.RootKey := HKEY_CURRENT_USER Else
            Reg.RootKey := HKEY_LOCAL_MACHINE;

          Reg.OpenKey( sPath, True );
          Reg.WriteBool( sKey, sValue );
      Finally
          Reg.CloseKey;
          Reg.Free;
      End;
     End;
End;

// *************************************************************************************
// ** TmxProtector.Del_Key, 8/21/01 4:38:58 PM
// *************************************************************************************

Function TmxProtector.Delete_Key: Boolean;
Var
     Reg: TRegistry;
     sPath: String;
Begin
     sPath:=GetRegistryKey;

     Reg := TRegistry.Create;
     Try
          If FRegistryRootKey = rkCurrentUser Then
            Reg.RootKey := HKEY_CURRENT_USER Else
            Reg.RootKey := HKEY_LOCAL_MACHINE;

          Result := Reg.DeleteKey( sPath );
     Finally
          Reg.Free;
     End;
End;

// *************************************************************************************
// ** TmxProtector.Loaded, 8/21/01 3:28:57 PM
// *************************************************************************************

Procedure TmxProtector.Loaded;
Begin
     Inherited Loaded;

     If poAutoInit In FOptions Then Init;
End;

// *************************************************************************************
// ** TmxProtector.CheckPassword, 8/21/01 4:14:00 PM
// *************************************************************************************

Procedure TmxProtector.CheckPassword;
Var
     NeedPassword: Boolean;
     Password: String;
Begin
     If stPassword In FProtectionTypes Then
     Begin
          NeedPassword := TRUE;

          If poPasswordOnce In FOptions Then
               NeedPassword := Not Get_Boolean( 'P1', False );

          If NeedPassword Then
          Begin
               Password := '';
               If Assigned( FOnGetPassword ) Then FOnGetPassword( Self, Password );

               If CodePassword( Password, False ) = FPassword Then
               Begin
                    If poPasswordOnce In FOptions Then Put_Boolean( 'P1', True );
                    If Assigned( FOnValidPassword ) Then FOnValidPassword( Self );
               End
               Else If Assigned( FOnWrongPassword ) Then FOnWrongPassword( Self, Password );
          End
          Else If Assigned( FOnValidPassword ) Then FOnValidPassword( Self );
     End;
End;

// *************************************************************************************
// ** TmxProtector.CheckStartTrial, 8/21/01 5:26:05 PM
// *************************************************************************************

Procedure TmxProtector.CheckStartTrial;
Var
     Counter: Integer;
     FirstStart: Boolean;
Begin
     If stStartTrial In FProtectionTypes Then
     Begin
          FirstStart := Not Get_Boolean( 'S1', False );

          If FirstStart Then
          Begin
               Put_Boolean( 'S1', True );
               Put_String( 'S2', CodePassword( IntToHex( FMaxStartNumber, 5 ), TRUE ) );
          End;

          Counter := StrToIntDef( '$' + DeCodePassword( Get_String( 'S2', '01' ), TRUE ), 1 );

          Dec( Counter );
          Put_String( 'S2', CodePassword( IntToHex( Counter, 5 ), TRUE ) );

          If Counter <= 0 Then
          Begin
               If Assigned( FOnExpiration ) Then FOnExpiration( Self );

               If poWorkAfterExpiration In Options Then
                    If Assigned( FOnStartTrial ) Then FOnStartTrial( Self, Counter );
          End
          Else If Assigned( FOnStartTrial ) Then FOnStartTrial( Self, Counter );
     End;
End;

// *************************************************************************************
// ** TmxProtector.CheckTimeTrial, 8/27/01 4:09:58 PM
// *************************************************************************************

Procedure TmxProtector.CheckTimeTrial;
Var
     Year, Month, Day: Word;
     LastYear, LastMonth, LastDay: Word;
     LastStart: TDateTime;
     ValidSystemTime: Boolean;
     FirstStart: Boolean;
     DateStr: String;
Begin
     If stTimeTrial In FProtectionTypes Then
     Begin
          FirstStart := Not Get_Boolean( 'T1', False );

          DecodeDate( Now, Year, Month, Day );
          ValidSystemTime := TRUE;

          If FirstStart Then
          Begin
               Put_Boolean( 'T1', True );
               Put_String( 'T2', CodePassword( IntToHex( Year, 4 ) + IntToHex( Month, 2 ) + IntToHex( Day, 2 ), True ) );
          End
          Else
          Begin
               If poCheckSytemTime In FOptions Then
               Begin
                    DateStr := Get_String( 'T3', CodePassword( IntToHex( Year, 4 ) + IntToHex( Month, 2 ) + IntToHex( Day, 2 ), True ) );
                    DateStr := DecodePassword( DateStr, TRUE );

                    LastYear := StrToIntDef( '$' + Copy( DateStr, 1, 4 ), Year );
                    LastMonth := StrToIntDef( '$' + Copy( DateStr, 5, 2 ), Month );
                    LastDay := StrToIntDef( '$' + Copy( DateStr, 7, 2 ), Day );

                    LastStart := EncodeDate( LastYear, LastMonth, LastDay );

                    If LastStart > Now Then
                    Begin
                         If Assigned( FOnInvalidSystemTime ) Then FOnInvalidSystemTime( Self );
                         ValidSystemTime := FALSE;

                         If Assigned( FOnExpiration ) Then FOnExpiration( Self );

                         If poWorkAfterExpiration In Options Then
                              If Assigned( FOnTimeTrial ) Then FOnTimeTrial( Self, GetDayNumber );
                    End;
               End;
          End;

          If ValidSystemTime Then
          Begin
               Put_String( 'T3', CodePassword( IntToHex( Year, 4 ) + IntToHex( Month, 2 ) + IntToHex( Day, 2 ), True ) );

               If GetDayNumber = 0 Then
               Begin
                    If Assigned( FOnExpiration ) Then FOnExpiration( Self );

                    If poWorkAfterExpiration In Options Then
                         If Assigned( FOnTimeTrial ) Then FOnTimeTrial( Self, GetDayNumber );
               End
               Else If Assigned( FOnTimeTrial ) Then FOnTimeTrial( Self, GetDayNumber );
          End;
     End;
End;

// *************************************************************************************
// *** TmxProtector.CheckDayTrial, 2001.10.16. 9:48:13
// *************************************************************************************

Procedure TmxProtector.CheckDayTrial;
Var
     Year, Month, Day: Word;
     LastYear, LastMonth, LastDay: Word;
     FirstStartDate: TDateTime;
     FirstStart: Boolean;
     LastStart: TDateTime;
     ValidSystemTime: Boolean;
     DateStr: String;
     LicencedDays: Integer;
Begin
     If stDayTrial In FProtectionTypes Then
     Begin
          FirstStart := Not Get_Boolean( 'D1', False );

          DecodeDate( Now, Year, Month, Day );
          ValidSystemTime := TRUE;

          If FirstStart Then
          Begin
               Put_Boolean( 'D1', True );
               Put_String( 'D2', CodePassword( IntToHex( Year, 4 ) + IntToHex( Month, 2 ) + IntToHex( Day, 2 ), True ) );
               LicencedDays := FMaxDayNumber - 1;
          End
          Else
          Begin
               DateStr := Get_String( 'D2', CodePassword( IntToHex( Year, 4 ) + IntToHex( Month, 2 ) + IntToHex( Day, 2 ), True ) );
               DateStr := DecodePassword( DateStr, TRUE );

               LastYear := StrToIntDef( '$' + Copy( DateStr, 1, 4 ), Year );
               LastMonth := StrToIntDef( '$' + Copy( DateStr, 5, 2 ), Month );
               LastDay := StrToIntDef( '$' + Copy( DateStr, 7, 2 ), Day );

               FirstStartDate := EncodeDate( LastYear, LastMonth, LastDay );

               // ******************************************************

               LicencedDays := Trunc( Now ) - Trunc( FirstStartDate ) + 1;
               If LicencedDays < 0 Then LicencedDays := 0;

               LicencedDays := FMaxDayNumber - LicencedDays;
               If LicencedDays < 0 Then LicencedDays := 0;

               // ******************************************************

               If poCheckSytemTime In FOptions Then
               Begin
                    DateStr := Get_String( 'D3', CodePassword( IntToHex( Year, 4 ) + IntToHex( Month, 2 ) + IntToHex( Day, 2 ), True ) );
                    DateStr := DecodePassword( DateStr, TRUE );

                    LastYear := StrToIntDef( '$' + Copy( DateStr, 1, 4 ), Year );
                    LastMonth := StrToIntDef( '$' + Copy( DateStr, 5, 2 ), Month );
                    LastDay := StrToIntDef( '$' + Copy( DateStr, 7, 2 ), Day );

                    LastStart := EncodeDate( LastYear, LastMonth, LastDay );

                    If LastStart > Now Then
                    Begin
                         If Assigned( FOnInvalidSystemTime ) Then FOnInvalidSystemTime( Self );
                         ValidSystemTime := FALSE;

                         If Assigned( FOnExpiration ) Then FOnExpiration( Self );

                         If poWorkAfterExpiration In Options Then
                              If Assigned( FOnDayTrial ) Then FOnDayTrial( Self, LicencedDays );
                    End;
               End;
          End;

          If ValidSystemTime Then
          Begin
               Put_String( 'D3', CodePassword( IntToHex( Year, 4 ) + IntToHex( Month, 2 ) + IntToHex( Day, 2 ), True ) );

               If LicencedDays = 0 Then
               Begin
                    If Assigned( FOnExpiration ) Then FOnExpiration( Self );

                    If poWorkAfterExpiration In Options Then
                         If Assigned( FOnDayTrial ) Then FOnDayTrial( Self, LicencedDays );
               End
               Else If Assigned( FOnDayTrial ) Then FOnDayTrial( Self, LicencedDays );
          End;
     End;
End;

// *************************************************************************************
// ** TmxProtector.CheckRegistration, 8/28/01 10:31:50 AM
// *************************************************************************************

Procedure TmxProtector.CheckRegistration;
Var
     SerialNumber: String;
     GenSerialNumber: String;
     UserName: String;
     Registered: Boolean;
Begin
     If stRegister In FProtectionTypes Then
     Begin
          Registered := FALSE;

          UserName := DeCodePassword( Get_String( 'R1', '' ), TRUE );
          SerialNumber := DeCodePassword( Get_String( 'R2', '' ), TRUE );

          If UserName <> '' Then
          Begin
               GenSerialNumber := GenerateSerialNumber( UserName );
               Registered := AnsiCompareText( GenSerialNumber, SerialNumber ) = 0;
          End;

          If Assigned( FOnCheckRegistration ) Then FOnCheckRegistration( Self, UserName, SerialNumber, Registered );

          If Registered Then
          Begin
               If Assigned( FOnRegisteredVersion ) Then FOnRegisteredVersion( Self );
               FUserName := UserName;
               FRegistration := rtRegistered;
          End
          Else
          Begin
               If Assigned( FOnUnRegisteredVersion ) Then FOnUnRegisteredVersion( Self );
               FUserName := '';
               FRegistration := rtUnRegistered;
          End;
     End;
End;

// *************************************************************************************
// ** TmxProtector.Registration, 8/30/01 8:41:50 AM
// *************************************************************************************

Procedure TmxProtector.Registration;
Var
     SerialNumber: String;
     GenSerialNumber: String;
     UserName: String;
     Registered: Boolean;
Begin
     If stRegister In FProtectionTypes Then
     Begin
          Registered := FALSE;

          // *************************************************************

          If Assigned( FOnBeforeRegister ) Then FOnBeforeRegister( Self );

          // *************************************************************

          If Assigned( FOnGetSerialNumber ) Then
          Begin
               FOnGetSerialNumber( Self, UserName, SerialNumber );
               FUserName := UserName;
               GenSerialNumber := GenerateSerialNumber( FUserName );

               If GenSerialNumber <> '' Then
               Begin
                    Registered := AnsiCompareText( GenSerialNumber, SerialNumber ) = 0;

                    If Not Registered Then
                         If Assigned( FOnInvalidSerialNumber ) Then FOnInvalidSerialNumber( Self );
               End;
          End;

          If Registered Then
          Begin
               Put_String( 'R1', CodePassword( FUserName, TRUE ) );
               Put_String( 'R2', CodePassword( UpperCase( SerialNumber ), TRUE ) );

               // *************************************************************

               If Assigned( FOnRegister ) Then FOnRegister( Self, FUserName, SerialNumber );

               // *************************************************************

               If Assigned( FOnRegisteredVersion ) Then FOnRegisteredVersion( Self );
               FUserName := UserName;
               FRegistration := rtRegistered;
          End
          Else
          Begin
               If Assigned( FOnUnRegisteredVersion ) Then FOnUnRegisteredVersion( Self );
               FUserName := '';
               FRegistration := rtUnRegistered;
          End;

          // *************************************************************

          If Assigned( FOnAfterRegister ) Then FOnAfterRegister( Self );

          // *************************************************************
     End;
End;

// *************************************************************************************
// ** TmxProtector.Reset, 8/21/01 4:36:09 PM
// *************************************************************************************

Procedure TmxProtector.Reset;
Var
  Handled: Boolean;
Begin
  Handled:=False;

  If Assigned( FOnReset ) Then FOnReset( Self, Handled );

  If Not Handled Then Delete_Key;

  CheckRegistration;
  FRegistration := rtUnknown;
End;

// *************************************************************************************
// ** TmxProtector.Init, 8/21/01 4:34:51 PM
// *************************************************************************************

Procedure TmxProtector.Init;
Begin
     If Not FFirstAfterStart Then Exit;
     If Assigned( FOnInitialization ) Then FOnInitialization( Self );

     CheckPassword;
     CheckStartTrial;
     CheckTimeTrial;
     CheckDayTrial;
     CheckRegistration;

     FFirstAfterStart := TRUE;
End;

// *************************************************************************************
// ** TmxProtector.GetDayNumber, 8/27/01 4:15:08 PM
// *************************************************************************************

Function TmxProtector.GetDayNumber: Longint;
Begin
     Result := Trunc( Expiration ) - Trunc( Now ) + 1;
     If Result < 0 Then Result := 0;
End;

// *************************************************************************************
// ** TmxProtector.GetLicencedDayNumber, 8/28/01 8:50:23 AM
// *************************************************************************************

Function TmxProtector.GetLicencedDayNumber: Longint;
Var
     FirstStart: TDateTime;
     DateStr: String;
     Year, Month, Day: Word;
Begin
     Result := 0;

     If Get_Boolean( 'T1', False ) Then
     Begin
          DecodeDate( Now, Year, Month, Day );
          DateStr := Get_String( 'T2', CodePassword( IntToHex( Year, 4 ) + IntToHex( Month, 2 ) + IntToHex( Day, 2 ), True ) );
          DateStr := DecodePassword( DateStr, TRUE );

          Year := StrToIntDef( '$' + Copy( DateStr, 1, 4 ), Year );
          Month := StrToIntDef( '$' + Copy( DateStr, 5, 2 ), Month );
          Day := StrToIntDef( '$' + Copy( DateStr, 7, 2 ), Day );

          FirstStart := EncodeDate( Year, Month, Day );

          Result := Trunc( Expiration ) - Trunc( FirstStart ) + 1;
          If Result < 0 Then Result := 0;
     End;
End;

// *************************************************************************************
// ** TmxProtector.GenerateSerialNumber, 8/28/01 2:47:29 PM
// *************************************************************************************

Function TmxProtector.GenerateSerialNumber( AUserName: String ): String;
Var
     I: Integer;
     Index: Integer;
     IntIndex: Integer;
     Serial: String;
     TempStr: String;
     TempStr1: String;
     Addon: Integer;
Begin
     Result := '';

     If AUserName = '' Then
     Begin
          MessageDlg( 'User name is empty. Please set this propery before!', mtInformation, [ mbOK ], 0 );
          Exit;
     End;

     AUserName := UpperCase( AUserName );

     Index := 1;
     IntIndex := 1;
     Addon := 0;

     For I := 1 To Length( AUserName ) Do
     Begin
          Inc( AddOn, ( Ord( AUserName[ I ] ) * I ) );
     End;

     If poUseHardwareKey In FOptions Then
     Begin
          TempStr := InternalGetHardwareID;

          If Assigned( FOnGetHardwareID ) Then FOnGetHardwareID( Self, TempStr );

          TempStr1 := '';
          For I := 1 To Length( TempStr ) Do
               If TempStr[ I ] <> '-' Then TempStr1 := TempStr1 + TempStr[ I ];

          TempStr := TempStr1;

          If Length( TempStr ) <> 16 Then
          Begin
               Result := '';
               If Assigned( FOnInvalidHardwareID ) Then FOnInvalidHardwareID( Self );
               Exit;
          End;

          For I := 1 To Length( TempStr ) Do
          Begin
               Inc( AddOn, ( Ord( TempStr[ I ] ) * I ) );
          End;
     End;

     For I := 1 To 12 Do
     Begin
          Serial := Serial +
               IntToHex(

               ( (
               Ord( FUniqueID[ I * 2 ] ) Xor Ord( FUniqueID[ I ] )
               )
               Xor Ord( AUserName[ Index ] )
               )
               Xor
               (
               ( Addon + I ) Mod 200
               )
               , 2 );

          Inc( Addon, Ord( AUserName[ Index ] ) Xor I );

          If poUseHardwareKey In FOptions Then Inc( Addon, Ord( TempStr[ I ] ) Xor I );

          Inc( Index );
          Inc( IntIndex );
          If Index > Length( AUserName ) Then Index := 1;
          If IntIndex > Length( mxInternalPassword ) Then IntIndex := 1;
     End;

     If Length( Serial ) > 24 Then Serial := Copy( Serial, 1, 24 );
     Result := Copy( Serial, 1, 8 ) + '-' + Copy( Serial, 9, 8 ) + '-' + Copy( Serial, 17, 8 );
End;

// *************************************************************************************
// ** TmxProtector.GetRegistryPath, 8/30/01 7:37:50 AM
// *************************************************************************************

Function TmxProtector.GetRegistryPath: String;
Var
     I: Integer;
     S: String;
Begin
     S := '';

     I := 1;
     While I < Length( mxRegistryPath ) Do
     Begin
          S := S + Chr( StrToIntDef( '$' + Copy( mxRegistryPath, I, 2 ), 0 ) );
          Inc( I, 2 );
     End;
     Result:=S;
End;

// *************************************************************************************
// ** TmxProtector.IsRegistered, 8/30/01 9:08:28 AM
// *************************************************************************************

Function TmxProtector.IsRegistered: Boolean;
Begin
     If FRegistration = rtUnknown Then CheckRegistration;
     Result := FRegistration = rtRegistered;
End;

// *************************************************************************************
// ** TmxProtector.GetRegisteredUserName, 8/30/01 10:11:26 AM
// *************************************************************************************

Function TmxProtector.GetRegisteredUserName: String;
Begin
     Result := FUserName;
End;

// *************************************************************************************
// ** IsCPUIDAvailable, 10/12/01 2:04:15 PM
// *************************************************************************************

Const
     ID_BIT = $200000;

Type
     TCPUID = Array[ 1..4 ] Of Longint;
     TVendor = Array[ 0..11 ] Of char;

Function IsCPUIDAvailable: Boolean; Register;
begin

End;

// *************************************************************************************
// ** GetCPUID, 10/12/01 2:04:09 PM
// *************************************************************************************

Function GetCPUID: TCPUID; Assembler; Register;
begin

End;

// *************************************************************************************
// ** GetCPUVendor, 10/12/01 2:04:06 PM
// *************************************************************************************

Function GetCPUVendor: TVendor; Assembler; Register;
begin

End;

// *************************************************************************************
// ** TmxProtector.InternalGetHardwareID, 10/12/01 2:04:03 PM
// *************************************************************************************

Function TmxProtector.InternalGetHardwareID: String;
begin

End;

// *************************************************************************************
// ** TmxProtector.GetHardwareID, 10/12/01 2:02:19 PM
// *************************************************************************************

Function TmxProtector.GetHardwareID: String;
Begin
End;

End.


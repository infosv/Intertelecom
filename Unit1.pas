unit Unit1;

interface
{$WARNINGS OFF}
{$HINTS OFF}
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, OC_InputBox, Registry, Grids, StdCtrls, ExtCtrls, MsHtml,
  ImgList,IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Menus, AdvCircularProgress, sSkinManager, ALHintBalloon,  CoolTrayIcon,
  RxAnimate, RxGIFCtrl, CnAAFont, CnAACtrls, KMAlert,
  FadeGraphicCheckBoxEx, jpeg, acPNG, ALScrollingText, NxCollection,
   GradBtn, AIMPButtonInc, HTMLabel, dbhtmlab, ShellAPI,
   ShowMsg, abfLabels, hbComm, SHDocVw, OleCtrls, RzSpnEdt,
  ComCtrls, NxEdit, mxProtector, ZMButton, ALScreenSnap;

type
  TIntertelecomForm = class(TForm)
    StringGrid1: TStringGrid;
    Timer1: TTimer;
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    CoolTrayIcon1: TCoolTrayIcon;
    PopupMenu1: TPopupMenu;
    Close1: TMenuItem;
    S1: TMenuItem;
    H1: TMenuItem;
    B1: TMenuItem;
    A1: TMenuItem;
    N1: TMenuItem;
    Timer3: TTimer;
    Timer5: TTimer;
    ImageList1: TImageList;
    Timer6: TTimer;
    Image1: TButton;
    IntertelecomAlertFx: TKMAlert;
    CnAAScrollText1: TCnAAScrollText;
    Label6: TLabel;
    TimerOnTopCheck: TTimer;
    Timer2: TTimer;
    AboutCheck: TCheckBox;
    AutoBalans: TTimer;
    StringGrid2: TStringGrid;
    BalloonReportFx: TALHintBalloonControl;
    Memo1: TMemo;
    CnTimer1: TTimer;
    CnTimer2: TTimer;
    HTMLabel1: THTMLabel;
    RxGIFAnimator3: TRxGIFAnimator;
    HTMLabel2: THTMLabel;
    AIMPButtonEx1: TAIMPButtonEx;
    AIMPButtonEx3: TAIMPButtonEx;
    AIMPButtonEx4: TAIMPButtonEx;
    RadioGroup1: TRadioGroup;
    HideBalloonHintFx: TCheckBox;
    Timer4: TTimer;
    TimeCheckFx: TTimer;
    SelectLanguageItems: TRadioGroup;
    Timer7: TTimer;
    PanelForms: TPanel;
    ResultLabel: TDBHTMLabel;
    Button1: TAIMPButtonEx;
    RealTimeTraff: THTMLabel;
    GradBtn2: TGradBtn;
    GradBtn6: TGradBtn;
    sSkinManager1: TsSkinManager;
    GradBtnSetup: TGradBtn;
    Panel7: TPanel;
    Panel6: TPanel;
    RxGIFAnimator1: TAIMPButtonEx;
    NxPanel1: TNxPanel;
    ALScrollingText1: TALScrollingText;
    Image4: TImage;
    NxPanel2: TNxPanel;
    Image1df: TImage;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    EditUsername: TEdit;
    EditPassword: TEdit;
    NxPanel3: TNxPanel;
    Label15: TLabel;
    UACheckBox: TFadeGraphicCheckBoxFx;
    RUSCheckBox: TFadeGraphicCheckBoxFx;
    USACheckBox: TFadeGraphicCheckBoxFx;
    NxPanel4: TNxPanel;
    NxPanel5: TNxPanel;
    Label2: TLabel;
    Label1: TLabel;
    Panel2: TPanel;
    GradBtn1: TAIMPButtonEx;
    GradBtn3: TGradBtn;
    GradBtnAboutsFx: TGradBtn;
    Panel3: TPanel;
    AutorunIntertelecom: TFadeGraphicCheckBoxFx;
    CheckBox1: TFadeGraphicCheckBoxFx;
    Panel4: TPanel;
    Timer8: TTimer;
    Label17: TLabel;
    ToolsCheckBoxSx: TCheckBox;
    Image5: TImage;
    sesions: TCnAALabel;
    Label8: TCnAALabel;
    AIMPButtonEx2: TAIMPButtonEx;
    AdvCircularProgress1: TAdvCircularProgress;
    NxPanelTrafPanel: TNxPanel;
    Label4Pass: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label16: TLabel;
    SpinnerTraf: TRzSpinner;
    SpinnerTime: TRzSpinner;
    PopupMenu2: TPopupMenu;
    SelectLimitN1: TMenuItem;
    SelectLimitN2: TMenuItem;
    SelectLimitN3: TMenuItem;
    SelectLimitN4: TMenuItem;
    SelectLimitN5: TMenuItem;
    SelectLimitN6: TMenuItem;
    SelectLimitN7: TMenuItem;
    SelectLimitN8: TMenuItem;
    SelectLimitN9: TMenuItem;
    SelectLimitN10: TMenuItem;
    SelectLimitN11: TMenuItem;
    SelectLimitN12: TMenuItem;
    SelectLimitN13: TMenuItem;
    SelectLimitN14: TMenuItem;
    SelectLimitN15: TMenuItem;
    SelectLimitN16: TMenuItem;
    SelectLimitN17: TMenuItem;
    SelectLimitN18: TMenuItem;
    SelectLimitN19: TMenuItem;
    SelectLimitN20: TMenuItem;
    SelectLimitN21: TMenuItem;
    SelectLimitN22: TMenuItem;
    SelectLimitN23: TMenuItem;
    SelectLimitN24: TMenuItem;
    SelectLimitN25: TMenuItem;
    ComboBoxTraff: TNxComboBox;
    Label9: TLabel;
    CheckBoxTimer: TFadeGraphicCheckBoxFx;
    NxPanelLogo: TNxPanel;
    Label14: TLabel;
    Label5: TLabel;
    HintCheckBox: TFadeGraphicCheckBoxFx;
    Label7: TLabel;
    OnTopCheckBoxFx: TFadeGraphicCheckBoxFx;
    Label10: TLabel;
    HotKeyEnableEx: TFadeGraphicCheckBoxFx;
    SkinSelectFx: TFadeGraphicCheckBoxFx;
    LabelSellSkn: TLabel;
    FadeGraphicCheckBoxFx1: TFadeGraphicCheckBoxFx;
    SkinSelectFxTimer: TTimer;
    AIMPButtonEx5: TAIMPButtonEx;
    Button2: TButton;
    TrialFxCheckBoxEx: TCheckBox;
    TrialFxCheckBoxTimer: TTimer;
    mxProtector: TmxProtector;
    Panel5: TPanel;
    Edit_Username: TLabel;
    Edit_Serial: TLabel;
    Button3: TButton;
    ZMButton1: TZMButton;
    AIMPButtonEx6: TAIMPButtonEx;
    RxGIFAnimator2: TRxGIFAnimator;
    ALScreenSnap1: TALScreenSnap;
    procedure FormCreate(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure FormDestroy(Sender: TObject);
    procedure CoolTrayIcon1DblClick(Sender: TObject);
    procedure Close1Click(Sender: TObject);
    procedure CoolTrayIcon1MouseEnter(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure EditUsernasdChange(Sender: TObject);
    procedure EditPasswordererChange(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure H1Click(Sender: TObject);
    procedure B1Click(Sender: TObject);
    procedure A1Click(Sender: TObject);
    procedure RxGIFAnimator1Click(Sender: TObject);
    procedure CoolTrayIcon1Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure Timer5Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure AIMPButtonEx1Click(Sender: TObject);
    procedure IntertelecomAlertFxShow(Sender: TObject);
    procedure IntertelecomAlertFxClose(Sender: TObject);
    procedure cbbConnectionsChange(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure TimerOnTopCheckTimer(Sender: TObject);
    procedure AIMPButtonEx4Click(Sender: TObject);
    procedure AIMPButtonEx3Click(Sender: TObject);
    procedure cnmrqtxt1MouseEnter(Sender: TObject);
    procedure CnAAScrollText1MouseEnter(Sender: TObject);
    procedure CnAAScrollText1MouseLeave(Sender: TObject);
    procedure cnmrqtxt1MouseLeave(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AutoBalansTimer(Sender: TObject);
    procedure GradBtn1Click(Sender: TObject);
    procedure GradBtn3Click(Sender: TObject);
    procedure GradBtn6Click(Sender: TObject);
    procedure GradBtn2Click(Sender: TObject);
    procedure CnTimer1Timer(Sender: TObject);
    procedure CnTimer2Timer(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure CoolTrayIcon1MinimizeToTray(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NxCheckBox1Click(Sender: TObject);
    procedure CoolTrayIcon1BalloonHintClick(Sender: TObject);
    procedure TextAnimator1ssMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel7MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel4MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelFormsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PanelPassConfigMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Panel6MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RealTimeTraffMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ResultLabelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RxGIFAnimator2MouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure ReportButtonClick(Sender: TObject);
    procedure Timer4Timer(Sender: TObject);
    procedure TimeCheckFxTimer(Sender: TObject);
    procedure Label9Click(Sender: TObject);
    procedure SelectLanguageItemsClick(Sender: TObject);
    procedure USACheckBoxClick(Sender: TObject);
    procedure RUSCheckBoxClick(Sender: TObject);
    procedure UACheckBoxClick(Sender: TObject);
    procedure Timer7Timer(Sender: TObject);
    procedure GradBtnAboutsFxClick(Sender: TObject);
    procedure GradBtnSetupClick(Sender: TObject);
    procedure AutorunIntertelecomClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure HintCheckBoxClick(Sender: TObject);
    procedure OnTopCheckBoxFxClick(Sender: TObject);
    procedure HotKeyEnableExClick(Sender: TObject);
    procedure FadeGraphicCheckBoxFx1Click(Sender: TObject);
    procedure Label17Click(Sender: TObject);
    procedure Image5MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpinnerTimeChange(Sender: TObject);
    procedure SelectLimitN1Click(Sender: TObject);
    procedure SelectLimitN2Click(Sender: TObject);
    procedure SelectLimitN3Click(Sender: TObject);
    procedure SelectLimitN4Click(Sender: TObject);
    procedure SelectLimitN5Click(Sender: TObject);
    procedure SelectLimitN6Click(Sender: TObject);
    procedure SelectLimitN7Click(Sender: TObject);
    procedure SelectLimitN8Click(Sender: TObject);
    procedure SelectLimitN9Click(Sender: TObject);
    procedure SelectLimitN10Click(Sender: TObject);
    procedure SelectLimitN11Click(Sender: TObject);
    procedure SelectLimitN12Click(Sender: TObject);
    procedure SelectLimitN13Click(Sender: TObject);
    procedure SelectLimitN14Click(Sender: TObject);
    procedure SelectLimitN15Click(Sender: TObject);
    procedure SelectLimitN16Click(Sender: TObject);
    procedure SelectLimitN17Click(Sender: TObject);
    procedure SelectLimitN18Click(Sender: TObject);
    procedure SelectLimitN19Click(Sender: TObject);
    procedure SelectLimitN20Click(Sender: TObject);
    procedure SelectLimitN21Click(Sender: TObject);
    procedure SelectLimitN22Click(Sender: TObject);
    procedure SelectLimitN23Click(Sender: TObject);
    procedure SelectLimitN24Click(Sender: TObject);
    procedure SelectLimitN25Click(Sender: TObject);
    procedure PopupMenu2Change(Sender: TObject; Source: TMenuItem;
      Rebuild: Boolean);
    procedure SkinSelectFxClick(Sender: TObject);
    procedure LabelSellSknClick(Sender: TObject);
    procedure SkinSelectFxTimerTimer(Sender: TObject);
    procedure AIMPButtonEx5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure TrialFxCheckBoxTimerTimer(Sender: TObject);
    procedure mxProtectorGetSerialNumber(Sender: TObject; var UserName,
      SerialNumber: String);
    procedure Button3Click(Sender: TObject);
    procedure CheckBoxTimerClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure AIMPButtonEx6Click(Sender: TObject);
    procedure RxGIFAnimator2Click(Sender: TObject);
  private
    { Private declarations }
    id1Esc,id1B,id1S,id1A,id1H,id1R,id1T: Integer;
    FY, FLeaveCount: Integer;
    IsMinimized: Boolean;
    function GetOnlineStatus: Boolean;
    procedure FloatRectangles(Minimizing, OverrideUserSettings: Boolean);
    procedure StatEvent(Sender: TObject; MessageText: string; Error: Boolean);
//    procedure WMGetMinMaxInfo(var Info: TWMGetMinMaxInfo); message wm_GetMinMaxInfo;
    procedure WMHotKeyFx(var Msg: TWMHotKey); message WM_HOTKEY;
    procedure IntertelecomLoad;
    procedure IntertelecomSave;
    procedure IntertelecomAutoRunOther;
    procedure PlaySndOnBtn;
    procedure PlayDVD_Off;
    procedure PlayDVD_On;
    procedure SelectLanguage;
    procedure RegHotKeyOnOff;
    procedure PlayDVD_OnSave;
    procedure RollDown;
    procedure RollUp;
    procedure UpdateInfo(List: TStringList);
  public
    { Public declarations }
    StartX, StartY, StartW, StartH: Integer;
    procedure OnStart(Sender: TObject);
    procedure OnEnd(Sender: TObject);
//    procedure ProcessRightsEx;
    procedure MyShowHint(var HintStr: string; var CanShow: Boolean;var HintInfo: THintInfo);
  end;
type
  TRasConn = record
    Size: DWORD;
    Handle: THandle;
    Name: array[0..20] of AnsiChar;
  end;

  TRasEnumConnections = function(var RasConn: TRasConn; var Size: DWORD;
    var Connections: DWORD): DWORD stdcall;
  TRasHangUp = function(Handle: THandle): DWORD stdcall;
var
  IntertelecomForm: TIntertelecomForm;
  DellKeyEx,HideBalloonEx: Boolean;

function ShellExecuteA(hWnd: HWND; Operation, FileName, Parameters,
Directory: PAnsiChar; ShowCmd: Integer): HINST; stdcall; external 'shell32.dll' Name 'ShellExecuteA';

function InternetGetConnectedState(lpdwFlags: LPDWORD; dwReserved: DWORD): BOOL; stdcall;
 external 'wininet.dll' Name 'InternetGetConnectedState';

implementation

{$R *.dfm}
{$R BMAPSRES.res}
uses
    TrayAnimation, Unit2, Splash;
const
    URL_LOGIN = 'https://assa.intertelecom.ua/ru/login/';
    URL_STATISTIC = 'https://assa.intertelecom.ua/ru/statistic/';
    URL_CONFIG = 'https://assa.intertelecom.ua/ru/config/';
    INTERNET_CONNECTION_MODEM           = 1;
    INTERNET_CONNECTION_LAN             = 2;
    INTERNET_CONNECTION_PROXY           = 4;
    SC_DRAGMOVE = $F012;
    VK_Escapes    = $1B;
    VK_Bee        = $42;
    VK_See        = $53;
    VK_Aee        = $41;
    VK_Hee        = $48;
    VK_Ree        = $52;
    VK_Tee        = $54;
    MOD_SHIFTs = 4;
resourcestring
              ERROR_SUBMIT_FAILED = 'Submit failed!';
              ERROR_LOGIN = 'Login failed or Error on page: %s';
              ERROR_FIELD_PHONE_NOT_FOUND = 'Field for phone not found!';
              ERROR_FIELD_PASSWORD_NOT_FOUND = 'Field for password not found!';
              ERROR_ON_EXTRACT_INFOS = 'No infos or error!';

{ Some utils }
procedure TIntertelecomForm.FloatRectangles(Minimizing, OverrideUserSettings: Boolean);
begin
  FloatingRectangles(Minimizing, OverrideUserSettings);
end;

{procedure TIntertelecomForm.ProcessRightsEx;
begin
     btn_Go.Enabled := mxProtector.IsRegistered;
     grp_Reg.Enabled := not mxProtector.IsRegistered;
     btn_GetSer.Enabled := not mxProtector.IsRegistered;
     btn_Register.Enabled := not mxProtector.IsRegistered;
     btn_Reset.Enabled := mxProtector.IsRegistered;
     Edit_UserName.Enabled := not mxProtector.IsRegistered;
     Edit_Serial.Enabled := not mxProtector.IsRegistered;
     btn_Register.Enabled := ( Edit_UserName.Text <> '' ) and ( Edit_Serial.Text <> '' ) and ( Not mxProtector.IsRegistered );
     if mxProtector.IsRegistered then
     begin
          label1.Caption := 'Registered version';
          Label5.Caption := 'Thanks for the registration!';
     end else
     begin
          label1.Caption := 'Shareware Edition';
          Label5.Caption := 'To enable the Go button you must register!';
     end;
end;}

procedure TIntertelecomForm.RegHotKeyOnOff;
begin
if HotKeyEnableEx.Checked = True then
begin
  id1Esc := GlobalAddAtom('Hotkey1FxExt'); // закрыть программу
  RegisterHotKey(Handle, id1Esc, 0, VK_ESCAPEs);
  id1B := GlobalAddAtom('Hotkey1FxExtBee'); // проверить баланс
  RegisterHotKey(Handle, id1B, 0, VK_Bee);
  id1S := GlobalAddAtom('Hotkey1FxExtSee'); // остановить проверку
  RegisterHotKey(Handle, id1S, 0, VK_See);
  id1A := GlobalAddAtom('Hotkey1FxExtAee'); // проверить баланс
  RegisterHotKey(Handle, id1A, 0, VK_Aee);
  id1H := GlobalAddAtom('Hotkey1FxExtHee'); // минимизировать программу
  RegisterHotKey(Handle, id1H, 0, VK_Hee);
  id1R := GlobalAddAtom('Hotkey1FxExtRee'); // минимизировать программу
  RegisterHotKey(Handle, id1R, 0, VK_Ree);
  id1T := GlobalAddAtom('Hotkey1FxExtTee'); // минимизировать программу
  RegisterHotKey(Handle, id1T, 0, VK_Tee);
end else
if HotKeyEnableEx.Checked = False then
begin
 UnRegisterHotKey(Handle, id1Esc);
 UnRegisterHotKey(Handle, id1B);
 UnRegisterHotKey(Handle, id1S);
 UnRegisterHotKey(Handle, id1A);
 UnRegisterHotKey(Handle, id1H);
 UnRegisterHotKey(Handle, id1R);
 UnRegisterHotKey(Handle, id1T);
end;
//IntertelecomSave;
//IntertelecomLoad;
end;

{procedure TIntertelecomForm.WMGetMinMaxInfo(var Info:TWMGetMinMaxInfo);
begin
  with Info.MinMaxInfo^ do
  begin
      ptMinTrackSize.x := 297;
      ptMinTrackSize.y := 172;
      ptMaxTrackSize.x := 297;
      ptMaxTrackSize.y := 172;
      ptMaxPosition.x := BoundsRect.Left;
      ptMaxPosition.y := BoundsRect.top;
  end;
  inherited;
end;}

procedure TIntertelecomForm.SelectLanguage;
begin
if SelectLanguageItems.ItemIndex = 0 then
begin
USACheckBox.Checked := True;
RUSCheckBox.Checked := False;
UACheckBox.Checked := False;
Label5.Caption := ' Show Hint';
Label7.Caption := ' Stay on Top';
Label10.Caption := ' Hot keys';
GradBtn6.Caption := ' hide';
GradBtn2.Caption := ' report';
GradBtn3.Caption := ' Seting';
Label4Pass.Caption := 'Report when:';
Label12.Caption := 'Check it after :';
Label9.Caption := ' Check completions megabyte (On/Off)';
Label2.Caption := ' Start together with Windows';
Label1.Caption := ' Check balance when start';
Label14.Caption := ' Options completions megabyte';
Label15.Caption := ' Language Interface';
Label17.Caption := ' Management Skins (On/Off)';
LabelSellSkn.Caption := ' Select skin Metro or Wood';
GradBtn1.Hint := 'Check the balance of the Mb and balance your tariff plan';
GradBtn3.Hint := 'Settings change password ';
GradBtnAboutsFx.Hint := 'About windows';
EditUsername.Hint := 'Edit the enter password for you to type your tariff plan in the 9-th digit format (for example: 569989487-no need to enter +380)';
Label3.Hint := 'Edit the enter password for you to type your tariff plan in the 9-th digit format (for example: 569989487-no need to enter +380)';
Image1df.Hint := 'Edit the enter password for you to type your tariff plan in the 9-th digit format (for example: 569989487-no need to enter +380)';
EditPassword.Hint := 'Edit the enter password';
Label4.Hint := 'Edit the enter password';
Image2.Hint := 'Edit the enter password';
RUSCheckBox.Hint := 'Select russian';
USACheckBox.Hint := 'Select english';
UACheckBox.Hint := 'Choose the ukrainian';
SpinnerTraf.Hint := 'Choose the number of megabytes';
ComboBoxTraff.Hint := 'Select a scan task of megabytes balance';
SpinnerTime.Hint := 'Select the verification period (minutes)';
CheckBoxTimer.Hint := 'Activate a number of residual traffic';
Label9.Hint := 'Activate a number of residual traffic';
HotKeyEnableEx.Hint := 'Hot keys (On/Off)'+#13+ '   '+#13+' Hot keys: '+#13+'   '+#13+'   - Settings: - T;'+#13+
'   - Check balance: - B;'+#13+'   - Cancel scan check balance: - S;'+#13+'   - Minimize program: - H;'+#13+
'   - Deploy the program: - R;'+#13+'   - Show the about box: - A;';
Label10.Hint := 'Hot keys (On/Off)'+#13+ '   '+#13+' Hot keys: '+#13+'   '+#13+'   - Settings: - T;'+#13+
'   - Check balance: - B;'+#13+'   - Cancel scan check balance: - S;'+#13+'   - Minimize program: - H;'+#13+
'   - Deploy the program: - R;'+#13+'   - Show the about box: - A;';
OnTopCheckBoxFx.Hint := 'On top of all Windows (On/Offл)';
Label7.Hint := 'On top of all Windows (On/Off)';
HintCheckBox.Hint := 'Hint over controls (On/Off)';
Label5.Hint := 'Hint over controls (On/Off)';
AutorunIntertelecom.Hint := 'Put the program autorun (On/Off)'+#13+'  '+#13+'(Run the program along with the Windows 95/98/Me/NT/2000/XP/2003/Vista/7/8/8.1/10)';
Label2.Hint := 'Put the program autorun (On/Off)'+#13+'  '+#13+'(Run the program along with the Windows 95/98/Me/NT/2000/XP/2003/Vista/7/8/8.1/10)';
CheckBox1.Hint := 'Automatically check the balance when starting (On/Off)';
Label1.Hint := 'Automatically check the balance when starting (On/Off)';
Label17.Hint := 'Control skin(On/Off)';
FadeGraphicCheckBoxFx1.Hint := 'Control skin (On/Off)';
LabelSellSkn.Hint := 'Metro select skin or Wood';
SkinSelectFx.Hint := 'Metro select skin or Wood';
AIMPButtonEx5.Hint := 'Support the project';
RxGIFAnimator1.Hint := 'Information About';
GradBtn2.Hint := 'Show full report';
GradBtn6.Hint := 'Return to the main window';
GradBtnSetup.Hint := 'Show full report';
AIMPButtonEx1.Hint := 'Hide about window';
AIMPButtonEx3.Hint := 'Intertelecom in ВКонтакте';
AIMPButtonEx4.Hint := 'Intertelecom in FaceBook';
//IntertelecomSave;
//IntertelecomLoad;
end else
if SelectLanguageItems.ItemIndex = 1 then
begin
USACheckBox.Checked := False;
RUSCheckBox.Checked := True;
UACheckBox.Checked := False;
Label5.Caption := ' Показывать подсказку';
Label7.Caption := ' Поверх всех окон';
Label10.Caption := ' Горячие клавиши';
GradBtn6.Caption := ' Свернуть';
GradBtn2.Caption := ' Отчёт';
GradBtn3.Caption := ' Настройки';
Label4Pass.Caption := 'Сообщить когда:';
Label12.Caption := 'Проверять после:';
Label9.Caption := ' Проверка остатка мегабайт (Вкл/Выкл)';
Label2.Caption := ' Запускать вместе с Windows';
Label1.Caption := ' Проверять баланс при запуске';
Label14.Caption := ' Параметры остатка мегабайт';
Label15.Caption := ' Язык интерфейса';
Label17.Caption := ' Управление скином (Вкл/Выкл)';
LabelSellSkn.Caption := ' Выбрать скина Metro или Wood';
GradBtn1.Hint := 'Проверить остаток Mb и баланс Вашего тарифного плана';
GradBtn3.Hint := 'Настройки смены пароля';
GradBtnAboutsFx.Hint := 'Окно О программе';
EditUsername.Hint := 'Поле для ввода номера Вашего тарифного плана в 9-ти значном формате (например: 569989487 - +380 вводить не надо)';
Label3.Hint := 'Поле для ввода номера Вашего тарифного плана в 9-ти значном формате (например: 569989487 - +380 вводить не надо)';
Image1df.Hint := 'Поле для ввода номера Вашего тарифного плана в 9-ти значном формате (например: 569989487 - +380 вводить не надо)';
EditPassword.Hint := 'Поле для ввода пароля';
Label4.Hint := 'Поле для ввода пароля';
Image2.Hint := 'Поле для ввода пароля';
RUSCheckBox.Hint := 'Выбрать русский';
USACheckBox.Hint := 'Выбрать английский';
UACheckBox.Hint := 'Выбрать украинский';
SpinnerTraf.Hint := 'Выбрать количество мегабайт';
ComboBoxTraff.Hint := 'Выбрать задачу проверки остатка мегабайт';
SpinnerTime.Hint := 'Выбрать период проверки (минут)';
CheckBoxTimer.Hint := 'Активировать проверку на количество остатка трафика';
Label9.Hint := 'Активировать проверку на количество остатка трафика';
HotKeyEnableEx.Hint := 'Горячие клавиши (Вкл/Выкл)'+#13+ '   '+#13+'Горячие клавиши: '+#13+'   '+#13+'   - Настройки: - T;'+#13+
'   - Проверить баланс: - B;'+#13+'   - Отменить проверку: - S;'+#13+'   - Свернуть программу: - H;'+#13+
'   - Развернуть программу: - R;'+#13+'   - Показать окно О программе: - A;';
Label10.Hint := 'Горячие клавиши (Вкл/Выкл)'+#13+ '   '+#13+'Горячие клавиши: '+#13+'   '+#13+'   - Настройки: - T;'+#13+
'   - Проверить баланс: - B;'+#13+'   - Отменить проверку: - S;'+#13+'   - Свернуть программу: - H;'+#13+
'   - Развернуть программу: - R;'+#13+'   - Показать окно О программе: - A;';
OnTopCheckBoxFx.Hint := 'Поверх всех окон (Вкл/Выкл)';
Label7.Hint := 'Поверх всех окон (Вкл/Выкл)';
HintCheckBox.Hint := 'Подсказка над элементами управления (Вкл/Выкл)';
Label5.Hint := 'Подсказка над элементами управления (Вкл/Выкл)';
AutorunIntertelecom.Hint := 'Поместить программу в автозапуск (Вкл/Выкл)'+#13+'  '+#13+'(Запускать программу вместе с Windows 95/98/Me/NT/2000/XP/2003/Vista/7/8/8.1/10)';
Label2.Hint := 'Поместить программу в автозапуск (Вкл/Выкл)'+#13+'  '+#13+'(Запускать программу вместе с Windows 95/98/Me/NT/2000/XP/2003/Vista/7/8/8.1/10)';
CheckBox1.Hint := 'Автоматически проверять баланс при запуске (Вкл/Выкл)';
Label1.Hint := 'Автоматически проверять баланс при запуске (Вкл/Выкл)';
Label17.Hint := 'Управление скином (Вкл/Выкл)';
FadeGraphicCheckBoxFx1.Hint := 'Управление скином (Вкл/Выкл)';
LabelSellSkn.Hint := 'Выбрать скин Metro или Wood';
SkinSelectFx.Hint := 'Выбрать скин Metro или Wood';
AIMPButtonEx5.Hint := 'Поддержать проект';
RxGIFAnimator1.Hint := 'Информация О Программе';
GradBtn2.Hint := 'Показать полный отчет';
GradBtn6.Hint := 'Вернуться к главному окну';
GradBtnSetup.Hint := 'Показать полный отчет';
AIMPButtonEx1.Hint := 'Спрятать окно О программе';
AIMPButtonEx3.Hint := 'Интертелеком ВКонтакте';
AIMPButtonEx4.Hint := 'Интертелеком в FaceBook';
//IntertelecomSave;
//IntertelecomLoad;
end else
if SelectLanguageItems.ItemIndex = 2 then
begin
USACheckBox.Checked := False;
RUSCheckBox.Checked := False;
UACheckBox.Checked := True;
Label5.Caption := ' Відображати підказку';
Label7.Caption := ' Поверх усіх вікон';
Label10.Caption := ' Гарячі клавіши';
GradBtn2.Caption := ' Звіт';
GradBtn6.Caption := ' Згорнути';
Label4Pass.Caption := 'Повідомити коли:';
Label12.Caption := 'Перевірити після:';
GradBtn3.Caption := ' Налаштування';
Label9.Caption := ' Перевірка залишку мегабайт (Увімк/Вимк)';
Label2.Caption := ' Запускати разом з Windows';
Label1.Caption := ' Перевіряти рахунок при запуску';
Label14.Caption := ' Параметри залишку мегабайт';
Label15.Caption := ' Мова інтерфейсу';
Label17.Caption := ' Управління скіном (Увімк/Вимк)';
LabelSellSkn.Caption := ' Виберіть шкіру Metro або Wood';
GradBtn1.Hint := 'Перевірка залишку МБ і баланс Вашого тарифного плану';
GradBtn3.Hint := 'Налаштування заміни пароля';
GradBtnAboutsFx.Hint := 'Вікно про программу';
EditUsername.Hint := 'Місце для введення вашого тарифного плану в 9-му-значному форматі (наприклад: 569989487-немає необхідності вживати + 380)';
Label3.Hint := 'Місце для введення вашого тарифного плану в 9-му-значному форматі (наприклад: 569989487-немає необхідності вживати + 380)';
Image1df.Hint := 'Місце для введення вашого тарифного плану в 9-му-значному форматі (наприклад: 569989487-немає необхідності вживати + 380)';
EditPassword.Hint := 'Місце для введення пароля';
Label4.Hint := 'Місце для введення пароля';
Image2.Hint := 'Місце для введення пароля';
RUSCheckBox.Hint := 'Виберіть російську';
USACheckBox.Hint := 'Виберіть англійську';
UACheckBox.Hint := 'Виберіть українську';
SpinnerTraf.Hint := 'Виберіть кількість мегабайт';
ComboBoxTraff.Hint := 'Виберіть завдання сканування мегабайт балансу';
SpinnerTime.Hint := 'Виберіть період перевірки (хвилин)';
CheckBoxTimer.Hint := 'Активувати кількість залишкового трафіку';
Label9.Hint := 'Активувати кількість залишкового трафіку';
HotKeyEnableEx.Hint := 'Гарячі клавіші (Увім/Вимкн)'+#13+ '   '+#13+' Гарячі клавіші: '+#13+'   '+#13+'   - Параметри: - T;'+#13+
'   - Перевірити залишок Мб: - B;'+#13+'   - Скасувати перевірку залишоку Мб: - S;'+#13+'   - Згорнути програму: - H;'+#13+
'   - Розгорнути програму: - R;'+#13+'   - Показати вікно про програму: - A;';
Label10.Hint := 'Гарячі клавіші (Увім/Вимкн)'+#13+ '   '+#13+' Гарячі клавіші: '+#13+'   '+#13+'   - Параметри: - T;'+#13+
'   - Перевірити залишок Мб: - B;'+#13+'   - Скасувати перевірку залишоку Мб: - S;'+#13+'   - Згорнути програму: - H;'+#13+
'   - Розгорнути програму: - R;'+#13+'   - Показати вікно про програму: - A;';
OnTopCheckBoxFx.Hint := 'Поверх всіх вікон (Увім/Вимкн)';
Label7.Hint := 'Поверх всіх вікон (Увім/Вимкн)';
HintCheckBox.Hint := 'Підказки над елементи керування (Увім/Вимкн)';
Label5.Hint := 'Підказки над елементи керування (Увім/Вимкн)';
AutorunIntertelecom.Hint := 'Поставити програму у віддалених без ключа запису (Увім/Вимкн)'+#13+'  '+#13+'(Запускати програму разом з Windows 95/98/Me/NT/2000/XP/2003/Vista/7/8/8.1/10)';
Label2.Hint := 'Поставити програму у віддалених без ключа запису (Увім/Вимкн)'+#13+'  '+#13+'(Запускати програму разом з Windows 95/98/Me/NT/2000/XP/2003/Vista/7/8/8.1/10)';
CheckBox1.Hint := 'Автоматично перевіряти залишок при запуску (Увім/Вимкн)';
Label1.Hint := 'Автоматично перевіряти залишок при запуску (Увім/Вимкн)';
Label17.Hint := 'Керування шкіркою (Увім/Вимкн)';
FadeGraphicCheckBoxFx1.Hint := 'Керування шкіркою (Увім/Вимкн)';
LabelSellSkn.Hint := 'Виберіть шкірку Metro або Wood';
SkinSelectFx.Hint := 'Виберіть шкірку Metro або Wood';
AIMPButtonEx5.Hint := 'Підтримати проект';
RxGIFAnimator1.Hint := 'Інформація про програму';
GradBtn2.Hint := 'Відображати повний звіт';
GradBtn6.Hint := 'Повернутися до головного вікна';
GradBtnSetup.Hint := 'Відображати повний звіт';
AIMPButtonEx1.Hint := 'Приховати вікно Про Програму';
AIMPButtonEx3.Hint := 'Інтертелеком ВКонтакте';
AIMPButtonEx4.Hint := 'Інтертелеком в facebook.com';
//IntertelecomSave;
//IntertelecomLoad;
end;
end;

function TIntertelecomForm.GetOnlineStatus: Boolean;
var
  Types: Integer;
begin
  Types := INTERNET_CONNECTION_MODEM +
  INTERNET_CONNECTION_LAN + INTERNET_CONNECTION_PROXY;
  Result := InternetGetConnectedState(@Types, 0);
end;

procedure TIntertelecomForm.MyShowHint(var HintStr: string; var CanShow: Boolean; var HintInfo: THintInfo);
var
  i: integer;
begin
 for i := 0 to Application.ComponentCount - 1 do
    if Application.Components[i] is THintWindow then
   with THintWindow(Application.Components[i]).Canvas do
   begin
        Font.name := 'Arial';
        Font.Size := 8;
        Font.Style := [fsBold];
        HintInfo.HintColor := clWhite;
   end;
end;

function DocumentExists(Browser: TWebBrowser; out Document: IHTMLDocument2): Boolean;
begin
  Result := Assigned(Browser.ControlInterface.Document);
  if (Result) then
  begin
    Browser.ControlInterface.Document.QueryInterface(IHtmlDocument2, Document);
    Result := Assigned(Document);
  end;
end;

function FillForm(WebBrowser: TWebBrowser; const FieldName, Value: string): Boolean;
var
  iForms, iItems: Integer;
  FormItem: OleVariant;
begin
  Result := False;
  try
    for iForms := 0 to WebBrowser.OleObject.Document.forms.Length -1 do
    begin
      FormItem := WebBrowser.OleObject.Document.forms.Item(iForms);
      for iItems := 0 to FormItem.Length -1 do
      begin
        if (FormItem.Item(iItems).Name = FieldName) then
        begin
          FormItem.Item(iItems).Value := Value;
          Result := True;
          Exit;
        end;
      end;
    end;
  except
    Exit;
  end;
end;

function AcceptForm(WebBrowser: TWebBrowser): Boolean;
var
  iForms, iItems: Integer;
  FormItem: OleVariant;
begin
  Result := False;
  try
    for iForms := 0 to WebBrowser.OleObject.Document.forms.Length -1 do
    begin
      FormItem := WebBrowser.OleObject.Document.forms.Item(iForms);
      for iItems := 0 to FormItem.Length -1 do
      begin
        if (FormItem.Item(iItems).Type = 'submit') then
        begin
          FormItem.Item(iItems).Click();
          Result := True;
          Exit;
        end;
      end;
    end;
  except
    Exit;
  end;
end;

function ErrorExists(WebBrowser: TWebBrowser; out ErrorText: string): Boolean;
const
  HTML_ERROR_START = '<P class=error>';
  HTML_ERROR_END = '</P>';
var
  Document: IHTMLDocument2;
  Html: string;
  O1, O2: Integer;
begin
  Result := False;
  if (DocumentExists(WebBrowser, Document)) then
  begin
    html := Document.body.innerHTML;

    O1 := Pos(HTML_ERROR_START, Html);
    if (O1 = 0) then
      Exit;
    Inc(O1, Length(HTML_ERROR_START));
    O2 := PosEx(HTML_ERROR_END, Html, O1);
    if (O2 = 0) then
      Exit;
    ErrorText := Copy(Html, O1, O2 - O1);
    Result := True;
  end
  else
    ErrorText := '';
end;

function ExtractInfos(WebBrowser: TWebBrowser; List: TStringList; ClearBeforeFill: Boolean = True): Boolean;
var
  TABLES: IHTMLElementCollection;
  TR: IHTMLElementCollection;
  TD: IHTMLElementCollection;
  E: IHTMLElement;
  Document: IHTMLDocument2;
  I, J: Integer;
  Key, Value: string;
begin
  Result := False;

  if (ClearBeforeFill) then
    List.Clear();

  if (not DocumentExists(WebBrowser, Document)) then
    Exit;

  TABLES := Document.all.tags('table') as IHTMLElementCollection;
  for I := 1 to TABLES.length-1 do
  begin
    E := TABLES.item(I, null) as IHTMLElement;

    TR := (E as IHTMLElement2).getElementsByTagName('tr') as IHTMLElementCollection;
    for J := 0 to TR.length-1 do
    begin
      E := TR.item(J, null) as IHTMLElement;

      TD := (E as IHTMLElement2).getElementsByTagName('td') as IHTMLElementCollection;
      if (TD.length > 0) then
      begin
        E := TD.item(0, null) as IHTMLElement;
        Key := E.innerText;
        if (TD.length > 1) then
        begin
          E := TD.item(1, null) as IHTMLElement;
          Value := E.innerText;
        end else
        begin
          Value := '';
        end;

        List.Values[Key] := Value;
      end;
    end;
  end;
  Result := List.Count > 0;
end;

procedure TIntertelecomForm.OnEnd(Sender: TObject);
begin
  Hide;
end;

procedure TIntertelecomForm.OnStart(Sender: TObject);
begin
  Show;
end;



procedure TIntertelecomForm.PlayDVD_On;
var
   t: DWORD;
   r: TRect;
begin
  {$IFNDEF WHND}
  SystemParametersInfo(SPI_GETWORKAREA, 0,@r,0);
  {$ENDIF}
  {$IFDEF WHND}
  SystemParametersInfo(SPI_GETWORKAREA, 0,r,0);
  {$ENDIF}
 while (Panel7.Top < r.Bottom) and (Panel2.Top < r.Bottom)do
  begin
   t := GetTickCount;
    while GetTickCount - t < 1 do
    begin
    Application.ProcessMessages;
    Panel7.Top := Panel7.Top + 5;
    Panel2.Top := Panel2.Top - 5;
    end;
    if (Panel7.Top > 1) or (Panel2.Top < 83)  then
    begin
    Panel2.Top := 84;
    Panel7.Top := 3;
    NxPanel1.Visible := True;
    IntertelecomForm.Height := 168;
    Exit;
   end;
  end;
end;

procedure TIntertelecomForm.PlayDVD_Off;
var
   t: DWORD;
   r: TRect;
begin
NxPanel1.Visible := False;
  {$IFNDEF WHND}
  SystemParametersInfo(SPI_GETWORKAREA, 0,@r,0);
  {$ENDIF}
  {$IFDEF WHND}
  SystemParametersInfo(SPI_GETWORKAREA, 0,r,0);
  {$ENDIF}
 while (Panel7.Top < r.Bottom) and (Panel2.Top < r.Bottom) do
  begin
   t := GetTickCount;
    while GetTickCount - t < 1 do
    begin
    Application.ProcessMessages;
    Panel7.Top := Panel7.Top - 9;
    Panel2.Top := Panel2.Top + 8;
    end;
    if (Panel7.Top < - 296) and (Panel2.Top > - 147)  then
    begin
   Panel7.Top := - 296;
   Panel2.Top := 147;
   ALScrollingText1.Visible := False;
    Exit;
    end;
  end;
end;

procedure TIntertelecomForm.PlayDVD_OnSave;
var
   t: DWORD;
   r: TRect;
begin
  {$IFNDEF WHND}
  SystemParametersInfo(SPI_GETWORKAREA, 0,@r,0);
  {$ENDIF}
  {$IFDEF WHND}
  SystemParametersInfo(SPI_GETWORKAREA, 0,r,0);
  {$ENDIF}
if Panel2.Top <= 147 then
begin
 while (Panel7.Top < r.Bottom) and (Panel2.Top < r.Bottom)do
  begin
   t := GetTickCount;
    while GetTickCount - t < 1 do
    begin
    Application.ProcessMessages;
    Panel7.Top := Panel7.Top + 95;
    Panel2.Top := Panel2.Top - 93;
    end;
    if (Panel7.Top > 1) or (Panel2.Top < 83)  then
    begin
    Panel2.Top := 84;
    Panel7.Top := 3;
    NxPanel1.Visible := True;
    IntertelecomForm.Height := 168;
    Exit;
   end;
  end;
 end;
end;

procedure TIntertelecomForm.RollDown;
var
   t: DWORD;
   r: TRect;
begin
//PlayDVD_On;
ALScrollingText1.Visible := True;
Panel3.Visible := False;
NxPanel1.Visible := True;
ToolsCheckBoxSx.Checked := True;
    {$IFNDEF WHND}
  SystemParametersInfo(SPI_GETWORKAREA, 0,@r,0);
  {$ENDIF}
  {$IFDEF WHND}
  SystemParametersInfo(SPI_GETWORKAREA, 0,r,0);
  {$ENDIF}
    while (IntertelecomForm.Height < r.Bottom) and (Panel2.Top < r.Bottom) do
  begin
   t := GetTickCount;
    while GetTickCount - t < 1 do
    Application.ProcessMessages;
    if sSkinManager1.Active = True then
    begin
    IntertelecomForm.Height := IntertelecomForm.Height + 28;
    Panel2.Top := Panel2.Top +28; end else
    if sSkinManager1.Active = False then
    begin
    IntertelecomForm.Height := IntertelecomForm.Height + 17;
    Panel2.Top := Panel2.Top +17; end;
    if (IntertelecomForm.Height > 502) or (Panel2.Top > 420) then
    begin
    IntertelecomForm.Height := 502;
    Panel2.Top := 420;
    Exit;
    end;
    end;
end;

procedure TIntertelecomForm.RollUp;
var
   t: DWORD;
   r: TRect;
begin
ToolsCheckBoxSx.Checked := False;
    {$IFNDEF WHND}
  SystemParametersInfo(SPI_GETWORKAREA, 0,@r,0);
  {$ENDIF}
  {$IFDEF WHND}
  SystemParametersInfo(SPI_GETWORKAREA, 0,r,0);
  {$ENDIF}
    while (IntertelecomForm.Height < r.Bottom) and (Panel2.Top < r.Bottom) do
  begin
   t := GetTickCount;
    while GetTickCount - t < 1 do
    Application.ProcessMessages;
    if sSkinManager1.Active = True then
    begin
    IntertelecomForm.Height := IntertelecomForm.Height - 28;
    Panel2.Top := Panel2.Top - 28; end else
    if sSkinManager1.Active = False then
    begin
    IntertelecomForm.Height := IntertelecomForm.Height - 17;
    Panel2.Top := Panel2.Top - 17; end;
    if (IntertelecomForm.Height < 167) or (Panel2.Top < 84) then
    begin
    IntertelecomForm.Height := 168;
    NxPanel1.Visible := False;
    Panel2.Top := 84;
    Panel3.Visible := True;
    IntertelecomSave;
    Exit;
    end;
    end;
end;

procedure TIntertelecomForm.PlaySndOnBtn;
begin
if HintCheckBox.Checked = True then
  begin
    Application.HintPause := 500;
  end else
if HintCheckBox.Checked = False then
  begin
    Application.HintPause := 50000;
 end;
//     IntertelecomSave;
//    IntertelecomLoad;

end;


procedure TIntertelecomForm.IntertelecomLoad;
var
   RegIniFile:TRegIniFile;
begin
 RegIniFile:=TRegIniFile.Create('Software');
 RegIniFile.OpenKey('Intertelecom Tools',true);
 RegIniFile.OpenKey('Intertelecom Tools-Open',true);
 begin
 CheckBox1.Checked := RegIniFile.ReadBool('Intertelecom','AutoBalans', False);
 AutorunIntertelecom.Checked := RegIniFile.ReadBool('Intertelecom','AutorunIntertelecomFx', False);
 SelectLimitN1.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN1Checked', False);
 SelectLimitN2.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN2Checked', False);
 SelectLimitN3.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN3Checked', False);
 SelectLimitN4.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN4Checked', False);
 SelectLimitN5.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN5Checked', False);
 SelectLimitN6.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN6Checked', False);
 SelectLimitN7.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN7Checked', False);
 SelectLimitN8.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN8Checked', False);
 SelectLimitN9.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN9Checked', False);
 SelectLimitN10.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN10Checked', False);
 SelectLimitN11.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN11Checked', False);
 SelectLimitN12.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN12Checked', False);
 SelectLimitN13.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN13Checked', False);
 SelectLimitN14.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN14Checked', False);
 SelectLimitN15.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN15Checked', False);
 SelectLimitN16.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN16Checked', False);
 SelectLimitN17.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN17Checked', False);
 SelectLimitN18.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN18Checked', False);
 SelectLimitN19.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN19Checked', False);
 SelectLimitN20.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN20Checked', False);
 SelectLimitN21.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN21Checked', False);
 SelectLimitN22.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN22Checked', False);
 SelectLimitN23.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN23Checked', False);
 SelectLimitN24.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN24Checked', False);
 SelectLimitN25.Checked :=  RegIniFile.ReadBool('Intertelecom','SelectLimitN25Checked', False);
 HintCheckBox.Checked := RegIniFile.ReadBool('Intertelecom','HintCheckBox', True);
 SkinSelectFx.Checked := RegIniFile.ReadBool('Intertelecom','SkinSelectFxChecked', False);
 HotKeyEnableEx.Checked := RegIniFile.ReadBool('Intertelecom','HotKeyEnableExInc', False);
 OnTopCheckBoxFx.Checked := RegIniFile.ReadBool('Intertelecom','OnTopCheckBoxFx-RegSave', False);
 CheckBoxTimer.Checked := RegIniFile.ReadBool('Intertelecom','CheckBoxTimerChecked', False);
 SpinnerTime.Value := RegIniFile.ReadInteger('Intertelecom','SpinnerTimeValues', SpinnerTime.Value);
 SpinnerTraf.Value := RegIniFile.ReadInteger('Intertelecom','SpinnerTrafValue', SpinnerTraf.Value);
 TimeCheckFx.Interval := RegIniFile.ReadInteger('Intertelecom','TimeCheckFxInterval', TimeCheckFx.Interval);
 SelectLanguageItems.ItemIndex := RegIniFile.ReadInteger('Intertelecom','SelectLanguageItems', SelectLanguageItems.ItemIndex);
 ComboBoxTraff.ItemIndex := RegIniFile.ReadInteger('Intertelecom','ComboBoxTraffItemIndex', ComboBoxTraff.ItemIndex);
 TimeCheckFx.Enabled := RegIniFile.ReadBool('Intertelecom','TimeCheckFxEnabledCheck', False);
 USACheckBox.Checked := RegIniFile.ReadBool('Intertelecom','UASCheckBoxCheck', False);
 RUSCheckBox.Checked := RegIniFile.ReadBool('Intertelecom','RUSCheckBoxCheck', True);
 UACheckBox.Checked := RegIniFile.ReadBool('Intertelecom','UACheckBoxCheck', False);
 EditUsername.Text := RegIniFile.ReadString('Intertelecom','EditUsernameFx',EditUsername.Text);
 EditPassword.Text := RegIniFile.ReadString('Intertelecom','EditPasswordFx',EditPassword.Text);
 sSkinManager1.SkinName := RegIniFile.ReadString('Intertelecom','sSkinManagerSkinName', sSkinManager1.SkinName);
 sSkinManager1.Active := RegIniFile.ReadBool('Intertelecom','sSkinManagerActive',True);
 FadeGraphicCheckBoxFx1.Checked := RegIniFile.ReadBool('Intertelecom','FadeGraphicCheckBoxFxActive',True);
 Panel2.Top := RegIniFile.ReadInteger('Intertelecom','Panel2Top',Panel2.Top);
 IntertelecomForm.Height := RegIniFile.ReadInteger('Intertelecom','IntertelecomFormHeight',IntertelecomForm.Height);
 Panel3.Visible := RegIniFile.ReadBool('Intertelecom','Panel3Visible',True);
 ToolsCheckBoxSx.Checked := RegIniFile.ReadBool('Intertelecom','ToolsCheckBoxVisibleSx',False);
 Edit_Serial.Caption := RegIniFile.ReadString('Intertelecom','SerialCaption', Edit_Serial.Caption);
 Edit_Username.Caption := RegIniFile.ReadString('Intertelecom','EditUsername', Edit_Username.Caption);
 RegIniFile.Free;
end;
end;

procedure TIntertelecomForm.IntertelecomSave;
var
   RegIniFile:TRegIniFile;
begin
 RegIniFile:=TRegIniFile.Create('Software');
 RegIniFile.OpenKey('Intertelecom Tools',true);
 RegIniFile.OpenKey('Intertelecom Tools-Open',true);
 begin
 RegIniFile.WriteBool('Intertelecom','AutoBalans', CheckBox1.Checked);
 RegIniFile.WriteBool('Intertelecom','AutorunIntertelecomFx', AutorunIntertelecom.Checked);
 RegIniFile.WriteBool('Intertelecom','HintCheckBox', HintCheckBox.Checked);
 RegIniFile.WriteBool('Intertelecom','HotKeyEnableExInc', HotKeyEnableEx.Checked);
 RegIniFile.WriteBool('Intertelecom','OnTopCheckBoxFx-RegSave', OnTopCheckBoxFx.Checked);
 RegIniFile.WriteBool('Intertelecom','CheckBoxTimerChecked', CheckBoxTimer.Checked);
 RegIniFile.WriteBool('Intertelecom','TimeCheckFxEnabledCheck', TimeCheckFx.Enabled);
 RegIniFile.WriteBool('Intertelecom','UASCheckBoxCheck', USACheckBox.Checked);
 RegIniFile.WriteBool('Intertelecom','RUSCheckBoxCheck', RUSCheckBox.Checked);
 RegIniFile.WriteBool('Intertelecom','UACheckBoxCheck', UACheckBox.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN1Checked', SelectLimitN1.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN2Checked', SelectLimitN2.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN3Checked', SelectLimitN3.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN4Checked', SelectLimitN4.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN5Checked', SelectLimitN5.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN6Checked', SelectLimitN6.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN7Checked', SelectLimitN7.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN8Checked', SelectLimitN8.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN9Checked', SelectLimitN9.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN10Checked', SelectLimitN10.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN11Checked', SelectLimitN11.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN12Checked', SelectLimitN12.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN13Checked', SelectLimitN13.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN14Checked', SelectLimitN14.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN15Checked', SelectLimitN15.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN16Checked', SelectLimitN16.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN17Checked', SelectLimitN17.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN18Checked', SelectLimitN18.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN19Checked', SelectLimitN19.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN20Checked', SelectLimitN20.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN21Checked', SelectLimitN21.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN22Checked', SelectLimitN22.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN23Checked', SelectLimitN23.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN24Checked', SelectLimitN24.Checked);
 RegIniFile.WriteBool('Intertelecom','SelectLimitN25Checked', SelectLimitN25.Checked);
 RegIniFile.WriteBool('Intertelecom','SkinSelectFxChecked', SkinSelectFx.Checked);
 RegIniFile.WriteString('Intertelecom','EditUsernameFx',EditUsername.Text);
 RegIniFile.WriteString('Intertelecom','sSkinManagerSkinName', sSkinManager1.SkinName);
 RegIniFile.WriteInteger('Intertelecom','SpinnerTimeValues', SpinnerTime.Value);
 RegIniFile.WriteInteger('Intertelecom','SpinnerTrafValue', SpinnerTraf.Value);
 RegIniFile.WriteInteger('Intertelecom','SelectLanguageItems', SelectLanguageItems.ItemIndex);
 RegIniFile.WriteInteger('Intertelecom','ComboBoxTraffItemIndex', ComboBoxTraff.ItemIndex);
 RegIniFile.WriteInteger('Intertelecom','TimeCheckFxInterval', TimeCheckFx.Interval);
 RegIniFile.WriteString('Intertelecom','EditPasswordFx',EditPassword.Text);
 RegIniFile.WriteBool('Intertelecom','sSkinManagerActive',sSkinManager1.Active);
 RegIniFile.WriteInteger('Intertelecom','Panel2Top',Panel2.Top);
 RegIniFile.WriteInteger('Intertelecom','IntertelecomFormHeight',IntertelecomForm.Height);
 RegIniFile.WriteBool('Intertelecom','Panel3Visible',Panel3.Visible);
 RegIniFile.WriteBool('Intertelecom','ToolsCheckBoxVisibleSx',ToolsCheckBoxSx.Checked);
 RegIniFile.WriteBool('Intertelecom','FadeGraphicCheckBoxFxActive', FadeGraphicCheckBoxFx1.Checked);
 RegIniFile.WriteString('Intertelecom','SerialCaption', Edit_Serial.Caption);
 RegIniFile.WriteString('Intertelecom','EditUsername', Edit_Username.Caption);
 RegIniFile.Free;
end;
end;

procedure TIntertelecomForm.IntertelecomAutoRunOther;
var
   hOther: TRegistry;
begin
    hOther := TRegistry.Create;
    hOther.RootKey := HKEY_CURRENT_USER;
    hOther.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', true);
    if AutorunIntertelecom.Checked = True then
    begin
    if FileExists(ExtractFilePath(Application.ExeName) + 'Intertelecom.exe') then
    hOther.WriteString('ApplicationIntertelecom', ExtractFilePath(Application.ExeName) +'Intertelecom.exe');
    end else
    if AutorunIntertelecom.Checked  = False then
    begin
    hOther.RootKey := HKEY_CURRENT_USER;
    hOther.OpenKey('\Software\Microsoft\Windows\CurrentVersion\Run', true);
    DellKeyEx := hOther.DeleteKey('ApplicationIntertelecom');
    DellKeyEx := hOther.DeleteValue('ApplicationIntertelecom');
    hOther.CloseKey;
    //hOther.Free;
  end;
end;

procedure TIntertelecomForm.WMHotKeyFx(var Msg: TWMHotKey);
begin
RegHotKeyOnOff;
  if Msg.HotKey = id1B then
  begin
  GradBtn1.Perform(WM_LBUTTONDOWN, 0, 0);
  GradBtn1.Perform(WM_LBUTTONUP, 0, 0);
  end;
  if Msg.HotKey = id1S then
  begin
  WebBrowser1.Stop;
      Timer3.Enabled := True;
      CoolTrayIcon1.CycleIcons := True;
  end;
  if Msg.HotKey = id1A then
  begin
  PlaySndOnBtn;
  if AboutCheck.Checked = True then
  IntertelecomAlertFx.CloseUp else
  if AboutCheck.Checked = False then
  IntertelecomAlertFx.PopUp;
  {GradBtn7.Perform(WM_LBUTTONDOWN, 0, 0);
  GradBtn7.Perform(WM_LBUTTONUP, 0, 0);}
  end;
  if Msg.HotKey = id1H then
  begin
  GradBtn6.Perform(WM_LBUTTONDOWN, 0, 0);
  GradBtn6.Perform(WM_LBUTTONUP, 0, 0);
  HideBalloonEx := CoolTrayIcon1.HideBalloonHint;
  IntertelecomAlertFx.CloseUp;
  Application.Minimize;
  HideBalloonHintFx.Checked := True;
  end;
  if Msg.HotKey = id1R then
  begin
   if IsMinimized then
  begin
    HideBalloonEx := CoolTrayIcon1.HideBalloonHint;
    case RadioGroup1.ItemIndex of
      1: begin
        FloatRectangles(False, True);
        CoolTrayIcon1.ShowMainForm;
        SetForegroundWindow(Application.Handle);
        HideBalloonHintFx.Checked := False;
      end;
    end;
    IsMinimized := False;
  end;
  end;
 if Msg.HotKey = id1T then
  begin
  GradBtn3.Perform(WM_LBUTTONDOWN, 0, 0);
  GradBtn3.Perform(WM_LBUTTONUP, 0, 0);
  end;
   if Msg.HotKey = id1Esc then
   begin
   if GetFocus <=0 then
   begin
   if MessageBox(GetForegroundWindow(),'Вы действительно хотите закрыть программу?','Intertelecom Inform',MB_YESNO or MB_ICONWARNING) = IDYES then
   close else
   SetForegroundWindow(Application.Handle);
   Exit;
   end;
   if GetFocus >=0 then
   begin
   Timer4.Enabled := True;
   end;
 end;
end;

procedure TIntertelecomForm.FormCreate(Sender: TObject);
begin
DoubleBuffered := true;
SystemParametersInfo(SPI_SETBEEP,0,nil,SPIF_SENDWININICHANGE);
RxGIFAnimator1.Align :=  alClient;
Panel7.Left := 1;
Panel7.Top := 3;
Panel2.Top := 84;
IntertelecomForm.Height := 168;
IntertelecomForm.Width := 298;
TimerOnTopCheck.Enabled := True;
Application.OnShowHint := MyShowHint;
  Enabled := False;
  Enabled := True;
  InvalidateRect(0, nil, True);
HideBalloonEx := True;
IntertelecomLoad;
PlayDVD_OnSave;
RxGIFAnimator2.Image.FrameIndex := 4;
AutoBalans.Enabled := True;
if CheckBoxTimer.Checked = True then
begin
TimeCheckFx.Enabled := True;
end else
if CheckBoxTimer.Checked = False then
begin
TimeCheckFx.Enabled := False;
end;
Caption := '«Intertelecom Balans»';
RegHotKeyOnOff;
if HintCheckBox.Checked = True then
begin
Application.HintPause := 500;
end else
if HintCheckBox.Checked = False then
begin
Application.HintPause := 50000;
end;
SkinSelectFxTimer.Enabled := True;
end;

procedure TIntertelecomForm.UpdateInfo(List: TStringList);
  function FormatValue(const Color: TColor; const Value: string): string;
  begin
    Result := Format('<FONT color="#%.6x">%s</FONT>', [Color, Value]);
  end;

  function FormatLine(const Caption, Value: string): string;
  begin
    Result := FormatValue($00161616, Caption) + ' ' + FormatValue($0000FF, Value) + #13#10;
  end;

  function FormatValueDef(const Color: TColor; const Value: string): string;
  begin
     Result := Format('<FONT color="#%.6x">%s</FONT>', [Color, Value]);
  end;

  function FormatLineDef(const Caption, Value: string): string;
  begin
     Result := FormatValueDef($00161616, Caption) + ' ' + FormatValueDef($921F57, Value) + #13#10;
  end;

var
  Traffic, TrafficBonus, TrafficSesia: string;
  p, pb, ps, coutsfx, coutssx: Integer;
begin
  Traffic := Trim(List.Values['пакетный трафик (Rev.A/Rev.B)']);
  p := Pos(' ', Traffic);
  if (p > 0) then
  Traffic := Copy(Traffic, 1, p - 6);
  TrafficBonus := Trim(List.Values['по акции (Rev.A/Rev.B)']);
  pb := Pos(' ', TrafficBonus);
  if (pb > 0) then
  TrafficBonus := Copy(TrafficBonus, 1, pb - 1);
  TrafficSesia := Trim(List.Values['Трафик МБ']);
  ps := Pos(' ', TrafficSesia);
  if (ps > 0) then
  TrafficSesia := Copy(TrafficSesia, 1, ps - 1);
  ResultLabel.HTMLText.Clear();
  RealTimeTraff.HTMLText.Clear();
  RealTimeTraff.HTMLText.Add(FormatLine('Трафик сессии: ', List.Values['Трафик МБ'] + ' Mb'));
  RealTimeTraff.HTMLText.Add(FormatLine('Абонентский стаж:', List.Values['Абонентский стаж (гг.мм)']+' года.'));
  ResultLabel.HTMLText.Add(FormatLineDef('Тарифный план:', List.Values['тарифный план']));
  ResultLabel.HTMLText.Add(FormatLine('Состояние:', List.Values['Состояние']));
  ResultLabel.HTMLText.Add(FormatLine('Баланс:', List.Values['Сальдо']));
//  ShowMessage(FloatToStr(Trunc(StrToFloat(TrafficSesia))));
 if Traffic <='' then
  begin
  ResultLabel.HTMLText.Add(FormatLine('Бонусный Трафик:',Traffic+' 0 Mb'));
  end else
  ResultLabel.HTMLText.Add(FormatLine('Пакетный Трафик:',Traffic+' Mb'));
  if TrafficBonus <='' then
  begin
  ResultLabel.HTMLText.Add(FormatLine('Бонусный Трафик:',TrafficBonus+' 0 Mb'));
  end else
  ResultLabel.HTMLText.Add(FormatLine('Бонусный Трафик:',TrafficBonus+' Mb'));
  if CheckBoxTimer.Checked = False then
  begin
  Exit;
  end;
  if (HideBalloonHintFx.Checked = True) and (CheckBoxTimer.Checked = False)  then
    begin;
    Button2.Perform(WM_LBUTTONDOWN, 0, 0);
    Button2.Perform(WM_LBUTTONUP, 0, 0);
   end;

  if (CheckBoxTimer.Checked = True) and (ComboBoxTraff.ItemIndex = 1) then
  begin
  coutssx := StrToInt(Copy(TrafficSesia,1,Pos ('.',TrafficSesia)-1));
  if  coutssx > SpinnerTraf.Value then
  begin
  CoolTrayIcon1.ShowBalloonHint('«Intertelecom Balans»', 'Вы использовали указанный трафик cесии ' + IntToStr(SpinnerTraf.Value)  + ' Мб' +#13+
  '   '+#13+'Трафик сесии: '+TrafficSesia+' Mb' +#13+ 'Пакетный Трафик: '+Traffic+' Mb',bitWarning,10);
  Windows.Beep(5100,200);
//  ShowMessage(Copy(TrafficSesia,1,Pos ('.',TrafficSesia)-1));
  end;
  end;
  if (CheckBoxTimer.Checked = True) and (ComboBoxTraff.ItemIndex = 0) then
  begin
  coutsfx := StrToInt(Traffic);
  if  coutsfx < SpinnerTraf.Value then
  begin
  CoolTrayIcon1.ShowBalloonHint('«Intertelecom Balans»', 'Осталось меньше ' + IntToStr(SpinnerTraf.Value)  + ' Мб' +#13+
  'Пакетный Трафик: '+Traffic+' Mb' ,bitWarning,10);
  Windows.Beep(5100,200);
  end else
  if  coutsfx = SpinnerTraf.Value then
  begin
  CoolTrayIcon1.ShowBalloonHint('«Intertelecom Balans»', 'Вы использовали указанный трафик ' + IntToStr(SpinnerTraf.Value)  + ' Мб' +#13+
  'Пакетный Трафик: '+Traffic+' Mb' ,bitWarning,10);
  Windows.Beep(5100,200);
  end else
  if Traffic = '0.0000' then
  begin
  CoolTrayIcon1.ShowBalloonHint('«Intertelecom Balans»', 'Закончился траффик ' ,bitError,10);
  Windows.Beep(5100,200);
  end;
 end;
end;

procedure TIntertelecomForm.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  Browser: TWebBrowser;
  List: TStringList;
  I: Integer;
  ErrorText: string;
  FS: TFormatSettings;
  Traffic, TrafficBonus: string;
  p,pb,Index: Integer;
  Flags, TargetFrameName, PostData, Headers: OleVariant;
//  d:PWindowPlacement;
begin
GetLocaleFormatSettings (0, FS);
FS.LongTimeFormat:='HH:MM';
  Browser := Sender as TWebBrowser;
  if (Pos('/login', URL) > 0) then
  begin
    if (ErrorExists(Browser, ErrorText)) then
      raise Exception.CreateFmt(ERROR_LOGIN, [ErrorText]);

    if (not FillForm(Browser, 'phone', EditUsername.Text)) then
    begin
    Timer7.Enabled := True;
      raise Exception.Create(ERROR_FIELD_PHONE_NOT_FOUND);
    end;
    if (not FillForm(Browser, 'pass', EditPassword.Text)) then
      raise Exception.Create(ERROR_FIELD_PASSWORD_NOT_FOUND);
    if (not AcceptForm(Browser)) then
      raise Exception.Create(ERROR_SUBMIT_FAILED);
    GradBtn3.Enabled := True;
     {WebBrowser1.Stop;
     Flags:=4;
     WebBrowser1.Navigate(URL, Flags, TargetFrameName, PostData, Headers);
     IntertelecomSave;
     IntertelecomLoad;}
//     GradBtn3.Enabled := True;
  end else
  if (Pos('/statistic', URL) > 0) then
  begin
    List := TStringList.Create();
    try
      if (not ExtractInfos(Browser, List)) then
      Timer3.Enabled := True;
      CoolTrayIcon1.CycleIcons := True;
      WebBrowser1.OleObject.Document.ParentWindow.ScrollBy(0, +645);
      WebBrowser1.OleObject.Document.ParentWindow.ScrollBy(+250, 0);
//        raise Exception.Create(ERROR_ON_EXTRACT_INFOS);
        AIMPButtonEx2.Visible := True;
        PlayDVD_Off;
      StringGrid1.RowCount := List.Count + 1;
      for I := 0 to List.Count - 1 do
      begin
        StringGrid1.Cells[0, I+1] := List.Names[I];
        StringGrid1.Cells[1, I+1] := List.ValueFromIndex[I];
      end;
      UpdateInfo(List);
      Traffic := Trim(List.Values['пакетный трафик (Rev.A/Rev.B)']);
      p := Pos(' ', Traffic);
      if (p > 0) then
      Traffic := Copy(Traffic, 1, p - 1);
      TrafficBonus := Trim(List.Values['по акции (Rev.A/Rev.B)']);
      pb := Pos(' ', TrafficBonus);
      if (pb > 0) then
      TrafficBonus := Copy(TrafficBonus, 1, pb - 1);
//      IsIconic(Application.Handle)
for i := 0 to List.Count - 1 do
  begin
    if AnsiStartsText('Текущая сессия интернет без тарификации', List.Names[i]) then
    begin
    sesions.Caption := 'Интернет-сессия: ' + List.ValueFromIndex[i];
      Break;
    end;
  end;
      if (HideBalloonHintFx.Checked = True) and (CheckBoxTimer.Checked = False)  then
      begin;
       CoolTrayIcon1.ShowBalloonHint('«Intertelecom Balans»',
        'Тарифный план: ' + List.Values['тарифный план'] + sLineBreak +
        'Состояние: ' +  List.Values['Состояние']  + sLineBreak +
        'Баланс: ' + List.Values['Сальдо'] + sLineBreak +
        sLineBreak + 'Пакетный трафик: ' + Traffic + ' Mb'+sLineBreak+'Трафик сессии: ' + List.Values['Трафик МБ'] + ' Mb'+
        sLineBreak+sLineBreak+'Текущая сессия интернет:' +sesions.Caption,bitInfo,10);
        RollDown;
      end;
      Memo1.Lines.Text := 'Лицевой счет: '+List.Values['Лицевой счет'] +
      sLineBreak +'Тарифный план: ' + List.Values['тарифный план'] +
      sLineBreak +'Абонент: ' + List.Values['Абонент'] +
      sLineBreak +'Абонентский номер: ' + List.Values['Абонентский код'] +
      sLineBreak +'Дата подключения: ' + List.Values['Дата подключения'] +
      sLineBreak +'Дата последней активности: ' + List.Values['Дата последней абонентской активности (мм.гггг)'] +
      sLineBreak +'Абонентский стаж: '+ List.Values['Абонентский стаж (гг.мм)']+' года.'+
      sLineBreak +sLineBreak +'E-Mail: ' + List.Values['E-Mail'] +
      sLineBreak +'IP адрес: ' + List.Values['IP'] +
      sLineBreak +sLineBreak +'Состояние: ' +  List.Values['Состояние']  +
      sLineBreak + 'Баланс: ' + List.Values['Сальдо'] +
      sLineBreak + sLineBreak + 'Пакетный трафик: ' + Traffic + ' Mb'+
      sLineBreak + 'Бонусный трафик: ' + TrafficBonus + ' Mb'+
      sLineBreak +sLineBreak +'Трафик сессии: ' + List.Values['Трафик МБ'] + ' Mb'+sLineBreak+
      sLineBreak+'Текущая сессия интернет:' +sesions.Caption;
      Caption := '«Intertelecom Balans»';
      Timer7.Enabled := False;
      AdvCircularProgress1.Enabled := False;
      AdvCircularProgress1.Appearance.TransitionSegmentColor := $00F6D078;
      NxPanel1.Visible := False;
      IntertelecomForm.Height := 168;
      GradBtnSetup.Enabled := True;
      GradBtn6.Enabled := True;
      GradBtn2.Enabled := True;
      GradBtn3.Enabled := True;
    finally
      List.Free();
    end;
  end;
end;

procedure TIntertelecomForm.FormDestroy(Sender: TObject);
begin
IntertelecomSave;
 UnRegisterHotKey(Handle, id1Esc);
 UnRegisterHotKey(Handle, id1B);
 UnRegisterHotKey(Handle, id1S);
 UnRegisterHotKey(Handle, id1A);
 UnRegisterHotKey(Handle, id1H);
 UnRegisterHotKey(Handle, id1R);
 UnRegisterHotKey(Handle, id1T);
 Timer4.Enabled := True;
end;

procedure TIntertelecomForm.CoolTrayIcon1DblClick(Sender: TObject);
begin
Close;
end;

procedure TIntertelecomForm.Close1Click(Sender: TObject);
begin
Close;
end;

procedure TIntertelecomForm.CoolTrayIcon1MouseEnter(Sender: TObject);
begin
CoolTrayIcon1.Hint := IntertelecomForm.Caption;
end;

procedure TIntertelecomForm.Button1Click(Sender: TObject);
begin
if GetOnlineStatus = False then
begin
Exit;
end else
GradBtnSetup.Enabled := False;
GradBtn6.Enabled := False;
GradBtn2.Enabled := False;
GradBtn3.Enabled := False;
ResultLabel.HTMLText.Text := 'Loading ...';
RealTimeTraff.HTMLText.Text := 'Loading ...';
sesions.Caption := 'Loading ...';
//IntertelecomLoad;
if IntertelecomForm.Height >  168 then
begin
RollUp;
end;
AdvCircularProgress1.Enabled := True;
AdvCircularProgress1.Appearance.TransitionSegmentColor := $00CAA047;
IntertelecomLoad;
Caption := 'loading...';
WebBrowser1.Navigate(URL_STATISTIC);
end;

procedure TIntertelecomForm.Label1Click(Sender: TObject);
begin
CheckBox1.Perform(WM_LBUTTONDOWN, 0, 0);
CheckBox1.Perform(WM_LBUTTONUP, 0, 0);
end;

procedure TIntertelecomForm.Label2Click(Sender: TObject);
begin
AutorunIntertelecom.Perform(WM_LBUTTONDOWN, 0, 0);
AutorunIntertelecom.Perform(WM_LBUTTONUP, 0, 0);
end;

procedure TIntertelecomForm.EditUsernasdChange(Sender: TObject);
begin
IntertelecomSave;
end;

procedure TIntertelecomForm.EditPasswordererChange(Sender: TObject);
begin
IntertelecomSave;
end;

procedure TIntertelecomForm.S1Click(Sender: TObject);
begin
if IsMinimized then
  begin
    HideBalloonEx := CoolTrayIcon1.HideBalloonHint;
    case RadioGroup1.ItemIndex of
      1: begin
        FloatRectangles(False, True);
        CoolTrayIcon1.ShowMainForm;
        SetForegroundWindow(Application.Handle);
      end;
    end;
    IsMinimized := False;
  end;
end;

procedure TIntertelecomForm.H1Click(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    1: FloatRectangles(True, True);
  end;
  IsMinimized := True;
//  SetForegroundWindow(Application.MainForm.Handle);
CoolTrayIcon1.HideMainForm;
HideBalloonHintFx.Checked := True;
end;

procedure TIntertelecomForm.B1Click(Sender: TObject);
begin
GradBtn1.Perform(WM_LBUTTONDOWN, 0, 0);
GradBtn1.Perform(WM_LBUTTONUP, 0, 0);
end;

procedure TIntertelecomForm.A1Click(Sender: TObject);
begin
RxGIFAnimator1.Perform(WM_LBUTTONDOWN, 0, 0);
RxGIFAnimator1.Perform(WM_LBUTTONUP, 0, 0);
end;

procedure TIntertelecomForm.RxGIFAnimator1Click(Sender: TObject);
begin
PlaySndOnBtn;
UnRegisterHotKey(Handle, id1Esc);
ShowMessageEx('Intertelecom About','О программе   '+sLineBreak+'  '+sLineBreak+
'Intertelecom - это небольшая програмка для проверки баланса.' +sLineBreak+ sLineBreak+ '  '+

'Лицензионное соглашение на использование ПО "Intertelecom"!!!'+sLineBreak+'  '+sLineBreak+
' - 1. Intertelecom ("ПО") является бесплатным ("Freeware") и распространяется по принципу "как есть" ("as is");'+sLineBreak+
' - 2. Вы имеете право использовать Intertelecom как на домашних компьютерах, так и на компьютерах в'+sLineBreak+
'в организациях любой формы собственности, в том числе в государственных и муниципальных учреждениях;'+sLineBreak+
' - 3. Вы можете бесплатно распространять данное ПО в виде оригинального дистрибутива;'+sLineBreak+
' - 4. Вы не вправе декомпилировать, дизассемблировать или модифицировать программу;'+sLineBreak+
' - 5. Вы не имеете права распространять данное ПО за материальное вознаграждение, если только'+sLineBreak+
'не имеете соответствующего разрешения от правообладателя.'+sLineBreak+'  '+sLineBreak+
'   Горячие клавиши:'+sLineBreak+'  '+sLineBreak+
'   - Настройки: - T;'+sLineBreak+
'   - Проверить баланс: - B;'+sLineBreak+
'   - Отменить проверку: - S;'+sLineBreak+
'   - Свернуть программу: - H;'+sLineBreak+
'   - Развернуть программу: - R;'+sLineBreak+
'   - Показать окно О программе: - A;'+sLineBreak+sLineBreak+
'   Мои контакты:'+sLineBreak+'  '+sLineBreak+
'   - ICQ: 62754415'+sLineBreak+
'   - Skype: stepanext'+sLineBreak+
'   - ВКонтакте: http://vk.com/id16697551'+sLineBreak+
'   - Twitter: https://twitter.com/DmitrikStepanov'+sLineBreak+
'   - FaceBook: http://facebook.com/Dmitry.Stepanov.Ex');
{MessageBox(GetForegroundWindow(),'О программе   '+sLineBreak+'  '+sLineBreak+
'Intertelecom - это небольшая програмка для проверки баланса.' +sLineBreak+ sLineBreak+ '  '+

'Лицензионное соглашение на использование ПО "Intertelecom"!!!'+sLineBreak+'  '+sLineBreak+
' - 1. Intertelecom ("ПО") является бесплатным ("Freeware") и распространяется по принципу "как есть" ("as is");'+sLineBreak+
' - 2. Вы имеете право использовать Intertelecom как на домашних компьютерах, так и на компьютерах в'+sLineBreak+
'в организациях любой формы собственности, в том числе в государственных и муниципальных учреждениях;'+sLineBreak+
' - 3. Вы можете бесплатно распространять данное ПО в виде оригинального дистрибутива;'+sLineBreak+
' - 4. Вы не вправе декомпилировать, дизассемблировать или модифицировать программу;'+sLineBreak+
' - 5. Вы не имеете права распространять данное ПО за материальное вознаграждение, если только'+sLineBreak+
'не имеете соответствующего разрешения от правообладателя.'+sLineBreak+'  '+sLineBreak+
'   Горячие клавиши:'+sLineBreak+'  '+sLineBreak+
'   - Настройки: - T;'+sLineBreak+
'   - Проверить баланс: - B;'+sLineBreak+
'   - Отменить проверку: - S;'+sLineBreak+
'   - Свернуть программу: - H;'+sLineBreak+
'   - Развернуть программу: - R;'+sLineBreak+
'   - Показать окно О программе: - A;'+sLineBreak+sLineBreak+
'   Мои контакты:'+sLineBreak+'  '+sLineBreak+
'   - ICQ: 62754415'+sLineBreak+
'   - Skype: stepanext'+sLineBreak+
'   - ВКонтакте: http://vk.com/id16697551'+sLineBreak+
'   - Twitter: https://twitter.com/DmitrikStepanov'+sLineBreak+
'   - FaceBook: http://facebook.com/Dmitry.Stepanov.Ex'
,'Intertelecom About',MB_OK or MB_ICONWARNING); }
  id1Esc := GlobalAddAtom('Hotkey1FxExt'); // закрыть программу
  RegisterHotKey(Handle, id1Esc, 0, VK_ESCAPEs);
end;

procedure TIntertelecomForm.CoolTrayIcon1Click(Sender: TObject);
begin
 if IsMinimized then
  begin
    case RadioGroup1.ItemIndex of
      1: begin
        FloatRectangles(False, True);
        CoolTrayIcon1.ShowMainForm;
        SetForegroundWindow(Application.Handle);
      end;
    end;
    IsMinimized := False;
  end;
end;

procedure TIntertelecomForm.Timer3Timer(Sender: TObject);
begin
RxGIFAnimator1.Perform(CM_MOUSEENTER, 0, 0);
Timer3.Enabled := false;
Timer5.Enabled := true;
end;

procedure TIntertelecomForm.Timer5Timer(Sender: TObject);
begin
RxGIFAnimator1.Perform(CM_MOUSELEAVE, 0, 0);
Timer5.Enabled := false;
Timer3.Enabled := true;
end;

procedure TIntertelecomForm.StatEvent(Sender: TObject;
  MessageText: string; Error: Boolean);
begin
  Caption := MessageText;
end;

procedure TIntertelecomForm.Image1Click(Sender: TObject);
begin
if (IntertelecomForm.Height <> 159) and (IntertelecomForm.Width <> 228) then
begin
end;
if (CheckBox1.Checked = False) or (GetOnlineStatus = False) then
begin
//TinaWavPlay.Play;
Exit;
end else
Caption := 'loading...';
WebBrowser1.Navigate(URL_STATISTIC);
end;

procedure TIntertelecomForm.Label5Click(Sender: TObject);
begin
HintCheckBox.Perform(WM_LBUTTONDOWN, 0, 0);
HintCheckBox.Perform(WM_LBUTTONUP, 0, 0);
end;

procedure TIntertelecomForm.HintCheckBoxClick(Sender: TObject);
begin
PlaySndOnBtn;
end;

procedure TIntertelecomForm.AutorunIntertelecomClick(Sender: TObject);
begin
PlaySndOnBtn;
IntertelecomAutoRunOther;
//IntertelecomSave;
end;

procedure TIntertelecomForm.CheckBox1Click(Sender: TObject);
begin
PlaySndOnBtn;
//IntertelecomSave;
end;

procedure TIntertelecomForm.AIMPButtonEx1Click(Sender: TObject);
begin
PlaySndOnBtn;
IntertelecomAlertFx.CloseUp;
end;

procedure TIntertelecomForm.IntertelecomAlertFxShow(Sender: TObject);
begin
  id1Esc := GlobalAddAtom('Hotkey1FxExt'); // закрыть программу
  RegisterHotKey(Handle, id1Esc, 0, VK_ESCAPEs);
  CnAAScrollText1.Active := True;
  CnAAScrollText1.Reset;
  RxGIFAnimator3.Animate := True;
  RxGIFAnimator3.FrameIndex := 30;
  AboutCheck.Checked := True;
end;

procedure TIntertelecomForm.IntertelecomAlertFxClose(Sender: TObject);
begin
IntertelecomAlertFx.CloseDelay := 36000;
Timer2.Enabled := True;
Sleep(12);
  CnAAScrollText1.Active := False;
  RxGIFAnimator3.Animate := False;
  CnAAScrollText1.Reset;
  id1Esc := GlobalAddAtom('Hotkey1FxExt'); // закрыть программу
  RegisterHotKey(Handle, id1Esc, 0, VK_ESCAPEs);
  AboutCheck.Checked := False;
end;

procedure TIntertelecomForm.cbbConnectionsChange(Sender: TObject);
begin
PlaySndOnBtn;
end;

procedure TIntertelecomForm.Label7Click(Sender: TObject);
begin
OnTopCheckBoxFx.Perform(WM_LBUTTONDOWN, 0, 0);
OnTopCheckBoxFx.Perform(WM_LBUTTONUP, 0, 0);
end;

procedure TIntertelecomForm.OnTopCheckBoxFxClick(Sender: TObject);
begin
PlaySndOnBtn;
if OnTopCheckBoxFx.Checked = True then
begin
with IntertelecomForm do
  SetWindowPos(Handle,
    HWND_TOPMOST,
    Left,
    Top,
    Width,
    Height,
    SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
TimerOnTopCheck.Enabled := True;
Application.HintPause := 50000;
end else
if OnTopCheckBoxFx.Checked = False then
begin
with IntertelecomForm do
  SetWindowPos(Handle,
    HWND_NOTOPMOST,
    Left,
    Top,
    Width,
    Height,
    SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
TimerOnTopCheck.Enabled := True;
Application.HintPause := 500;
end;
end;

procedure TIntertelecomForm.TimerOnTopCheckTimer(Sender: TObject);
begin
if OnTopCheckBoxFx.Checked = True then
begin
with IntertelecomForm do
  SetWindowPos(Handle,
    HWND_TOPMOST,
    Left,
    Top,
    Width,
    Height,
    SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
TimerOnTopCheck.Enabled := True;
end else
if OnTopCheckBoxFx.Checked = False then
begin
with IntertelecomForm do
  SetWindowPos(Handle,
    HWND_NOTOPMOST,
    Left,
    Top,
    Width,
    Height,
    SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);
TimerOnTopCheck.Enabled := False;
end;
end;

procedure TIntertelecomForm.AIMPButtonEx4Click(Sender: TObject);
begin
if GetOnlineStatus = False then
begin
Exit;
end else
ShellExecuteA(Handle, nil, 'https://www.facebook.com/intertelecom.ua', nil, nil, SW_SHOW);
end;

procedure TIntertelecomForm.AIMPButtonEx3Click(Sender: TObject);
begin
if GetOnlineStatus = False then
begin
Exit;
end else
ShellExecuteA(Handle, nil, 'http://vk.com/intertelecom_com', nil, nil, SW_SHOW);
end;

procedure TIntertelecomForm.cnmrqtxt1MouseEnter(Sender: TObject);
begin
IntertelecomAlertFx.CloseDelay := 100000;
end;

procedure TIntertelecomForm.CnAAScrollText1MouseEnter(Sender: TObject);
begin
IntertelecomAlertFx.CloseDelay := 100000;
end;

procedure TIntertelecomForm.CnAAScrollText1MouseLeave(Sender: TObject);
begin
IntertelecomAlertFx.CloseDelay := 9000;
end;

procedure TIntertelecomForm.cnmrqtxt1MouseLeave(Sender: TObject);
begin
IntertelecomAlertFx.CloseDelay := 9000;
end;

procedure TIntertelecomForm.Timer2Timer(Sender: TObject);
begin
SetForegroundWindow(Application.MainForm.Handle);
GetForegroundWindow();
Timer2.Enabled := False;
end;

procedure TIntertelecomForm.FormActivate(Sender: TObject);
begin
  id1Esc := GlobalAddAtom('Hotkey1FxExt'); // закрыть программу
  RegisterHotKey(Handle, id1Esc, 0, VK_ESCAPEs);
end;

procedure TIntertelecomForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
IntertelecomSave;
Timer4.Enabled := True;
end;

procedure TIntertelecomForm.AutoBalansTimer(Sender: TObject);
begin
if CheckBox1.Checked = False then
begin
AutoBalans.Enabled := False;
Exit;
end else
if CheckBox1.Checked = True then
begin
GradBtn1.Perform(WM_LBUTTONDOWN, 0, 0);
GradBtn1.Perform(WM_LBUTTONUP, 0, 0);
AutoBalans.Enabled := False;
end;
end;

procedure TIntertelecomForm.GradBtn1Click(Sender: TObject);
begin
Button1.Perform(WM_LBUTTONDOWN, 0, 0);
Button1.Perform(WM_LBUTTONUP, 0, 0);
end;

procedure TIntertelecomForm.GradBtn3Click(Sender: TObject);
begin
NxPanel1.Visible := True;
if ToolsCheckBoxSx.Checked = False then
begin
RollDown;
end else
if ToolsCheckBoxSx.Checked = True then
begin
RollUp;
end;
end;

procedure TIntertelecomForm.GradBtn6Click(Sender: TObject);
begin
PlayDVD_On;
end;

procedure TIntertelecomForm.GradBtn2Click(Sender: TObject);
begin
BalloonReportFx.ShowTextHintBalloon(bmtInfo, '«Intertelecom Balans»',
Memo1.Lines.Text, 300, 50, 50, IntertelecomForm, bapTopRight);
end;

procedure TIntertelecomForm.CnTimer1Timer(Sender: TObject);
begin
CnTimer2.Enabled := True;
CnTimer1.Enabled := False;
Label8.Caption := 'Disconnected';
//Label8.foSegOnColor := clWhite;
if GetOnlineStatus = True then
begin
Label8.Caption := 'Connected..';
CnTimer1.Enabled := False;
CnTimer2.Enabled := False;
//Label8.SegOnColor := clLime;
Windows.Beep(1100,100);
if (CheckBox1.Checked = True) and (GetOnlineStatus = True) then
begin
GradBtn1.Perform(WM_LBUTTONDOWN, 0, 0);
GradBtn1.Perform(WM_LBUTTONUP, 0, 0);
AutoBalans.Enabled := False;
end;
end;
end;

procedure TIntertelecomForm.CnTimer2Timer(Sender: TObject);
begin
CnTimer1.Enabled := True;
CnTimer2.Enabled := False;
if GetOnlineStatus = True then
begin
Label8.Caption := 'Connected..';
//Label8.SegOnColor := clLime;
CnTimer1.Enabled := False;
CnTimer2.Enabled := False;
end;
end;

procedure TIntertelecomForm.Label10Click(Sender: TObject);
begin
HotKeyEnableEX.Perform(WM_LBUTTONDOWN, 0, 0);
HotKeyEnableEX.Perform(WM_LBUTTONUP, 0, 0);
end;

procedure TIntertelecomForm.HotKeyEnableExClick(Sender: TObject);
begin
RegHotKeyOnOff;
end;
procedure TIntertelecomForm.CoolTrayIcon1MinimizeToTray(Sender: TObject);
begin
  case RadioGroup1.ItemIndex of
    1: FloatRectangles(True, True);
  end;
  IsMinimized := True;
  HideBalloonHintFx.Checked := True;
//  SetForegroundWindow(Application.MainForm.Handle);
end;

procedure TIntertelecomForm.FormShow(Sender: TObject);
begin
HideBalloonHintFx.Checked := False;
if Panel7.Top =-290 then
begin
PlayDVD_OnSave;
end;
end;

procedure TIntertelecomForm.NxCheckBox1Click(Sender: TObject);
begin
ShowMessage('ssssss');

end;

procedure TIntertelecomForm.CoolTrayIcon1BalloonHintClick(Sender: TObject);
begin
 if IsMinimized then
  begin
    case RadioGroup1.ItemIndex of
      1: begin
        FloatRectangles(False, True);
        CoolTrayIcon1.ShowMainForm;
        SetForegroundWindow(Application.Handle);
      end;
    end;
    IsMinimized := False;
  end;
end;

procedure TIntertelecomForm.TextAnimator1ssMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
IntertelecomForm.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TIntertelecomForm.Panel7MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
IntertelecomForm.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TIntertelecomForm.Panel4MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
IntertelecomForm.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TIntertelecomForm.Panel3MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
IntertelecomForm.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TIntertelecomForm.PanelFormsMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
IntertelecomForm.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TIntertelecomForm.PanelPassConfigMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
IntertelecomForm.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TIntertelecomForm.Panel6MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
IntertelecomForm.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TIntertelecomForm.RealTimeTraffMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
IntertelecomForm.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TIntertelecomForm.ResultLabelMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
IntertelecomForm.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TIntertelecomForm.RxGIFAnimator2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
ReleaseCapture;
IntertelecomForm.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TIntertelecomForm.ReportButtonClick(Sender: TObject);
begin
if GetOnlineStatus = False then
begin
Exit;
end else
ReportFormFx.Show;
end;
procedure TIntertelecomForm.Timer4Timer(Sender: TObject);
begin
IntertelecomSave;
Close;
Halt;
Timer4.Enabled := False;
end;

procedure TIntertelecomForm.TimeCheckFxTimer(Sender: TObject);
begin
Button1.Perform(WM_LBUTTONDOWN, 0, 0);
Button1.Perform(WM_LBUTTONUP, 0, 0);
end;
procedure TIntertelecomForm.Label9Click(Sender: TObject);
begin
CheckBoxTimer.Perform(WM_LBUTTONDOWN, 0, 0);
CheckBoxTimer.Perform(WM_LBUTTONUP, 0, 0);
end;

procedure TIntertelecomForm.SelectLanguageItemsClick(Sender: TObject);
begin
SelectLanguage;
end;

procedure TIntertelecomForm.USACheckBoxClick(Sender: TObject);
begin
SelectLanguageItems.ItemIndex := 0;
USACheckBox.Checked := True;
//IntertelecomSave;
//IntertelecomLoad;
end;

procedure TIntertelecomForm.RUSCheckBoxClick(Sender: TObject);
begin
SelectLanguageItems.ItemIndex := 1;
RUSCheckBox.Checked := True;
//IntertelecomSave;
//IntertelecomLoad;
end;

procedure TIntertelecomForm.UACheckBoxClick(Sender: TObject);
begin
SelectLanguageItems.ItemIndex := 2;
UACheckBox.Checked := True;
//IntertelecomSave;
//IntertelecomLoad;
end;

procedure TIntertelecomForm.Timer7Timer(Sender: TObject);
begin
Timer7.Enabled := False;
PostMessage(FindWindow(nil,'Intertelecom'), WM_CLOSE, 0, 0);
//PostMessage(FindWindow('TForm',nil), WM_CLOSE, 0, 0);
end;
procedure TIntertelecomForm.GradBtnAboutsFxClick(Sender: TObject);
begin
//IntertelecomAlertFx.PopUp;
  if AboutCheck.Checked = True then
  IntertelecomAlertFx.CloseUp else
  if AboutCheck.Checked = False then
  IntertelecomAlertFx.PopUp;

end;

procedure TIntertelecomForm.GradBtnSetupClick(Sender: TObject);
begin
PlayDVD_On;
NxPanel1.Visible := True;
if ToolsCheckBoxSx.Checked = False then
begin
RollDown;
end else
if ToolsCheckBoxSx.Checked = True then
begin
RollUp;
end;
end;
procedure TIntertelecomForm.FadeGraphicCheckBoxFx1Click(Sender: TObject);
begin
if FadeGraphicCheckBoxFx1.Checked then
begin
sSkinManager1.Active := True;
Perform(CM_RECREATEWND, 0, 0);
end else
if FadeGraphicCheckBoxFx1.Checked = False then
begin
sSkinManager1.Active := False;
end;
IntertelecomSave;
IntertelecomLoad;
Windows.InvalidateRect(GetActiveWindow, nil, True);
end;
procedure TIntertelecomForm.Label17Click(Sender: TObject);
begin
FadeGraphicCheckBoxFx1.Perform(WM_LBUTTONDOWN, 0, 0);
FadeGraphicCheckBoxFx1.Perform(WM_LBUTTONUP, 0, 0);
end;

procedure TIntertelecomForm.Image5MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
  begin
  ReleaseCapture;
  Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
end;

procedure TIntertelecomForm.SpinnerTimeChange(Sender: TObject);
begin
 case SpinnerTime.Value of
      0:  TimeCheckFx.Interval := 60000;
      1:  TimeCheckFx.Interval := 120000;
      2:  TimeCheckFx.Interval := 180000;
      3:  TimeCheckFx.Interval := 240000;
      4:  TimeCheckFx.Interval := 60000;
      5:  TimeCheckFx.Interval := 120000;
      6:  TimeCheckFx.Interval := 180000;
      7:  TimeCheckFx.Interval := 240000;
      8:  TimeCheckFx.Interval := 300000;
      9:  TimeCheckFx.Interval := 360000;
      10:  TimeCheckFx.Interval := 420000;
      11:  TimeCheckFx.Interval := 480000;
      12:  TimeCheckFx.Interval := 540000;
      13:  TimeCheckFx.Interval := 600000;
      14:  TimeCheckFx.Interval := 660000;
      15:  TimeCheckFx.Interval := 720000;
      16:  TimeCheckFx.Interval := 780000;
      17:  TimeCheckFx.Interval := 840000;
      18:  TimeCheckFx.Interval := 900000;
      19:  TimeCheckFx.Interval := 160000;
      20:  TimeCheckFx.Interval := 180000;
      21:  TimeCheckFx.Interval := 240000;
      22:  TimeCheckFx.Interval := 280000;
      23:  TimeCheckFx.Interval := 360000;
      24:  TimeCheckFx.Interval := 420000;
      25:  TimeCheckFx.Interval := 480000;
      26:  TimeCheckFx.Interval := 560000;
      27:  TimeCheckFx.Interval := 620000;
      28:  TimeCheckFx.Interval := 680000;
      29:  TimeCheckFx.Interval := 740000;
    end;
end;

procedure TIntertelecomForm.SelectLimitN1Click(Sender: TObject);
begin
SelectLimitN1.Caption := '100';
SpinnerTraf.Value :=  StrToInt(SelectLimitN1.Caption);
end;

procedure TIntertelecomForm.SelectLimitN2Click(Sender: TObject);
begin
SelectLimitN2.Caption := '200';
SpinnerTraf.Value :=  StrToInt(SelectLimitN2.Caption);
end;

procedure TIntertelecomForm.SelectLimitN3Click(Sender: TObject);
begin
SelectLimitN3.Caption := '300';
SpinnerTraf.Value :=  StrToInt(SelectLimitN3.Caption);
end;

procedure TIntertelecomForm.SelectLimitN4Click(Sender: TObject);
begin
SelectLimitN4.Caption := '400';
SpinnerTraf.Value :=  StrToInt(SelectLimitN4.Caption);
end;

procedure TIntertelecomForm.SelectLimitN5Click(Sender: TObject);
begin
SelectLimitN5.Caption := '500';
SpinnerTraf.Value :=  StrToInt(SelectLimitN5.Caption);
end;

procedure TIntertelecomForm.SelectLimitN6Click(Sender: TObject);
begin
SelectLimitN6.Caption := '600';
SpinnerTraf.Value :=  StrToInt(SelectLimitN6.Caption);
end;

procedure TIntertelecomForm.SelectLimitN7Click(Sender: TObject);
begin
SelectLimitN7.Caption := '700';
SpinnerTraf.Value :=  StrToInt(SelectLimitN7.Caption);
end;

procedure TIntertelecomForm.SelectLimitN8Click(Sender: TObject);
begin
SelectLimitN8.Caption := '800';
SpinnerTraf.Value :=  StrToInt(SelectLimitN8.Caption);
end;

procedure TIntertelecomForm.SelectLimitN9Click(Sender: TObject);
begin
SelectLimitN9.Caption := '900';
SpinnerTraf.Value :=  StrToInt(SelectLimitN9.Caption);
end;

procedure TIntertelecomForm.SelectLimitN10Click(Sender: TObject);
begin
SelectLimitN10.Caption := '1000';
SpinnerTraf.Value :=  StrToInt(SelectLimitN10.Caption);
end;

procedure TIntertelecomForm.SelectLimitN11Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN11.Caption);
end;

procedure TIntertelecomForm.SelectLimitN12Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN12.Caption);
end;

procedure TIntertelecomForm.SelectLimitN13Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN13.Caption);
end;

procedure TIntertelecomForm.SelectLimitN14Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN14.Caption);
end;

procedure TIntertelecomForm.SelectLimitN15Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN15.Caption);
end;

procedure TIntertelecomForm.SelectLimitN16Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN16.Caption);
end;

procedure TIntertelecomForm.SelectLimitN17Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN17.Caption);
end;

procedure TIntertelecomForm.SelectLimitN18Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN18.Caption);
end;

procedure TIntertelecomForm.SelectLimitN19Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN19.Caption);
end;

procedure TIntertelecomForm.SelectLimitN20Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN20.Caption);
end;

procedure TIntertelecomForm.SelectLimitN21Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN21.Caption);
end;

procedure TIntertelecomForm.SelectLimitN22Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN22.Caption);
end;

procedure TIntertelecomForm.SelectLimitN23Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN23.Caption);
end;

procedure TIntertelecomForm.SelectLimitN24Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN24.Caption);
end;

procedure TIntertelecomForm.SelectLimitN25Click(Sender: TObject);
begin
SpinnerTraf.Value :=  StrToInt(SelectLimitN25.Caption);
end;

procedure TIntertelecomForm.PopupMenu2Change(Sender: TObject;
  Source: TMenuItem; Rebuild: Boolean);
begin
//SpinnerTraf.Value := StrToInt(TMenuItem(Sender).Caption);
end;

procedure TIntertelecomForm.SkinSelectFxClick(Sender: TObject);
begin
SkinSelectFxTimer.Enabled := True;
end;

procedure TIntertelecomForm.LabelSellSknClick(Sender: TObject);
begin
SkinSelectFx.Perform(WM_LBUTTONDOWN, 0, 0);
SkinSelectFx.Perform(WM_LBUTTONUP, 0, 0);
end;

procedure TIntertelecomForm.SkinSelectFxTimerTimer(Sender: TObject);
begin
if sSkinManager1.Active = False then
begin
Exit;
end;
if SkinSelectFx.Checked = True then
begin
RxGIFAnimator1.BitmapBMP.LoadFromResourceName(HInstance, 'BMAP1');
RxGIFAnimator1.Repaint;
sSkinManager1.SkinName := 'MetroUI (внутренний)';
//sSkinManager1.ReloadSkin;
end else
if SkinSelectFx.Checked = False then
begin
RxGIFAnimator1.BitmapBMP.LoadFromResourceName(HInstance, 'BMAP2');
RxGIFAnimator1.Repaint;
sSkinManager1.SkinName := 'Wood (внутренний)';
//sSkinManager1.ReloadSkin;
end;
SkinSelectFxTimer.Enabled := False;
end;

procedure TIntertelecomForm.AIMPButtonEx5Click(Sender: TObject);
begin
ShellExecuteA(Handle, nil, 'https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=AV5RSLV3J9X4E', nil, nil, SW_SHOW);
end;

procedure TIntertelecomForm.Button2Click(Sender: TObject);
begin
  IntertelecomSave;
  IntertelecomLoad;
end;
procedure TIntertelecomForm.TrialFxCheckBoxTimerTimer(Sender: TObject);
begin
TrialFxCheckBoxEx.Checked := True;
TrialFxCheckBoxTimer.Enabled := False;
end;

procedure TIntertelecomForm.mxProtectorGetSerialNumber(Sender: TObject;
  var UserName, SerialNumber: String);
begin
    UserName := Edit_Username.Caption;
    SerialNumber := Edit_Serial.Caption;// 
//     IntertelecomSave;
//     IntertelecomLoad;
end;

procedure TIntertelecomForm.Button3Click(Sender: TObject);
begin
mxProtector.Reset;
end;

procedure TIntertelecomForm.CheckBoxTimerClick(Sender: TObject);
var
  c, v, w: string;
begin
if TrialFxCheckBoxEx.Checked = false then
begin
Exit;
end;
if mxProtector.IsRegistered Then
begin
Exit;
end else
if (Edit_Serial.Caption = '') or ( not mxProtector.IsRegistered) or (Edit_Username.Caption = '') then
begin
  c := InputBoxEx('Активация PREMIUM', 'UserName: ', 'Serial: ', 'enter name','');
  InputBoxExResult(c, v, w);
  Edit_Username.Caption := v;
  Edit_Serial.Caption := w;
mxProtector.Registration;
if mxProtector.IsRegistered Then
begin
ShowMessage('Активация PREMIUM успешна');
CheckBoxTimer.Checked := True;
end else
ShowMessage('Серийный ноомер не верный');
Edit_Serial.Caption := '';
CheckBoxTimer.Checked := False;
Exit;
end;
end;

procedure TIntertelecomForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
IntertelecomForm.Hide;
with TSplashFormFx.Execute do
    try
//      Application.CreateForm(TMainForm, MainForm);
  finally
      Free;
    end;
//CanClose := False;
end;

procedure TIntertelecomForm.AIMPButtonEx6Click(Sender: TObject);
begin
RollUp;
end;

procedure TIntertelecomForm.RxGIFAnimator2Click(Sender: TObject);
begin
if GetOnlineStatus = False then
begin
Exit;
end else
 ShellExecute(Handle, nil, 'mailto:sg_st@ukr.net', nil, nil, SW_SHOW);
end;
end.

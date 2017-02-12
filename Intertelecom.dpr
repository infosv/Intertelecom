program Intertelecom;

uses
  Forms,
  syncobjs,
  messages,
  windows,
  Unit1 in 'Unit1.pas' {IntertelecomForm},
  Unit2 in 'Unit2.pas' {ReportFormFx};

{$R *.res}
var
  CheckEventst: TEvent;

procedure FormCreateEx;
begin
  CheckEventst := TEvent.Create(nil, false, true, 'MYPROGRAM_Run_Intertelcom');
  if CheckEventst.WaitFor(10) <> wrSignaled then
  begin
    Halt; // ����� ����� ��������� ��������� ��� ������� ��� ���-������.
  end;
end;
begin
  FormCreateEx;
  Application.Initialize;
  Application.ProcessMessages;
  Application.CreateForm(TIntertelecomForm, IntertelecomForm);
  Application.CreateForm(TReportFormFx, ReportFormFx);
  Application.Run;
end.


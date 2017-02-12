unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, SHDocVw;

type
  TReportFormFx = class(TForm)
    WebBrowser1: TWebBrowser;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReportFormFx: TReportFormFx;

implementation

uses Unit1;

{$R *.dfm}

procedure TReportFormFx.FormShow(Sender: TObject);
begin
WebBrowser1.Navigate(IntertelecomForm.WebBrowser1.LocationURL);
end;

end.

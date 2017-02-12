unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, sf_flash, Animate, GIFCtrl;

type
  TForm3 = class(TForm)
    sfFlashPlayer1: TsfFlashPlayer;
    sfFlashList1: TsfFlashList;
    sfLayeredFlashForm1: TsfLayeredFlashForm;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.Timer1Timer(Sender: TObject);
begin
sfFlashPlayer1.FlashIndex := 0;
sfFlashPlayer1.Stop;
sfFlashPlayer1.StopPlay;
//Sleep(1700);
sfFlashPlayer1.GotoFrame(0);
Close;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
sfFlashPlayer1.FlashIndex := 0;
sfFlashPlayer1.Stop;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
sfFlashPlayer1.FlashIndex := 0;
sfFlashPlayer1.Play;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
sfFlashPlayer1.FlashIndex := 0;
sfFlashPlayer1.Stop;
sfFlashPlayer1.StopPlay;
sfFlashPlayer1.GotoFrame(0);
end;

end.

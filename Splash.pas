// If forms of your application appears on the screen with delay, the splash of
// the other demo has better effect.

unit Splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  PicShow, ExtCtrls, jpeg;

type
  TSplashFormFx = class(TForm)
    PicShow: TPicShow;
    procedure PicShowProgress(Sender: TObject);
  private
    procedure CreateBackground;
  public
    class function Execute: TSplashFormFx;
  end;

implementation

{$R *.DFM}

{$IFDEF VER100}
// I just realized Random function on Delphi 3 does not work correctly. It
// sometimes returns a negative value and sometimes a value larger than the
// Range parameter. By the way, I have to mention that I have not installed
// any service pack.
function Random(Range: Integer): Integer;
begin
  Result := System.Random(Range);
  if Result < 0 then Result := -Result;
  Result := Result mod Range;
end;
{$ENDIF}

procedure TSplashFormFx.CreateBackground;
var
  Background: TBitmap;
  DC: HDC;
begin
  // First we set position of the form on the center of desktop.
  // We set Position property of the form to poDesigned because we
  // need the form's position before showing it.
  Left := (Screen.Width - Width) div 2;
  Top := (Screen.Height - Height) div 2;
  // We create a bitmap object for storing the screen behind the form.
  Background := TBitmap.Create;
  Background.Width := Width;
  Background.Height := Height;
  // We get device context of the screen and copy the screen behind the form
  // to the created bitmap.
  DC := GetDC(0);
  try
    BitBlt(Background.Canvas.Handle, 0, 0, Width, Height, DC, Left, Top, SRCCOPY);
  finally
    ReleaseDC(0, DC);
  end;
  // We set Backgrund property of PicShow to captured screen image. By this trick,
  // the form will seem as transparent.
  PicShow.BgPicture.Assign(Background);
  // To reduce chance of flickering (only when PicShow is used as non-windowed
  // control we may sometime have flickers) we set background color of the form
  // to color of upper left pixel of the captured screen.
  Color := Background.Canvas.Pixels[0,0];
  // We don't need the bitmap object, then we free it.
  Background.Free;
end;

class function TSplashFormFx.Execute: TSplashFormFx;
begin
  Result := TSplashFormFx.Create(nil);
  with Result do
  begin
    // A trick to make PicShow as transparent
    CreateBackground;
    // Displays the splash form.
    Show;
    // To prevent flickering, updates the form immediately.
    Update;
    // Select randomly a transition effect.
    Randomize;
    PicShow.Style := 127;
    // Starts image transition. For splash forms don't use PicShow as Threaded.
    // When threaded is true, transition will start after activation of main form.
    PicShow.Execute;
    // Waits a bit before continuing the rest of the application.
    // Consider that we don't use threaded mode, otherwise the following
    // line has no effect.
    Sleep(500);
  end;
end;

procedure TSplashFormFx.PicShowProgress(Sender: TObject);
begin
PicShow.OverDraw := True;
  if (PicShow.Progress = 100) and not PicShow.Reverse then
  begin
    // we select another transition effect randomly,
    PicShow.Style := 127;
    // and continue the transaction to its initial state.
    PicShow.Reverse := True;
    // by the way, we wait two seconds before hiding the image
    Sleep(32);
    PicShow.OverDraw := True;
  end;
end;
end.

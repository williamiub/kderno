unit USPlash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls,  StdCtrls, Grids, DBGrids, OleCtrls, DrLabel, dxGDIPlusClasses,
  TFlatButtonUnit, Buttons, TFlatSpeedButtonUnit, AppEvnts, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit,
  cxProgressBar;

type
  TFSplash = class(TForm)
    Label1: TLabel;
    ImgOrion: TImage;
    LSimple01: TLabel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatSpeedButton2: TFlatSpeedButton;
    Image6: TImage;
    ApplicationEvents1: TApplicationEvents;
    SPProgress: TcxProgressBar;
    procedure FormCreate(Sender: TObject);
    procedure FlatSpeedButton2Click(Sender: TObject);
    procedure FlatSpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash: TFSplash;
  ClicouNaImagem:boolean;
  iLeft,iTop:Integer;

implementation

uses UMenu, ULogin;



{$R *.DFM}

procedure TFSplash.FlatSpeedButton1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TFSplash.FlatSpeedButton2Click(Sender: TObject);
begin
     Application.Minimize;
end;

procedure TFSplash.FormCreate(Sender: TObject);
var
  region : hrgn;
begin
  region:= CreateRoundRectRgn(0, 0, width, height, 50, 50);
  setwindowrgn(handle, region, true);
end;




procedure TFSplash.FormShow(Sender: TObject);
begin



     //Close;
    // ULogin.FLogin.Visible:=true;
end;

end.

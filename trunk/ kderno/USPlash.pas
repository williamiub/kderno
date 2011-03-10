unit USPlash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls,  StdCtrls, Grids, DBGrids, OleCtrls, DrLabel, dxGDIPlusClasses,
  TFlatButtonUnit, Buttons, TFlatSpeedButtonUnit;

type
  TFSplash = class(TForm)
    Label1: TLabel;
    Shape2: TShape;
    ImgOrion: TImage;
    LSimple01: TLabel;
    Shape1: TShape;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatSpeedButton2: TFlatSpeedButton;
    SPProgress: TShape;
    SPProgress2: TShape;
    Image6: TImage;
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

uses UMenu;



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
   { FSplash.SpProgress.Width:=FSplash.SpProgress.Width+32;
     FSplash.SpProgress2.Width:=FSplash.SpProgress.Width;  }
    { FSplash.SpProgress.Update;
     FSplash.Update;
     FSplash.SpProgress.Width:=FSplash.SpProgress.Width+20;
     FSplash.SpProgress2.Width:=FSplash.SpProgress.Width-20; }
end;



end.

unit USPlash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls,  StdCtrls, Grids, DBGrids, OleCtrls, DrLabel, dxGDIPlusClasses,
  TFlatButtonUnit, Buttons, TFlatSpeedButtonUnit;

type
  TFSplash = class(TForm)
    Label1: TLabel;
    SPProgress: TShape;
    Shape2: TShape;
    ImgOrion: TImage;
    SPProgress2: TShape;
    LSimple01: TLabel;
    Shape1: TShape;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    FlatSpeedButton1: TFlatSpeedButton;
    FlatSpeedButton2: TFlatSpeedButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash: TFSplash;

implementation



{$R *.DFM}

procedure TFSplash.FormCreate(Sender: TObject);
var
  region : hrgn;
begin
  region:= CreateRoundRectRgn(0, 0, width, height, 50, 50);
  setwindowrgn(handle, region, true);
end;

end.

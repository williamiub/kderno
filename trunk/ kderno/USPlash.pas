unit USPlash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  jpeg, ExtCtrls,  StdCtrls, Grids, DBGrids, OleCtrls, DrLabel, dxGDIPlusClasses;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FSplash: TFSplash;

implementation



{$R *.DFM}

end.

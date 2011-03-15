unit SelectStorageUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, dxSkinsCore, dxSkinMoneyTwins, Menus,
  cxLookAndFeelPainters, cxButtons, cxRadioGroup, cxControls, cxContainer,
  cxEdit, cxGroupBox, dxSkinLilian, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinXmas2008Blue, dxSkinCaramel, dxSkiniMaginary,
  dxSkinOffice2007Black, dxSkinOffice2007Blue, dxSkinOffice2007Green,
  dxSkinOffice2007Pink, dxSkinOffice2007Silver, cxGraphics, cxLookAndFeels;

type
  TSelectStorage = class(TForm)
    cxGroupBox1: TcxGroupBox;
    rbDBStorage: TcxRadioButton;
    rbUnboundStorage: TcxRadioButton;
    btnOK: TcxButton;
    cxGroupBox2: TcxGroupBox;
  end;

implementation

{$R *.dfm}

end.

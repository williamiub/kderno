unit UDmMenu;

interface

uses
  SysUtils, Classes, DB, cxEditRepositoryItems, cxEdit, ImgList,
  Controls, cxGraphics, dxSkinsCore, dxmdaset, cxSchedulerHolidays;

type
  TdmSkinEditor = class(TDataModule)
    imgBarsImages: TcxImageList;
    EditRepository: TcxEditRepository;
    EditRepositoryImage: TcxEditRepositoryImageItem;
    EditRepositoryMemo: TcxEditRepositoryMemoItem;
    EditRepositoryHyperLink: TcxEditRepositoryHyperLinkItem;
    EditRepositoryPrice: TcxEditRepositoryCurrencyItem;
    EditRepositoryFuelEconomy: TcxEditRepositoryTextItem;
    EditRepositoryAutomatic: TcxEditRepositoryCheckBoxItem;
    dsCars: TDataSource;
    mdsCars: TdxMemData;
    mdsCarsID: TAutoIncField;
    mdsCarsTrademark: TStringField;
    mdsCarsModel: TStringField;
    mdsCarsHP: TSmallintField;
    mdsCarsLiter: TFloatField;
    mdsCarsCyl: TSmallintField;
    mdsCarsTransmissSpeedCount: TSmallintField;
    mdsCarsTransmissAutomatic: TStringField;
    mdsCarsMPG_City: TSmallintField;
    mdsCarsMPG_Highway: TSmallintField;
    mdsCarsCategory: TStringField;
    mdsCarsDescription: TMemoField;
    mdsCarsHyperlink: TStringField;
    mdsCarsPicture: TBlobField;
    mdsCarsPrice: TFloatField;
    cxSchedulerHolidays1: TcxSchedulerHolidays;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSkinEditor: TdmSkinEditor;

implementation

{$R *.dfm}

end.

unit UDmKDerno;

interface

uses
  SysUtils, Classes, DB, cxEditRepositoryItems, cxEdit, ImgList,
  Controls, cxGraphics, dxSkinsCore, dxmdaset, cxSchedulerHolidays, DBXFirebird,
  FMTBcd, SqlExpr;

type
  TDmKderno = class(TDataModule)
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
    KDConnection: TSQLConnection;
    TUsuario: TSQLQuery;
    TUsuarioID_USUARIO: TIntegerField;
    TUsuarioLOGIN: TStringField;
    TUsuarioSENHA: TStringField;
    TAgenda: TSQLQuery;
    TAgendaCOD_AGENDA: TIntegerField;
    TAgendaAGENDA: TBlobField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmKderno: TDmKderno;

implementation

{$R *.dfm}

end.

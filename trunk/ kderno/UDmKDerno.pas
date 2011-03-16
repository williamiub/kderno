unit UDmKDerno;

interface

uses
  SysUtils, Classes, DB, cxEditRepositoryItems, cxEdit, ImgList,
  Controls, cxGraphics, dxSkinsCore, dxmdaset, cxSchedulerHolidays, DBXFirebird,
  FMTBcd, SqlExpr, IBCustomDataSet, IBTable, IBQuery, IBDatabase, ExtCtrls,
  Provider, DBClient;

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
    cxSchedulerHolidays1: TcxSchedulerHolidays;
    KDernoConection: TSQLConnection;
    TUsuario: TSQLQuery;
    TUsuarioLOGIN: TStringField;
    TUsuarioSENHA: TStringField;
    DSUsuario: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DmKderno: TDmKderno;

implementation

uses ULogin;

{$R *.dfm}

end.

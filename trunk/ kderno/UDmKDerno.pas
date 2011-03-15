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
    cxSchedulerHolidays1: TcxSchedulerHolidays;
    KDConnection: TSQLConnection;
    TUsuario: TSQLQuery;
    TUsuarioID_USUARIO: TIntegerField;
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

{$R *.dfm}

end.

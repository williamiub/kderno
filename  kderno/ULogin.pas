unit ULogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxGroupBox, cxStyles,
  cxGraphics, cxCustomData, cxTL, cxTextEdit, cxInplaceContainer, cxVGrid,
  cxSplitter, cxFilter, cxData, cxDataStorage, DB, cxDBData, cxGridLevel,
  cxGridBandedTableView, cxGridDBBandedTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomTableView, cxGridCardView,
  cxGridDBCardView, cxClasses, cxGridCustomView, cxGrid,
  cxEditRepositoryItems, cxPC, cxNavigator, cxTrackBar, cxProgressBar,
  cxSpinEdit, cxTimeEdit, cxMaskEdit, cxButtonEdit, cxCheckBox,
  cxCheckGroup, cxRadioGroup, cxCalc, cxDropDownEdit, cxMemo, cxCalendar,
  cxMRUEdit, cxBlobEdit, Menus, cxLookAndFeelPainters, StdCtrls, cxButtons,
  dxBar, ImgList, cxBarEditItem,
  dxLayoutControl, jpeg, ExtCtrls, cxLookAndFeels,
  dxNavBarCollns, dxNavBarBase, dxNavBar,
  dxDockControl, dxDockPanel,
  cxImage,
  cxCustomPivotGrid, cxPivotGrid, cxDBPivotGrid,
  dxRibbon, dxStatusBar, dxRibbonStatusBar, ComCtrls, ShlObj,
  dxRibbonForm, dxBarExtItems, cxScheduler,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerDateNavigator, cxSchedulerTimeGridView,
  cxSchedulerUtils, cxSchedulerWeekView, cxSchedulerYearView,
  cxShellCommon, cxShellComboBox, cxSchedulerDialogs,
  cxSchedulerEventEditor, cxSchedulerRecurrenceEditor, ShellApi,
  dxLayoutLookAndFeels, cxSchedulerHolidays, cxSchedulerGanttView,
  dxSkinsCore, dxSkinscxPCPainter,
  dxSkinsdxNavBar2Painter, dxSkinsForm, dxSkinsdxDockControlPainter, dxSkinsdxBarPainter,
  dxSkinsdxRibbonPainter, dxSkinscxSchedulerPainter,
  dxSkinscxScheduler3Painter, cxDWMApi,
  dxBarSkinnedCustForm, cxTLdxBarBuiltInMenu, IdBaseComponent, IdScheduler,
  IdSchedulerOfThread, IdSchedulerOfThreadDefault, dxLayoutcxEditAdapters,
  cxLabel, Cripto, GIFImg, cxDBNavigator, cxDBEdit, DBXFirebird, FMTBcd,
  SqlExpr, DBCtrls, dxRibbonGallery, Grids, DBGrids, cxCheckComboBox;

type
  TFLogin = class(TdxRibbonForm)
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel;
    dxRibbon: TdxRibbon;
    dxRibbonTab1: TdxRibbonTab;
    dxBarManager: TdxBarManager;
    QAToolbar: TdxBar;
    tbSkins: TdxBar;
    dxbFile: TdxBarSubItem;
    bFormat: TdxBarSubItem;
    dxbHelp: TdxBarSubItem;
    bNew: TdxBarButton;
    dxbSave: TdxBarButton;
    dxbExit: TdxBarButton;
    dxbtnAbout: TdxBarButton;
    bOpen: TdxBarButton;
    bSave: TdxBarButton;
    bCut: TdxBarButton;
    bCopy: TdxBarButton;
    bPaste: TdxBarButton;
    bUndo: TdxBarButton;
    bBold: TdxBarButton;
    bPrint: TdxBarButton;
    bItalic: TdxBarButton;
    bUnderline: TdxBarButton;
    bLeft: TdxBarButton;
    bCenter: TdxBarButton;
    bRight: TdxBarButton;
    dxBarButton1: TdxBarButton;
    bEdit: TdxBarSubItem;
    dxBarButton6: TdxBarButton;
    bReplace: TdxBarButton;
    bFind: TdxBarButton;
    bFont: TdxBarButton;
    UseRibbonForm: TdxBarLargeButton;
    AppBtnCheck: TdxBarLargeButton;
    ShowQAT: TdxBarLargeButton;
    bbAboveRibbon: TdxBarButton;
    bbBelowRibbon: TdxBarButton;
    blBarsStyle: TdxBarLargeButton;
    beSkinCombo: TcxBarEditItem;
    btnSmallRibbonStyle: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    btnOnTheWeb: TdxBarLargeButton;
    btnDisableAero: TdxBarButton;
    dxBarManagerBar1: TdxBar;
    cxBarEditItem1: TcxBarEditItem;
    cxBarEditItem2: TcxBarEditItem;
    cxBarEditItem3: TcxBarEditItem;
    dxBarSubItem1: TdxBarSubItem;
    cxBarEditItem4: TcxBarEditItem;
    cxBarEditItem5: TcxBarEditItem;
    cxBarEditItem6: TcxBarEditItem;
    dxBarButton5: TdxBarButton;
    dxBarLargeButton1: TdxBarLargeButton;
    dxSkinController1: TdxSkinController;
    cxImageList1: TcxImageList;
    cxImageList2: TcxImageList;
    cxBarEditItem7: TcxBarEditItem;
    dxBarLargeButton2: TdxBarLargeButton;
    dxBarProgressItem1: TdxBarProgressItem;
    dxBarSubItem2: TdxBarSubItem;
    dxBarSubItem3: TdxBarSubItem;
    dxBarButton7: TdxBarButton;
    dxBarSubItem4: TdxBarSubItem;
    dxBarButton8: TdxBarButton;
    Criptografa1: TCriptografa;
    dxBarProgressItem2: TdxBarProgressItem;
    cxBarEditItem8: TcxBarEditItem;
    cxBarEditItem9: TcxBarEditItem;
    cxBarEditItem10: TcxBarEditItem;
    dxBarLargeButton3: TdxBarLargeButton;
    cxBarEditItem11: TcxBarEditItem;
    cxBarEditItem12: TcxBarEditItem;
    dxBarProgressItem3: TdxBarProgressItem;
    dxBarLargeButton4: TdxBarLargeButton;
    dxBarLargeButton5: TdxBarLargeButton;
    dxBarSubItem5: TdxBarSubItem;
    dxBarButton9: TdxBarButton;
    dxBarButton10: TdxBarButton;
    dxBarButton11: TdxBarButton;
    cxImageList3: TcxImageList;
    dxRibbonGalleryItem1: TdxRibbonGalleryItem;
    cxBarEditItem13: TcxBarEditItem;
    cxBarEditItem14: TcxBarEditItem;
    cxBarEditItem15: TcxBarEditItem;
    cxBarEditItem16: TcxBarEditItem;
    dxBarLargeButton6: TdxBarLargeButton;
    dxBarLargeButton7: TdxBarLargeButton;
    cxImage1: TcxImage;
    procedure dxBarSubItem3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
   { procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);  }
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;
    fecha:Boolean;

implementation

uses UDmKderno, UMenu;


{$R *.dfm}

{procedure TFLogin.cxButton1Click(Sender: TObject);
begin
  // UDmKderno.DmKderno.ClientDataSet1.ApplyUpdates(-1)
end;

procedure TFLogin.cxButton2Click(Sender: TObject);
begin
    try
     try
        UDmKderno.DmKderno.TUsuario.Close;
        UDmKderno.DmKderno.TUsuario.SQL.Clear;
        UDmKderno.DmKderno.TUsuario.SQL.Add('select * from usuario where usuario.senha = :cod');
        UDmKderno.DmKderno.TUsuario.ParamByName('cod').AsString:=UDmKderno.DmKderno.TUsuario.FieldByName('SENHA').AsString;
        UDmKderno.DmKderno.TUsuario.Open;
     except

     end;

  finally

  end;
end;        }

procedure TFLogin.dxBarSubItem3Click(Sender: TObject);
var
  senha, login :string;
begin
   if (cxBarEditItem6.EditValue='') or (cxBarEditItem6.EditValue='')then
   begin
      exit;
      ShowMessage('Por favor, verifique os dados de login...');
   end;

   Senha:=Criptografa1.TextToCriptoHex(cxBarEditItem5.editvalue);
   login:=cxBarEditItem6.EditValue;
   login:=UpperCase(login);

    { UDmKderno.DmKderno.TUsuario.Close;
     UDmKderno.DmKderno.TUsuario.SQL.Clear;
     UDmKderno.DmKderno.TUsuario.SQL.Add('SELECT * FROM USUARIO WHERE (LOGIN=:LOGIN) AND (SENHA=:SENHA)');
     UDmKderno.DmKderno.TUsuario.ParamByName('LOGIN').AsString:=login;
     UDmKderno.DmKderno.TUsuario.ParamByName('SENHA').AsString:=Senha;
      UDmKderno.DmKderno.TUsuario.Open;   }


      if {(UDmKderno.DmKderno.TUsuario.IsEmpty) and} (UpperCase(cxBarEditItem5.editvalue)='ANGUS') and (UpperCase(cxBarEditItem6.editvalue)='DAEMUN') or  (UpperCase(cxBarEditItem5.editvalue)='123') and (UpperCase(cxBarEditItem6.editvalue)='SOFTIN') then
      begin
          fecha:=false;
           close;
           Application.ShowMainForm:=true;
           FMenu.Visible:=true;
           FMenu.Show;


      end else
      begin
            ShowMessage('Desculpe, login incorreto, tente novamente.');



      end;




end;

procedure TFLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    if (fecha=true) then
      Application.Terminate;
end;

procedure TFLogin.FormCreate(Sender: TObject);
begin
    fecha:=true;
end;

end.

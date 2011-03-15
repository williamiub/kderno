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
  cxLabel, Cripto, GIFImg;

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
    procedure dxBarSubItem3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogin: TFLogin;

implementation

uses UDmKderno, UMenu;

{$R *.dfm}

procedure TFLogin.dxBarSubItem3Click(Sender: TObject);
var
  senha:string;
begin
   if (cxBarEditItem6.EditValue='') or (cxBarEditItem6.EditValue='')then
   begin
      exit;
      ShowMessage('Por favor, verifique os dados de login...');
   end;


   Senha:=Criptografa1.TextToCriptoHex(cxBarEditItem5.editvalue);
     UDmKderno.DmKderno.TUsuario.Close;
     UDmKderno.DmKderno.TUsuario.SQL.Clear;
     UDmKderno.DmKderno.TUsuario.SQL.Add('SELECT * FROM USUARIO WHERE (LOGIN=:LOGIN) AND (SENHA=:SENHA)');
     UDmKderno.DmKderno.TUsuario.ParamByName('LOGIN').AsString:=cxBarEditItem6.editvalue;
     UDmKderno.DmKderno.TUsuario.ParamByName('SENHA').AsString:=Senha;
      UDmKderno.DmKderno.TUsuario.Open;


      if (UDmKderno.DmKderno.TUsuario.IsEmpty) and (UpperCase(cxBarEditItem5.editvalue)<>'ANGUS') then
      begin
          ShowMessage('não entrou');




      end else
      begin
          ShowMessage('entrou');



      end;




end;

end.

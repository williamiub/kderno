unit UMenu;

interface

uses
{$I dxSkins.inc}
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
  dxBarSkinnedCustForm, cxTLdxBarBuiltInMenu;

type
  TFMenu = class(TdxRibbonForm, IcxLookAndFeelNotificationListener)
    dxBarManager: TdxBarManager;
    tbStandard: TdxBar;
    dxBarManager1Bar2: TdxBar;
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
    tbFormat: TdxBar;
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
    cxImageList1: TcxImageList;
    dxDockingManager: TdxDockingManager;
    dxSkinController: TdxSkinController;
    dxRibbonStatusBar1: TdxRibbonStatusBar;
    dxRibbonTab1: TdxRibbonTab;
    dxRibbon: TdxRibbon;
    ilGroupIcons: TcxImageList;
    QAToolbar: TdxBar;
    dxBarApplicationMenu1: TdxBarApplicationMenu;
    dxRibbonTab2: TdxRibbonTab;
    tbStyleOptions: TdxBar;
    UseRibbonForm: TdxBarLargeButton;
    AppMenuImages: TcxImageList;
    AppBtnCheck: TdxBarLargeButton;
    QATBar: TdxBar;
    ShowQAT: TdxBarLargeButton;
    bbAboveRibbon: TdxBarButton;
    bbBelowRibbon: TdxBarButton;
    blBarsStyle: TdxBarLargeButton;
    beSkinCombo: TcxBarEditItem;
    SchedulerStorage: TcxSchedulerStorage;
    ImageList: TImageList;
    tbSkins: TdxBar;
    btnSmallRibbonStyle: TdxBarButton;
    dxRibbonTab3: TdxRibbonTab;
    tbLinks: TdxBar;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    btnOnTheWeb: TdxBarLargeButton;
    dxLayoutLookAndFeelList: TdxLayoutLookAndFeelList;
    dxLayoutStandardLookAndFeel: TdxLayoutStandardLookAndFeel;
    dxLayoutOfficeLookAndFeel: TdxLayoutOfficeLookAndFeel;
    dxLayoutWebLookAndFeel: TdxLayoutWebLookAndFeel;
    pcGrids: TcxPageControl;
    tsGrid: TcxTabSheet;
    Grid: TcxGrid;
    CardViewHorizontal: TcxGridDBCardView;
    CardViewHorizontalTrademark: TcxGridDBCardViewRow;
    CardViewHorizontalPicture: TcxGridDBCardViewRow;
    CardViewHorizontalModel: TcxGridDBCardViewRow;
    CardViewHorizontalRow3: TcxGridDBCardViewRow;
    CardViewHorizontalHP: TcxGridDBCardViewRow;
    CardViewHorizontalLiter: TcxGridDBCardViewRow;
    CardViewHorizontalCyl: TcxGridDBCardViewRow;
    CardViewHorizontalRow4: TcxGridDBCardViewRow;
    CardViewHorizontalTransmissSpeedCount: TcxGridDBCardViewRow;
    CardViewHorizontalTransmissAutomatic: TcxGridDBCardViewRow;
    CardViewHorizontalRow2: TcxGridDBCardViewRow;
    CardViewHorizontalMPG_City: TcxGridDBCardViewRow;
    CardViewHorizontalMPG_Highway: TcxGridDBCardViewRow;
    CardViewHorizontalCategory: TcxGridDBCardViewRow;
    CardViewHorizontalRow1: TcxGridDBCardViewRow;
    CardViewHorizontalDescription: TcxGridDBCardViewRow;
    CardViewHorizontalHyperlink: TcxGridDBCardViewRow;
    CardViewHorizontalPrice: TcxGridDBCardViewRow;
    CardViewVertical: TcxGridDBCardView;
    CardViewVerticalTrademark: TcxGridDBCardViewRow;
    CardViewVerticalModel: TcxGridDBCardViewRow;
    CardViewVerticalPicture: TcxGridDBCardViewRow;
    CardViewVerticalHyperlink: TcxGridDBCardViewRow;
    CardViewVerticalPrice: TcxGridDBCardViewRow;
    CardViewVerticalRow1: TcxGridDBCardViewRow;
    CardViewVerticalHP: TcxGridDBCardViewRow;
    CardViewVerticalLiter: TcxGridDBCardViewRow;
    CardViewVerticalCyl: TcxGridDBCardViewRow;
    CardViewVerticalRow2: TcxGridDBCardViewRow;
    CardViewVerticalTransmissSpeedCount: TcxGridDBCardViewRow;
    CardViewVerticalTransmissAutomatic: TcxGridDBCardViewRow;
    CardViewVerticalCategory: TcxGridDBCardViewRow;
    CardViewVerticalFuelEconomy: TcxGridDBCardViewRow;
    CardViewVerticalMPG_City: TcxGridDBCardViewRow;
    CardViewVerticalMPG_Highway: TcxGridDBCardViewRow;
    CardViewVerticalRow3: TcxGridDBCardViewRow;
    CardViewVerticalDescription: TcxGridDBCardViewRow;
    TableView: TcxGridDBTableView;
    TableViewID: TcxGridDBColumn;
    TableViewTrademark: TcxGridDBColumn;
    TableViewModel: TcxGridDBColumn;
    TableViewCategory: TcxGridDBColumn;
    TableViewPicture: TcxGridDBColumn;
    TableViewPrice: TcxGridDBColumn;
    BandedTableView: TcxGridDBBandedTableView;
    BandedTableViewTrademark: TcxGridDBBandedColumn;
    BandedTableViewModel: TcxGridDBBandedColumn;
    BandedTableViewLiter: TcxGridDBBandedColumn;
    BandedTableViewTransmissAutomatic: TcxGridDBBandedColumn;
    BandedTableViewCategory: TcxGridDBBandedColumn;
    BandedTableViewHyperlink: TcxGridDBBandedColumn;
    BandedTableViewPicture: TcxGridDBBandedColumn;
    BandedTableViewPrice: TcxGridDBBandedColumn;
    GridLevel3: TcxGridLevel;
    GridLevel4: TcxGridLevel;
    GridLevel1: TcxGridLevel;
    GridLevel2: TcxGridLevel;
    tsPivotGrid: TcxTabSheet;
    PreviewPivotGrid: TcxPivotGrid;
    pgfPurchaseQuarter: TcxPivotGridField;
    pgfPurchaseMonth: TcxPivotGridField;
    pgfPaymentType: TcxPivotGridField;
    pgfQuantity: TcxPivotGridField;
    pgfCarName: TcxPivotGridField;
    pgfUnitPrice: TcxPivotGridField;
    pgfCompanyName: TcxPivotGridField;
    pgfPaymentAmount: TcxPivotGridField;
    tsScheduler: TcxTabSheet;
    Scheduler: TcxScheduler;
    ControlBox: TPanel;
    rgGroupBy: TcxRadioGroup;
    rgViews: TcxRadioGroup;
    tsTreeList: TcxTabSheet;
    cxTreeList1: TcxTreeList;
    cxTreeList1cxTreeListColumn1: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn2: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn3: TcxTreeListColumn;
    cxTreeList1cxTreeListColumn4: TcxTreeListColumn;
    tsVerticalGrid: TcxTabSheet;
    cxVerticalGrid: TcxVerticalGrid;
    cxVerticalGridEditorRow1: TcxEditorRow;
    cxVerticalGridCategoryRow1: TcxCategoryRow;
    cxVerticalGridEditorRow2: TcxEditorRow;
    cxVerticalGridEditorRow5: TcxEditorRow;
    cxVerticalGridEditorRow3: TcxEditorRow;
    cxVerticalGridCategoryRow2: TcxCategoryRow;
    cxVerticalGridEditorRow9: TcxEditorRow;
    cxVerticalGridEditorRow7: TcxEditorRow;
    cxVerticalGridEditorRow6: TcxEditorRow;
    cxVerticalGridEditorRow4: TcxEditorRow;
    cxVerticalGridEditorRow8: TcxEditorRow;
    cxVerticalGridEditorRow10: TcxEditorRow;
    cxVerticalGridEditorRow11: TcxEditorRow;
    tsLayoutControl: TcxTabSheet;
    lcMain: TdxLayoutControl;
    Image1: TImage;
    lcMain___Root: TdxLayoutGroup;
    dxLayoutGroup1: TdxLayoutGroup;
    lcMainGroup4: TdxLayoutGroup;
    lcMainGroup20: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    lcMainItem5: TdxLayoutItem;
    lcMainItem9: TdxLayoutItem;
    lcMainItem11: TdxLayoutItem;
    lcMainItem13: TdxLayoutItem;
    lcMainGroup25: TdxLayoutGroup;
    lcMainGroup22: TdxLayoutGroup;
    lcMainItem3: TdxLayoutItem;
    lcMainGroup23: TdxLayoutGroup;
    lcMainItem7: TdxLayoutItem;
    lcMainItem27: TdxLayoutItem;
    lcMainGroup2: TdxLayoutGroup;
    lcMainGroup17: TdxLayoutGroup;
    lcMainGroup10: TdxLayoutGroup;
    lcMainItem15: TdxLayoutItem;
    lcMainItem16: TdxLayoutItem;
    lcMainGroup13: TdxLayoutGroup;
    lcMainItem17: TdxLayoutItem;
    lcMainItem18: TdxLayoutItem;
    lcMainGroup15: TdxLayoutGroup;
    lcMainItem19: TdxLayoutItem;
    lcMainItem20: TdxLayoutItem;
    lcMainGroup3: TdxLayoutGroup;
    lcMainGroup21: TdxLayoutGroup;
    lcMainGroup16: TdxLayoutGroup;
    lcMainItem21: TdxLayoutItem;
    lcMainItem22: TdxLayoutItem;
    lcMainGroup18: TdxLayoutGroup;
    lcMainItem23: TdxLayoutItem;
    lcMainItem24: TdxLayoutItem;
    lcMainGroup19: TdxLayoutGroup;
    lcMainItem25: TdxLayoutItem;
    lcMainItem26: TdxLayoutItem;
    lcMainItem2: TdxLayoutItem;
    lcMainItem6: TdxLayoutItem;
    lcMainItem10: TdxLayoutItem;
    lcMainItem12: TdxLayoutItem;
    lcMainItem14: TdxLayoutItem;
    lcMainItem4: TdxLayoutItem;
    lcMainItem8: TdxLayoutItem;
    tsEditors: TcxTabSheet;
    cxCheckGroup1: TcxCheckGroup;
    cxRadioGroup1: TcxRadioGroup;
    cxPopupEdit: TcxPopupEdit;
    cxButtonEdit1: TcxButtonEdit;
    cxTimeEdit1: TcxTimeEdit;
    cxNavigator1: TcxNavigator;
    cxDateEdit: TcxDateEdit;
    pbVertical: TcxProgressBar;
    tbVertical: TcxTrackBar;
    pbHorizontal: TcxProgressBar;
    tbHorizontal: TcxTrackBar;
    cxButton1: TcxButton;
    cxCalcEdit: TcxCalcEdit;
    cxBlobEdit: TcxBlobEdit;
    cxMemo1: TcxMemo;
    cxSpinEdit1: TcxSpinEdit;
    cxDateTimeEdit: TcxDateEdit;
    cxMemo2: TcxMemo;
    cxComboBox1: TcxComboBox;
    rgControlsState: TcxRadioGroup;
    ShellComboBox: TcxShellComboBox;
    cxTabSheet1: TcxTabSheet;
    dxDockSite: TdxDockSite;
    dxLayoutDockSite4: TdxLayoutDockSite;
    dxLayoutDockSite3: TdxLayoutDockSite;
    dxDockMainPanel: TdxDockPanel;
    dxDockPanelLeft: TdxDockPanel;
    dxNavPane: TdxNavBar;
    dxNavBarGroup4: TdxNavBarGroup;
    dxNavBarGroup5: TdxNavBarGroup;
    dxNavBarGroup6: TdxNavBarGroup;
    dxNavBarItem10: TdxNavBarItem;
    dxNavBarItem11: TdxNavBarItem;
    dxNavBarItem12: TdxNavBarItem;
    dxNavBarItem13: TdxNavBarItem;
    dxNavBarItem14: TdxNavBarItem;
    dxNavBarItem15: TdxNavBarItem;
    dxNavBarItem16: TdxNavBarItem;
    dxNavBarItem17: TdxNavBarItem;
    dxNavBarItem18: TdxNavBarItem;
    dxDockPanelRight: TdxDockPanel;
    dxNavBar: TdxNavBar;
    dxNavBarGroup1: TdxNavBarGroup;
    dxNavBarGroup3: TdxNavBarGroup;
    dxNavBarGroup2: TdxNavBarGroup;
    dxNavBarItem1: TdxNavBarItem;
    dxNavBarItem2: TdxNavBarItem;
    dxNavBarItem3: TdxNavBarItem;
    dxNavBarItem4: TdxNavBarItem;
    dxNavBarItem5: TdxNavBarItem;
    dxNavBarItem6: TdxNavBarItem;
    dxNavBarItem7: TdxNavBarItem;
    dxNavBarItem8: TdxNavBarItem;
    dxNavBarItem9: TdxNavBarItem;
    dxLayoutDockSite1: TdxLayoutDockSite;
    btnDisableAero: TdxBarButton;
    PopupMenu1: TPopupMenu;
    Mudardesign1: TMenuItem;
    procedure tbVerticalPropertiesChange(Sender: TObject);
    procedure tbHorizontalPropertiesChange(Sender: TObject);
    procedure dxbExitClick(Sender: TObject);
    procedure dxSkinControllerSkinForm(Sender: TObject;
      AForm: TCustomForm; var ASkinName: String; var UseSkin: Boolean);
    procedure rgControlsStateClick(Sender: TObject);
    procedure UseRibbonFormClick(Sender: TObject);
    procedure AppBtnCheckClick(Sender: TObject);
    procedure bbAboveRibbonClick(Sender: TObject);
    procedure bbBarsStyleClick(Sender: TObject);
    procedure beSkinComboChange(Sender: TObject);
    procedure rgGroupByClick(Sender: TObject);
    procedure rgViewsPropertiesChange(Sender: TObject);
    procedure btnSmallRibbonStyleClick(Sender: TObject);
    procedure tsPivotGridResize(Sender: TObject);
    procedure dxBarsLinkClick(Sender: TObject);
    procedure btnDisableAeroClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Mudardesign1Click(Sender: TObject);
  private
    FLayoutSkinLookAndFeel: TdxLayoutSkinLookAndFeel;
    FResNames: TStringList;
    FSkinNames: TStringList;
    function GetLookAndFeel: TcxLookAndFeel;
    function GetSkinSelectorVisible: Boolean;
    function GetUseRibbonStyle: Boolean;
    procedure SetSkinSelectorVisible(AValue: Boolean);
    procedure SetUseRibbonStyle(AValue: Boolean);
    // IcxLookAndFeelNotificationListener
    function GetObject: TObject;
    procedure MasterLookAndFeelChanged(Sender: TcxLookAndFeel; AChangedValues: TcxLookAndFeelValues);
    procedure MasterLookAndFeelDestroying(Sender: TcxLookAndFeel);
  protected
    function GetUseSkinForm: Boolean;
    procedure InitializePivotGridData;
    procedure InitializePreview(ALookAndFeel: TcxLookAndFeel);
    procedure InitializeScheduler;
    procedure InitializeSkinList;
    procedure SelectSkinName(const ASkinName: string);
    procedure SetEditorsState(AEnabled: Boolean);
    procedure SetupLookAndFeel(AKind: TcxLookAndFeelKind; ANative: Boolean);
    procedure SynchronizeLookAndFeel;
    procedure WndProc(var Message: TMessage); override;
    //
    property LookAndFeel: TcxLookAndFeel read GetLookAndFeel;
    property ResNames: TStringList read FResNames;
    property SkinNames: TStringList read FSkinNames;
    property UseRibbonStyle: Boolean read GetUseRibbonStyle write SetUseRibbonStyle;
  public
    constructor Create(AOwner: TComponent); override;
    constructor CreateEx(AOwner: TComponent; ALookAndFeel: TcxLookAndFeel); virtual;
    destructor Destroy; override;
    procedure UpdateController;
    property SkinSelectorVisible: Boolean read GetSkinSelectorVisible write SetSkinSelectorVisible;
  end;

var
  FMenu: TFMenu;

procedure GenerateRandomEvents(AScheduler: TcxScheduler; ACount: Integer;
  ARandomResource: Boolean = False);
implementation

uses
  UDmMenu, dxSkinEditorUtils, dxSkinsStrs;

{$R *.dfm}
{$R cxPivotGridData.res}

var
  WM_SETUPLOOKANDFEEL: Cardinal = WM_USER + 101;

  SportEvents: array[0..12] of string =
   ('Basketball Qualifying - Men',
    'Lamon Brewster (32-2) vs. Luan Krasniqi (28-1-1) (WBO heavyweight belt)',
    'Vince Philips (47-9-1) vs. Reynaldo Pelonia (35-21-3)',
    'Kili Madrid (6-0-1) vs. Donny Fosmire (10-7)',
    'Nelson Zepeda (1-0-1) vs. Kaleo Padilla (0-0)',
    'Justin Mercado (1-1) vs. Waldo Rojas (0-0)',
    'Australian Open',
    'Weightlifting 48 Kg - Women  - Final',
    'Sabre - Men - 1st Round',
    'Epee - Women - 1st Round',
    'Soccer 1st Round - *Women''s Preliminaries - Women',
    'Greco-Roman 96kg - Men - Qualifying',
    'Men''s Bronze Medal Match - RUS - USA');

  MaxRandomPeriod: Integer = 60;

function GetRandomDate(AScheduler: TcxScheduler): TDateTime;
begin
  Result := Date + Random(MaxRandomPeriod)*(Random(2) * 2 - 1) + AScheduler.OptionsView.WorkStart;
  if Trunc(Result) = Date then
    Result := Result + Random(10) * HourToTime
  else
    Result := Result + Random(24) * HourToTime;
end;

function GetRandomResourceID(AScheduler: TcxScheduler): Variant;
begin
  Result := Null;
  if (AScheduler.Storage = nil) or (AScheduler.Storage.ResourceCount = 0) then
    Exit
  else
    if AScheduler.Storage.ResourceCount = 1 then
      Result := AScheduler.Storage.ResourceIDs[0]
    else
      Result := AScheduler.Storage.ResourceIDs[Random(AScheduler.Storage.ResourceCount)];
end;

function GetRandomState: Integer;
begin
  Result := Random(4);
end;

procedure CreateEventObject(AScheduler: TcxScheduler; AAllDayEvent, ARandomResource: Boolean;
  AEventDuration: TDateTime);
var
  ADate: TDateTime;
  AEvent: TcxSchedulerEvent;
begin
  AEvent := AScheduler.Storage.CreateEvent;
  ADate := GetRandomDate(AScheduler);
  AEvent.Start := ADate;
  AEvent.AllDayEvent := AAllDayEvent;
  AEvent.Finish := ADate + AEventDuration;
  AEvent.State := GetRandomState;
  AEvent.LabelColor := EventLabelColors[Random(11)];
  AEvent.Caption := SportEvents[Random(High(SportEvents) + 1)];
  if ARandomResource then
    AEvent.ResourceID := GetRandomResourceID(AScheduler);
end;

procedure GenerateRandomEvents(AScheduler: TcxScheduler; ACount: Integer;
  ARandomResource: Boolean = False);
var
  I: Integer;
begin
  if AScheduler.Storage = nil then Exit;
  AScheduler.Storage.BeginUpdate;
  try
    Randomize;
    for I := 0 to ACount div 5 * 3 - 1 do
      CreateEventObject(AScheduler, False, ARandomResource, (Random(180) + 30) * MinuteToTime);
    for I := 0 to ACount div 5 - 1 do
      CreateEventObject(AScheduler, True, ARandomResource, 1);
    for I := 0 to ACount div 5 - 1 do
      CreateEventObject(AScheduler, False, ARandomResource, 1 + (Random(180) + 30) * MinuteToTime);
  finally
    AScheduler.Storage.EndUpdate;
  end;
end;

{ TdxSkinEditorPreviewForm }

constructor TFMenu.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FLayoutSkinLookAndFeel := TdxLayoutSkinLookAndFeel.Create(Self);
  lcMain.LookAndFeel := FLayoutSkinLookAndFeel;
  InitializePivotGridData;
  LookAndFeel.AddChangeListener(Self);
  Grid.DoubleBuffered := True;
  PreviewPivotGrid.DoubleBuffered := True;
  FResNames := TStringList.Create;
  FSkinNames := TStringList.Create;
  InitializeScheduler;
end;

constructor TFMenu.CreateEx(
  AOwner: TComponent; ALookAndFeel: TcxLookAndFeel);
begin
  Create(AOwner);
  InitializePreview(ALookAndFeel);
  UpdateController;
end;

destructor TFMenu.Destroy;
begin
  LookAndFeel.RemoveChangeListener(Self);
  FreeAndNil(FLayoutSkinLookAndFeel);
  FreeAndNil(FSkinNames);
  FreeAndNil(FResNames);
  inherited Destroy;
end;

function TFMenu.GetLookAndFeel: TcxLookAndFeel;
begin
  Result := FLayoutSkinLookAndFeel.LookAndFeel;
end;

function TFMenu.GetSkinSelectorVisible: Boolean;
begin
  Result := tbSkins.Visible;
end;

function TFMenu.GetUseRibbonStyle: Boolean;
begin
  Result := dxRibbon.BarManager <> nil;
end;

procedure TFMenu.SetSkinSelectorVisible(AValue: Boolean);
begin
  if AValue <> tbSkins.Visible then
  begin
    tbSkins.Visible := AValue;
    dxSkinController.NativeStyle := not AValue;
    InitializeSkinList;
  end;
end;

procedure TFMenu.SetUseRibbonStyle(AValue: Boolean);
const
  ABarItemVisibility: array[Boolean] of TdxBarItemVisible =
    (ivNever, ivAlways);
var
  ASaveValue: Boolean;
begin
  if UseRibbonStyle <> AValue then
  begin
    SendMessage(Handle, WM_SETREDRAW, 0, 0);
    dxBarManager.BeginUpdate;
    dxRibbon.BeginUpdate;
    try
      dxRibbon.Visible := AValue;
      UseRibbonForm.Visible := ABarItemVisibility[AValue];
      AppBtnCheck.Visible := ABarItemVisibility[AValue];
      btnOnTheWeb.Visible := ABarItemVisibility[AValue];
      QATBar.Visible := AValue;
      QAToolbar.Visible := AValue;
      if AValue then
      begin
        dxRibbon.BarManager := dxBarManager;
        with dxRibbon.QuickAccessToolbar do
        begin
          ASaveValue := Visible;
          Visible := True; // Problem with recalculating of QuickAccessToolBar if it invisible
          Toolbar := QAToolbar;
          Visible := ASaveValue;
        end;  
        dxRibbon.SupportNonClientDrawing := UseRibbonForm.Down;
      end
      else
      begin
        dxRibbon.SupportNonClientDrawing := False;
        dxRibbon.QuickAccessToolbar.Toolbar := nil;
        dxRibbon.BarManager := nil;
      end;
      tbStyleOptions.Move(dsTop, 0, 0);
      tbStandard.Row := 0;
      tbFormat.Row := 0;
      tbSkins.Row := 0;
      tbLinks.Row := 1;
      blBarsStyle.Visible := ABarItemVisibility[AValue];
      btnSmallRibbonStyle.Visible := ABarItemVisibility[not AValue];
      btnSmallRibbonStyle.Down := AValue;
      blBarsStyle.Down := AValue;
    finally
      dxRibbon.EndUpdate;
      dxBarManager.EndUpdate;
    end;
    SendMessage(Handle, WM_SETREDRAW, 1, 0);
    RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_FRAME or RDW_ALLCHILDREN{ or RDW_UPDATENOW});
  end;
end;

function TFMenu.GetObject: TObject;
begin
  Result := LookAndFeel;
end;

procedure TFMenu.MasterLookAndFeelChanged(Sender: TcxLookAndFeel;
  AChangedValues: TcxLookAndFeelValues);
begin
  if lfvSkinName in AChangedValues then
  begin
    dxRibbon.ColorSchemeName := Sender.SkinName;
    dxRibbon.InvalidateWithChildren;
  end;
end;

procedure TFMenu.MasterLookAndFeelDestroying(Sender: TcxLookAndFeel);
begin
end;

procedure TFMenu.Mudardesign1Click(Sender: TObject);
begin
    lcMain.Customization:=true;
end;

procedure TFMenu.WndProc(var Message: TMessage);
const
  KindMap: array[0..4] of TcxLookAndFeelKind =
   (lfStandard, lfFlat, lfUltraFlat, lfOffice11, lfStandard);
begin
  inherited WndProc(Message);
  if Message.Msg = WM_SETUPLOOKANDFEEL then
  begin
    if Message.WParam <= 4 then
      SetupLookAndFeel(KindMap[Message.wParam], Message.wParam = 4)
    else
      SelectSkinName(beSkinCombo.CurEditValue);
  end;                
end;

procedure TFMenu.UpdateController;
begin
  dxSkinController.Refresh;
end;

function TFMenu.GetUseSkinForm: Boolean;
begin
  Result := not (UseRibbonStyle and dxRibbon.SupportNonClientDrawing);
end;

procedure TFMenu.InitializePivotGridData;
var
  AStream: TStream;
begin
  AStream := TResourceStream.Create(hInstance, 'PIVOTPREVIEWDATA', 'PIVOTDATA');
  try
    AStream.Position := 0;
    PreviewPivotGrid.DataController.LoadFromStream(AStream);
    PreviewPivotGrid.FullRefresh;
  finally
    AStream.Free;
  end;
end;

procedure TFMenu.InitializePreview(ALookAndFeel: TcxLookAndFeel);
begin
  FLayoutSkinLookAndFeel.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  dxDockingManager.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  SkinEditorSetControlLookAndFeel(Self, ALookAndFeel);
  dxBarManager.LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  with TdxNavBarSkinExplorerBarPainter(dxNavBar.ViewStyle) do
    LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  with TdxNavBarSkinNavPanePainter(dxNavPane.ViewStyle) do
    LookAndFeel.MasterLookAndFeel := ALookAndFeel;
  dxRibbon.ColorSchemeName := ALookAndFeel.SkinName;
  InitializeScheduler;
end;

procedure TFMenu.InitializeScheduler;
begin
  GenerateRandomEvents(Scheduler, 50, True);
  Scheduler.SelectDays([Date - 1, Date, Date + 1], True);
end;

procedure TFMenu.InitializeSkinList;
var
  AIndex: Integer;
begin
  with TcxComboBoxProperties(beSkinCombo.Properties) do
  begin
    Items.Clear;
    Items.Add('Standard');
    Items.Add('Flat');
    Items.Add('Ultra Flat');
    Items.Add('Office 2003');
    Items.Add('Windows Theme');

    dxSkinsPopulateSkinResources(HInstance, ResNames, SkinNames);
    AIndex := SkinNames.IndexOf(sdxDefaultUserSkinData);
    if AIndex >= 0 then
      SkinNames.Delete(AIndex);
    Items.AddStrings(SkinNames);

    SelectSkinName('Black');
  end;
end;

procedure TFMenu.tbVerticalPropertiesChange(
  Sender: TObject);
begin
  pbVertical.Position := 20 - tbVertical.Position;
end;

procedure TFMenu.tbHorizontalPropertiesChange(
  Sender: TObject);
begin
  pbHorizontal.Position := tbHorizontal.Position;
end;

procedure TFMenu.dxbExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFMenu.dxSkinControllerSkinForm(
  Sender: TObject; AForm: TCustomForm; var ASkinName: String;
  var UseSkin: Boolean);
begin
  if (ASkinName <> '') and UseSkin or (FLayoutSkinLookAndFeel = nil) then Exit;
  UseSkin := GetExtendedStylePainters.GetNameByPainter(LookAndFeel.MasterLookAndFeel.SkinPainter, ASkinName);
  if not UseSkin then Exit;
  if AForm = Self then
    UseSkin := GetUseSkinForm
  else
    UseSkin := (AForm is TcxSchedulerRecurrenceEventEditorForm) or
      (AForm is TcxSchedulerEventEditor);
end;

procedure TFMenu.FormCreate(Sender: TObject);
begin
  if IsCompositionEnabled then
    btnDisableAero.Visible := ivAlways
  else
    btnDisableAero.Visible := ivNever;
end;

procedure TFMenu.rgControlsStateClick(Sender: TObject);
begin
  SetEditorsState(rgControlsState.ItemIndex = 0);
end;

procedure TFMenu.SelectSkinName(const ASkinName: string);
var
  AIndex: Integer;
  AResource: TResourceStream;
begin
  dxSkinController.UseSkins := ASkinName <> '';
  dxSkinController.NativeStyle := False;
  dxRibbon.ColorSchemeName := dxSkinController.SkinName;
  beSkinCombo.EditValue := ASkinName;
  if dxSkinController.UseSkins then
  begin
    AIndex := SkinNames.IndexOf(ASkinName);
    if AIndex >= 0 then
    begin
      AResource := TResourceStream.Create(HInstance,
        ResNames.Strings[Integer(SkinNames.Objects[AIndex])],
        PChar(sdxResourceType));
      try
        dxSkinsUserSkinLoadFromStream(AResource, ASkinName);
      finally
        AResource.Free;
      end;
    end;
  end;
  SynchronizeLookAndFeel;
end;

procedure TFMenu.SetEditorsState(AEnabled: Boolean);
var
  I: Integer;
begin
  with tsEditors do
    for I := 0 to ControlCount - 1 do
    begin
      if Controls[I] <> rgControlsState then
        Controls[I].Enabled := AEnabled;
    end;
end;

procedure TFMenu.SetupLookAndFeel(AKind: TcxLookAndFeelKind;
  ANative: Boolean);
begin
  dxSkinController.UseSkins := False; 
  dxSkinController.Kind := AKind;
  dxSkinController.NativeStyle := ANative;
  dxRibbon.ColorSchemeName := 'Blue';
  SynchronizeLookAndFeel;
end;

procedure TFMenu.SynchronizeLookAndFeel;

  procedure CheckNavBars;
  const
    NavBarViewStyle: array[TcxLookAndFeelKind] of Integer = (1, 0, 1, 13);
    NavPaneViewStyle: array[TcxLookAndFeelKind] of Integer = (8, 8, 9, 12);
  begin
    if dxSkinController.UseSkins then
    begin
      dxNavPane.View := 14;
      with TdxNavBarSkinExplorerBarPainter(dxNavPane.ViewStyle) do
        SkinName := dxSkinController.SkinName;
      dxNavBar.View := 15;
      with TdxNavBarSkinNavPanePainter(dxNavBar.ViewStyle) do
        SkinName := dxSkinController.SkinName;
    end
    else
      if dxSkinController.NativeStyle then
      begin
        dxNavPane.View := 11;
        dxNavBar.View := 7;
      end
      else
      begin
        dxNavPane.View := NavPaneViewStyle[dxSkinController.Kind];
        dxNavBar.View := NavBarViewStyle[dxSkinController.Kind];
      end;
  end;

  procedure CheckLayoutControl;
  begin
    if dxSkinController.UseSkins then
      lcMain.LookAndFeel := FLayoutSkinLookAndFeel
    else
      if dxSkinController.NativeStyle then
        lcMain.LookAndFeel := dxLayoutWebLookAndFeel
      else
        if dxSkinController.Kind = lfOffice11 then
          lcMain.LookAndFeel := dxLayoutOfficeLookAndFeel
        else
          lcMain.LookAndFeel := dxLayoutStandardLookAndFeel; 
  end;

begin
  CheckNavBars;
  CheckLayoutControl;
end;

procedure TFMenu.UseRibbonFormClick(Sender: TObject);
var
  ASavedUseSkins: Boolean;
begin
  ASavedUseSkins := dxSkinController.UseSkins;
  try
    dxSkinController.UseSkins := False;
    dxRibbon.SupportNonClientDrawing := UseRibbonForm.Down;
  finally
    dxSkinController.UseSkins := ASavedUseSkins;
    dxSkinController.Refresh;
  end;
end;

procedure TFMenu.AppBtnCheckClick(Sender: TObject);
begin
  dxRibbon.ApplicationButton.Visible := AppBtnCheck.Down;
end;

procedure TFMenu.bbAboveRibbonClick(Sender: TObject);
begin
  with dxRibbon.QuickAccessToolbar do
  begin
    Visible := ShowQAT.Down;
    if bbAboveRibbon.Down then
      Position := qtpAboveRibbon
    else
      Position := qtpBelowRibbon;
  end;
end;

procedure TFMenu.bbBarsStyleClick(Sender: TObject);
begin
  UseRibbonStyle := blBarsStyle.Down;
end;

procedure TFMenu.beSkinComboChange(Sender: TObject);
begin
  if (Sender is TcxComboBox) and (TcxComboBox(Sender).ItemIndex >= 0) then
    PostMessage(Handle, WM_SETUPLOOKANDFEEL, TcxComboBox(Sender).ItemIndex, 0);
end;

procedure TFMenu.rgGroupByClick(Sender: TObject);
begin
  case rgGroupBy.ItemIndex of
    0:
      Scheduler.OptionsView.GroupingKind := gkNone;
    1:
      Scheduler.OptionsView.GroupingKind := gkByResource;
    2:
      Scheduler.OptionsView.GroupingKind := gkByDate;
  end;
end;

procedure TFMenu.rgViewsPropertiesChange(
  Sender: TObject);
begin
  case rgViews.ItemIndex of
    0: Scheduler.ViewDay.Active := True;
    1: Scheduler.ViewWeek.Active := True;
    2: Scheduler.ViewWeeks.Active := True;
    3: Scheduler.ViewTimeGrid.Active := True;
    4: Scheduler.ViewYear.Active := True;
  end;
end;

procedure TFMenu.btnDisableAeroClick(Sender: TObject);
begin
  DisableAero := btnDisableAero.Down;
  RedrawWindow(Handle, nil, 0, RDW_ERASE or RDW_INVALIDATE or RDW_FRAME or RDW_ALLCHILDREN{ or RDW_UPDATENOW});
end;

procedure TFMenu.btnSmallRibbonStyleClick(
  Sender: TObject);
begin
  UseRibbonStyle := btnSmallRibbonStyle.Down;
end;

procedure TFMenu.tsPivotGridResize(Sender: TObject);
begin
//
end;

procedure TFMenu.dxBarsLinkClick(Sender: TObject);
const
  Urls: array[0..3] of string =
    ('http://www.devexpress.com', 'http://www.devexpress.com/products',
    'http://www.devexpress.com/downloads', 'https://www.devexpress.com/ClientCenter');
begin
  ShellExecute(0, 'OPEN', PChar(Urls[TComponent(Sender).Tag]), nil, nil, SW_SHOW);
end;

initialization
  WM_SETUPLOOKANDFEEL := RegisterWindowMessage('WM_SETUPLOOKANDFEEL');

end.

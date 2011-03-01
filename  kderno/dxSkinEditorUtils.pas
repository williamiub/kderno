unit dxSkinEditorUtils;

interface

uses
  Types, Windows, Messages, SysUtils, cxControls, cxGraphics, Classes, Graphics, Controls,
  Math, StdCtrls, Forms, dxOffice11, cxLookAndFeels, cxLookAndFeelPainters,
  dxSkinsCore, cxGeometry, Registry, dxGdiplusApi, XMLDoc, XMLIntf,
  dxThemeManager, ImgList, ShFolder, dxSkinsStrs, cxSplitter, ShellApi, ActiveX;

const
  SizeDelta = 32;
  MarginThickness = 2;
  ImageBorderSize = 5;

type
  { TdxSkinEditorControl }

  TdxSkinEditorDropFileEvent = procedure(Sender: TObject; const AFileName: string) of object;

  TdxSkinEditorControl = class(TcxControl, IUnknown, IDropTarget)
  private
    FDropFileName: string; 
    FOnDropFile: TdxSkinEditorDropFileEvent;
    procedure SetOnDropFile(AValue: TdxSkinEditorDropFileEvent);
    function IDropTarget.DragOver = DragOverTarget;
  protected
    function CanDropFile(const AFileName: string): Boolean; virtual; 
    procedure CreateHandle; override;
    procedure DoDropFile(const AFileName: string); virtual;
    { IDropTarget }
    function DragEnter(const dataObj: IDataObject; grfKeyState: Longint;
      pt: TPoint; var dwEffect: Longint): HResult; stdcall;
    function DragOverTarget(grfKeyState: Longint; pt: TPoint;
      var dwEffect: Longint): HResult; stdcall;
    function DragLeave: HResult; stdcall;
    function Drop(const dataObj: IDataObject; grfKeyState: Longint; pt: TPoint;
      var dwEffect: Longint): HResult; stdcall;

    property OnDropFile: TdxSkinEditorDropFileEvent read FOnDropFile write SetOnDropFile;
  public
    destructor Destroy; override;
  end;

  { TdxSkinBufferedControl }

  TdxSkinBufferedControl = class(TdxSkinEditorControl)
  private
    FBitmap: TBitmap;
    FBitmapCanvas: TcxCanvas;
    FImageIndex: Integer;
    FIsDirty: Boolean;
    FState: TdxSkinElementState;
    procedure SetImageIndex(AValue: Integer);
    procedure SetIsDirty(AValue: Boolean);
    procedure SetState(AValue: TdxSkinElementState);
  protected
    procedure BoundsChanged; override;
    procedure CheckBitmap;
    procedure DrawContent; virtual;
    procedure Paint; override;

    property Bitmap: TBitmap read FBitmap;
    property BitmapCanvas: TcxCanvas read FBitmapCanvas;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    property ImageIndex: Integer read FImageIndex write SetImageIndex;
    property IsDirty: Boolean read FIsDirty write SetIsDirty;
    property State: TdxSkinElementState read FState write SetState;
  end;

  { TdxSkinElementPreview }

  TdxSkinElementPreview = class(TdxSkinBufferedControl)
  private
    FAnchor: TPoint;
    FElement: TdxSkinElement;
    FSize: TSize;
    FSizing: Boolean;
    function GetOriginalSize: TSize;
    function GetSizeGripRect: TRect;
    procedure SetElement(AValue: TdxSkinElement);
    procedure SetSize(const ASize: TSize);
  protected
    procedure DrawContent; override;
    procedure InitElementInfo;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
  public
    property Element: TdxSkinElement read FElement write SetElement;
    property OriginalSize: TSize read GetOriginalSize;
    property Size: TSize read FSize write SetSize;
  published
    property Align;
    property Anchors;
  end;

  { TdxSkinGradientPanel }

  TdxSkinGradientPanel = class(TdxSkinEditorControl)
  private
    FCaption: string;
    FCaptionColor: TColor;
    FCaptionHeight: Integer;
    FFakeFont: TFont; 
    function GetRealCaptionColor: TColor;
    function GetRealCaptionHeight: Integer;
    procedure SetCaption(AValue: string);
    procedure SetCaptionColor(AValue: TColor);
    procedure SetCaptionHeight(AValue: Integer);
    procedure WMNCCalcSize(var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint(var Message: TWMNCPaint); message WM_NCPAINT;
  protected
    procedure FontChanged; override;
    procedure Paint; override;
    procedure LookAndFeelChanged(Sender: TcxLookAndFeel;
      AChangedValues: TcxLookAndFeelValues); override;

    property RealCaptionColor: TColor read GetRealCaptionColor;
    property RealCaptionHeight: Integer read GetRealCaptionHeight;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property Align;
    property Caption: string read FCaption write SetCaption;
    property CaptionColor: TColor read FCaptionColor write SetCaptionColor default clDefault;
    property CaptionHeight: Integer read FCaptionHeight write SetCaptionHeight default 0;
    property Color default clBtnFace;
    property Font;
    property OnDropFile;
  end;

  { TdxSkinEditorSplitter }
  
  TdxSkinEditorSplitter = class(TcxSplitter)
  private
    FBorders: TcxBorders;
    procedure SetBorders(Value: TcxBorders);
  protected
    procedure Paint; override;
  published
    property Borders: TcxBorders read FBorders write SetBorders; 
  end;

  { TdxSkinImagePreview }

  TdxMargin = (mLeft, mTop, mRight, mBottom);

  TdxSkinImagePreview = class(TdxSkinBufferedControl)
  private
    FBitmap: TdxSkinImage;
    FChangesHandler: TNotifyEvent;
    FDragMargin: TdxMargin;
    FGridColor: TColor;
    FLockChanges: Integer;
    FMarginColor: TColor;
    FMoved: Boolean;
    FScrollPos: TPoint;
    FShowGrid: Boolean;
    FZoom: Integer;
    function GetBitmapSize: TSize;
    function GetBorderBounds: TRect;
    function GetGridLinesVisible: Boolean;
    function GetHitTest(const X, Y: Integer; out AMargin: TdxMargin): Boolean;
    function GetImageBounds: TRect;
    function GetMargins: TcxRect;

    procedure SetBitmap(AValue: TdxSkinImage);
    procedure SetColor(AValue: TColor);
    procedure SetGridColor(AValue: TColor);
    procedure SetScrollPos(const AValue: TPoint);
    procedure SetShowGrid(AValue: Boolean);
    procedure SetZoom(AValue: Integer);
  protected
    function CalculateCursor(X, Y: Integer): TCursor;
    function CalculateMargins(X, Y: Integer): TRect;
    procedure ApplyMarginChanges;
    procedure DoOpenFile(const AFileName: string);
    procedure DrawContent; override;
    procedure InitScrollBarsParameters; override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Scroll(AScrollBarKind: TScrollBarKind; AScrollCode: TScrollCode;
      var AScrollPos: Integer); override;
    //
    procedure LockChanges;
    procedure UnlockChanges;
  public
    constructor Create(AOwner: TComponent);override;
    function GetMarginBounds(AMargin: TdxMargin): TRect; overload;
    function GetMarginBounds(const ARect: TRect; AMargin: TdxMargin): TRect; overload;
    procedure SetMargins(const ARect: TRect);

    property Bitmap: TdxSkinImage read FBitmap write SetBitmap;
    property BitmapSize: TSize read GetBitmapSize;
    property DragMargin: TdxMargin read FDragMargin;
    property GridLinesVisible: Boolean read GetGridLinesVisible;
    property ImageBounds: TRect read GetImageBounds;
    property Margins: TcxRect read GetMargins;
    property ScrollPos: TPoint read FScrollPos write SetScrollPos;
  published
    property Align;
    property Anchors;
    property BorderStyle;
    property Color;
    property GridColor: TColor read FGridColor write SetGridColor default clBlack;
    property MarginColor: TColor read FMarginColor write SetColor default clRed;
    property ShowGrid: Boolean read FShowGrid write SetShowGrid default False;
    property Zoom: Integer read FZoom write SetZoom default 2;
    property OnDblClick;
    property OnDropFile;
  end;

function SkinSignatureStr: string;
procedure DrawGradientHeader(ADC: HDC; const AText: string; const ARect: TRect;
  ALookAndFeel: TcxLookAndFeel; AFont: TFont; AColor: TColor);
function CheckGDIPlusInitialization: Boolean;
function CheckMarginValue(AValue: Integer; AMargin: TdxMargin;
  const AMargins: TRect; const AImageSize: TSize): Integer;
function GetDefaultProgramFile(const AFileName: string): string;
function GetDefaultSkinsLocation: string;
function IsOurXMLSkin(const AFileName: string): Boolean;
function RemoveSpaces(const S: string): string;
function RunOpenWithDialog(const AFileName: string): Boolean;
procedure SetMarginValue(var R: TRect; AMargin: TdxMargin; AValue: Integer);
procedure SkinEditorSetControlLookAndFeel(
  AControl: TWinControl; AMasterLookAndFeel: TcxLookAndFeel);
implementation

uses
  dxCore, dxEditorUtils;

const
  sdxGdiPlusRequered = 'This application requires the Microsoft GDI+ library to be installed!';

function SkinSignatureStr: string;
begin
  Result := dxAnsiStringToString(dxSkinSignature);
end;

procedure SetMarginValue(var R: TRect; AMargin: TdxMargin; AValue: Integer);
begin
  case AMargin of
    mTop:
      R.Top := AValue;
    mLeft:
      R.Left := AValue;
    mRight:
      R.Right := AValue;
    mBottom:
      R.Bottom := AValue;
  end;
end;

function CheckMarginValue(AValue: Integer;
  AMargin: TdxMargin; const AMargins: TRect; const AImageSize: TSize): Integer;
var
  AMaxValue: Integer;
begin
  case AMargin of
    mLeft:
      AMaxValue := AImageSize.cx - AMargins.Right;
    mRight:
      AMaxValue := AImageSize.cx - AMargins.Left;
    mTop:
      AMaxValue := AImageSize.cy - AMargins.Bottom;
    else //mBottom
      AMaxValue := AImageSize.cy - AMargins.Top
  end;
  Result := Min(Max(AValue, 0), AMaxValue - 1);
end;

function CheckGDIPlusInitialization: Boolean;
begin
  Result := CheckGdiPlus;
  if not Result then
    MessageBox(0, sdxGdiPlusRequered, nil, MB_OK or MB_ICONERROR);
end;

function EnumWndProc(AWindowHandle: HWND; LParam: Integer): Boolean; stdcall;
var
  AClassName: array[0..1024 - 1] of Char;
const
  ADialogClass = '#32770';
begin
  FillChar(AClassName, SizeOf(AClassName), 0);
  Result := (GetClassName(AWindowHandle, @AClassName[0], SizeOf(AClassName) - 1) =
    Length(ADialogClass)) and (ADialogClass = ADialogClass);
  if Result then
    SetForegroundWindow(AWindowHandle);
  Result := not Result;
end;

function RemoveSpaces(const S: string): string;
begin
  Result := StringReplace(S, ' ', '', [rfReplaceAll]);
end;

function RunOpenWithDialog(const AFileName: string): Boolean;
var
  AStartupInfo: TStartupInfo;
  AProcessInfo: TProcessInformation;
begin
  FillChar(AStartupInfo, SizeOf(AStartupInfo), 0);
  FillChar(AProcessInfo, SizeOf(AProcessInfo), 0);
  AStartupInfo.cb := SizeOf(AStartupInfo);
  AStartupInfo.dwFlags := STARTF_USESHOWWINDOW;
  AStartupInfo.wShowWindow := SW_SHOWNORMAL;
  Result := CreateProcess(nil, PChar('"rundll32.exe" shell32.dll,OpenAs_RunDLL ' + AFileName),
    nil, nil, True, NORMAL_PRIORITY_CLASS, nil, nil, AStartupInfo, AProcessInfo);
  if Result then
    try
      WaitForInputIdle(AProcessInfo.hProcess, INFINITE);
      // following code need for bringtofront dialog window
      Result := EnumThreadWindows(AProcessInfo.dwThreadId, @EnumWndProc, 0);
      //
    finally
      CloseHandle(AProcessInfo.hThread);
      CloseHandle(AProcessInfo.hProcess);
    end;
end;

procedure DrawGradientHeader(ADC: HDC; const AText: string; const ARect: TRect;
  ALookAndFeel: TcxLookAndFeel; AFont: TFont; AColor: TColor);
var
  APrevBkMode: Integer;
  APrevFont: Integer;
  APrevColor: Cardinal;
  R: TRect;
begin
  R := ARect;
  if ALookAndFeel.ActiveStyle in [lfsNative, lfsOffice11] then
    FillGradientRect(ADC, ARect, dxOffice11BarMarkColors1[1],
      dxOffice11BarMarkColors2[1], False)
  else
    FillGradientRect(ADC, ARect, clBtnShadow, clBtnShadow, False);
  InflateRect(R, -cxTextOffset, -cxTextOffset);
  if (R.Right > R.Left + 10) then
  begin
    APrevBkMode := SetBkMode(ADC, TRANSPARENT);
    APrevFont := SelectObject(ADC, AFont.Handle);
    APrevColor := SetTextColor(ADC, ColorToRGB(AColor));    
    DrawText(ADC, PChar(AText), Length(AText), R,
      DT_VCENTER or DT_END_ELLIPSIS or DT_SINGLELINE);
    SelectObject(ADC, APrevFont);
    SetTextColor(ADC, APrevColor);
    SetBkMode(ADC, APrevBkMode);
  end;
end;

function IsOurXMLSkin(const AFileName: string): Boolean;
var
  ADocument: IXMLDocument;
  ANode: IXMLNode;
begin
  ADocument := TXMLDocument.Create(AFileName);
  try
    ANode := ADocument.ChildNodes.First;
    if ANode <> nil then
      ANode := ANode.NextSibling;
    Result := (ANode <> nil) and SameText(ANode.NodeName, SkinSignatureStr);
  finally
    ADocument := nil;
  end;
end;

function GetDefaultProgramFile(const AFileName: string): string;
var
  AReg: TRegistry;
  ARootOfExt: string;
begin
  Result := '';
  AReg := TRegistry.Create;
  try
    AReg.RootKey := HKEY_CLASSES_ROOT;
    if AReg.OpenKey(ExtractFileExt(AFileName), False) then
    begin
      ARootOfExt := AReg.ReadString('');
      AReg.CloseKey;
      if AReg.OpenKey(ARootOfExt + '\shell\edit\command\', False) then
      begin
        Result := AReg.ReadString('');
        AReg.CloseKey;
      end
      else
        if AReg.OpenKey(ARootOfExt + '\shell\open\command\', False) then
        begin
          Result := AReg.ReadString('');
          AReg.CloseKey;
        end;
    end;
  finally
    AReg.Free;
  end;
end;

function GetDefaultSkinsLocation: string;
var
  APath: array[0..1023] of Char;
begin
  if SHGetFolderPath(0, CSIDL_PERSONAL, 0, 0, @APath) = s_ok then
    Result := APath
  else
    Result := GetCurrentDir;
  Result := CorrectLocationPath(Result) + sdxSkinsRootFolder;
end;

procedure SkinEditorSetControlLookAndFeel(
  AControl: TWinControl; AMasterLookAndFeel: TcxLookAndFeel);
var
  AIntf: IcxLookAndFeelContainer;
  I: Integer;
begin
  if Supports(AControl, IcxLookAndFeelContainer, AIntf) then
  begin
    AIntf.GetLookAndFeel.NativeStyle := False;
    AIntf.GetLookAndFeel.MasterLookAndFeel := AMasterLookAndFeel;
  end;
  for I := 0 to AControl.ControlCount - 1 do
    if AControl.Controls[I] is TWinControl then
      SkinEditorSetControlLookAndFeel(TWinControl(AControl.Controls[I]), AMasterLookAndFeel);
end;

{ TdxSkinEditorControl }

destructor TdxSkinEditorControl.Destroy;
begin
  if HandleAllocated then
    RevokeDragDrop(Handle);
  inherited Destroy;
end;

function TdxSkinEditorControl.CanDropFile(const AFileName: string): Boolean;
var
  AExt: string;
begin
  AExt := ExtractFileExt(AFileName);
  Result := SameText('.bmp', AExt) or SameText('.png', AExt);  
end;

procedure TdxSkinEditorControl.CreateHandle;
begin
  inherited CreateHandle;
  if Assigned(FOnDropFile) then
    RegisterDragDrop(Handle, Self);
end;

procedure TdxSkinEditorControl.DoDropFile(const AFileName: string);
begin
  if Assigned(FOnDropFile) then
    FOnDropFile(Self, AFileName);
end;

const
  DropEffects: array[Boolean] of Longint = (DROPEFFECT_NONE, DROPEFFECT_COPY);
  
function TdxSkinEditorControl.DragEnter(const dataObj: IDataObject;
  grfKeyState: Longint; pt: TPoint; var dwEffect: Longint): HResult;
var
  Format: TFormatETC;
  Medium: TSTGMedium;
  CFileName: array[0..MAX_PATH] of Char;
begin
  FillChar(Format, SizeOf(Format), 0);
  with Format do
  begin
    cfFormat := CF_HDROP;
    dwAspect := DVASPECT_CONTENT;
    lindex := -1;
    tymed := TYMED_HGLOBAL;
  end;
  FDropFileName := '';
  if (DataObj.GetData(Format, Medium) = S_OK) then
  try
    if DragQueryFile(Medium.hGlobal, 0, CFileName, MAX_PATH) > 0 then
      FDropFileName := CFileName;
  finally
    if Medium.unkForRelease = nil then ReleaseSTGMedium(Medium);
  end;
  dwEffect := DropEffects[CanDropFile(FDropFileName)];
  Result := S_OK;
end;

function TdxSkinEditorControl.DragOverTarget(grfKeyState: Longint; pt: TPoint;
  var dwEffect: Longint): HResult;
begin
  dwEffect := DropEffects[CanDropFile(FDropFileName)];
  Result := S_OK;
end;

function TdxSkinEditorControl.DragLeave: HResult;
begin
  Result := S_OK;
end;

function TdxSkinEditorControl.Drop(const dataObj: IDataObject;
  grfKeyState: Longint; pt: TPoint; var dwEffect: Longint): HResult;
begin
  dwEffect := DropEffects[CanDropFile(FDropFileName)];
  if dwEffect = DROPEFFECT_COPY then
    DoDropFile(FDropFileName);
  Result := S_OK;
end;

procedure TdxSkinEditorControl.SetOnDropFile(AValue: TdxSkinEditorDropFileEvent);
begin
  FOnDropFile := AValue;
  if HandleAllocated then
  begin
    if Assigned(FOnDropFile) then
      RegisterDragDrop(Handle, Self)
    else
      RevokeDragDrop(Handle);
  end;
end;

{ TdxSkinBufferedControl }

constructor TdxSkinBufferedControl.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FBitmap := TBitmap.Create;
  FBitmapCanvas := TcxCanvas.Create(FBitmap.Canvas);
end;

destructor TdxSkinBufferedControl.Destroy;
begin
  FBitmapCanvas.Free;
  FBitmap.Free;
  inherited Destroy;
end;

procedure TdxSkinBufferedControl.BoundsChanged;
begin
  CheckBitmap;
  inherited BoundsChanged;
end;

procedure TdxSkinBufferedControl.CheckBitmap;
begin
  if ((FBitmap.Width < Width) or ((FBitmap.Width - Width) > SizeDelta)) or
    ((FBitmap.Height < Height) or ((FBitmap.Height - Height) > SizeDelta)) then
  begin
    FBitmap.Width := (Width div SizeDelta + 1) * SizeDelta;
    FBitmap.Height := (Height div SizeDelta + 1) * SizeDelta;
    IsDirty := True;
  end;
end;

procedure TdxSkinBufferedControl.DrawContent;
begin
  BitmapCanvas.Brush.Color := Color;
  BitmapCanvas.FillRect(ClientRect);
end;

procedure TdxSkinBufferedControl.Paint;
begin
  inherited Paint;
  CheckBitmap;
  if IsDirty then
  begin
    DrawContent;
    IsDirty := False;
  end;
  BitBlt(inherited Canvas.Handle, 0, 0, Width,
         Height, BitmapCanvas.Handle, 0, 0, SRCCOPY);
end;

procedure TdxSkinBufferedControl.SetImageIndex(AValue: Integer);
begin
  if AValue <> FImageIndex then
  begin
    FImageIndex := AValue;
    IsDirty := True;
  end;
end;

procedure TdxSkinBufferedControl.SetIsDirty(AValue: Boolean);
begin
  FIsDirty := AValue;
  if FIsDirty then
    Invalidate;
end;

procedure TdxSkinBufferedControl.SetState(AValue: TdxSkinElementState);
begin
  if AValue <> FState then
  begin
    FState := AValue;
    IsDirty := True;
  end;
end;


{ TdxSkinElementPreview }

function TdxSkinElementPreview.GetOriginalSize: TSize;
begin
  if Element <> nil then
    Result := Element.Image.Size
  else
    Result := cxNullSize;
end;

procedure TdxSkinElementPreview.SetElement(AValue: TdxSkinElement);
begin
  IsDirty := True;
  if (AValue <> FElement) then
    FElement := AValue;
  InitElementInfo;
  Size := GetOriginalSize;
  Invalidate;
end;

procedure TdxSkinElementPreview.SetSize(const ASize: TSize);
begin
  FSize := ASize;
  Invalidate;
end;

function TdxSkinElementPreview.GetSizeGripRect: TRect;
var
  ASizeGripSize: TSize; 
begin
  ASizeGripSize := LookAndFeelPainter.SizeGripSize;
  Result := cxRectBounds(ClientBounds.Left + Size.cx,
    ClientBounds.Top + Size.cy, ASizeGripSize.cx, ASizeGripSize.cy);
end;

procedure TdxSkinElementPreview.InitElementInfo;
begin
  if (FElement <> nil) then
    Size := FElement.Image.Size
  else
    Size := cxNullSize;
end;

procedure TdxSkinElementPreview.MouseDown(
  Button: TMouseButton; Shift: TShiftState;  X, Y: Integer);
begin
  if PtInRect(GetSizeGripRect, Point(X, Y)) then
  begin
    FSizing := Element <> nil;
    FAnchor := Point(X, Y);
  end;
end;

procedure TdxSkinElementPreview.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  ASizeGripRect: TRect;
begin
  ASizeGripRect := GetSizeGripRect;
  if FSizing then
  begin
    if PtInRect(BoundsRect, Point(X, Y)) then
    begin
      Size := cxSize(Max(Min(Width - cxRectWidth(ASizeGripRect), Size.cx + X - FAnchor.X), OriginalSize.cx),
                     Max(Min(Height - cxRectHeight(ASizeGripRect), Size.cy + Y - FAnchor.Y), OriginalSize.cy));
      FAnchor := Point(X, Y);
      IsDirty := True;
    end;  
  end
  else
    if PtInRect(ASizeGripRect, Point(X, Y)) then
      Cursor := crSizeNWSE
    else
      Cursor := crDefault;
end;

procedure TdxSkinElementPreview.MouseUp(
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  FSizing := False;
end;

procedure TdxSkinElementPreview.DrawContent;
begin
  inherited DrawContent;
  if Element <> nil then
    Element.Draw(BitmapCanvas.Handle, Rect(ClientBounds.Left,
                 ClientBounds.Top, Size.cx, Size.cy), ImageIndex, State);
  LookAndFeelPainter.DrawSizeGrip(BitmapCanvas, GetSizeGripRect, clNone);
end;

{ TdxSkinGradientPanel }

constructor TdxSkinGradientPanel.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := ControlStyle + [csAcceptsControls];
  Color := clBtnFace;
  CaptionColor := clDefault;
  FFakeFont := TFont.Create;
  FFakeFont.Assign(Font);
  FFakeFont.Style := [fsBold];
end;

destructor TdxSkinGradientPanel.Destroy;
begin
  FFakeFont.Free;
  inherited Destroy;
end;

procedure TdxSkinGradientPanel.FontChanged;
begin
  FFakeFont.Assign(Font);
  FFakeFont.Style := [fsBold];
end;

procedure TdxSkinGradientPanel.Paint;
begin
  inherited Paint;
  Canvas.FillRect(Rect(-1, -1, Width, Height), Color);
end;

procedure TdxSkinGradientPanel.LookAndFeelChanged(Sender: TcxLookAndFeel;
  AChangedValues: TcxLookAndFeelValues);
begin
  RecreateWnd;
end;

function TdxSkinGradientPanel.GetRealCaptionColor: TColor;
begin
  Result := FCaptionColor;
  if Result = clDefault then
    Result := clWindow;
end;

function TdxSkinGradientPanel.GetRealCaptionHeight: Integer;
begin
  Result := CaptionHeight;
  if Result = 0 then
    Result := cxTextHeight(Font) + cxTextOffset * 3;
end;

procedure TdxSkinGradientPanel.SetCaption(AValue: string);
begin
  FCaption := AValue;
  RedrawWindow(Handle, nil, 0, RDW_INVALIDATE or RDW_FRAME);
end;

procedure TdxSkinGradientPanel.SetCaptionColor(AValue: TColor);
begin
  FCaptionColor := AValue;
  RecreateWnd;
end;

procedure TdxSkinGradientPanel.SetCaptionHeight(AValue: Integer);
begin
  if AValue < 0 then
    AValue := 0;
  if AValue <> FCaptionHeight then
  begin
    FCaptionHeight := AValue;
    RecreateWnd;
    Realign;
  end;
end;

procedure TdxSkinGradientPanel.WMNCCalcSize(var Message: TWMNCCalcSize);
begin
  inherited;
  InflateRect(Message.CalcSize_Params.rgrc[0], -1, -1);
  Inc(Message.CalcSize_Params.rgrc[0].Top, RealCaptionHeight - 1);
end;

procedure TdxSkinGradientPanel.WMNCPaint(var Message: TWMNCPaint);
var
  R: TRect;
  DC: HDC;
  ABorderColor: TColor;
begin
  inherited;
  GetWindowRect(Handle, R);
  OffsetRect(R, -R.Left, -R.Top);
  DC := GetWindowDC(Handle);
  ABorderColor := clBlack;
  if LookAndFeel.ActiveStyle in [lfsNative, lfsOffice11] then
    ABorderColor := dxOffice11BarMarkColors2[1];
  FrameRectByColor(DC, R, ABorderColor);
  R.Bottom := R.Top + GetRealCaptionHeight;
  InflateRect(R, -1, -1);
  DrawGradientHeader(DC, Caption, R, LookAndFeel, FFakeFont, RealCaptionColor);
  R := cxRectSetTop(R, R.Bottom, 1);
  FrameRectByColor(DC, R, ABorderColor);
  ReleaseDC(Handle, DC);
end;

{ TdxSkinEditorSplitter }

procedure TdxSkinEditorSplitter.Paint;
var
  AParams: TcxViewParams;
  R: TRect;
  ABorderColor: TColor;
begin
  ABorderColor := clBlack;
  FillChar(AParams, SizeOf(AParams), 0);
  if LookAndFeel.ActiveStyle in [lfsNative, lfsOffice11] then
    ABorderColor := dxOffice11BarMarkColors2[1];
  AParams.Color := Color;
  Canvas.FillRect(ClientRect, AParams, Borders, ABorderColor);
  if AlignSplitter in [salLeft, salRight] then
    R := cxRectInflate(ClientRect, -1, 0)
  else
    R := cxRectInflate(ClientRect, 0, -1);
  if bLeft in Borders then
    Inc(R.Left);
  if bRight in Borders then
    Dec(R.Right);
  if bTop in Borders then
    Inc(R.Top);
  if bBottom in Borders then
    Dec(R.Bottom);
  cxFillHalfToneRect(Canvas.Canvas, R, Color, clBtnShadow);
end;

procedure TdxSkinEditorSplitter.SetBorders(Value: TcxBorders);
begin
  FBorders := Value;
  Invalidate;
end;

{ TdxSkinImagePreview }

constructor TdxSkinImagePreview.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FZoom := 2;
  FGridColor := clBlack;
  FMarginColor := clRed;
end;

procedure TdxSkinImagePreview.ApplyMarginChanges;
begin
  if Assigned(Margins.OnChange) then
    Margins.OnChange(Margins);
end;

function TdxSkinImagePreview.GetBorderBounds: TRect;
begin
  if Bitmap <> nil then
    Result := cxRectSetSize(ClientBounds,
          Bitmap.Size.cx * Zoom + Byte(GridLinesVisible) + 2 * ImageBorderSize,
          Bitmap.Size.cy * Zoom + Byte(GridLinesVisible) + 2 * ImageBorderSize)
  else
    Result := cxNullRect;
end;

function TdxSkinImagePreview.GetGridLinesVisible: Boolean;
begin
  Result := FShowGrid and (FZoom >= 4); 
end;

function TdxSkinImagePreview.GetHitTest(
  const X, Y: Integer; out AMargin: TdxMargin): Boolean;
var
  ASide: TdxMargin;
begin
  for ASide := mLeft to mBottom do
  begin
    Result := PtInRect(GetMarginBounds(ASide), Point(X, Y));
    if Result then
    begin
      AMargin := ASide;
      Break;
    end;
  end;
end;

function TdxSkinImagePreview.GetImageBounds: TRect;
begin
  if Bitmap = nil then
    Result := cxNullRect
  else
  begin
    Result := cxRectSetSize(ClientBounds,
      Bitmap.Size.cx * Zoom + Byte(GridLinesVisible),
      Bitmap.Size.cy * Zoom + Byte(GridLinesVisible));
    OffsetRect(Result, ScrollPos.X + ImageBorderSize, ScrollPos.Y + ImageBorderSize);
  end;
end;

function TdxSkinImagePreview.GetBitmapSize: TSize;
begin
  Result := Bitmap.Size;
end;

function TdxSkinImagePreview.GetMargins: TcxRect;
begin
  Result := Bitmap.Margins;
end;

function TdxSkinImagePreview.GetMarginBounds(AMargin: TdxMargin): TRect;
begin
  Result := GetMarginBounds(Margins.Rect, AMargin);
end;

function TdxSkinImagePreview.GetMarginBounds(
  const ARect: TRect; AMargin: TdxMargin): TRect;
var
  AImageBounds: TRect;
  LineThickness: Integer;
begin
  LineThickness := Min(MarginThickness div 2, Zoom);
  AImageBounds := GetImageBounds;

  case AMargin of
    mLeft:
       Result := Rect(AImageBounds.Left + ARect.Left * Zoom - LineThickness,
                      AImageBounds.Top,
                      AImageBounds.Left + ARect.Left * Zoom + LineThickness
                                        + Byte(GridLinesVisible),
                      AImageBounds.Bottom);
    mRight:
       Result := Rect(AImageBounds.Right - ARect.Right * Zoom - LineThickness,
                      AImageBounds.Top,
                      AImageBounds.Right - ARect.Right * Zoom + LineThickness
                                         + Byte(GridLinesVisible),
                      AImageBounds.Bottom);
    mTop:
       Result := Rect(AImageBounds.Left,
                      AImageBounds.Top + ARect.Top * Zoom - LineThickness,
                      AImageBounds.Right,
                      AImageBounds.Top + ARect.Top * Zoom + LineThickness
                                       + Byte(GridLinesVisible));
    mBottom:
       Result := Rect(AImageBounds.Left,
                      AImageBounds.Bottom - ARect.Bottom * Zoom - LineThickness,
                      AImageBounds.Right,
                      AImageBounds.Bottom - ARect.Bottom * Zoom + LineThickness
                                          + Byte(GridLinesVisible));

  end;
end;

procedure TdxSkinImagePreview.SetBitmap(AValue: TdxSkinImage);
begin
  FBitmap := AValue;
  SetZoom(FZoom);
end;

procedure TdxSkinImagePreview.SetColor(AValue: TColor);
begin
  FMarginColor := AValue;
  IsDirty := True;
  Invalidate;
end;

procedure TdxSkinImagePreview.SetGridColor(AValue: TColor);
begin
  FGridColor := AValue;
  IsDirty := True;
  Invalidate;
end;

procedure TdxSkinImagePreview.SetMargins(const ARect: TRect);
begin
  Margins.Rect := ARect;
  IsDirty := True;
end;

procedure TdxSkinImagePreview.SetShowGrid(AValue: Boolean);
begin
  if AValue <> FShowGrid then
  begin
    FShowGrid := AValue;
    SetZoom(FZoom);
    IsDirty := True; 
  end;
end;

procedure TdxSkinImagePreview.SetZoom(AValue: Integer);
begin
  FZoom := Max(AValue, 1);
  IsDirty := True; 
  UpdateScrollBars;
end;

procedure TdxSkinImagePreview.SetScrollPos(const AValue: TPoint);
begin
  if not cxPointIsEqual(AValue, FScrollPos) then
  begin
    FScrollPos := AValue;
    IsDirty := True; 
  end;
end;

procedure TdxSkinImagePreview.InitScrollBarsParameters;
var
  AImageBounds: TRect;
  AClient: TRect;
begin
  AImageBounds := GetImageBounds;
  AClient := ClientBounds;
  FScrollPos := cxNullPoint;
  SetScrollBarInfo(sbVertical, 0, AImageBounds.Bottom - AImageBounds.Top,
    1, AClient.Bottom - AClient.Top - 2 * ImageBorderSize, 0, True, True);
  SetScrollBarInfo(sbHorizontal, 0, AImageBounds.Right - AImageBounds.Left,
    1, AClient.Right - AClient.Left - 2 * ImageBorderSize, 0, True, True);
   IsDirty := True; 
end;

function TdxSkinImagePreview.CalculateCursor(X, Y: Integer): TCursor;
var
  AMargin: TdxMargin;
begin
  Result := crDefault;
  if GetHitTest(X, Y, AMargin) then
  begin
     case AMargin of
       mLeft, mRight:
         Result := crSizeWE;
       mTop, mBottom:
         Result := crSizeNS;
     end;
  end;
end;

function TdxSkinImagePreview.CalculateMargins(X, Y: Integer): TRect;
var
  AValue: Integer;
begin
  case DragMargin of
    mTop:
      AValue := (Y - ImageBounds.Top) div Zoom;
    mLeft:
      AValue := (X - ImageBounds.Left) div Zoom;
    mRight:
      AValue := (ImageBounds.Right - X) div Zoom;
    else //mBottom
      AValue := (ImageBounds.Bottom - Y) div Zoom;
  end;
  Result := Margins.Rect;
  SetMarginValue(Result, DragMargin,
    CheckMarginValue(AValue, DragMargin, Margins.Rect, BitmapSize));
end;

procedure TdxSkinImagePreview.MouseDown(
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseDown(Button, Shift, X, Y);
  if Assigned(Bitmap) then
    FMoved := GetHitTest(X, Y, FDragMargin);
end;

procedure TdxSkinImagePreview.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  if Bitmap = nil then Exit;
  if not FMoved then
    Cursor := CalculateCursor(X, Y)
  else
    if PtInRect(ImageBounds, Point(X, Y)) then
    begin
      LockChanges;
      try
        SetMargins(CalculateMargins(X, Y));
      finally
        UnlockChanges;
      end;
    end;
end;

procedure TdxSkinImagePreview.MouseUp(
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);
  if FMoved and Assigned(Bitmap) then
    ApplyMarginChanges;
  FMoved := False;
  Cursor := crDefault;
end;

procedure TdxSkinImagePreview.DoOpenFile(const AFileName: string);
begin
  if Assigned(OnDropFile) then
    OnDropFile(Self, AFileName)
end;

procedure TdxSkinImagePreview.DrawContent;
var
  AImageBounds: TRect;
  AItemBitmap: TBitmap;
  AMargin: TdxMargin;
  I: Integer;
  R: TRect;
begin
  inherited DrawContent;
  if Bitmap = nil then Exit;
  
  AImageBounds := GetImageBounds;

  AItemBitmap := TBitmap.Create;
  try 
    AItemBitmap.PixelFormat := pf32Bit;
    Bitmap.GetBitmap(ImageIndex, State, AItemBitmap, Color);
    BitmapCanvas.Canvas.StretchDraw(AImageBounds, AItemBitmap);
  finally 
    AItemBitmap.Free;
  end;

  if GridLinesVisible then
  begin
    BitmapCanvas.Brush.Color := FGridColor;
    R := GetImageBounds;
    R.Right := R.Left + 1;
    for I := 0 to (AImageBounds.Right - AImageBounds.Left) div Zoom do
    begin
      BitmapCanvas.FillRect(R);
      OffsetRect(R, Zoom, 0);
    end;
    R := GetImageBounds;
    R.Bottom := R.Top + 1;
    for I := 0 to (AImageBounds.Bottom - AImageBounds.Top) div Zoom do
    begin
      BitmapCanvas.FillRect(R);
      OffsetRect(R, 0, Zoom);
    end;
  end;
  
  BitmapCanvas.Brush.Color := FMarginColor;
  for AMargin := Low(AMargin) to High(AMargin) do
    BitmapCanvas.FillRect(GetMarginBounds(AMargin));

  BitmapCanvas.Brush.Color := clBlack;  
  BitmapCanvas.FrameRect(GetBorderBounds);
end;

procedure TdxSkinImagePreview.Scroll(AScrollBarKind: TScrollBarKind;
  AScrollCode: TScrollCode; var AScrollPos: Integer);
var
  ANewScrollPos: TPoint;
begin
  if AScrollCode = scEndScroll then Exit;
  ANewScrollPos := FScrollPos;
  case AScrollBarKind of
    sbHorizontal:
      ANewScrollPos.X := -AScrollPos;
    sbVertical:
      ANewScrollPos.Y := -AScrollPos;
  end;
  ScrollPos := ANewScrollPos;
end;

procedure TdxSkinImagePreview.LockChanges;
begin
  if FLockChanges = 0 then
  begin
    FChangesHandler := Margins.OnChange;
    Margins.OnChange := nil;
  end;
  Inc(FLockChanges);
end;

procedure TdxSkinImagePreview.UnlockChanges;
begin
  Dec(FLockChanges);
  if FLockChanges = 0 then
    Margins.OnChange := FChangesHandler;
end;

end.

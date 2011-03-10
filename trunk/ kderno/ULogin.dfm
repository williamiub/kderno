object FLogin: TFLogin
  Left = 0
  Top = 0
  Caption = 'FLogin'
  ClientHeight = 441
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object dxLayoutControl1: TdxLayoutControl
    Left = 96
    Top = 184
    Width = 225
    Height = 153
    Align = alCustom
    TabOrder = 0
    TabStop = False
    LayoutLookAndFeel = dxLayoutSkinLookAndFeel1
    OptionsItem.FocusControlOnItemCaptionClick = True
    object cxTextEdit1: TcxTextEdit
      Left = 72
      Top = 10
      Style.HotTrack = False
      TabOrder = 0
      Text = 'cxTextEdit1'
      Width = 121
    end
    object cxTextEdit2: TcxTextEdit
      Left = 72
      Top = 37
      Style.HotTrack = False
      TabOrder = 1
      Text = 'cxTextEdit2'
      Width = 121
    end
    object dxLayoutControl1Group_Root: TdxLayoutGroup
      AlignHorz = ahLeft
      AlignVert = avTop
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      object dxLayoutControl1Item1: TdxLayoutItem
        CaptionOptions.Text = 'cxTextEdit1'
        Control = cxTextEdit1
        ControlOptions.ShowBorder = False
      end
      object dxLayoutControl1Item2: TdxLayoutItem
        CaptionOptions.Text = 'cxTextEdit2'
        Control = cxTextEdit2
        ControlOptions.ShowBorder = False
      end
    end
  end
  object dxRibbon1: TdxRibbon
    Left = 0
    Top = 0
    Width = 418
    Height = 25
    ColorSchemeName = 'Blue'
    Contexts = <>
    TabOrder = 1
    TabStop = False
    object dxRibbon1Tab1: TdxRibbonTab
      Active = True
      Caption = 'dxRibbon1Tab1'
      Groups = <>
      Index = 0
    end
    object dxRibbon1Tab2: TdxRibbonTab
      Caption = 'dxRibbon1Tab2'
      Groups = <>
      Index = 1
    end
  end
  object dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList
    Left = 328
    Top = 192
    object dxLayoutSkinLookAndFeel1: TdxLayoutSkinLookAndFeel
    end
  end
end

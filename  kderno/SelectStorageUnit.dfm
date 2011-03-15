object SelectStorage: TSelectStorage
  Left = 524
  Top = 233
  BorderStyle = bsDialog
  Caption = 'Select storage'
  ClientHeight = 114
  ClientWidth = 198
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object cxGroupBox2: TcxGroupBox
    Left = 0
    Top = 0
    Align = alClient
    PanelStyle.Active = True
    TabOrder = 0
    DesignSize = (
      198
      114)
    Height = 114
    Width = 198
    object cxGroupBox1: TcxGroupBox
      Left = 8
      Top = 8
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Save to'
      TabOrder = 0
      Transparent = True
      Height = 65
      Width = 182
      object rbDBStorage: TcxRadioButton
        Left = 8
        Top = 16
        Width = 113
        Height = 17
        Caption = 'DB Storage'
        Checked = True
        TabOrder = 0
        TabStop = True
        Transparent = True
      end
      object rbUnboundStorage: TcxRadioButton
        Left = 8
        Top = 41
        Width = 113
        Height = 17
        Caption = 'Unbound Storage'
        TabOrder = 1
        Transparent = True
      end
    end
    object btnOK: TcxButton
      Left = 105
      Top = 83
      Width = 85
      Height = 23
      Anchors = [akTop, akRight]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 1
    end
  end
end

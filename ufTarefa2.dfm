object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'fTarefa2'
  ClientHeight = 221
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMeio: TPanel
    Left = 0
    Top = 0
    Width = 315
    Height = 221
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 20
    TabOrder = 0
    object lblThread2: TLabel
      Left = 20
      Top = 90
      Width = 145
      Height = 13
      Caption = 'Informe o tempo da Thread 2:'
    end
    object lblThread1: TLabel
      Left = 20
      Top = 18
      Width = 145
      Height = 13
      Caption = 'Informe o tempo da Thread 1:'
    end
    object pbThread1: TProgressBar
      Left = 20
      Top = 55
      Width = 262
      Height = 17
      TabOrder = 2
    end
    object edtThread2: TEdit
      Left = 169
      Top = 87
      Width = 115
      Height = 21
      TabOrder = 1
      OnKeyPress = edtThread2KeyPress
    end
    object pbThread2: TProgressBar
      Left = 20
      Top = 128
      Width = 264
      Height = 17
      TabOrder = 3
    end
    object btnExecutar: TButton
      Left = 116
      Top = 164
      Width = 97
      Height = 25
      Caption = 'Executar'
      TabOrder = 4
      OnClick = btnExecutarClick
    end
    object edtThread1: TEdit
      Left = 167
      Top = 15
      Width = 115
      Height = 21
      TabOrder = 0
      OnKeyPress = edtThread1KeyPress
    end
  end
end

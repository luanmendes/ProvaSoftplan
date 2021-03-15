object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Tarefa 3'
  ClientHeight = 416
  ClientWidth = 687
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
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMeio: TPanel
    Left = 0
    Top = 0
    Width = 687
    Height = 299
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 20
    TabOrder = 0
    object pnlTopo: TPanel
      Left = 20
      Top = 20
      Width = 647
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object lblProjeto: TLabel
        Left = 0
        Top = 10
        Width = 73
        Height = 13
        Caption = 'Valores projeto'
      end
    end
    object dbgrdProjeto: TDBGrid
      Left = 20
      Top = 49
      Width = 647
      Height = 230
      Align = alClient
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          Visible = True
        end
        item
          Expanded = False
          Visible = True
        end
        item
          Expanded = False
          Visible = True
        end>
    end
  end
  object pnlBaixo: TPanel
    Left = 0
    Top = 299
    Width = 687
    Height = 117
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object lblTotal: TLabel
      Left = 547
      Top = 5
      Width = 40
      Height = 13
      Caption = 'Total R$'
    end
    object lblTotalDivisoes: TLabel
      Left = 547
      Top = 45
      Width = 81
      Height = 13
      Caption = 'Total divis'#245'es R$'
    end
    object btnTotal: TButton
      Left = 416
      Top = 16
      Width = 105
      Height = 25
      Caption = 'Obter total'
      TabOrder = 0
      OnClick = btnTotalClick
    end
    object btnTotalDivisoes: TButton
      Left = 416
      Top = 63
      Width = 105
      Height = 25
      Caption = 'Obter total divis'#245'es'
      TabOrder = 2
      OnClick = btnTotalDivisoesClick
    end
    object medtTotalDivisoes: TMaskEdit
      Left = 547
      Top = 64
      Width = 120
      Height = 21
      ReadOnly = True
      TabOrder = 3
      Text = ''
    end
    object medtTotal: TMaskEdit
      Left = 547
      Top = 18
      Width = 120
      Height = 21
      ReadOnly = True
      TabOrder = 1
      Text = ''
    end
  end
end

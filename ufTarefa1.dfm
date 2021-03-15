object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsNone
  Caption = 'Tarefa 1'
  ClientHeight = 405
  ClientWidth = 833
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
  PixelsPerInch = 96
  TextHeight = 13
  object pnlBaixo: TPanel
    Left = 0
    Top = 235
    Width = 833
    Height = 170
    Align = alBottom
    BevelOuter = bvNone
    BorderWidth = 35
    TabOrder = 3
    object lblSQL: TLabel
      Left = 35
      Top = 16
      Width = 56
      Height = 13
      Caption = 'SQL gerado'
    end
    object lblCopiado: TLabel
      Left = 35
      Top = 141
      Width = 159
      Height = 13
      Caption = 'Comando salvo em seu "crtl + c".'
      Visible = False
    end
    object mmoSQLGerado: TMemo
      Left = 35
      Top = 35
      Width = 763
      Height = 100
      Align = alClient
      ReadOnly = True
      TabOrder = 0
    end
  end
  object pnlColunas: TPanel
    Left = 0
    Top = 0
    Width = 233
    Height = 235
    Align = alLeft
    BevelOuter = bvNone
    BorderWidth = 30
    Caption = 'pnlColunas'
    TabOrder = 0
    object lblColunas: TLabel
      Left = 30
      Top = 11
      Width = 38
      Height = 13
      Caption = 'Colunas'
    end
    object mmoColunas: TMemo
      Tag = 1
      Left = 30
      Top = 30
      Width = 173
      Height = 175
      Hint = 'Colunas'
      Align = alClient
      TabOrder = 0
    end
  end
  object pnlTabelas: TPanel
    Left = 233
    Top = 0
    Width = 241
    Height = 235
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 30
    TabOrder = 1
    object lblTabela: TLabel
      Left = 30
      Top = 11
      Width = 32
      Height = 13
      Caption = 'Tabela'
    end
    object mmoTabela: TMemo
      Tag = 1
      Left = 30
      Top = 30
      Width = 170
      Height = 175
      Hint = 'Tabela'
      Align = alLeft
      TabOrder = 0
    end
  end
  object pnlCondicoes: TPanel
    Left = 474
    Top = 0
    Width = 359
    Height = 235
    Align = alRight
    BevelOuter = bvNone
    BorderWidth = 30
    TabOrder = 2
    object lblCondicoes: TLabel
      Left = 30
      Top = 11
      Width = 49
      Height = 13
      Caption = 'Condi'#231#245'es'
    end
    object mmoCondicoes: TMemo
      Left = 30
      Top = 30
      Width = 170
      Height = 175
      Hint = 'Condi'#231#245'es'
      Align = alLeft
      Anchors = []
      TabOrder = 0
    end
    object btnGerar: TButton
      Left = 224
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Gerar SQL'
      TabOrder = 1
      OnClick = btnGerarClick
    end
  end
  object spQuery1: TspQuery
    Left = 584
    Top = 225
  end
  object spQuery2: TspQuery
    Left = 648
    Top = 186
  end
end

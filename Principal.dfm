object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Principal'
  ClientHeight = 348
  ClientWidth = 561
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = mmTarefas
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object mmTarefas: TMainMenu
    Left = 192
    Top = 96
    object arefas1: TMenuItem
      Caption = 'Tarefas'
      object arefa11: TMenuItem
        Action = actTarefa1
      end
      object arefa21: TMenuItem
        Action = actTarefa2
      end
      object arefa31: TMenuItem
        Action = actTarefa3
      end
    end
  end
  object actlstAcoes: TActionList
    Left = 296
    Top = 152
    object actTarefa1: TAction
      Caption = 'Tarefa 1'
      OnExecute = actTarefa1Execute
    end
    object actTarefa2: TAction
      Caption = 'Tarefa 2'
      OnExecute = actTarefa2Execute
    end
    object actTarefa3: TAction
      Caption = 'Tarefa 3'
      OnExecute = actTarefa3Execute
    end
  end
end

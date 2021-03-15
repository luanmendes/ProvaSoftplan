unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, System.Actions, Vcl.ActnList,
  ufTarefa1, ufTarefa2, ufTarefa3, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    mmTarefas: TMainMenu;
    arefas1: TMenuItem;
    arefa11: TMenuItem;
    arefa21: TMenuItem;
    arefa31: TMenuItem;
    actlstAcoes: TActionList;
    actTarefa1: TAction;
    actTarefa2: TAction;
    actTarefa3: TAction;
    procedure actTarefa1Execute(Sender: TObject);
    procedure actTarefa2Execute(Sender: TObject);
    procedure actTarefa3Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


procedure TfrmPrincipal.actTarefa1Execute(Sender: TObject);
begin
  Application.CreateForm(TfTarefa1, fTarefa1);
end;


procedure TfrmPrincipal.actTarefa2Execute(Sender: TObject);
begin
  Application.CreateForm(TfTarefa2, fTarefa2);
end;

procedure TfrmPrincipal.actTarefa3Execute(Sender: TObject);
begin
  Application.CreateForm(TfTarefa3, fTarefa3);
end;

end.

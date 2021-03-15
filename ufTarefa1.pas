unit ufTarefa1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, ClipBrd ,uspQuery;

type
  TfTarefa1 = class(TForm)
    pnlBaixo: TPanel;
    pnlColunas: TPanel;
    pnlTabelas: TPanel;
    pnlCondicoes: TPanel;
    mmoColunas: TMemo;
    mmoTabela: TMemo;
    mmoCondicoes: TMemo;
    mmoSQLGerado: TMemo;
    lblColunas: TLabel;
    lblTabela: TLabel;
    lblCondicoes: TLabel;
    btnGerar: TButton;
    lblSQL: TLabel;
    spQuery1: TspQuery;
    spQuery2: TspQuery;
    lblCopiado: TLabel;
   
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure ValidaCamposPreenchidos;
    procedure ValidaTabelasInformadas;
  end;

var
  fTarefa1: TfTarefa1;

implementation

{$R *.dfm}

procedure TfTarefa1.btnGerarClick(Sender: TObject);
begin
  ValidaCamposPreenchidos;
  ValidaTabelasInformadas;

  spQuery1.Coluna := mmoColunas.Lines.Text;
  spQuery1.Tabela := mmoTabela.Lines.Text;
  spQuery1.Condicao := mmoCondicoes.Lines.Text;

  mmoSQLGerado.Lines.Text := spQuery1.GeraSQL;
  Clipboard.AsText := mmoSQLGerado.Lines.Text;
  lblCopiado.Visible := True;
end;

procedure TfTarefa1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  fTarefa1 := nil;
end;

procedure TfTarefa1.ValidaCamposPreenchidos;
var
  i: Integer;
  sCamposNaoPreenchidos: string;
begin
  try
    for i := 0 to Pred(fTarefa1.ComponentCount) do
    begin
      if (fTarefa1.Components[i] is TMemo)
        and (TMemo(fTarefa1.Components[i]).Tag = 1) then
      begin
        if TMemo(fTarefa1.Components[i]).Lines.Count = 0 then
          sCamposNaoPreenchidos :=  sCamposNaoPreenchidos + ' - ' + TMemo(fTarefa1.Components[i]).Hint  + #10#13;
      end;
    end;
    if sCamposNaoPreenchidos <> EmptyStr then
      raise Exception.Create('Os campos abaixo não foram preenchidos e são obrigatórios: ' + #10#13 +
        sCamposNaoPreenchidos);
  except
    raise;
  end;
end;

procedure TfTarefa1.ValidaTabelasInformadas;
const
  MSG_UMA_TABELA_POR_LINHA = 'Somente é permitido informar tabela para a geração do SQL.';
begin
  try
    if mmoTabela.Lines.Count > 1 then
      raise Exception.Create(MSG_UMA_TABELA_POR_LINHA);
    if (Pos(' ', mmoTabela.Lines[0]) > 0) or
        (Pos(',', mmoTabela.Lines[0]) > 0) then
      raise Exception.Create(MSG_UMA_TABELA_POR_LINHA);
  except
    raise;
  end;

end;

end.

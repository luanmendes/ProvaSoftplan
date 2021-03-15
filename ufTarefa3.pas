unit ufTarefa3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, dmdfTarefa3, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxCurrencyEdit, Vcl.Mask;

type
  TfTarefa3 = class(TForm)
    pnlMeio: TPanel;
    pnlBaixo: TPanel;
    pnlTopo: TPanel;
    dbgrdProjeto: TDBGrid;
    lblProjeto: TLabel;
    btnTotal: TButton;
    btnTotalDivisoes: TButton;
    lblTotal: TLabel;
    lblTotalDivisoes: TLabel;
    medtTotalDivisoes: TMaskEdit;
    medtTotal: TMaskEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnTotalClick(Sender: TObject);
    procedure btnTotalDivisoesClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FTarefa3DM: TdmTarefa3;

    procedure PreparaGrid;
  public
    { Public declarations }



  end;

var
  fTarefa3: TfTarefa3;

implementation

{$R *.dfm}

{ TfTarefa3 }

procedure TfTarefa3.PreparaGrid;
begin
  dbgrdProjeto.DataSource := FTarefa3DM.dsProjeto;
  dbgrdProjeto.Columns[0].FieldName := 'IDPROJETO';
  dbgrdProjeto.Columns[1].FieldName := 'NOMEPROJETO';
  dbgrdProjeto.Columns[2].FieldName := 'VALOR';
end;

procedure TfTarefa3.btnTotalClick(Sender: TObject);
begin
   medtTotal.Text:= FormatFloat('R$ ###,###,##0.0000',
    FTarefa3DM.CalcularTotais);
end;

procedure TfTarefa3.btnTotalDivisoesClick(Sender: TObject);
begin
  medtTotalDivisoes.Text:= FormatFloat('R$ ###,###,##0.0000',
    FTarefa3DM.CalcularTotaisDivisao);
end;

procedure TfTarefa3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fTarefa3 := nil;
  Action := caFree;
end;

procedure TfTarefa3.FormCreate(Sender: TObject);
begin
  FTarefa3DM  := TdmTarefa3.Create(nil);
end;

procedure TfTarefa3.FormDestroy(Sender: TObject);
begin
  FreeandNil(FTarefa3DM);
end;

procedure TfTarefa3.FormShow(Sender: TObject);
begin
  PreparaGrid;
end;

end.

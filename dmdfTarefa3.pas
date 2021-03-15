unit dmdfTarefa3;

interface

uses
  System.SysUtils, System.Classes, Datasnap.DBClient, Data.DB;

  type
  TdmTarefa3 = class(TDataModule)
    procedure DataModuleCreate(Sender: TObject);

  private
      { Private declarations }

    FdsProjeto: TDataSource;
    FcdsProjeto: TClientDataSet;

    procedure CriaComponentes;
    procedure PopulaRegistros;

  public
    { Public declarations }
    function CalcularTotais: Currency;
    function CalcularTotaisDivisao: Currency;


    property cdsProjeto: TClientDataSet read FcdsProjeto write FcdsProjeto;
    property dsProjeto: TDataSource read FdsProjeto write FdsProjeto;
  end;

var
  dmTarefa3: TdmTarefa3;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmTarefa3 }

function TdmTarefa3.CalcularTotais: Currency;
var
  cTotal: Currency;
begin
  cTotal := 0;
  try
    cdsProjeto.DisableControls;
    cdsProjeto.First;
    while not cdsProjeto.Eof do
    begin
      cTotal := cTotal + cdsProjeto.Fields[2].Value;
      cdsProjeto.Next;
    end;
  finally
    Result := cTotal;
    cdsProjeto.EnableControls;
  end;
end;

function TdmTarefa3.CalcularTotaisDivisao: Currency;
var
  cTotalDivisao, cValorAnterior: Currency;
begin
  cTotalDivisao := 0;
  cValorAnterior :=0;
  try
    cdsProjeto.DisableControls;
    cdsProjeto.First;
    while not cdsProjeto.Eof do
    begin
      if cValorAnterior > 0 then
        cTotalDivisao := cTotalDivisao + (cdsProjeto.Fields[2].Value / cValorAnterior);

      cValorAnterior := cdsProjeto.Fields[2].Value;
      cdsProjeto.Next;
    end;
  finally
    Result:= cTotalDivisao;
    cdsProjeto.EnableControls;
  end;
end;

procedure TdmTarefa3.CriaComponentes;
begin
  FcdsProjeto := TClientDataSet.Create(nil);
  FcdsProjeto.FieldDefs.Add('IDPROJETO', ftInteger);
  FcdsProjeto.FieldDefs.Add('NOMEPROJETO', ftString, 60);
  FcdsProjeto.FieldDefs.Add('VALOR', ftCurrency);
  FcdsProjeto.IndexFieldNames := 'IDPROJETO';
  FcdsProjeto.CreateDataSet;

  FdsProjeto := TDataSource.Create(nil);
  FdsProjeto.DataSet := FcdsProjeto;
end;

procedure TdmTarefa3.DataModuleCreate(Sender: TObject);
begin
  CriaComponentes;
  PopulaRegistros;
end;

procedure TdmTarefa3.PopulaRegistros;
var
  i: Integer;
begin
  for i := 1 to 10 do
  begin
    FcdsProjeto.Insert;
    FcdsProjeto.FieldByName('IDPROJETO').AsInteger := i;
    FcdsProjeto.FieldByName('NOMEPROJETO').AsString := Format('Projeto %s', [IntToStr(i)]);
    FcdsProjeto.FieldByName('VALOR').AsCurrency := i * 10;
    FcdsProjeto.Post;
  end;
end;

end.

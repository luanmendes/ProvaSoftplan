unit uspQuery;

interface

uses
  System.SysUtils, System.Classes, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TspQuery = class(TFDQuery)
  private
    { Private declarations }

    FspCondicoes: TStrings;
    FspColunas: TStrings;
    FspTabelas: TStrings;
    FTabela: string;
    FCondicao: string;
    FColuna: string;

    procedure SetCondicoesList(Value: TStrings);
    procedure SetColunasList(Value: TStrings);
    procedure SetTabelasList(Value: TStrings);

    procedure setColuna(const Value: string);
    procedure setCondicao(const Value: string);
    procedure setTabela(const Value: string);

    property spCondicoes: TStrings read FspCondicoes write SetCondicoesList;
    property spColunas: TStrings read FspColunas write SetColunasList;
    property spTabelas: TStrings read FspTabelas write SetTabelasList;

    procedure AtribuiValoresLista(ALista: TStrings; ATexto: string);
  public
    { Public declarations }
    function GeraSQL: String;

    property Coluna: string read FColuna write setColuna;
    property Tabela: string read FTabela write setTabela;
    property Condicao: string read FCondicao write setCondicao;

    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
  end;

procedure register;

implementation

procedure Register;
begin
  RegisterComponents('spComponentes', [TspQuery]);
end;

{ TspQuery }

procedure TspQuery.AtribuiValoresLista(ALista: TStrings; ATexto: string);
begin
  ALista.Clear;
  
  if ATexto <> EmptyStr then
  begin
    ALista.Add(ATexto);
  end;
end;

constructor TspQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FspCondicoes := TStringList.Create;

  FspColunas := TStringList.Create;
{  FspColunas.Delimiter := ',';
  FspColunas.StrictDelimiter := True;                                          ;}

  FspTabelas := TStringList.Create;

  FTabela:= '';
  FTabela := '';
  FCondicao := '';
end;

destructor TspQuery.Destroy;
begin
  FspCondicoes.Free;
  FspColunas.Free;
  FspTabelas.Free;

  inherited;
end;

function TspQuery.GeraSQL: String;
var
  sGeraSQL: String;
begin
  sGeraSQL :=
    Format('SELECT %s',
      [StringReplace(spColunas.Strings[0], #13#10, ', ', [rfReplaceAll])]) + #13#10 +
    Format('FROM %s', [spTabelas.Text]);

  if spCondicoes.Count > 0 then
    sGeraSQL := sGeraSQL +
      Format('WHERE %s', [spCondicoes.Text]);

  Result := sGeraSQL;
end;

procedure TspQuery.setColuna(const Value: string);
begin
  FColuna := Value;

  AtribuiValoresLista(spColunas, FColuna);
end;

procedure TspQuery.setCondicao(const Value: string);
begin
  FCondicao := Value;

  AtribuiValoresLista(spCondicoes, FCondicao);
end;

procedure TspQuery.setTabela(const Value: string);
begin
  FTabela := Value;

  AtribuiValoresLista(spTabelas, FTabela);
end;

procedure TspQuery.SetColunasList(Value: TStrings);
begin
  FspColunas := Value;
end;


procedure TspQuery.SetCondicoesList(Value: TStrings);
begin
  FspCondicoes := Value;
end;


procedure TspQuery.SetTabelasList(Value: TStrings);
begin
  FspTabelas := Value;
end;

end.

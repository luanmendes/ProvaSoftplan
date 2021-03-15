unit ufTarefa2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls;

  type
  TBarraProgressoThread = Class(TThread)
  private
    FTempoExecucao: Integer;
    FBarraProgresso: TProgressbar;
  protected
    procedure Execute; Override;
  public
    constructor Create;
    destructor Destroy; override;

    procedure AtribuiValores(ATempoExecucao: Integer; ABarraProgresso: TProgressBar);
end;

type
  TfTarefa2 = class(TForm)
    pnlMeio: TPanel;
    pbThread1: TProgressBar;
    lblThread2: TLabel;
    edtThread2: TEdit;
    pbThread2: TProgressBar;
    btnExecutar: TButton;
    lblThread1: TLabel;
    edtThread1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExecutarClick(Sender: TObject);
    procedure edtThread1KeyPress(Sender: TObject; var Key: Char);
    procedure edtThread2KeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FProgressoThread1: TBarraProgressoThread;
    FProgressoThread2: TBarraProgressoThread;

    procedure ValidarExecucaoThreads;

  public
    { Public declarations }
  end;

var
  fTarefa2: TfTarefa2;

implementation

{$R *.dfm}

{ TBarraProgressoThread }

constructor TBarraProgressoThread.Create;
begin
  inherited Create(True);

  FreeOnTerminate := True;
end;

destructor TBarraProgressoThread.Destroy;
begin
  inherited Destroy;
end;

procedure TBarraProgressoThread.Execute;
var
  i: Integer;
begin
  inherited;

  for i := 0 to 100 do
  begin
    if Terminated then
      Break;

    Sleep(FTempoExecucao);
    Synchronize(
      procedure
      begin
        FBarraProgresso.Position := i;
      end);
  end;
end;

procedure TBarraProgressoThread.AtribuiValores(ATempoExecucao: Integer;
  ABarraProgresso: TProgressBar);
begin
  FTempoExecucao := ATempoExecucao;
  FBarraProgresso := ABarraProgresso;
end;


procedure TfTarefa2.btnExecutarClick(Sender: TObject);
begin
  ValidarExecucaoThreads;
  if
    (edtThread1.Text <> EmptyStr) and (StrToInt(edtThread1.Text) > 0) then
  begin
    FProgressoThread1 := TBarraProgressoThread.Create;
    FProgressoThread1.AtribuiValores(StrToInt(edtThread1.Text),
      pbThread1);
    try
      FProgressoThread1.Start;
    except on E: Exception do
      raise Exception.Create(Format('Ocorreu um erro ao executar a Thread 1, Erro original: %s', [E.Message]));
    end;
  end;

  if (edtThread2.Text <> EmptyStr) and  (StrToInt(edtThread2.Text) > 0) then
  begin
    FProgressoThread2 := TBarraProgressoThread.Create;
    FProgressoThread2.AtribuiValores(StrToInt(edtThread2.Text),
      pbThread2);
    try
      FProgressoThread2.Start;
    except on E: Exception do
      raise Exception.Create(Format('Ocorreu um erro ao executar a Thread 1, Erro original: %s', [E.Message]));
    end;
  end;

end;

procedure TfTarefa2.edtThread1KeyPress(Sender: TObject; var Key: Char);
begin
  if not (key in ['0'..'9']) then
    key := #0;
end;

procedure TfTarefa2.edtThread2KeyPress(Sender: TObject; var Key: Char);
begin
  if not(key in ['0'..'9']) then
    key := #0;
end;

procedure TfTarefa2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FProgressoThread1) then
    FProgressoThread1.Terminate;

  if Assigned(FProgressoThread2) then
    FProgressoThread2.Terminate;

  fTarefa2 := nil;
  Action := caFree;
end;

procedure TfTarefa2.FormShow(Sender: TObject);
begin
  FProgressoThread1 := nil;
  FProgressoThread2 := nil;
end;


procedure TfTarefa2.ValidarExecucaoThreads;
var
  bEmExecucao: Boolean;
  sMensagem: string;
begin
  try
    bEmExecucao := False;
    if Assigned(FProgressoThread1) then
      bEmExecucao := (not FProgressoThread1.Finished)
        and (not FProgressoThread1.Suspended);

    if bEmExecucao then
    begin
      sMensagem:= '- Thread 1';
      bEmExecucao := False;
    end;

    if Assigned(FProgressoThread2) then
      bEmExecucao :=  (not FProgressoThread2.Finished)
        and (not FProgressoThread2.Suspended);

    if bEmExecucao then
      sMensagem:= sMensagem + #10#13 +'- Thread 2';

    if sMensagem <> EmptyStr then
      raise Exception.Create('As Threads abaixo estão em execução, aguarde finalizar ' +
        'para iniciar uma nova' + #10#13+
        sMensagem);
  except
    raise;
  end;
end;

end.

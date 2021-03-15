program ProvaDelphiApp;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {frmPrincipal},
  ufTarefa1 in 'ufTarefa1.pas' {fTarefa1},
  ufTarefa2 in 'ufTarefa2.pas' {fTarefa2},
  ufTarefa3 in 'ufTarefa3.pas' {fTarefa3},
  uspQuery in 'Componentes\uspQuery.pas',
  dmdfTarefa3 in 'dmdfTarefa3.pas' {dmTarefa3: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.

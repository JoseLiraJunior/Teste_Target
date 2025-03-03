program Teste_Target;

uses
  Vcl.Forms,
  uTeste in 'uTeste.pas' {frmTesteTarget};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmTesteTarget, frmTesteTarget);
  Application.Run;
end.

program prjNotas;

uses
  Vcl.Forms,
  Menu in 'Menu.pas' {FrmMenu},
  DmCom in 'DmCom.pas' {Dm: TDataModule},
  clsAlunos in 'clsAlunos.pas',
  clsNotas in 'clsNotas.pas',
  cad_padrao in 'cad_padrao.pas' {FrmCad_padrao},
  cad_alunos in 'cad_alunos.pas' {FrmCad_alunos},
  Cad_notas in 'Cad_notas.pas' {FrmCad_notas};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDm, Dm);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.Run;
end.

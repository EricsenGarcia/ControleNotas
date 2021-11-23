unit cad_alunos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_padrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ComCtrls, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, clsAlunos, DmCom;

type
  TFrmCad_alunos = class(TFrmCad_padrao)
    FDConsID: TIntegerField;
    FDConsNOME: TStringField;
    Label2: TLabel;
    Label3: TLabel;
    edId: TEdit;
    edNome: TEdit;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure BtnInserirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCad_alunos: TFrmCad_alunos;

implementation

var
  Alunos : TAlunos;

{$R *.dfm}

procedure TFrmCad_alunos.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  edId.text   := FDCons.FieldByName('id'  ).AsString;
  edNome.text := FDCons.FieldByName('nome').AsString;
end;

procedure TFrmCad_alunos.BtnEliminarClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox( 'Deseja realmente eliminar?',
                             'Atenção', mb_YesNo + mb_IconQuestion )=idNo then
  begin
    exit;
  end;


  Dm.FDC.StartTransaction;
  try
    Alunos := TAlunos.create;
    try
      Alunos.delete( StrToIntDef( edId.text, 0 ) );

      Dm.FDC.ReleaseClients(rmFetchAll); Dm.FDC.Commit;

      PageControl1.ActivePage := tbConsulta;
      Recarregar;
    finally
      FreeAndNil( Alunos );
    end;
  Except
    on e: Exception do begin
      Dm.FDC.Rollback;
      ShowMessage('Erro ao deletar: '+ e.message);
    end;
  end;
end;

procedure TFrmCad_alunos.BtnGravarClick(Sender: TObject);
begin
  inherited;
  Dm.FDC.StartTransaction;
  try
    Alunos := TAlunos.create;
    try
      Alunos.nome := edNome.text;

      if edId.text = '' then
        Alunos.insert
      else
        Alunos.update( StrToIntDef( edId.text, 0 ) );

      Dm.FDC.ReleaseClients(rmFetchAll); Dm.FDC.Commit;

      ShowMessage('Gravado com sucesso.');
      PageControl1.ActivePage := tbConsulta;
      Recarregar;
    finally
      FreeAndNil( Alunos );
    end;
  Except
    on e: Exception do begin
      Dm.FDC.Rollback;
      ShowMessage('Erro ao inserir: '+ e.message);
    end;
  end;
end;

procedure TFrmCad_alunos.BtnInserirClick(Sender: TObject);
begin
  inherited;
  edId.text   := '';
  edNome.text := '';
end;

end.

unit Cad_notas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cad_padrao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  JvExDBGrids, JvDBGrid, Vcl.ComCtrls, Vcl.StdCtrls, JvExStdCtrls, JvButton,
  JvCtrls, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.Mask, JvExMask, JvToolEdit,
  JvBaseEdits, Vcl.DBCtrls, clsNotas, DmCom;

type
  TFrmCad_notas = class(TFrmCad_padrao)
    FDConsNOME: TStringField;
    FDConsID: TIntegerField;
    FDConsID_ALUNO: TIntegerField;
    FDConsNOTA_01: TBCDField;
    FDConsNOTA_02: TBCDField;
    FDConsNOTA_03: TBCDField;
    FDConsNOTA_04: TBCDField;
    FDAluno: TFDQuery;
    dsAluno: TDataSource;
    Label2: TLabel;
    Label3: TLabel;
    edId: TEdit;
    edNota1: TJvCalcEdit;
    Label4: TLabel;
    edNota2: TJvCalcEdit;
    Label5: TLabel;
    edNota3: TJvCalcEdit;
    Label6: TLabel;
    edNota4: TJvCalcEdit;
    Label7: TLabel;
    FDAlunoID: TIntegerField;
    FDAlunoNOME: TStringField;
    DBAlunos: TDBLookupComboBox;
    Label8: TLabel;
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnEliminarClick(Sender: TObject);
    procedure BtnInserirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCad_notas: TFrmCad_notas;

implementation

var
  Notas : TNotas;

{$R *.dfm}

procedure TFrmCad_notas.BtnAlterarClick(Sender: TObject);
begin
  inherited;
  FdAluno.Close;
  FdAluno.Open;

  edId.text      := FDCons.FieldByName('id'     ).AsString;
  edNota1.Value  := FDCons.FieldByName('nota_01').AsFloat;
  edNota2.Value  := FDCons.FieldByName('nota_02').AsFloat;
  edNota3.Value  := FDCons.FieldByName('nota_03').AsFloat;
  edNota4.Value  := FDCons.FieldByName('nota_04').AsFloat;

  DBAlunos.KeyValue := FDCons.FieldByName('id_aluno').AsInteger;

//  FDAluno.locate('id', FDCons.FieldByName('id_aluno').AsInteger, []);
end;

procedure TFrmCad_notas.BtnEliminarClick(Sender: TObject);
begin
  inherited;
  if Application.MessageBox( 'Deseja realmente eliminar?',
                             'Atenção', mb_YesNo + mb_IconQuestion )=idNo then
  begin
    exit;
  end;


  Dm.FDC.StartTransaction;
  try
    Notas := TNotas.create;
    try
      Notas.delete( StrToIntDef( edId.text, 0 ) );

      Dm.FDC.ReleaseClients(rmFetchAll); Dm.FDC.Commit;

      PageControl1.ActivePage := tbConsulta;
      Recarregar;
    finally
      FreeAndNil( Notas );
    end;
  Except
    on e: Exception do begin
      Dm.FDC.Rollback;
      ShowMessage('Erro ao deletar: '+ e.message);
    end;
  end;
end;

procedure TFrmCad_notas.BtnGravarClick(Sender: TObject);
begin
  inherited;
  Dm.FDC.StartTransaction;
  try
    Notas := TNotas.create;
    try
      Notas.id_aluno := FDAluno.FieldByname('id').AsInteger;
      Notas.nota_01  := edNota1.Value;
      Notas.nota_02  := edNota2.Value;
      Notas.nota_03  := edNota3.Value;
      Notas.nota_04  := edNota4.Value;

      if edId.text = '' then
        Notas.insert
      else
        Notas.update( StrToIntDef( edId.text, 0 ) );

      Dm.FDC.ReleaseClients(rmFetchAll); Dm.FDC.Commit;

      ShowMessage('Gravado com sucesso.');
      PageControl1.ActivePage := tbConsulta;
      Recarregar;
    finally
      FreeAndNil( Notas );
    end;
  Except
    on e: Exception do begin
      Dm.FDC.Rollback;
      ShowMessage('Erro ao inserir: '+ e.message);
    end;
  end;
end;

procedure TFrmCad_notas.BtnInserirClick(Sender: TObject);
begin
  inherited;
  edId.text     := '';

  FdAluno.Close;
  FdAluno.Open;

  edNota1.value := 0;
  edNota2.value := 0;
  edNota3.value := 0;
  edNota4.value := 0;
end;

end.

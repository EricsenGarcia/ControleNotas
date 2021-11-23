unit clsAlunos;

interface

uses FireDAC.Comp.Client, DmCom;

type TAlunos = class
  public
    id    : Integer;
    nome  : String;

    procedure insert;
    procedure update(Pid: Integer);
    procedure delete(Pid: Integer);
end;

implementation

{ TAlunos }

procedure TAlunos.delete(Pid: Integer);
var
  tq : TFDQuery;
begin
  tq := TFDQuery.Create(nil);
  tq.Connection := Dm.FDC;
  tq.sql.clear;
  tq.params.clear;
  tq.sql.add('delete from alunos where id=:id');
  tq.ParamByName('id').Asinteger := Pid;

  tq.ExecSQL;

  tq.close;
  tq.free;
end;

procedure TAlunos.insert;
var
  tq : TFDQuery;
begin
  tq := TFDQuery.Create(nil);
  tq.Connection := Dm.FDC;
  tq.sql.clear;
  tq.params.clear;
  tq.sql.add('Insert into alunos values(                         '+
             '  (select gen_id(GEN_alunos,1) from rdb$database), '+
             '  :nome)                                           ');

  tq.ParamByName('nome').AsString := nome ;

  tq.ExecSQL;

  tq.close;
  tq.free;
end;

procedure TAlunos.update(Pid: Integer);
var
  tq : TFDQuery;
begin
  tq := TFDQuery.Create(nil);
  tq.Connection := Dm.FDC;
  tq.sql.clear;
  tq.params.clear;
  tq.sql.add('update alunos set    '+
             '  nome =:nome        '+
             ' where id  =:id      ');
  tq.ParamByName('id').AsInteger      := Pid;
  tq.ParamByName('nome').AsString     := nome;

  tq.ExecSQL;

  tq.close;
  tq.free;
end;

end.

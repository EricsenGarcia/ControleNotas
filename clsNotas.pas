unit clsNotas;

interface

uses FireDAC.Comp.Client, DmCom;

type TNotas = class
  public
    id        : Integer;
    id_aluno  : Integer;
    nota_01   : Double;
    nota_02   : Double;
    nota_03   : Double;
    nota_04   : Double;


    procedure insert;
    procedure update(Pid: Integer);
    procedure delete(Pid: Integer);
  end;

implementation

{ TNotas }

procedure TNotas.delete(Pid: Integer);
var
  tq : TFDQuery;
begin
  tq := TFDQuery.Create(nil);
  tq.Connection := Dm.FDC;
  tq.sql.clear;
  tq.params.clear;
  tq.sql.add('delete from notas where id=:id');
  tq.ParamByName('id').Asinteger := Pid;

  tq.ExecSQL;

  tq.close;
  tq.free;
end;

procedure TNotas.insert;
var
  tq : TFDQuery;
begin
  tq := TFDQuery.Create(nil);
  tq.Connection := Dm.FDC;
  tq.sql.clear;
  tq.params.clear;
  tq.sql.add('Insert into notas values(                               '+
             '  (select gen_id(GEN_Notas,1) MAIOR from rdb$database), '+
             '  :id_aluno,  '+
             '  :nota_01,   '+
             '  :nota_02,   '+
             '  :nota_03,   '+
             '  :nota_04 )  ');
  tq.ParamByName('id_aluno').AsInteger := id_aluno;
  tq.ParamByName('nota_01').AsFloat    := nota_01 ;
  tq.ParamByName('nota_02').AsFloat    := nota_02 ;
  tq.ParamByName('nota_03').AsFloat    := nota_03 ;
  tq.ParamByName('nota_04').AsFloat    := nota_04 ;

  tq.ExecSQL;

  tq.close;
  tq.free;
end;

procedure TNotas.update(Pid: Integer);
var
  tq : TFDQuery;
begin
  tq := TFDQuery.Create(nil);
  tq.Connection := Dm.FDC;
  tq.sql.clear;
  tq.params.clear;
  tq.sql.add('update notas set        '+
             '  id_aluno =:id_aluno,  '+
             '  nota_01  =:nota_01,   '+
             '  nota_02  =:nota_02,   '+
             '  nota_03  =:nota_03,   '+
             '  nota_04  =:nota_04    '+
             ' where id  =:id         ');
  tq.ParamByName('id').AsInteger       := Pid;
  tq.ParamByName('id_aluno').AsInteger := id_aluno;
  tq.ParamByName('nota_01').AsFloat    := nota_01 ;
  tq.ParamByName('nota_02').AsFloat    := nota_02 ;
  tq.ParamByName('nota_03').AsFloat    := nota_03 ;
  tq.ParamByName('nota_04').AsFloat    := nota_04 ;

  tq.ExecSQL;

  tq.close;
  tq.free;

end;

end.

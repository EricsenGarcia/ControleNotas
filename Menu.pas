unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, JvExStdCtrls, JvButton, JvCtrls, Vcl.ImgList, Vcl.Grids,
  Vcl.DBGrids, JvExDBGrids, JvDBGrid, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Datasnap.DBClient,
  Datasnap.Provider, cad_alunos, Cad_notas;

type
  TFrmMenu = class(TForm)
    Img32: TImageList;
    Panel1: TPanel;
    BtnSair: TJvImgBtn;
    BtnNota: TJvImgBtn;
    BtnAluno: TJvImgBtn;
    Panel3: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    JvDBGrid1: TJvDBGrid;
    Label1: TLabel;
    FDAlunos: TFDQuery;
    DataSetProvider1: TDataSetProvider;
    CdsAlunos: TClientDataSet;
    dsAlunos: TDataSource;
    CdsAlunosID: TIntegerField;
    CdsAlunosID_ALUNO: TIntegerField;
    CdsAlunosNOTA_01: TBCDField;
    CdsAlunosNOTA_02: TBCDField;
    CdsAlunosNOTA_03: TBCDField;
    CdsAlunosNOTA_04: TBCDField;
    CdsAlunosID_1: TIntegerField;
    CdsAlunosNOME: TStringField;
    CdsAlunosMedia: TFloatField;
    CdsAlunosStatus: TStringField;
    procedure BtnSairClick(Sender: TObject);
    procedure BtnAlunoClick(Sender: TObject);
    procedure BtnNotaClick(Sender: TObject);
    procedure CdsAlunosCalcFields(DataSet: TDataSet);
    procedure JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }

    procedure LoadNotas;
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

uses DmCom;

procedure TFrmMenu.BtnAlunoClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCad_alunos, FrmCad_alunos);
  try
    FrmCad_alunos.ShowModal;
  finally
    FreeAndNil( FrmCad_alunos );
  end;

  LoadNotas;
end;

procedure TFrmMenu.BtnNotaClick(Sender: TObject);
begin
  Application.CreateForm(TFrmCad_notas, FrmCad_notas);
  try
    FrmCad_notas.ShowModal;
  finally
    FreeAndNil( FrmCad_notas );
  end;

  LoadNotas;
end;

procedure TFrmMenu.BtnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMenu.CdsAlunosCalcFields(DataSet: TDataSet);
begin
  CdsAlunos.FieldByName('media').Value := (   CdsAlunos.FieldByName('NOTA_01').Value
                                            + CdsAlunos.FieldByName('NOTA_02').Value
                                            + CdsAlunos.FieldByName('NOTA_03').Value
                                            + CdsAlunos.FieldByName('NOTA_04').Value
                                          ) / 4;

  if CdsAlunos.FieldByName('media').Value >= 7 then
    CdsAlunos.FieldByName('Status').Value := 'Aprovado'
  else
    if (CdsAlunos.FieldByName('media').Value < 7)and(CdsAlunos.FieldByName('media').Value >= 5) then
      CdsAlunos.FieldByName('Status').Value := 'Recuperação'
    else
      CdsAlunos.FieldByName('Status').Value := 'Reprovado';
end;

procedure TFrmMenu.FormShow(Sender: TObject);
begin
  LoadNotas;
end;

procedure TFrmMenu.JvDBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  JvDBGrid1.Canvas.Font.Color := clBlack;

  if AnsiUpperCase(Column.FieldName) = 'STATUS' then begin
    if JvDBGrid1.DataSource.DataSet.FieldByName('status').AsString = 'Aprovado' then
      JvDBGrid1.Canvas.Brush.Color    := clMoneyGreen;
    if JvDBGrid1.DataSource.DataSet.FieldByName('status').AsString = 'Recuperação' then
      JvDBGrid1.Canvas.Brush.Color    := clYellow;
    if JvDBGrid1.DataSource.DataSet.FieldByName('status').AsString = 'Reprovado' then
      JvDBGrid1.Canvas.Brush.Color    := clRed;
  end;

  JvDBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFrmMenu.LoadNotas;
begin
  CdsAlunos.Close;
  CdsAlunos.Open;
end;

end.

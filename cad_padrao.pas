unit cad_padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, JvExStdCtrls, JvButton, JvCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.Grids, Vcl.DBGrids, JvExDBGrids, JvDBGrid, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls;

type
  TFrmCad_padrao = class(TForm)
    Panel3: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    Image1: TImage;
    PageControl1: TPageControl;
    TbConsulta: TTabSheet;
    TbCadastro: TTabSheet;
    FDCons: TFDQuery;
    dsCons: TDataSource;
    JvDBGrid1: TJvDBGrid;
    Panel1: TPanel;
    BtnEliminar: TJvImgBtn;
    BtnGravar: TJvImgBtn;
    Panel4: TPanel;
    BtnAlterar: TJvImgBtn;
    BtnInserir: TJvImgBtn;
    BtnCancelar: TJvImgBtn;
    procedure BtnAlunoClick(Sender: TObject);
    procedure BtnInserirClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Recarregar;
  end;

var
  FrmCad_padrao: TFrmCad_padrao;

implementation

uses Menu;

{$R *.dfm}

procedure TFrmCad_padrao.BtnAlunoClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCad_padrao.BtnCancelarClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbConsulta;
end;

procedure TFrmCad_padrao.Recarregar;
begin
  FDCons.Close;
  FDCons.open;
end;

procedure TFrmCad_padrao.BtnAlterarClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbCadastro;
end;

procedure TFrmCad_padrao.BtnInserirClick(Sender: TObject);
begin
  PageControl1.ActivePage := tbCadastro;
end;

procedure TFrmCad_padrao.FormShow(Sender: TObject);
begin
  Recarregar;
end;

end.

unit DmCom;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  IPPeerClient, FireDAC.Phys.TDBXBase, FireDAC.Phys.DataSnap, FireDAC.Comp.UI,
  FireDAC.Phys.IBBase, FireDAC.Phys.FB, Data.DB, FireDAC.Comp.Client;

type
  TDm = class(TDataModule)
    FDC: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysDataSnapDriverLink1: TFDPhysDataSnapDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dm: TDm;

implementation

uses
  Vcl.Forms, Winapi.Windows;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDm.DataModuleCreate(Sender: TObject);
begin
  try
    Dm.FDC.Params.Values['DATABASE'] := ExtractFilePath(Application.ExeName)+'base\banco.fdb';
    Dm.FDC.Connected                 := True;
  except
    on e: exception do begin
      Application.MessageBox( 'Erro ao tentar conectar com base de dados.',
                                'Atenção', mb_ok + mb_IconError );
    end;
  end;
end;

end.

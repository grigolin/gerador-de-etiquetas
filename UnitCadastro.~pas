unit UnitCadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ZDataset, ZConnection, Mask;

type
  TfmrCadastro = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    MemoNome: TMemo;
    Label2: TLabel;
    Label3: TLabel;
    EditSerial: TEdit;
    Button1: TButton;
    Label5: TLabel;
    maskEditData: TMaskEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmrCadastro: TfmrCadastro;

implementation

uses UnitPrincipal;

{$R *.dfm}

procedure TfmrCadastro.Button1Click(Sender: TObject);
var
  FmrPrincipal : TFmrPrincipal;
  Qry : TZQuery;
begin
  FmrPrincipal := TFmrPrincipal.Create(self);

  Qry := TZQuery.Create(self);
  Qry.Connection := FmrPrincipal.Conexao;

  Qry.SQL.Add('INSERT INTO IMPRESSAO (NOME, SERIAL, DATA) VALUES (:nome, :serial, :data);');
  Qry.ParamByName('nome').AsString := MemoNome.Lines.Text;
  Qry.ParamByName('serial').AsString := EditSerial.Text;
  Qry.ParamByName('data').AsString := maskEditData.Text;

  Qry.ExecSQL;

  if Qry.RowsAffected > 0 then
  begin
    ShowMessage('Cadastro concluído com sucesso!');
    fmrCadastro.Close
  end
  else
    ShowMessage('Erro no cadastro!');

    Qry.Close;
end;

procedure TfmrCadastro.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FmrPrincipal.DBGrid1.DataSource.DataSet.Refresh;
end;


end.

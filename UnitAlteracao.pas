unit UnitAlteracao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, ZConnection, ZDataSet;

type
  TFmrAlteracao = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    EditSerialAlteracao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    MemoNomeAlteracao: TMemo;
    Label5: TLabel;
    EditDataAlterar: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmrAlteracao: TFmrAlteracao;

implementation

uses UnitPrincipal, DBGrids, ZAbstractDataset, ZAbstractRODataset;

{$R *.dfm}

procedure TFmrAlteracao.FormShow(Sender: TObject);
var
  id : Integer;
  Qry : TZQuery;
begin
  id := FmrPrincipal.DBGrid1.Fields[0].AsInteger;
  Qry := TZQuery.Create(self);

  with Qry do
  begin
  Connection := FmrPrincipal.Conexao;
  SQl.Clear;
  SQL.Add('SELECT * FROM IMPRESSAO WHERE ID = :id');
  ParamByName('id').AsInteger := id;
  Open;

  if RecordCount > 0 then
  begin
    MemoNomeAlteracao.Lines.Add(FieldByName('NOME').AsString);
    EditSerialAlteracao.Text := FieldByName('SERIAL').AsString;
    EditDataAlterar.Text := fieldbyname('DATA').AsString
  end;

  end;

end;

procedure TFmrAlteracao.Button1Click(Sender: TObject);
var
  id : Integer;
  Qry : TZQuery;
begin
  id := FmrPrincipal.DBGrid1.Fields[0].AsInteger;
  Qry := TZQuery.Create(self);


  if (Trim(MemoNomeAlteracao.Text) <> '') then
  begin
    Qry.Connection := FmrPrincipal.Conexao;

    with Qry do
    begin
      SQL.Clear;
      SQL.Add('UPDATE IMPRESSAO SET NOME = :nome, SERIAL = :serial, DATA = :data WHERE ID = :id;');
      ParamByName('nome').AsString := MemoNomeAlteracao.Lines.Text;
      ParamByName('serial').AsString := EditSerialAlteracao.Text;
      ParamByName('data').AsString := EditDataAlterar.Text;
      ParamByName('id').AsInteger := id;
      ExecSQL;

      if RowsAffected > 0 then
      begin
        ShowMessage('Altera��o realizada com sucesso!');
        FmrAlteracao.Close;

      end
      else
        ShowMessage('Erro na opera��o de altera��o.');

    end;
  end
  else
    ShowMessage('O campo de nome n�o pode estar vazio!');
end;

procedure TFmrAlteracao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FmrPrincipal.DBGrid1.DataSource.DataSet.Refresh;
end;

end.

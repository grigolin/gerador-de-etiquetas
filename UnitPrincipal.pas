unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ZConnection, ToolWin, ActnMan, ActnCtrls, ActnMenus, DB, ZDataset,
  Menus, ZAbstractRODataset, ZAbstractDataset, Grids, DBGrids, StdCtrls,
  Buttons, ExtCtrls, RLReport;

type
  TFmrPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Conexao: TZConnection;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    QrySelectGeral: TZQuery;
    DBGrid2: TDBGrid;
    Panel2: TPanel;
    DSGridEtiquetas: TDataSource;
    QrySelectEtiquetas: TZQuery;
    EditPesquisa: TEdit;
    btnAdicionar: TBitBtn;
    btnRemover: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    BtnImprimir: TBitBtn;
    btnAlterar: TBitBtn;
    btnExcluir: TBitBtn;
    btnCadastrar: TBitBtn;
    CheckBox3: TCheckBox;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    procedure CadastrodeEtiquetas1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AletraodeEtiquetas1Click(Sender: TObject);
    procedure ExclusodeEtiquetas1Click(Sender: TObject);
    procedure ImprimirEtiquetas1Click(Sender: TObject);
    procedure ImprimirEtiquetasIndividuais1Click(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure EditPesquisaChange(Sender: TObject);
    procedure BtnImprimirClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmrPrincipal: TFmrPrincipal;

implementation

uses UnitCadastro, UnitAlteracao, UnitImpressao;

{$R *.dfm}


procedure TFmrPrincipal.CadastrodeEtiquetas1Click(Sender: TObject);
begin
  fmrCadastro.Show;
end;

procedure TFmrPrincipal.FormShow(Sender: TObject);
begin
  QrySelectGeral.Open;
  QrySelectEtiquetas.Open;
end;

procedure TFmrPrincipal.AletraodeEtiquetas1Click(Sender: TObject);
begin
  FmrAlteracao.Show;
end;

procedure TFmrPrincipal.ExclusodeEtiquetas1Click(Sender: TObject);
var
  id : Integer;
  Qry : TZQuery;
  nome : String;
begin
  id := FmrPrincipal.DBGrid1.Fields[0].AsInteger;
  nome := FmrPrincipal.DBGrid1.Fields[1].AsString;

  if Dialogs.MessageDlg('Você tem certeza que deseja deletar o registro com o nome ' + nome + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Qry := TZQuery.Create(self);

    with Qry do
    begin
      Connection := Conexao;

      SQL.Add('DELETE FROM IMPRESSAO WHERE ID = :id;');
      ParamByName('id').AsInteger := id;
      ExecSQL;

      if RowsAffected > 0 then
      begin
        ShowMessage('Deleção conclúida com sucesso!');
        FmrPrincipal.DBGrid1.DataSource.DataSet.Refresh;
      end
      else
        ShowMessage('Erro ao deletar o registro.');
  end;

  end;

end;

procedure TFmrPrincipal.ImprimirEtiquetas1Click(Sender: TObject);
begin
  FmrImpressao.QryRelatorioEtiquetas.SQL.Add('SELECT * FROM IMPRESSAO;');
  FmrImpressao.QryRelatorioEtiquetas.Open;

  if FmrImpressao.QryRelatorioEtiquetas.RecordCount = 0 then
    ShowMessage('Nenhum registro encontrado.')
  else
    FmrImpressao.RelEtiquetas.Preview();

end;

procedure TFmrPrincipal.ImprimirEtiquetasIndividuais1Click(
  Sender: TObject);
begin
    FmrImpressao.QryRelatorioEtiquetas.SQL.Clear;
    FmrImpressao.QryRelatorioEtiquetas.SQL.Add('SELECT * FROM IMPRESSAO WHERE PENDENTE = TRUE;');
    FmrImpressao.QryRelatorioEtiquetas.Open;
    FmrImpressao.RelEtiquetas.Preview();
end;

procedure TFmrPrincipal.btnAdicionarClick(Sender: TObject);
var
  Query : TZQuery;
begin
  Query := TZQuery.Create(self);
  Query.Connection := Conexao;

  with Query do
  begin
    SQL.Clear;
    SQl.Add('UPDATE IMPRESSAO SET PENDENTE = TRUE WHERE ID = :id;');
    ParamByName('id').AsInteger := DBGrid1.Fields[0].AsInteger;
    ExecSQL;
  end;

  DBGrid2.DataSource.DataSet.Refresh;
end;

procedure TFmrPrincipal.btnRemoverClick(Sender: TObject);
var
  Query : TZQuery;
begin
  Query := TZQuery.Create(self);
  Query.Connection := Conexao;

  with Query do
  begin
    SQL.Clear;
    SQL.Add('UPDATE IMPRESSAO SET PENDENTE = FALSE WHERE ID = :id;');
    ParamByName('id').AsInteger := DBGrid2.Fields[0].AsInteger;
    ExecSQL;
  end;

  DBGrid2.DataSource.DataSet.Refresh;
end;

// TODO escolher se quer pesquisar por nome, serial ou data.
procedure TFmrPrincipal.EditPesquisaChange(Sender: TObject);
begin
  if Trim(EditPesquisa.Text) = '' then
  begin
    QrySelectGeral.SQL.Clear;
    QrySelectGeral.SQL.Add('SELECT * FROM IMPRESSAO;');
    QrySelectGeral.Open;
    DBGrid1.DataSource.DataSet.Refresh;
  end
  else
  begin
    QrySelectGeral.SQL.Clear;
    QrySelectGeral.SQL.Add('SELECT * FROM IMPRESSAO WHERE UPPER(NOME) LIKE UPPER(' + QuotedStr('%' + EditPesquisa.Text + '%')+ ')');
    QrySelectGeral.Open;
    DBGrid1.DataSource.DataSet.Refresh;
  end;
end;

procedure TFmrPrincipal.BtnImprimirClick(Sender: TObject);
var
  Qry : TZQuery;
  I : Integer;
begin
    if (FmrPrincipal.CheckBox3.Checked) and (StrToInt(FmrPrincipal.Edit1.Text) > 0) then
    begin
      Qry := TZQuery.Create(Self);
      Qry.Connection := FmrPrincipal.Conexao;
      Qry.SQL.Add('INSERT INTO IMPRESSAO (nome, pendente) VALUES  ( ' + quotedStr('nulo') + ', true);');

      for i := 1 to StrToInt(FmrPrincipal.Edit1.Text) do
      begin
        Qry.ExecSQL;
      end;
      Qry.Close;
    end;
    FmrImpressao.QryRelatorioEtiquetas.SQL.Clear;
    FmrImpressao.QryRelatorioEtiquetas.SQL.Add('SELECT * FROM IMPRESSAO WHERE PENDENTE = TRUE ORDER BY ID DESC;');
    FmrImpressao.QryRelatorioEtiquetas.Open;
    FmrImpressao.RelEtiquetas.Preview();
end;

procedure TFmrPrincipal.btnCadastrarClick(Sender: TObject);
begin
  fmrCadastro.Show;
end;

procedure TFmrPrincipal.btnAlterarClick(Sender: TObject);
begin
  FmrAlteracao.Show;
end;

procedure TFmrPrincipal.btnExcluirClick(Sender: TObject);
var
  id : Integer;
  Qry : TZQuery;
  nome : String;
begin
  id := FmrPrincipal.DBGrid1.Fields[0].AsInteger;
  nome := FmrPrincipal.DBGrid1.Fields[1].AsString;

  if Dialogs.MessageDlg('Tem certeza que quer deletar o produto de nome: ' + nome + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Qry := TZQuery.Create(self);

    with Qry do
    begin
      Connection := Conexao;

      SQL.Add('DELETE FROM IMPRESSAO WHERE ID = :id;');
      ParamByName('id').AsInteger := id;
      ExecSQL;

      if RowsAffected > 0 then
      begin
        ShowMessage('Remoção conclúida com sucesso!');
        FmrPrincipal.DBGrid1.DataSource.DataSet.Refresh;
      end
      else
        ShowMessage('Erro ao deletar o registro.');
  end;

  end;

end;



procedure TFmrPrincipal.CheckBox3Click(Sender: TObject);
begin
  if FmrPrincipal.CheckBox3.Checked then
  begin
    FmrPrincipal.Panel1.Visible := true;
  end
  else
    FmrPrincipal.Panel1.Visible := false;
end;

procedure TFmrPrincipal.Button1Click(Sender: TObject);
var
  valorAtual : Integer;
begin
  valorAtual := StrToInt(Edit1.Text);

  Edit1.Text := IntToStr(valorAtual + 1);
end;

procedure TFmrPrincipal.Button2Click(Sender: TObject);
var
  valorAtual : Integer;
begin
  valorAtual := StrToInt(Edit1.Text);
  Edit1.Text := IntToStr(valorAtual - 1);
end;



end.

unit UnitImpressao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  RLBarcode;

type
  TFmrImpressao = class(TForm)
    QryRelatorioEtiquetas: TZQuery;
    RelEtiquetas: TRLReport;
    DSEtiquetas: TDataSource;
    RLDetailGrid1: TRLDetailGrid;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDraw1: TRLDraw;
    RLDBText3: TRLDBText;
    RLDBBarcode1: TRLDBBarcode;
    RLPanel1: TRLPanel;
    RLBand1: TRLBand;
    RLImage2: TRLImage;
    procedure RLPanel1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand1AfterPrint(Sender: TObject);
    procedure RelEtiquetasBeforePrint(Sender: TObject;
      var PrintIt: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FmrImpressao: TFmrImpressao;

  implementation

uses UnitPrincipal;

{$R *.dfm}


procedure TFmrImpressao.RLPanel1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  teste : boolean;
begin
  teste := (RLDBText1.DataSet.FieldValues['nome'] = 'nulo') and
           (RLDBText2.DataSet.FieldValues['serial'] = null) and
           (RLDBText3.DataSet.FieldValues['data'] = null);

  if teste then
  begin
    RLImage2.Visible := False;
    RLDraw1.Pen.Color := clWhite;
    RLDBText1.Color := clWhite;
    RLDBText1.Font.Color := clWhite;
  end
  else
  begin
    RLDraw1.Pen.Color := clMenuHighlight;
    RLDBText1.Color := clMenuHighlight;
    RLDBText1.Font.Color := clBlack;

    if FmrPrincipal.CheckBox1.Checked then
      RLImage2.Visible := True;
  end;
end;


procedure TFmrImpressao.RLBand1AfterPrint(Sender: TObject);
var
  Qry : TZQuery;
begin
  Qry := TZQuery.Create(self);
  Qry.Connection := FmrPrincipal.Conexao;
  Qry.SQl.Clear;
  Qry.SQL.Add('DELETE FROM IMPRESSAO WHERE NOME = ' + quotedStr('nulo') + ' AND SERIAL IS NULL AND DATA IS NULL AND CODIGOBARRA IS NULL;');
  Qry.ExecSQL;
  Qry.Close;
  FmrPrincipal.CheckBox3.Checked := false;
  FmrPrincipal.Edit1.Text := '0';
end;


procedure TFmrImpressao.RelEtiquetasBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if FmrPrincipal.CheckBox1.Checked then
  begin
      if FileExists('C:\Users\Terminal_6\Downloads\ImpressaoEtiquetas\ImpressaoEtiquetas\logo_infosis.jpg') then
      begin
          RLDBText1.Visible := False;
          RLImage2.Visible := True;
          RLImage2.Picture.LoadFromFile('C:\Users\Terminal_6\Downloads\ImpressaoEtiquetas\ImpressaoEtiquetas\logo_infosis.jpg');
      end;
  end
  else
  begin
    RLDBText1.Visible := true;
    RLImage2.Visible := false;
  end;
end;
end.

program ProjetoEtiquetas;

uses
  Forms,
  UnitPrincipal in 'UnitPrincipal.pas' {FmrPrincipal},
  UnitCadastro in 'UnitCadastro.pas' {fmrCadastro},
  UnitAlteracao in 'UnitAlteracao.pas' {FmrAlteracao},
  UnitImpressao in 'UnitImpressao.pas' {FmrImpressao};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmrPrincipal, FmrPrincipal);
  Application.CreateForm(TfmrCadastro, fmrCadastro);
  Application.CreateForm(TFmrAlteracao, FmrAlteracao);
  Application.CreateForm(TFmrImpressao, FmrImpressao);
  Application.Run;
end.

unit Base;

interface

uses Boleto;

type
  IGeraBoletoBuilder = interface
    function FormataCampos: IGeraBoletoBuilder;
    function ValidaDados: IGeraBoletoBuilder;
    function FormataNossoNumero: IGeraBoletoBuilder;
    function FormataCampoLivre: IGeraBoletoBuilder;
    function FormataLinhaDigitavel: IGeraBoletoBuilder;
    function FormataCodigoBarras: IGeraBoletoBuilder;
    procedure Criar;
  end;

  IFormataNossoNumero = interface
    ['{0AE09CA6-EE68-4985-9931-43A9B7ED4C18}']
    procedure Formata(ABoleto: IBoleto);
  end;

implementation

end.

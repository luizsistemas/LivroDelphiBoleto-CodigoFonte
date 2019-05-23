unit GeraBoleto.Factories;

interface

uses
  SysUtils, GeraBoleto.Boleto, GeraBoleto.Base, GeraBoleto.Funcoes;

type
  TFactoryBoleto = class
  public
    class function GetFormatter(ABoleto: IBoleto): IFormatacao;
  end;

implementation


uses
  GeraBoleto.Banco001, Vcl.Forms;

{ TBoletoFactory }

class function TFactoryBoleto.GetFormatter(ABoleto: IBoleto): IFormatacao;
begin
  if not IsNumber(ABoleto.GetConta.Banco.Numero) then
    raise Exception.Create('Número do Banco inválido: ' + ABoleto.GetConta.Banco.Numero);

  case ABoleto.GetConta.Banco.Numero.ToInteger of
    1: Result := TFormata001.Create(ABoleto);
  else
    raise Exception.Create('Banco não implementado!');
  end;
end;

end.

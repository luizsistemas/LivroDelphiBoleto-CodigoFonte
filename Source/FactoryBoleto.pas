unit FactoryBoleto;

interface

uses
  SysUtils, Boleto, Base, Funcoes;

type
  TFactoryBoleto = class
  public
    class function GetFormatter(ABoleto: IBoleto): IGeraBoletoBuilder;
  end;

implementation


uses
  Boleto001, Vcl.Forms;

{ TBoletoFactory }

class function TFactoryBoleto.GetFormatter(ABoleto: IBoleto): IGeraBoletoBuilder;
begin
  if not IsNumber(ABoleto.GetConta.Banco.Numero) then
    raise Exception.Create('N�mero do Banco inv�lido: ' + ABoleto.GetConta.Banco.Numero);

  case ABoleto.GetConta.Banco.Numero.ToInteger of
    1: Result := TFormata001.Create(ABoleto);
  else
    raise Exception.Create('Banco n�o implementado!');
  end;
end;

end.

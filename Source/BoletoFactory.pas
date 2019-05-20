unit BoletoFactory;

interface

uses
  SysUtils, Boleto, Base;

type
  TBoletoFactory = class
  public
    class function GetFormatter(ABoleto: IBoleto): IGeraBoletoBuilder;
  end;

implementation


uses
  Boleto001;

{ TBoletoFactory }

class function TBoletoFactory.GetFormatter(ABoleto: IBoleto): IGeraBoletoBuilder;
begin
  case ABoleto.GetConta.Banco.Numero.Trim.ToInteger of
    1: Result := TBBFormata.Create(ABoleto);
  end;
end;

end.

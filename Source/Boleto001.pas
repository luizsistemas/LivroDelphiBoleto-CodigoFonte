unit Boleto001;

interface

uses Boleto, Pessoa, Conta, Titulo, Base;

const
  NUM_BANCO = '001';
  DIGITO_NUM = '9';

type
  TBoleto001 = class(TBoleto)
  private
    procedure Validar; override;
    procedure Formatar; override;
  end;

  TFactoryBBFormataNossoNumero = class
  public
    class function GetFormata(AConvenio: string): IFormataNossoNumero;
  end;

  TBBConvenio4 = class(TInterfacedObject, IFormataNossoNumero)
  public
    procedure Formata(ABoleto: IBoleto);
  end;

  TBBConvenio6 = class(TInterfacedObject, IFormataNossoNumero)
  public
    procedure Formata(ABoleto: IBoleto);
  end;

  TBBConvenio7 = class(TInterfacedObject, IFormataNossoNumero)
  public
    procedure Formata(ABoleto: IBoleto);
  end;

implementation

uses
  System.SysUtils, Funcoes;

{ TBoleto001 }

procedure TBoleto001.Validar;
begin
  if FConta.Banco.Numero <> NUM_BANCO then
    raise Exception.Create('N�mero do Banco inv�lido!');
  if FConta.Banco.DigitoNumero <> DIGITO_NUM then
    raise Exception.Create('D�gito do N�mero do Banco inv�lido!');
  if FConta.DigitoAgencia.Length > 1 then
    raise Exception.Create('D�gito da Ag�ncia inv�lido!');
  if not IsNumber( FConta.Conta ) then
    raise Exception.Create('N�mero da Conta inv�lido!');
  if FConta.DigitoConta.Length > 1 then
    raise Exception.Create('D�gito da Conta inv�lido!');
end;

procedure TBoleto001.Formatar;
begin
  FConta.Agencia := LeftPad(FConta.Agencia, 4);
  FConta.Conta := LeftPad(FConta.Conta, 8);
end;

{ TFactoryBBFormataNossoNumero }

class function TFactoryBBFormataNossoNumero.GetFormata(AConvenio: string): IFormataNossoNumero;
begin
  case AConvenio.Length of
    4: Result := TBBConvenio4.Create;
    6: Result := TBBConvenio6.Create;
    7: Result := TBBConvenio7.Create;
  else
    raise Exception.Create('Formato do Conv�nio n�o definido!');
  end;
end;

{ TBBConvenio4 }

procedure TBBConvenio4.Formata(ABoleto: IBoleto);
begin

end;

{ TBBConvenio6 }

procedure TBBConvenio6.Formata(ABoleto: IBoleto);
begin

end;

{ TBBConvenio7 }

procedure TBBConvenio7.Formata(ABoleto: IBoleto);
begin

end;

end.

unit Boleto001;

interface

uses Boleto, Pessoa, Conta, Titulo, Base;

const
  NUM_BANCO = '001';
  DIGITO_NUM = '9';

type
  TBBFormata = class(TInterfacedObject, IGeraBoletoBuilder)
  private
    FBoleto: IBoleto;
  public
    constructor Create(ABoleto: IBoleto);
    function FormataCampos: IGeraBoletoBuilder;
    function ValidaDados: IGeraBoletoBuilder;
    function FormataNossoNumero: IGeraBoletoBuilder;
    function FormataCampoLivre: IGeraBoletoBuilder;
    function FormataLinhaDigitavel: IGeraBoletoBuilder;
    function FormataCodigoBarras: IGeraBoletoBuilder;
    procedure Criar;
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

{ TBBFormata }

constructor TBBFormata.Create(ABoleto: IBoleto);
begin
  FBoleto := ABoleto;
end;

procedure TBBFormata.Criar;
begin

end;

function TBBFormata.FormataCampoLivre: IGeraBoletoBuilder;
begin
  Result := Self;
end;

function TBBFormata.FormataCampos: IGeraBoletoBuilder;
begin
  FBoleto.GetConta.Agencia := LeftPad(FBoleto.GetConta.Agencia, 4);
  FBoleto.GetConta.Conta := LeftPad(FBoleto.GetConta.Conta, 8);
  Result := Self;
end;

function TBBFormata.FormataCodigoBarras: IGeraBoletoBuilder;
begin
  Result := Self;
end;

function TBBFormata.FormataLinhaDigitavel: IGeraBoletoBuilder;
begin
  Result := Self;
end;

function TBBFormata.FormataNossoNumero: IGeraBoletoBuilder;
begin
  Result := Self;
end;

function TBBFormata.ValidaDados: IGeraBoletoBuilder;
begin
  if FBoleto.GetConta.Banco.Numero <> NUM_BANCO then
    raise Exception.Create('N�mero do Banco inv�lido!');
  if FBoleto.GetConta.Banco.DigitoNumero <> DIGITO_NUM then
    raise Exception.Create('D�gito do N�mero do Banco inv�lido!');
  if FBoleto.GetConta.DigitoAgencia.Length > 1 then
    raise Exception.Create('D�gito da Ag�ncia inv�lido!');
  if not IsNumber( FBoleto.GetConta.Conta ) then
    raise Exception.Create('N�mero da Conta inv�lido!');
  if FBoleto.GetConta.DigitoConta.Length > 1 then
    raise Exception.Create('D�gito da Conta inv�lido!');
  Result := Self;
end;

end.

unit Boleto001;

interface

uses Boleto, Pessoa, Conta, Titulo, Base;

const
  NUM_BANCO = '001';
  DIGITO_NUM = '9';

type
  TBoleto001 = class(TInterfacedObject, IBoleto)
  private
    FBeneficiario: IPessoa;
    FConta: IConta;
    FTitulo: ITitulo;
    FPagador: IPessoa;
    procedure Validar;
    procedure Formatar;
  public
    constructor Create(ABeneficiario: IPessoa; AConta: IConta; ATitulo: ITitulo; APagador: IPessoa);
    function GetBeneficiario: IPessoa;
    function GetConta: IConta;
    function GetPagador: IPessoa;
    function GetTitulo: ITitulo;
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

constructor TBoleto001.Create(ABeneficiario: IPessoa; AConta: IConta; ATitulo: ITitulo;
  APagador: IPessoa);
begin
  FBeneficiario := ABeneficiario;
  FConta := AConta;
  FTitulo := ATitulo;
  FPagador := APagador;
  Formatar;
  Validar;
end;

procedure TBoleto001.Validar;
begin
  if FConta.Banco.Numero <> NUM_BANCO then
    raise Exception.Create('Número do Banco inválido!');
  if FConta.Banco.DigitoNumero <> DIGITO_NUM then
    raise Exception.Create('Dígito do Número do Banco inválido!');
  if FConta.DigitoAgencia.Length > 1 then
    raise Exception.Create('Dígito da Agência inválido!');
  if not IsNumber( FConta.Conta ) then
    raise Exception.Create('Número da Conta inválido!');
  if FConta.DigitoConta.Length > 1 then
    raise Exception.Create('Dígito da Conta inválido!');
end;

procedure TBoleto001.Formatar;
begin
  FConta.Agencia := LeftPad(FConta.Agencia, 4);
  FConta.Conta := LeftPad(FConta.Conta, 8);
end;

function TBoleto001.GetBeneficiario: IPessoa;
begin
  Result := FBeneficiario;
end;

function TBoleto001.GetConta: IConta;
begin
  Result := FConta;
end;

function TBoleto001.GetPagador: IPessoa;
begin
  Result := FPagador;
end;

function TBoleto001.GetTitulo: ITitulo;
begin
  Result := FTitulo;
end;

{ TFactoryBBFormataNossoNumero }

class function TFactoryBBFormataNossoNumero.GetFormata(AConvenio: string): IFormataNossoNumero;
begin
  case AConvenio.Length of
    4: Result := TBBConvenio4.Create;
    6: Result := TBBConvenio6.Create;
    7: Result := TBBConvenio7.Create;
  else
    raise Exception.Create('Formato do Convênio não definido!');
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

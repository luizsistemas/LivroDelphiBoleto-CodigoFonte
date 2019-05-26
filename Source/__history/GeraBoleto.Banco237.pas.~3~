unit GeraBoleto.Banco237;

interface

uses GeraBoleto.Boleto, GeraBoleto.Base;

const
  DIGITO_NUM = '9';

type
  TFormata237 = class(TInterfacedObject, IFormatacao)
  private
    FBoleto: IBoleto;
  public
    constructor Create(ABoleto: IBoleto);
    procedure FormataCamposConta;
    procedure ValidaDados;
    procedure FormataCampoLivre;
  end;

implementation

uses
  System.SysUtils, GeraBoleto.Funcoes;

{ TFormata237 }

constructor TFormata237.Create(ABoleto: IBoleto);
begin
  FBoleto := ABoleto;
end;

procedure TFormata237.FormataCampoLivre;
begin
  FBoleto.GetTitulo.NossoNum := LeftPad(FBoleto.GetConta.SeqNossoNumero.ToString, 11);

  FBoleto.SetCampoLivre( FBoleto.GetConta.Agencia +  FBoleto.GetConta.Carteira +
    FBoleto.GetTitulo.NossoNum + FBoleto.GetConta.Conta + '0');
end;

procedure TFormata237.FormataCamposConta;
begin
  FBoleto.GetConta.Agencia := LeftPad(FBoleto.GetConta.Agencia, 4);
  FBoleto.GetConta.Conta := LeftPad(FBoleto.GetConta.Conta, 7);
end;

procedure TFormata237.ValidaDados;
begin
  if FBoleto.GetConta.Banco.DigitoNumero <> DIGITO_NUM then
    raise Exception.Create('Dígito do Número do Banco inválido!');
  if not IsNumber( FBoleto.GetConta.Conta ) then
    raise Exception.Create('Número da Conta inválido!');
end;

end.

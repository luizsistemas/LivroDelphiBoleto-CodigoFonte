unit TestGeraBoletoBuilder;

interface

uses
  TestFramework, GeraBoleto.Boleto, SysUtils;

type
  TestTGeraBoletoBuilder = class(TTestCase)
  strict private
    FBoleto: IBoleto;
  private
    procedure SetDadosPadrao;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestValidaCodigoBarras;
    procedure TestFormataLinhaDigitavel;
  end;

implementation

{ TestTGeralBoletoBuilder }

uses
  GeraBoleto.Conta, GeraBoleto.Titulo;

procedure TestTGeraBoletoBuilder.SetUp;
begin
  FBoleto := TBoleto.Create;
  SetDadosPadrao;
end;

procedure TestTGeraBoletoBuilder.TearDown;
begin
end;

procedure TestTGeraBoletoBuilder.SetDadosPadrao;
var
  Conta: TConta;
  Titulo: TTitulo;
begin
  Conta := FBoleto.GetConta;
  Conta.Banco.Numero := '001';
  Conta.Banco.DigitoNumero := '9';
  Conta.Agencia := '9999';
  Conta.DigitoAgencia := '9';
  Conta.Conta := '123456';
  Conta.DigitoConta := '1';
  Conta.Convenio := '1234567';
  Conta.SeqNossoNumero := 1;
  Conta.Carteira := '17';

  Titulo := FBoleto.GetTitulo;
  Titulo.Emissao := StrToDate('1/1/2019');
  Titulo.Vencto :=  StrToDate('30/05/2019');
  Titulo.EspecMoeda := '9';
  Titulo.EspecDoc := 'DM';
  Titulo.Aceite := 'N';
  Titulo.DataProc := StrToDate('1/1/2019');
  Titulo.Valor := 300.00;
end;

procedure TestTGeraBoletoBuilder.TestValidaCodigoBarras;
begin
  FBoleto.Gerar;
  CheckEquals('00196790500000300000000001234567000000000117',
    FBoleto.GetCodigoBarras, 'Código de Barras inválido!');
end;

procedure TestTGeraBoletoBuilder.TestFormataLinhaDigitavel;
begin
  FBoleto.Gerar;
  CheckEquals('00190.00009 01234.567004 00000.001172 6 79050000030000',
    FBoleto.GetLinhaDigitavel, 'Linha Digitável inválida!');
end;

initialization
  RegisterTest(TestTGeraBoletoBuilder.Suite);
end.

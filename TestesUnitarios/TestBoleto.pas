unit TestBoleto;

interface

uses
  TestFramework, GeraBoleto.Boleto;

type
  TestTBoleto = class(TTestCase)
  strict private
    FBoleto: IBoleto;

    procedure SetDadosPadrao;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
      procedure TestNumeroDoBancoComEspacos;
      procedure TestDigitoDoNumeroDoBancoComEspacos;
      procedure TestNumeroDoBancoEhValido;
      procedure TestNumeroDaContaComCarectereInvalido;
  end;

implementation

uses
  System.SysUtils, GeraBoleto.Conta, GeraBoleto.Titulo;

procedure TestTBoleto.SetDadosPadrao;
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
  Conta.Convenio := '1234';
  Conta.Carteira := '17';

  Titulo := FBoleto.GetTitulo;
  Titulo.Vencto := StrToDate('30/05/2019');
  Titulo.Valor := 300.00;
end;

procedure TestTBoleto.SetUp;
begin
  FBoleto := TBoleto.Create;
  SetDadosPadrao;
end;

procedure TestTBoleto.TearDown;
begin
  //
end;

procedure TestTBoleto.TestNumeroDoBancoComEspacos;
begin
  FBoleto.GetConta.Banco.Numero := ' 001 ';
  CheckEquals('001', FBoleto.GetConta.Banco.Numero, 'Número do banco inválido!');
end;

procedure TestTBoleto.TestNumeroDoBancoEhValido;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.Banco.Numero := 'a001';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exceção gerada quando número do banco contém letras ou símbolos');
end;

procedure TestTBoleto.TestDigitoDoNumeroDoBancoComEspacos;
begin
  FBoleto.GetConta.Banco.DigitoNumero := ' 9 ';
  CheckEquals('9', FBoleto.GetConta.Banco.DigitoNumero , 'Dígito do Número do banco inválido!');
end;


procedure TestTBoleto.TestNumeroDaContaComCarectereInvalido;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.Conta := 'a123';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exceção gerada quando informado caractere inválido na conta');
end;


initialization
  RegisterTest(TestTBoleto.Suite);
end.


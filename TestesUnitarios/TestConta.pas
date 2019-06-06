unit TestConta;

interface

uses
  TestFramework, GeraBoleto.Conta, GeraBoleto.Banco, SysUtils;

type
  TestTConta = class(TTestCase)
  strict private
    FConta: TConta;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestNumeroDaAgenciaComEspacos;
    procedure TestNumeroDaAgenciaComCaracteresInvalidos;
    procedure TestNumeroDaContaComEspacos;
    procedure TestDigitoDoNumeroDaContaComEspacos;
    procedure TestNumeroDaContaComCaracteresInvalidos;
  end;

implementation

procedure TestTConta.SetUp;
begin
  FConta := TConta.Create;
end;

procedure TestTConta.TearDown;
begin
  FConta.Free;
  FConta := nil;
end;

procedure TestTConta.TestDigitoDoNumeroDaContaComEspacos;
begin
  FConta.DigitoConta := ' 9 ';
  CheckEquals('9', FConta.DigitoConta , 'Dígito do Número da conta inválido!');
end;

procedure TestTConta.TestNumeroDaAgenciaComCaracteresInvalidos;
begin
  StartExpectingException(exception);
  FConta.Agencia := '#895';
  StopExpectingException('Nenhuma exceção gerada quando número da agência contém letras ou símbolos');
end;

procedure TestTConta.TestNumeroDaAgenciaComEspacos;
begin
  FConta.Agencia := ' 0895 ';
  CheckEquals('0895', FConta.Agencia, 'Número da agência inválido!');
end;

procedure TestTConta.TestNumeroDaContaComCaracteresInvalidos;
begin
  StartExpectingException(exception);
  FConta.Conta := '.123456';
  StopExpectingException('Nenhuma exceção gerada quando número da conta contém letras ou símbolos');
end;

procedure TestTConta.TestNumeroDaContaComEspacos;
begin
  FConta.Conta := ' 12345 ';
  CheckEquals('12345', FConta.Conta, 'Número da conta inválido!');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTConta.Suite);
end.


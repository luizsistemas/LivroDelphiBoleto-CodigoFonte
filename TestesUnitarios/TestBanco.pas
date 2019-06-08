unit TestBanco;

interface

uses
  TestFramework, GeraBoleto.Banco;

type
  TestTBanco = class(TTestCase)
  strict private
    FBanco: TBanco;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestNumeroDoBancoComEspacos;
    procedure TestDigitoDoNumeroDoBancoComEspacos;
    procedure TestNumeroDoBancoComCaracteresInvalidos;
  end;

implementation

uses
  System.SysUtils;

procedure TestTBanco.SetUp;
begin
  FBanco := TBanco.Create;
end;

procedure TestTBanco.TearDown;
begin
  FBanco.Free;
  FBanco := nil;
end;

procedure TestTBanco.TestDigitoDoNumeroDoBancoComEspacos;
begin
  FBanco.DigitoNumero := ' 9 ';
  CheckEquals('9', FBanco.DigitoNumero , 'D�gito do N�mero do banco inv�lido!');
end;

procedure TestTBanco.TestNumeroDoBancoComCaracteresInvalidos;
begin
  StartExpectingException(Exception);
  FBanco.Numero := 'a001';
  StopExpectingException('Nenhuma exce��o gerada quando n�mero do banco cont�m letras ou s�mbolos');
end;

procedure TestTBanco.TestNumeroDoBancoComEspacos;
begin
  FBanco.Numero := ' 001 ';  //n�mero com espa�os em branco
  CheckEquals('001', FBanco.Numero, 'N�mero do banco inv�lido!');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTBanco.Suite);
end.


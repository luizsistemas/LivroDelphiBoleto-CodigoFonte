unit TestBoleto;

interface

uses
  TestFramework, GeraBoleto.Boleto;

type
  TestTBoleto = class(TTestCase)
  strict private
    FBoleto: IBoleto;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
      procedure TestNumeroDoBancoComEspacos;
      procedure TestDigitoDoNumeroDoBancoComEspacos;
      procedure TestNumeroDoBancoEhValido;
  end;

implementation

uses
  System.SysUtils, GeraBoleto.Conta, GeraBoleto.Titulo;

procedure TestTBoleto.SetUp;
begin
  FBoleto := TBoleto.Create;
end;

procedure TestTBoleto.TearDown;
begin
  //
end;

procedure TestTBoleto.TestNumeroDoBancoComEspacos;
begin
  FBoleto.GetConta.Banco.Numero := ' 001 ';
  CheckEquals('001', FBoleto.GetConta.Banco.Numero, 'N�mero do banco inv�lido!');
end;

procedure TestTBoleto.TestNumeroDoBancoEhValido;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.Banco.Numero := 'a001';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exce��o gerada quando n�mero do banco cont�m letras ou s�mbolos');
end;

procedure TestTBoleto.TestDigitoDoNumeroDoBancoComEspacos;
begin
  FBoleto.GetConta.Banco.DigitoNumero := ' 9 ';
  CheckEquals('9', FBoleto.GetConta.Banco.DigitoNumero , 'D�gito do N�mero do banco inv�lido!');
end;

initialization
  RegisterTest(TestTBoleto.Suite);
end.


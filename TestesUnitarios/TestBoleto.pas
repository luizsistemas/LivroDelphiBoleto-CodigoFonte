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

initialization
  RegisterTest(TestTBoleto.Suite);
end.


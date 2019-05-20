unit TestBoleto001;

interface

uses
  TestFramework, Boleto001, Conta, Boleto, Titulo, Pessoa;

type
  TestTBoleto001 = class(TTestCase)
  strict private
    FBoleto001: IBoleto;

    procedure SetDadosPadrao;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestVerificaQtdeCaracteresDoNumeroDoBanco;
    procedure TestValidaSeNumeroCorrespondeAoBancoDoBrasil;
    procedure TestDigitoDoNumeroDoBancoComEspacos;
    procedure TestDigitoDoNumeroDoBancoInvalido;
    procedure TestFormatacaoDoNumeroDaAgencia;
    procedure TestDigitoAgencia;
    procedure TestDigitoAgenciaMaiorQueUmDigito;
    procedure TestFormatacaoDoNumeroDaConta;
    procedure TestNumeroDaContaComCarectereInvalido;
    procedure TestDigitoDaConta;
    procedure TestDigitoDaContaMaiorQueUmDigito;
  end;

implementation

uses
  System.SysUtils;

procedure TestTBoleto001.SetDadosPadrao;
begin
  //Conta
  FBoleto001.GetConta.Banco.Numero := '001';
  FBoleto001.GetConta.Banco.DigitoNumero := '9';
  FBoleto001.GetConta.Agencia := '9999';
  FBoleto001.GetConta.DigitoAgencia := '9';
  FBoleto001.GetConta.Conta := '123456';
  FBoleto001.GetConta.DigitoConta := '1';
  //Beneficiario
  FBoleto001.GetBeneficiario.CnpjCpf := '12345678901';
  FBoleto001.GetBeneficiario.Nome := 'Teste Beneficiario';
  //Titulo
  FBoleto001.GetTitulo.Emissao := StrToDate('1/1/2019');
  FBoleto001.GetTitulo.Vencto :=  StrToDate('30/05/2019');
  FBoleto001.GetTitulo.EspecMoeda := '9';
  FBoleto001.GetTitulo.EspecDoc := 'DM';
  FBoleto001.GetTitulo.Aceite := 'N';
  FBoleto001.GetTitulo.DataProc := StrToDate('1/1/2019');
  FBoleto001.GetTitulo.Valor := 300.00;
  //Pagador
  FBoleto001.GetPagador.CnpjCpf := '12345678901';
  FBoleto001.GetPagador.Nome := 'Teste Pagador';
  FBoleto001.GetPagador.Endereco.Logradouro := 'Rua Teste 01';
  FBoleto001.GetPagador.Endereco.Numero := '23';
  FBoleto001.GetPagador.Endereco.Bairro := 'Centro';
  FBoleto001.GetPagador.Endereco.Cidade := 'Balsas';
  FBoleto001.GetPagador.Endereco.Uf := 'MA';
end;

procedure TestTBoleto001.SetUp;
begin
  FBoleto001 := TBoleto001.Create;
  SetDadosPadrao;
end;

procedure TestTBoleto001.TearDown;
begin
  //
end;

procedure TestTBoleto001.TestDigitoAgencia;
begin
  FBoleto001.GetConta.DigitoAgencia := ' 1';
  CheckEquals('1', FBoleto001.GetConta.DigitoAgencia, 'Dídigo agência inválido');
end;

procedure TestTBoleto001.TestDigitoAgenciaMaiorQueUmDigito;
begin
  StartExpectingException(exception);
  FBoleto001.GetConta.DigitoAgencia := '14';
  FBoleto001.GeraBoleto;
  StopExpectingException('Nenhuma exceção gerada quando informado dígito da agência maior que um dígito');
end;

procedure TestTBoleto001.TestDigitoDaConta;
begin
  FBoleto001.GetConta.DigitoConta := ' 1     ';
  CheckEquals('1', FBoleto001.GetConta.DigitoConta, 'Dídigo da conta inválido');
end;

procedure TestTBoleto001.TestDigitoDaContaMaiorQueUmDigito;
begin
  StartExpectingException(exception);
  FBoleto001.GetConta.DigitoConta := '18';
  FBoleto001.GeraBoleto;
  StopExpectingException('Nenhuma exceção gerada quando informado dígito da conta maior que um dígito');
end;

procedure TestTBoleto001.TestDigitoDoNumeroDoBancoComEspacos;
begin
  FBoleto001.GetConta.Banco.DigitoNumero := ' 9 ';
  CheckTrue(FBoleto001.GetConta.Banco.DigitoNumero = '9', 'Dígito do Número do banco inválido!');
end;

procedure TestTBoleto001.TestDigitoDoNumeroDoBancoInvalido;
begin
  StartExpectingException(exception);
  FBoleto001.GetConta.Banco.DigitoNumero := '8';
  FBoleto001.GeraBoleto;
  StopExpectingException('Nenhuma exceção gerada quando informado dígito do número do banco inválido');
end;

procedure TestTBoleto001.TestFormatacaoDoNumeroDaAgencia;
begin
  FBoleto001.GetConta.Agencia := '123';
  FBoleto001.GeraBoleto;
  CheckEquals('0123', FBoleto001.GetConta.Agencia, 'Agência com formato inválido!');
end;

procedure TestTBoleto001.TestFormatacaoDoNumeroDaConta;
begin
  FBoleto001.GetConta.Conta := '12345';
  FBoleto001.GeraBoleto;
  CheckEquals('00012345', FBoleto001.GetConta.Conta, 'Formatação do número da conta inválido');
end;

procedure TestTBoleto001.TestNumeroDaContaComCarectereInvalido;
begin
  StartExpectingException(exception);
  FBoleto001.GetConta.Conta := 'a123';
  FBoleto001.GeraBoleto;
  StopExpectingException('Nenhuma exceção gerada quando informado caractere inválido na conta');
end;

procedure TestTBoleto001.TestValidaSeNumeroCorrespondeAoBancoDoBrasil;
begin
  StartExpectingException(exception);
  FBoleto001.GetConta.Banco.Numero := '237'; // número do Bradesco
  FBoleto001.GeraBoleto;
  StopExpectingException('Nenhuma exceção gerada quando Número do Banco inválido');
end;

procedure TestTBoleto001.TestVerificaQtdeCaracteresDoNumeroDoBanco;
begin
  FBoleto001.GetConta.Banco.Numero := ' 001 ';
  CheckTrue(FBoleto001.GetConta.Banco.Numero = '001', 'Número do banco inválido!');
end;

initialization
  RegisterTest(TestTBoleto001.Suite);
end.


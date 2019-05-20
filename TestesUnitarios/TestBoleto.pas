unit TestBoleto;

interface

uses
  TestFramework, Conta, Boleto, Titulo, Pessoa;

type
  TestTBoleto = class(TTestCase)
  strict private
    FBoleto: IBoleto;

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

procedure TestTBoleto.SetDadosPadrao;
begin
  //Conta
  FBoleto.GetConta.Banco.Numero := '001';
  FBoleto.GetConta.Banco.DigitoNumero := '9';
  FBoleto.GetConta.Agencia := '9999';
  FBoleto.GetConta.DigitoAgencia := '9';
  FBoleto.GetConta.Conta := '123456';
  FBoleto.GetConta.DigitoConta := '1';
  //Beneficiario
  FBoleto.GetBeneficiario.CnpjCpf := '12345678901';
  FBoleto.GetBeneficiario.Nome := 'Teste Beneficiario';
  //Titulo
  FBoleto.GetTitulo.Emissao := StrToDate('1/1/2019');
  FBoleto.GetTitulo.Vencto :=  StrToDate('30/05/2019');
  FBoleto.GetTitulo.EspecMoeda := '9';
  FBoleto.GetTitulo.EspecDoc := 'DM';
  FBoleto.GetTitulo.Aceite := 'N';
  FBoleto.GetTitulo.DataProc := StrToDate('1/1/2019');
  FBoleto.GetTitulo.Valor := 300.00;
  //Pagador
  FBoleto.GetPagador.CnpjCpf := '12345678901';
  FBoleto.GetPagador.Nome := 'Teste Pagador';
  FBoleto.GetPagador.Endereco.Logradouro := 'Rua Teste 01';
  FBoleto.GetPagador.Endereco.Numero := '23';
  FBoleto.GetPagador.Endereco.Bairro := 'Centro';
  FBoleto.GetPagador.Endereco.Cidade := 'Balsas';
  FBoleto.GetPagador.Endereco.Uf := 'MA';
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

procedure TestTBoleto.TestDigitoAgencia;
begin
  FBoleto.GetConta.DigitoAgencia := ' 1';
  CheckEquals('1', FBoleto.GetConta.DigitoAgencia, 'D�digo ag�ncia inv�lido');
end;

procedure TestTBoleto.TestDigitoAgenciaMaiorQueUmDigito;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.DigitoAgencia := '14';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exce��o gerada quando informado d�gito da ag�ncia maior que um d�gito');
end;

procedure TestTBoleto.TestDigitoDaConta;
begin
  FBoleto.GetConta.DigitoConta := ' 1     ';
  CheckEquals('1', FBoleto.GetConta.DigitoConta, 'D�digo da conta inv�lido');
end;

procedure TestTBoleto.TestDigitoDaContaMaiorQueUmDigito;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.DigitoConta := '18';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exce��o gerada quando informado d�gito da conta maior que um d�gito');
end;

procedure TestTBoleto.TestDigitoDoNumeroDoBancoComEspacos;
begin
  FBoleto.GetConta.Banco.DigitoNumero := ' 9 ';
  CheckTrue(FBoleto.GetConta.Banco.DigitoNumero = '9', 'D�gito do N�mero do banco inv�lido!');
end;

procedure TestTBoleto.TestDigitoDoNumeroDoBancoInvalido;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.Banco.DigitoNumero := '8';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exce��o gerada quando informado d�gito do n�mero do banco inv�lido');
end;

procedure TestTBoleto.TestFormatacaoDoNumeroDaAgencia;
begin
  FBoleto.GetConta.Agencia := '123';
  FBoleto.Gerar;
  CheckEquals('0123', FBoleto.GetConta.Agencia, 'Ag�ncia com formato inv�lido!');
end;

procedure TestTBoleto.TestFormatacaoDoNumeroDaConta;
begin
  FBoleto.GetConta.Conta := '12345';
  FBoleto.Gerar;
  CheckEquals('00012345', FBoleto.GetConta.Conta, 'Formata��o do n�mero da conta inv�lido');
end;

procedure TestTBoleto.TestNumeroDaContaComCarectereInvalido;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.Conta := 'a123';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exce��o gerada quando informado caractere inv�lido na conta');
end;

procedure TestTBoleto.TestValidaSeNumeroCorrespondeAoBancoDoBrasil;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.Banco.Numero := '237'; // n�mero do Bradesco
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exce��o gerada quando N�mero do Banco inv�lido');
end;

procedure TestTBoleto.TestVerificaQtdeCaracteresDoNumeroDoBanco;
begin
  FBoleto.GetConta.Banco.Numero := ' 001 ';
  CheckTrue(FBoleto.GetConta.Banco.Numero = '001', 'N�mero do banco inv�lido!');
end;

initialization
  RegisterTest(TestTBoleto.Suite);
end.


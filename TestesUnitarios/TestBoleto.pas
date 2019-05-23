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
      procedure TestDigitoDoNumeroDoBancoInvalido;
      procedure TestFormatacaoDoNumeroDaAgencia;
      procedure TestFormatacaoDoNumeroDaConta;
      procedure TestNumeroDaContaComCarectereInvalido;
      procedure TestFormatacaoNossoNumeroConvenioDeTamanho4;
      procedure TestFormatacaoNossoNumeroConvenioDeTamanho6;
      procedure TestFormatacaoNossoNumeroConvenioDeTamanho7;
      procedure TestFormatacaoCampoLivreParaConvenio4E6;
      procedure TestFormatacaoCampoLivreParaConvenio7;
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

procedure TestTBoleto.TestDigitoDoNumeroDoBancoInvalido;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.Banco.DigitoNumero := '8';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exceção gerada quando informado dígito do número do banco inválido');
end;

procedure TestTBoleto.TestFormatacaoCampoLivreParaConvenio4E6;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '1234';
  FBoleto.GetConta.Agencia := '123';
  FBoleto.GetConta.Conta := '1234';
  FBoleto.GetConta.Carteira := '17';
  FBoleto.Gerar;
  CheckEquals('1234000012301230000123417', FBoleto.GetCampoLivre, 'Formatação do Campo Livre Inválido para convênio com 4 e 6 dígitos');
end;

procedure TestTBoleto.TestFormatacaoCampoLivreParaConvenio7;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '1234567';
  FBoleto.GetConta.Agencia := '123';
  FBoleto.GetConta.Conta := '1234';
  FBoleto.GetConta.Carteira := '17';
  FBoleto.Gerar;
  CheckEquals('0000001234567000000012317', FBoleto.GetCampoLivre, 'Formatação do Campo Livre Inválido para convênio com 7 dígitos');
end;

procedure TestTBoleto.TestFormatacaoDoNumeroDaAgencia;
begin
  FBoleto.GetConta.Agencia := '123';
  FBoleto.Gerar;
  CheckEquals('0123', FBoleto.GetConta.Agencia, 'Agência com formato inválido!');
end;

procedure TestTBoleto.TestFormatacaoDoNumeroDaConta;
begin
  FBoleto.GetConta.Conta := '12345';
  FBoleto.Gerar;
  CheckEquals('00012345', FBoleto.GetConta.Conta, 'Formatação do número da conta inválido');
end;

procedure TestTBoleto.TestFormatacaoNossoNumeroConvenioDeTamanho4;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '1234';
  FBoleto.Gerar;
  CheckEquals('12340000123', FBoleto.GetTitulo.NossoNum, 'Formatação Nosso Número inválido para convênio com 4 dígitos');
end;

procedure TestTBoleto.TestFormatacaoNossoNumeroConvenioDeTamanho6;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '123456';
  FBoleto.Gerar;
  CheckEquals('12345600123', FBoleto.GetTitulo.NossoNum, 'Formatação Nosso Número inválido para convênio com 4 dígitos');
end;

procedure TestTBoleto.TestFormatacaoNossoNumeroConvenioDeTamanho7;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '1234567';
  FBoleto.Gerar;
  CheckEquals('12345670000000123', FBoleto.GetTitulo.NossoNum, 'Formatação Nosso Número inválido para convênio com 4 dígitos');
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


unit TestFormata001;

interface

uses
  TestFramework, GeraBoleto.Boleto, SysUtils;

type
  TestTFormata001 = class(TTestCase)
  strict private
    FBoleto: IBoleto;
  private
    procedure SetDadosPadrao;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestDigitoDoNumeroDoBancoInvalido;
    procedure TestFormatacaoDoNumeroDaAgencia;
    procedure TestFormatacaoDoNumeroDaConta;
    procedure TestFormatacaoDaCarteiraCaracteresInvalidos;
    procedure TestFormatacaoDaCarteiraQuantidadeCaracteresInvalido;
    procedure TestFormatacaoCampoLivreParaConvenio4E6;
    procedure TestDigitoVerificadorDoNossoNumero;
    procedure TestFormatacaoCampoLivreParaConvenio7;
  end;

implementation

uses
  GeraBoleto.Conta, GeraBoleto.Titulo, GeraBoleto.Funcoes;

procedure TestTFormata001.SetDadosPadrao;
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

procedure TestTFormata001.SetUp;
begin
  FBoleto := TBoleto.Create;
  SetDadosPadrao;
end;

procedure TestTFormata001.TearDown;
begin
end;

procedure TestTFormata001.TestDigitoVerificadorDoNossoNumero;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '123456';  //somente convenio de 4 e 6 d�gitos
  FBoleto.Gerar;
  CheckEquals('4', FBoleto.GetTitulo.DigitoNossoNum, 'D�gito Verificado do Nosso N�mero Inv�lido!');
end;

procedure TestTFormata001.TestDigitoDoNumeroDoBancoInvalido;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.Banco.DigitoNumero := '8';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exce��o gerada quando informado d�gito do n�mero do banco inv�lido');
end;

procedure TestTFormata001.TestFormatacaoCampoLivreParaConvenio4E6;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '1234';
  FBoleto.GetConta.Agencia := '123';
  FBoleto.GetConta.Conta := '1234';
  FBoleto.GetConta.Carteira := '17';
  FBoleto.Gerar;
  CheckEquals('1234000012301230000123417', FBoleto.GetCampoLivre, 'Formata��o do Campo Livre Inv�lido para conv�nio com 4 d�gitos');

  FBoleto.GetConta.Convenio := '123456';
  FBoleto.Gerar;
  CheckEquals('1234560012301230000123417', FBoleto.GetCampoLivre, 'Formata��o do Campo Livre Inv�lido para conv�nio com 6 d�gitos');
end;

procedure TestTFormata001.TestFormatacaoCampoLivreParaConvenio7;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '1234567';
  FBoleto.GetConta.Agencia := '123';
  FBoleto.GetConta.Conta := '1234';
  FBoleto.GetConta.Carteira := '17';
  FBoleto.Gerar;
  CheckEquals('0000001234567000000012317', FBoleto.GetCampoLivre, 'Formata��o do Campo Livre Inv�lido para conv�nio com 7 d�gitos');
end;

procedure TestTFormata001.TestFormatacaoDaCarteiraCaracteresInvalidos;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.Carteira := 'a7';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exce��o gerada quando informado caractere inv�lido na carteira');
end;

procedure TestTFormata001.TestFormatacaoDaCarteiraQuantidadeCaracteresInvalido;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.Carteira := '017';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exce��o gerada quando carteira com quantidade de caracteres inv�lida');
end;

procedure TestTFormata001.TestFormatacaoDoNumeroDaAgencia;
begin
  FBoleto.GetConta.Agencia := '123';
  FBoleto.Gerar;
  CheckEquals('0123', FBoleto.GetConta.Agencia, 'Ag�ncia com formato inv�lido!');
end;

procedure TestTFormata001.TestFormatacaoDoNumeroDaConta;
begin
  FBoleto.GetConta.Conta := '12345';
  FBoleto.Gerar;
  CheckEquals('00012345', FBoleto.GetConta.Conta, 'Formata��o do n�mero da conta inv�lido');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTFormata001.Suite);
end.


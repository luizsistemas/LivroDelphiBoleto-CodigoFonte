unit TestGeraBoleto001;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit 
  being tested.

}

interface

uses
  TestFramework, GeraBoleto.Base, GeraBoleto.Boleto, GeraBoleto.Funcoes, SysUtils;

type
  TestTGeraBoletoBuilder001 = class(TTestCase)
  strict private
    FBoleto: IBoleto;
  private
    procedure SetDadosPadrao;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestDigitoDoNumeroDoBancoInvalido;
    procedure TestFormatacaoCampoLivreParaConvenio4E6;
    procedure TestFormatacaoCampoLivreParaConvenio7;
    procedure TestFormatacaoDoNumeroDaAgencia;
    procedure TestFormatacaoDoNumeroDaConta;
    procedure TestFormatacaoNossoNumeroConvenioDeTamanho4;
    procedure TestFormatacaoNossoNumeroConvenioDeTamanho6;
    procedure TestFormatacaoNossoNumeroConvenioDeTamanho7;
    procedure TestFormataLinhaDigitavel;
    procedure TestFormataCodigoBarras;
  end;

implementation

uses
  GeraBoleto.Conta, GeraBoleto.Titulo;

procedure TestTGeraBoletoBuilder001.SetDadosPadrao;
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

procedure TestTGeraBoletoBuilder001.SetUp;
begin
  FBoleto := TBoleto.Create;
  SetDadosPadrao;
end;

procedure TestTGeraBoletoBuilder001.TearDown;
begin
end;

procedure TestTGeraBoletoBuilder001.TestDigitoDoNumeroDoBancoInvalido;
begin
  StartExpectingException(exception);
  FBoleto.GetConta.Banco.DigitoNumero := '8';
  FBoleto.Gerar;
  StopExpectingException('Nenhuma exce��o gerada quando informado d�gito do n�mero do banco inv�lido');
end;

procedure TestTGeraBoletoBuilder001.TestFormatacaoCampoLivreParaConvenio4E6;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '1234';
  FBoleto.GetConta.Agencia := '123';
  FBoleto.GetConta.Conta := '1234';
  FBoleto.GetConta.Carteira := '17';
  FBoleto.Gerar;
  CheckEquals('1234000012301230000123417', FBoleto.GetCampoLivre, 'Formata��o do Campo Livre Inv�lido para conv�nio com 4 e 6 d�gitos');
end;

procedure TestTGeraBoletoBuilder001.TestFormatacaoCampoLivreParaConvenio7;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '1234567';
  FBoleto.GetConta.Agencia := '123';
  FBoleto.GetConta.Conta := '1234';
  FBoleto.GetConta.Carteira := '17';
  FBoleto.Gerar;
  CheckEquals('0000001234567000000012317', FBoleto.GetCampoLivre, 'Formata��o do Campo Livre Inv�lido para conv�nio com 7 d�gitos');
end;

procedure TestTGeraBoletoBuilder001.TestFormatacaoDoNumeroDaAgencia;
begin
  FBoleto.GetConta.Agencia := '123';
  FBoleto.Gerar;
  CheckEquals('0123', FBoleto.GetConta.Agencia, 'Ag�ncia com formato inv�lido!');
end;

procedure TestTGeraBoletoBuilder001.TestFormatacaoDoNumeroDaConta;
begin
  FBoleto.GetConta.Conta := '12345';
  FBoleto.Gerar;
  CheckEquals('00012345', FBoleto.GetConta.Conta, 'Formata��o do n�mero da conta inv�lido');
end;

procedure TestTGeraBoletoBuilder001.TestFormatacaoNossoNumeroConvenioDeTamanho4;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '1234';
  FBoleto.Gerar;
  CheckEquals('12340000123', FBoleto.GetTitulo.NossoNum, 'Formata��o Nosso N�mero inv�lido para conv�nio com 4 d�gitos');
end;

procedure TestTGeraBoletoBuilder001.TestFormatacaoNossoNumeroConvenioDeTamanho6;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '123456';
  FBoleto.Gerar;
  CheckEquals('12345600123', FBoleto.GetTitulo.NossoNum, 'Formata��o Nosso N�mero inv�lido para conv�nio com 4 d�gitos');
end;

procedure TestTGeraBoletoBuilder001.TestFormatacaoNossoNumeroConvenioDeTamanho7;
begin
  FBoleto.GetConta.SeqNossoNumero := 123;
  FBoleto.GetConta.Convenio := '1234567';
  FBoleto.Gerar;
  CheckEquals('12345670000000123', FBoleto.GetTitulo.NossoNum, 'Formata��o Nosso N�mero inv�lido para conv�nio com 4 d�gitos');
end;

procedure TestTGeraBoletoBuilder001.TestFormataLinhaDigitavel;
begin
  FBoleto.Gerar;
  CheckEquals('00190.00009 01234.567004 00000.001172 6 79050000030000', FBoleto.GetLinhaDigitavel,
    'Linha Digit�vel inv�lida!');
end;

procedure TestTGeraBoletoBuilder001.TestFormataCodigoBarras;
begin
  FBoleto.Gerar;
  CheckEquals('00196790500000300000000001234567000000000117', FBoleto.GetCodigoBarras, 'C�digo de Barras inv�lido!');
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTGeraBoletoBuilder001.Suite);
end.


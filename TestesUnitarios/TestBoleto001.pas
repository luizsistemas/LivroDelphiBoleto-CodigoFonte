unit TestBoleto001;

interface

uses
  TestFramework, Boleto001, Conta, Boleto, Titulo, Pessoa;

type
  TestTBoleto001 = class(TTestCase)
  strict private
    FBeneficiario: IPessoa;
    FConta: IConta;
    FTitulo: ITitulo;
    FPagador: IPessoa;
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
  FConta.Banco.Numero := '001';
  FConta.Banco.DigitoNumero := '9';
  FConta.Agencia := '9999';
  FConta.DigitoAgencia := '9';
  FConta.Conta := '123456';
  FConta.DigitoConta := '1';
  FBeneficiario.CnpjCpf := '12345678901';
  FBeneficiario.Nome := 'Teste Beneficiario';
  FTitulo.Emissao := StrToDate('1/1/2019');
  FTitulo.Vencto :=  StrToDate('30/05/2019');
  FTitulo.EspecMoeda := '9';
  FTitulo.EspecDoc := 'DM';
  FTitulo.Aceite := 'N';
  FTitulo.DataProc := StrToDate('1/1/2019');
  FTitulo.Valor := 300.00;
  FPagador.CnpjCpf := '12345678901';
  FPagador.Nome := 'Teste Pagador';
  FPagador.Endereco.Logradouro := 'Rua Teste 01';
  FPagador.Endereco.Numero := '23';
  FPagador.Endereco.Bairro := 'Centro';
  FPagador.Endereco.Cidade := 'Balsas';
  FPagador.Endereco.Uf := 'MA';
end;

procedure TestTBoleto001.SetUp;
begin
  FBeneficiario := TPessoa.Create;
  FConta := TConta.Create;
  FTitulo := TTitulo.Create;
  FPagador := TPessoa.Create;
  SetDadosPadrao;
end;

procedure TestTBoleto001.TearDown;
begin
  // não precisamos mais destruir FBoleto, pois este agora é do tipo interface
end;

procedure TestTBoleto001.TestDigitoAgencia;
begin
  FConta.DigitoAgencia := ' 1';
  CheckEquals('1', FConta.DigitoAgencia, 'Dídigo agência inválido');
end;

procedure TestTBoleto001.TestDigitoAgenciaMaiorQueUmDigito;
begin
  StartExpectingException(exception);
  FConta.DigitoAgencia := '14';
  FBoleto001 := TBoleto001.Create(FBeneficiario, FConta, FTitulo, FPagador);
  StopExpectingException('Nenhuma exceção gerada quando informado dígito da agência maior que um dígito');
end;

procedure TestTBoleto001.TestDigitoDaConta;
begin
  FConta.DigitoConta := ' 1     ';
  CheckEquals('1', FConta.DigitoConta, 'Dídigo da conta inválido');
end;

procedure TestTBoleto001.TestDigitoDaContaMaiorQueUmDigito;
begin
  StartExpectingException(exception);
  FConta.DigitoConta := '18';
  FBoleto001 := TBoleto001.Create(FBeneficiario, FConta, FTitulo, FPagador);
  StopExpectingException('Nenhuma exceção gerada quando informado dígito da conta maior que um dígito');
end;

procedure TestTBoleto001.TestDigitoDoNumeroDoBancoComEspacos;
begin
  FConta.Banco.DigitoNumero := ' 9 ';
  CheckTrue(FConta.Banco.DigitoNumero = '9', 'Dígito do Número do banco inválido!');
end;

procedure TestTBoleto001.TestDigitoDoNumeroDoBancoInvalido;
begin
  StartExpectingException(exception);
  FConta.Banco.DigitoNumero := '8';
  FBoleto001 := TBoleto001.Create(FBeneficiario, FConta, FTitulo, FPagador);
  StopExpectingException('Nenhuma exceção gerada quando informado dígito do número do banco inválido');
end;

procedure TestTBoleto001.TestFormatacaoDoNumeroDaAgencia;
begin
  FConta.Agencia := '123';
  FBoleto001 := TBoleto001.Create(FBeneficiario, FConta, FTitulo, FPagador);
  CheckEquals('0123', FConta.Agencia, 'Agência com formato inválido!');
end;

procedure TestTBoleto001.TestFormatacaoDoNumeroDaConta;
begin
  FConta.Conta := '12345';
  FBoleto001 := TBoleto001.Create(FBeneficiario, FConta, FTitulo, FPagador);
  CheckEquals('00012345', FConta.Conta, 'Formatação do número da conta inválido');
end;

procedure TestTBoleto001.TestNumeroDaContaComCarectereInvalido;
begin
  StartExpectingException(exception);
  FConta.Conta := 'a123';
  FBoleto001 := TBoleto001.Create(FBeneficiario, FConta, FTitulo, FPagador);
  StopExpectingException('Nenhuma exceção gerada quando informado caractere inválido na conta');
end;

procedure TestTBoleto001.TestValidaSeNumeroCorrespondeAoBancoDoBrasil;
begin
  StartExpectingException(exception);
  FConta.Banco.Numero := '237'; // número do Bradesco
  FBoleto001 := TBoleto001.Create(FBeneficiario, FConta, FTitulo, FPagador);
  StopExpectingException('Nenhuma exceção gerada quando Número do Banco inválido');
end;

procedure TestTBoleto001.TestVerificaQtdeCaracteresDoNumeroDoBanco;
begin
  FConta.Banco.Numero := ' 001 ';
  CheckTrue(FConta.Banco.Numero = '001', 'Número do banco inválido!');
end;

initialization
  RegisterTest(TestTBoleto001.Suite);
end.


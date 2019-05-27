unit TestContainerBoleto;

interface

uses
  TestFramework, GeraBoleto.Container, GeraBoleto.Boleto;

type
  TestTBoletoContainer = class(TTestCase)
  strict private
    FContainer: IBoletoContainer;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestAdicaoDeBoletoNoContainer;
    procedure TestListaDeBoletosDoContainer;
    procedure TestExcluiBoletoDoContainer;
  end;

implementation

{ TestTBoletoContainer }

procedure TestTBoletoContainer.SetUp;
begin
  FContainer := TBoletoContainer.Create;
end;

procedure TestTBoletoContainer.TearDown;
begin
end;

procedure TestTBoletoContainer.TestAdicaoDeBoletoNoContainer;
var
  Boleto: IBoleto;
begin
  Boleto := FContainer.Add;
  CheckTrue((Boleto is TBoleto), 'Nenhum boleto retornado');
end;

procedure TestTBoletoContainer.TestExcluiBoletoDoContainer;
begin
  //adicionar 3 boletos
  FContainer.Add;
  FContainer.Add;
  FContainer.Add;
  //deleta boleto
  FContainer.Delete(1); // exclui o segundo boleto da Lista (índice 1)
  //teste
  CheckEquals(2, FContainer.Boletos.Count, 'Método Deleta não excluiu o boleto corretamente.');
end;

procedure TestTBoletoContainer.TestListaDeBoletosDoContainer;
begin
  //adicionar 3 boletos
  FContainer.Add;
  FContainer.Add;
  FContainer.Add;
  CheckEquals(3, FContainer.Boletos.Count, 'Lista de boletos com erro.');
end;

initialization
  RegisterTest(TestTBoletoContainer.Suite);
end.

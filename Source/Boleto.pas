unit Boleto;

interface

uses
  Pessoa, Conta, Titulo;

type
  IBoleto = interface
    ['{824360BB-E02F-4F7B-9DCE-D4A58B23C79F}']
    function GetBeneficiario: TPessoa;
    function GetConta: TConta;
    function GetPagador: TPessoa;
    function GetTitulo: TTitulo;
    procedure Gerar;
  end;

  TBoleto = class (TInterfacedObject, IBoleto)
  private
  protected
    FBeneficiario: TPessoa;
    FConta: TConta;
    FPagador: TPessoa;
    FTitulo: TTitulo;
  public
    constructor Create;
    destructor Destroy; override;
    function GetBeneficiario: TPessoa;
    function GetConta: TConta;
    function GetPagador: TPessoa;
    function GetTitulo: TTitulo;

    procedure Gerar;
  end;

implementation

uses Base, FactoryBoleto;

{ TBoleto }

constructor TBoleto.Create;
begin
  FBeneficiario := TPessoa.Create;
  FConta := TConta.Create;
  FTitulo := TTitulo.Create;
  FPagador := TPessoa.Create;
end;

destructor TBoleto.Destroy;
begin
  FBeneficiario.Free;
  FConta.Free;
  FTitulo.Free;
  FPagador.Free;

  inherited;
end;

procedure TBoleto.Gerar;
begin
  TFactoryBoleto
            .GetFormatter(Self)
            .FormataCampos
            .ValidaDados
            .FormataNossoNumero
            .FormataCampoLivre
            .FormataCodigoBarras
            .Criar;
end;

function TBoleto.GetBeneficiario: TPessoa;
begin
  Result := FBeneficiario;
end;

function TBoleto.GetConta: TConta;
begin
  Result := FConta;
end;

function TBoleto.GetPagador: TPessoa;
begin
  Result := FPagador;
end;

function TBoleto.GetTitulo: TTitulo;
begin
  Result := FTitulo;
end;

end.

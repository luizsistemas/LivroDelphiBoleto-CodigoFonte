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
  end;

  TBoleto = class (TInterfacedObject, IBoleto)
  private
  protected
    FBeneficiario: TPessoa;
    FConta: TConta;
    FPagador: TPessoa;
    FTitulo: TTitulo;

    procedure Formatar; virtual; abstract;
    procedure Validar; virtual; abstract;
  public
    constructor Create(ABeneficiario: TPessoa; AConta: TConta; ATitulo: TTitulo; APagador: TPessoa);
    function GetBeneficiario: TPessoa;
    function GetConta: TConta;
    function GetPagador: TPessoa;
    function GetTitulo: TTitulo;
  end;

implementation

{ TBoleto }

constructor TBoleto.Create(ABeneficiario: TPessoa; AConta: TConta; ATitulo: TTitulo; APagador: TPessoa);
begin
  FBeneficiario := ABeneficiario;
  FConta := AConta;
  FTitulo := ATitulo;
  FPagador := APagador;
  Formatar;
  Validar;
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

unit GeraBoleto.Container;

interface

uses
  GeraBoleto.Boleto, System.Generics.Collections;

type
  IBoletoContainer = interface
  ['{AA8EA86D-1213-4521-8392-D844B4C2AF04}']
    function Add: IBoleto;
    procedure Delete(Index: Integer);
    function Boletos: TList<IBoleto>;
    procedure Imprimir;
  end;

  TBoletoContainer = class(TInterfacedObject, IBoletoContainer)
  private
    FBoletos: TList<IBoleto>;
  public
    constructor Create;
    destructor Destroy; override;
    function Add: IBoleto;
    procedure Delete(Index: Integer);
    function Boletos: TList<IBoleto>;
    procedure Imprimir;
  end;

implementation

{ TBoletoContainer }

constructor TBoletoContainer.Create;
begin
  FBoletos := TList<IBoleto>.Create;
end;

destructor TBoletoContainer.Destroy;
begin
  FBoletos.Free;
  inherited;
end;

function TBoletoContainer.Add: IBoleto;
begin
  Result := TBoleto.Create;
  FBoletos.Add(Result);
end;

function TBoletoContainer.Boletos: TList<IBoleto>;
begin
  Result := FBoletos;
end;

procedure TBoletoContainer.Delete(Index: Integer);
begin
  if (Index + 1) <= FBoletos.Count then
    FBoletos.Delete(Index);
end;

procedure TBoletoContainer.Imprimir;
begin
  // a ser implementado quando tratarmos dos testes caixa preta (ou testes end to end)
end;

end.

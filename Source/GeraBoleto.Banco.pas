unit GeraBoleto.Banco;

interface

type
  TBanco = class
  private
    FNome: string;
    FDigitoNumero: string;
    FNumero: string;
    procedure SetNumero(const Value: string);
    procedure SetDigitoNumero(const Value: string);
  public
    property Numero: string read FNumero write SetNumero;
    property DigitoNumero: string read FDigitoNumero write SetDigitoNumero;
    property Nome: string read FNome write FNome;
  end;

implementation

{ TBanco }

uses
  Sysutils, GeraBoleto.Funcoes;

procedure TBanco.SetDigitoNumero(const Value: string);
begin
  FDigitoNumero := Trim(Value);
end;

procedure TBanco.SetNumero(const Value: string);
begin
  FNumero := Trim(Value);
  if not IsNumber(FNumero) then
    raise Exception.Create('N�mero do Banco inv�lido');
end;

end.

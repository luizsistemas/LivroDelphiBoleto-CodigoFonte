unit Banco;

interface

type
  TBanco = class
  private
    FNome: string;
    FDigitoNumero: string;
    FNumero: string;
  public
    property Numero: string read FNumero write FNumero;
    property DigitoNumero: string read FDigitoNumero write FDigitoNumero;
    property Nome: string read FNome write FNome;
  end;

implementation

end.

unit Conta;

interface

uses
  Banco;

type
  TConta = class
  private
    FBanco: TBanco;
    FLocalPagto: string;
    FAgencia: string;
    FDigitoConta: string;
    FConta: string;
    FCarteira: string;
    FDigitoAgencia: string;
  public
    property Banco: TBanco read FBanco write FBanco;
    property LocalPagto: string read FLocalPagto write FLocalPagto;
    property Agencia: string read FAgencia write FAgencia;
    property DigitoAgencia: string read FDigitoAgencia write FDigitoAgencia;
    property Conta: string read FConta write FConta;
    property DigitoConta: string read FDigitoConta write FDigitoConta;
    property Carteira: string read FCarteira write FCarteira;
  end;

implementation

end.

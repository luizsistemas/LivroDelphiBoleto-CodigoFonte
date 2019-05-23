unit Conta;

interface

uses
  Banco, SysUtils;

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
    FConvenio: string;

    procedure SetAgencia(const Value: string);
    procedure SetConta(const Value: string);
    procedure SetDigitoAgencia(const Value: string);
    procedure SetDigitoConta(const Value: string);
    procedure SetConvenio(const Value: string);

  public
    constructor Create;
    destructor Destroy; override;

    property Banco: TBanco read FBanco write FBanco;
    property LocalPagto: string read FLocalPagto write FLocalPagto;
    property Agencia: string read FAgencia write SetAgencia;
    property DigitoAgencia: string read FDigitoAgencia write SetDigitoAgencia;
    property Conta: string read FConta write SetConta;
    property DigitoConta: string read FDigitoConta write SetDigitoConta;
    property Carteira: string read FCarteira write FCarteira;
    property Convenio: string read FConvenio write SetConvenio;
  end;

implementation

{ TConta }

constructor TConta.Create;
begin
  FBanco := TBanco.Create;
end;

destructor TConta.Destroy;
begin
  FBanco.Free;
  inherited;
end;

procedure TConta.SetAgencia(const Value: string);
begin
  FAgencia := Trim(Value);
end;

procedure TConta.SetConta(const Value: string);
begin
  FConta := Trim(Value);
end;

procedure TConta.SetConvenio(const Value: string);
begin
  FConvenio := Trim(Value);
end;

procedure TConta.SetDigitoAgencia(const Value: string);
begin
  FDigitoAgencia := Trim(Value);
end;

procedure TConta.SetDigitoConta(const Value: string);
begin
  FDigitoConta := Trim(Value);
end;

end.

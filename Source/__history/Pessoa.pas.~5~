unit Pessoa;

interface

type
  TEndereco = class
  private
    FLogradouro: string;
    FBairro: string;
    FUf: string;
    FCep: string;
    FNumero: string;
    FComplemento: string;
    FCidade: string;
  public
    property Logradouro: string read FLogradouro write FLogradouro;
    property Numero: string read FNumero write FNumero;
    property Bairro: string read FBairro write FBairro;
    property Complemento: string read FComplemento write FComplemento;
    property Cidade: string read FCidade write FCidade;
    property Uf: string read FUf write FUf;
    property Cep: string read FCep write FCep;
  end;

  IPessoa = interface
    ['{1FCEB7D7-B754-4D6F-B500-158F64F825F0}']
    function GetCnpjCpf: string;
    function GetEmail: string;
    function GetEndereco: TEndereco;
    function GetNome: string;
    function GetTelefone: string;

    procedure SetCnpjCpf(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: TEndereco);
    procedure SetNome(const Value: string);
    procedure SetTelefone(const Value: string);

    property CnpjCpf: string read GetCnpjCpf write SetCnpjCpf;
    property Nome: string read GetNome write SetNome;
    property Endereco: TEndereco read GetEndereco write SetEndereco;
    property Telefone: string read GetTelefone write SetTelefone;
    property Email: string read GetEmail write SetEmail;
  end;

  TPessoa = class(TInterfacedObject, IPessoa)
  private
    FEmail: string;
    FCnpjCpf: string;
    FNome: string;
    FTelefone: string;
    FEndereco: TEndereco;
  public
    constructor Create;
    destructor Destroy; override;

    function GetCnpjCpf: string;
    function GetEmail: string;
    function GetEndereco: TEndereco;
    function GetNome: string;
    function GetTelefone: string;

    procedure SetCnpjCpf(const Value: string);
    procedure SetEmail(const Value: string);
    procedure SetEndereco(const Value: TEndereco);
    procedure SetNome(const Value: string);
    procedure SetTelefone(const Value: string);

    property CnpjCpf: string read GetCnpjCpf write SetCnpjCpf;
    property Nome: string read GetNome write SetNome;
    property Endereco: TEndereco read GetEndereco write SetEndereco;
    property Telefone: string read GetTelefone write SetTelefone;
    property Email: string read GetEmail write SetEmail;
  end;

implementation

{ TPessoa }

constructor TPessoa.Create;
begin
  Endereco := TEndereco.Create;
end;

destructor TPessoa.Destroy;
begin
  FEndereco.Free;
  inherited;
end;

function TPessoa.GetCnpjCpf: string;
begin
  Result := FCnpjCpf;
end;

function TPessoa.GetEmail: string;
begin
  Result := FEmail;
end;

function TPessoa.GetEndereco: TEndereco;
begin
  Result := FEndereco;
end;

function TPessoa.GetNome: string;
begin
  Result := FNome;
end;

function TPessoa.GetTelefone: string;
begin
  Result := FTelefone;
end;

procedure TPessoa.SetCnpjCpf(const Value: string);
begin
  FCnpjCpf := Value;
end;

procedure TPessoa.SetEmail(const Value: string);
begin
  FEmail := Value;

end;

procedure TPessoa.SetEndereco(const Value: TEndereco);
begin
  FEndereco := Value;

end;

procedure TPessoa.SetNome(const Value: string);
begin
  FNome := Value;
end;

procedure TPessoa.SetTelefone(const Value: string);
begin
  FTelefone := Value;
end;

end.

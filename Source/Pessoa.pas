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

  TPessoa = class
  private
    FEmail: string;
    FCnpjCpf: string;
    FNome: string;
    FTelefone: string;
    FEndereco: TEndereco;
  public
    constructor Create;
    destructor Destroy; override;

    property CnpjCpf: string read FCnpjCpf write FCnpjCpf;
    property Nome: string read FNome write FNome;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property Telefone: string read FTelefone write FTelefone;
    property Email: string read FEmail write FEmail;
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

end.

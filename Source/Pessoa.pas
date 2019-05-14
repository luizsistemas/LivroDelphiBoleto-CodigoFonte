unit Pessoa;

interface

type
  TPessoa = class
  private
    FLogradouro: string;
    FEmail: string;
    FBairro: string;
    FUf: string;
    FCep: string;
    FCnpjCpf: string;
    FNumero: string;
    FComplemento: string;
    FNome: string;
    FCidade: string;
    FTelefone: string;
  public
    property CnpjCpf: string read FCnpjCpf write FCnpjCpf;
    property Nome: string read FNome write FNome;
    property Logradouro: string read FLogradouro write FLogradouro;
    property Numero: string read FNumero write FNumero;
    property Bairro: string read FBairro write FBairro;
    property Complemento: string read FComplemento write FComplemento;
    property Cidade: string read FCidade write FCidade;
    property Uf: string read FUf write FUf;
    property Cep: string read FCep write FCep;
    property Telefone: string read FTelefone write FTelefone;
    property Email: string read FEmail write FEmail;
  end;

implementation

end.

unit udmDadosBoleto;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  GeraBoleto.Boleto, FireDAC.Stan.StorageBin;

type
  TdmDadosBoleto = class(TDataModule)
    Boletos: TFDMemTable;
    BoletosBancoNumero: TStringField;
    BoletosBancoDigito: TStringField;
    BoletosBancoNome: TStringField;
    BoletosContaLocalPagto: TStringField;
    BoletosContaCodBeneficiario: TStringField;
    BoletosContaCarteira: TStringField;
    BoletosBenCnpjCpf: TStringField;
    BoletosBenNome: TStringField;
    BoletosBenLogradouro: TStringField;
    BoletosBenNumero: TStringField;
    BoletosBenBairro: TStringField;
    BoletosBenCep: TStringField;
    BoletosBenCidade: TStringField;
    BoletosBenUF: TStringField;
    BoletosBenFone: TStringField;
    BoletosTitData: TDateTimeField;
    BoletosTitVencimento: TDateTimeField;
    BoletosTitNossoNumero: TStringField;
    BoletosTitDataProc: TDateTimeField;
    BoletosTitDocumento: TStringField;
    BoletosTitAceite: TStringField;
    BoletosTitEspecDoc: TStringField;
    BoletosTitEspecMoeda: TStringField;
    BoletosTitValor: TCurrencyField;
    BoletosTitInstrucoes: TMemoField;
    BoletosPagCnpjCpf: TStringField;
    BoletosPagNome: TStringField;
    BoletosPagLogradouro: TStringField;
    BoletosPagNumero: TStringField;
    BoletosPagBairro: TStringField;
    BoletosPagCep: TStringField;
    BoletosPagCidade: TStringField;
    BoletosPagUF: TStringField;
    BoletosPagFone: TStringField;
    BoletosCodigoBarras: TStringField;
    BoletosLinhaDigitavel: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure AdicionaDadosNoMemTable(ABoleto: IBoleto);
  end;

var
  dmDadosBoleto: TdmDadosBoleto;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TdmDadosBoleto.AdicionaDadosNoMemTable(ABoleto: IBoleto);
begin
  Boletos.Append;
  BoletosBancoNumero.AsString := ABoleto.GetConta.Banco.Numero;
  BoletosBancoNome.AsString := ABoleto.GetConta.Banco.Nome;
  BoletosBancoDigito.AsString := ABoleto.GetConta.Banco.DigitoNumero;

  BoletosContaLocalPagto.AsString := ABoleto.GetConta.LocalPagto;
  BoletosContaCodBeneficiario.AsString := ABoleto.GetCodBeneficiarioFormatado;
  BoletosContaCarteira.AsString := ABoleto.GetConta.Carteira;

  BoletosBenCnpjCpf.AsString := ABoleto.GetBeneficiario.CnpjCpf;
  BoletosBenNome.AsString := ABoleto.GetBeneficiario.Nome;
  BoletosBenLogradouro.AsString := ABoleto.GetBeneficiario.Endereco.Logradouro;
  BoletosBenNumero.AsString := ABoleto.GetBeneficiario.Endereco.Numero;
  BoletosBenBairro.AsString := ABoleto.GetBeneficiario.Endereco.Bairro;
  BoletosBenCep.AsString := ABoleto.GetBeneficiario.Endereco.Cep;
  BoletosBenCidade.AsString := ABoleto.GetBeneficiario.Endereco.Cidade;
  BoletosBenUF.AsString := ABoleto.GetBeneficiario.Endereco.Uf;
  BoletosBenFone.AsString := ABoleto.GetBeneficiario.Telefone;

  BoletosTitData.AsDateTime := ABoleto.GetTitulo.Emissao;
  BoletosTitVencimento.AsDateTime := ABoleto.GetTitulo.Vencto;
  BoletosTitDataProc.AsDateTime := ABoleto.GetTitulo.DataProc;
  BoletosTitNossoNumero.AsString := ABoleto.GetNossoNumeroFormatado;
  BoletosTitDocumento.AsString := ABoleto.GetTitulo.Documento;
  BoletosTitAceite.AsString := ABoleto.GetTitulo.Aceite;
  BoletosTitEspecDoc.AsString := ABoleto.GetTitulo.EspecDoc;
  BoletosTitEspecMoeda.AsString := ABoleto.GetTitulo.EspecMoeda;
  BoletosTitValor.AsCurrency := ABoleto.GetTitulo.Valor;
  BoletosTitInstrucoes.AsString := ABoleto.GetTitulo.Instrucoes.Text;

  BoletosPagCnpjCpf.AsString := ABoleto.GetPagador.CnpjCpf;
  BoletosPagNome.AsString := ABoleto.GetPagador.Nome;
  BoletosPagLogradouro.AsString := ABoleto.GetPagador.Endereco.Logradouro;
  BoletosPagNumero.AsString := ABoleto.GetPagador.Endereco.Numero;
  BoletosPagBairro.AsString := ABoleto.GetPagador.Endereco.Bairro;
  BoletosPagCep.AsString := ABoleto.GetPagador.Endereco.Cep;
  BoletosPagCidade.AsString := ABoleto.GetPagador.Endereco.Cidade;
  BoletosPagUF.AsString := ABoleto.GetPagador.Endereco.Uf;
  BoletosPagFone.AsString := ABoleto.GetPagador.Telefone;

  BoletosCodigoBarras.AsString := ABoleto.GetCodigoBarras;
  BoletosLinhaDigitavel.AsString := ABoleto.GetLinhaDigitavel;

  Boletos.Post;
end;

procedure TdmDadosBoleto.DataModuleCreate(Sender: TObject);
begin
  Boletos.Close;
  Boletos.Open;
end;

end.

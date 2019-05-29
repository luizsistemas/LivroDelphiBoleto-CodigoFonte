unit udmBoletoFastReport;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet, frxBarcode;

type
  TdmBoletoFastReport = class(TDataModule)
    Boletos: TFDMemTable;
    BoletosBenCnpjCpf: TStringField;
    BoletosBenNome: TStringField;
    BoletosBenLogradouro: TStringField;
    BoletosBenNumero: TStringField;
    BoletosBenBairro: TStringField;
    BoletosBenCidade: TStringField;
    BoletosBenUF: TStringField;
    BoletosBenFone: TStringField;
    Report: TfrxReport;
    frxDsBoletos: TfrxDBDataset;
    BoletosBenCep: TStringField;
    frxBarCodeObject1: TfrxBarCodeObject;
    BoletosTitData: TDateTimeField;
    BoletosTitValor: TCurrencyField;
    BoletosTitInstrucoes: TMemoField;
    BoletosBancoNumero: TStringField;
    BoletosBancoDigito: TStringField;
    BoletosBancoNome: TStringField;
    BoletosTitNossoNumero: TStringField;
    BoletosTitVencimento: TDateTimeField;
    BoletosTitDataProc: TDateTimeField;
    BoletosTitDocumento: TStringField;
    BoletosTitAceite: TStringField;
    BoletosTitEspecDoc: TStringField;
    BoletosTitEspecMoeda: TStringField;
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
    BoletosContaLocalPagto: TStringField;
    BoletosContaCodBeneficiario: TStringField;
    BoletosContaCarteira: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBoletoFastReport: TdmBoletoFastReport;

implementation

{$R *.dfm}

end.

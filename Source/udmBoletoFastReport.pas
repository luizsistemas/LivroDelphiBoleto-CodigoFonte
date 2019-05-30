unit udmBoletoFastReport;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet, frxBarcode,
  GeraBoleto.Boleto, udmDadosBoleto;

type
  TdmBoletoFastReport = class(TDataModule)
    Report: TfrxReport;
    frxDsBoletos: TfrxDBDataset;
    frxBarCodeObject1: TfrxBarCodeObject;
    procedure DataModuleCreate(Sender: TObject);
  private
  public
    procedure AdicionaDadosNoMemTable(ABoleto: IBoleto);
  end;

var
  dmBoletoFastReport: TdmBoletoFastReport;

implementation

{$R *.dfm}

procedure TdmBoletoFastReport.AdicionaDadosNoMemTable(ABoleto: IBoleto);
begin
  dmDadosBoleto.AdicionaDadosNoMemTable(ABoleto);
end;


procedure TdmBoletoFastReport.DataModuleCreate(Sender: TObject);
begin
  dmDadosBoleto := TdmDadosBoleto.Create(Self);
end;

end.

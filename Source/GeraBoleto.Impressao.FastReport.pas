unit GeraBoleto.Impressao.FastReport;

interface

uses
  GeraBoleto.Impressao, udmBoletoFastReport, GeraBoleto.Boleto,
  System.Generics.Collections, SysUtils;

type
  TImpressaoBoletoFast = class(TInterfacedObject, IImpressaoBoleto)
  private
    FReportFile: string;
    Dm: TdmBoletoFastReport;
  public
    constructor Create(AReportFile: string);
    destructor Destroy; override;
    procedure Imprime(ABoletos: TList<IBoleto>);
  end;

implementation

{ TImpressaoBoletoFast }

constructor TImpressaoBoletoFast.Create(AReportFile: string);
begin
  Dm := TdmBoletoFastReport.Create(nil);
  FReportFile := AReportFile;
  if FReportFile.IsEmpty then
    raise Exception.Create('Arquivo do FastReport n�o informado!');

  if not FileExists(FReportFile) then
    raise Exception.Create('Arquivo do FastReport n�o encontrado!');
end;

destructor TImpressaoBoletoFast.Destroy;
begin
  FreeAndNil(Dm);
  inherited;
end;

procedure TImpressaoBoletoFast.Imprime(ABoletos: TList<IBoleto>);
var
  I: Integer;
begin
  for I := 0 to ABoletos.Count - 1 do
    Dm.AdicionaDadosNoMemTable(ABoletos[I]);

  Dm.Report.LoadFromFile(FReportFile);
  Dm.Report.ShowReport;
end;

end.

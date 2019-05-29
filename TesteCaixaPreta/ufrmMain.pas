unit ufrmMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  GeraBoleto.Container, GeraBoleto.Boleto;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edNumBanco: TEdit;
    edAgencia: TEdit;
    Label2: TLabel;
    edDigAgencia: TEdit;
    Label4: TLabel;
    edConta: TEdit;
    edDigConta: TEdit;
    edDigNumero: TEdit;
    edConvenio: TEdit;
    Label7: TLabel;
    edSequencia: TEdit;
    Label8: TLabel;
    Label3: TLabel;
    edCarteira: TEdit;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    edBenNome: TEdit;
    Label11: TLabel;
    edBenCnpj: TEdit;
    Label12: TLabel;
    edBenLogradouro: TEdit;
    edBenNumero: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    edBenBairro: TEdit;
    Label15: TLabel;
    edBenCep: TEdit;
    edBenCidade: TEdit;
    Label16: TLabel;
    edBenUF: TEdit;
    Label17: TLabel;
    GroupBox3: TGroupBox;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    edPagNome: TEdit;
    edPagCnpj: TEdit;
    edPagLogradouro: TEdit;
    edPagNumero: TEdit;
    edPagBairro: TEdit;
    edPagCep: TEdit;
    edPagCidade: TEdit;
    edPagUF: TEdit;
    GroupBox4: TGroupBox;
    Label9: TLabel;
    edData: TEdit;
    Label10: TLabel;
    edVencimento: TEdit;
    Label5: TLabel;
    edValor: TEdit;
    edDocumento: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    edAceite: TEdit;
    Label28: TLabel;
    edDataProc: TEdit;
    btnAdiciona: TButton;
    btnExclui: TButton;
    btnImprime: TButton;
    memObs: TMemo;
    btnImpNoMemo: TButton;
    procedure FormCreate(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure btnImpNoMemoClick(Sender: TObject);
    procedure btnImprimeClick(Sender: TObject);
  private
    FContainer: IBoletoContainer;
    procedure PreencheBoleto(ABoleto: IBoleto);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  GeraBoleto.Impressao.FastReport, GeraBoleto.Impressao;

{$R *.dfm}

procedure TfrmMain.btnAdicionaClick(Sender: TObject);
var
  Boleto: IBoleto;
begin
  Boleto := FContainer.Add;
  PreencheBoleto(Boleto);
  Boleto.Gerar;
  ShowMessage('Boleto foi adicionado!');
end;

procedure TfrmMain.btnImpNoMemoClick(Sender: TObject);
var
  Boleto: IBoleto;
begin
  if FContainer.Boletos.Count > 0 then  //verifica se tem boleto na lista
  begin
    Boleto := FContainer.Boletos[0];  // pegamos o primeiro boleto da lista
    memObs.Lines.Clear;
    memObs.Lines.Add('Nome Banco: ' + Boleto.GetConta.Banco.Nome);
    memObs.Lines.Add('Nosso Número: ' + Boleto.GetTitulo.NossoNum);
    memObs.Lines.Add('Dígito Nosso Número: ' + Boleto.GetTitulo.DigitoNossoNum);
    memObs.Lines.Add('Código de Barras: ' + Boleto.GetCodigoBarras);
    memObs.Lines.Add('Linha Digitável: ' + Boleto.GetLinhaDigitavel);
  end;
end;

procedure TfrmMain.btnImprimeClick(Sender: TObject);
var
  ModuloImp: IImpressaoBoleto;
  Arquivo: string;
begin
  Arquivo := '..\..\Report\Boleto.fr3';
  if FContainer.Boletos.Count > 0 then  //verifica se tem boleto na lista
  begin
    ModuloImp := TImpressaoBoletoFast.Create(Arquivo);
    FContainer.SetModuloImpressao(ModuloImp);
    FContainer.Imprimir;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FContainer := TBoletoContainer.Create;
end;

procedure TfrmMain.PreencheBoleto(ABoleto: IBoleto);
begin
  with ABoleto.GetBeneficiario do
  begin
    CnpjCpf := edBenCnpj.Text;
    Nome := edBenNome.Text;
    Endereco.Logradouro := edBenLogradouro.Text;
    Endereco.Numero := edBenNumero.Text;
    Endereco.Bairro := edBenBairro.Text;
    Endereco.Cidade := edBenCidade.Text;
    Endereco.Uf := edBenUF.Text;
  end;
  with ABoleto.GetConta do
  begin
    Banco.Numero := edNumBanco.Text;
    Banco.DigitoNumero := edDigNumero.Text;
    LocalPagto := 'Pago em qualquer agência até o vencimento';
    Agencia := edAgencia.Text;
    DigitoAgencia := edDigAgencia.Text;
    Conta := edConta.Text;
    DigitoConta := edDigConta.Text;
    Carteira := edCarteira.Text;
    Convenio := edConvenio.Text;
    SeqNossoNumero := StrToInt(edSequencia.Text);
  end;
  with ABoleto.GetTitulo do
  begin
    Emissao := StrToDate(edData.Text);
    Vencto := StrToDate(edVencimento.Text);
    Documento := edDocumento.Text;
    Aceite := edAceite.Text;
    DataProc := StrToDate(edDataProc.Text);
    EspecMoeda := 'R$';
    EspecDoc := 'DM';
    Valor := StrToCurr(edValor.Text);
    Instrucoes.Add('Será Cobrado R$ 1,00 de juros por dia de atraso');
    Instrucoes.Add('Multa de R$ 50,00 após vencimento');
    Instrucoes.Add('Outras instruções...');
  end;
  with ABoleto.GetPagador do
  begin
    CnpjCpf := edPagCnpj.Text;
    Nome := edPagNome.Text;
    Endereco.Logradouro := edPagLogradouro.Text;
    Endereco.Numero := edPagNumero.Text;
    Endereco.Bairro := edPagBairro.Text;
    Endereco.Cidade := edPagCidade.Text;
    Endereco.Uf := edPagUF.Text;
  end;
end;

end.

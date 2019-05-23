unit Boleto001;

interface

uses Boleto, Pessoa, Conta, Titulo, Base;

const
  DIGITO_NUM = '9';

type
  TFormata001 = class(TInterfacedObject, IGeraBoletoBuilder)
  private
    FCampoLivre: string;
    FBoleto: IBoleto;
  public
    constructor Create(ABoleto: IBoleto);
    function FormataCampos: IGeraBoletoBuilder;
    function ValidaDados: IGeraBoletoBuilder;
    function FormataNossoNumero: IGeraBoletoBuilder;
    function FormataLinhaDigitavel: IGeraBoletoBuilder;
    function FormataCodigoBarras: IGeraBoletoBuilder;
    function Criar: Boolean;
  end;

  TFactoryBBFormataNossoNumero = class
  public
    class function GetFormata(AConvenio: string): IFormataNossoNumero;
  end;

  TBBConvenio4 = class(TInterfacedObject, IFormataNossoNumero)
  public
    procedure Formata(ABoleto: IBoleto; var ACampoLivre: string);
  end;

  TBBConvenio6 = class(TInterfacedObject, IFormataNossoNumero)
  public
    procedure Formata(ABoleto: IBoleto; var ACampoLivre: string);
  end;

  TBBConvenio7 = class(TInterfacedObject, IFormataNossoNumero)
  public
    procedure Formata(ABoleto: IBoleto; var ACampoLivre: string);
  end;

implementation

uses
  System.SysUtils, Funcoes;

{ TFactoryBBFormataNossoNumero }

class function TFactoryBBFormataNossoNumero.GetFormata(AConvenio: string): IFormataNossoNumero;
begin
  case AConvenio.Length of
    4: Result := TBBConvenio4.Create;
    6: Result := TBBConvenio6.Create;
    7: Result := TBBConvenio7.Create;
  else
    raise Exception.Create('Conv�nio inv�lido!');
  end;
end;

{ TBBConvenio4 }

procedure TBBConvenio4.Formata(ABoleto: IBoleto; var ACampoLivre: string);
begin
  ABoleto.GetTitulo.NossoNum := ABoleto.GetConta.Convenio +
      LeftPad(ABoleto.GetConta.SeqNossoNumero.ToString, 7);
  ACampoLivre := ABoleto.GetTitulo.NossoNum + ABoleto.GetConta.Agencia +
    ABoleto.GetConta.Conta + ABoleto.GetConta.Carteira;
end;

{ TBBConvenio6 }

procedure TBBConvenio6.Formata(ABoleto: IBoleto; var ACampoLivre: string);
begin

end;

{ TBBConvenio7 }

procedure TBBConvenio7.Formata(ABoleto: IBoleto; var ACampoLivre: string);
begin

end;

{ TBBFormata }

constructor TFormata001.Create(ABoleto: IBoleto);
begin
  FBoleto := ABoleto;
end;

function TFormata001.Criar: Boolean;
begin
  Result := True;
end;

function TFormata001.FormataCampos: IGeraBoletoBuilder;
begin
  FBoleto.GetConta.Agencia := LeftPad(FBoleto.GetConta.Agencia, 4);
  FBoleto.GetConta.Conta := LeftPad(FBoleto.GetConta.Conta, 8);
  Result := Self;
end;

function TFormata001.FormataCodigoBarras: IGeraBoletoBuilder;
begin
  Result := Self;
end;

function TFormata001.FormataLinhaDigitavel: IGeraBoletoBuilder;
begin
  Result := Self;
end;

function TFormata001.FormataNossoNumero: IGeraBoletoBuilder;
begin
  Result := Self;
end;

function TFormata001.ValidaDados: IGeraBoletoBuilder;
begin
  if FBoleto.GetConta.Banco.DigitoNumero <> DIGITO_NUM then
    raise Exception.Create('D�gito do N�mero do Banco inv�lido!');
  if not IsNumber( FBoleto.GetConta.Conta ) then
    raise Exception.Create('N�mero da Conta inv�lido!');
  Result := Self;
end;

end.

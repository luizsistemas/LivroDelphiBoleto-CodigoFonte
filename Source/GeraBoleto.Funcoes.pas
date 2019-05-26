unit GeraBoleto.Funcoes;

interface

uses
  SysUtils, StrUtils;

  function LeftPad(Value: String; Length: Integer; Pad: Char='0'): string;
  function RightPad(Value: String; Length: Integer; Pad: Char='0'): string;
  function IsNumber(Value: string): Boolean;
  function Modulo11(Valor: string; Base: Integer = 9): string;
  function CalcDigitoVerificadorCodBarras(Valor: string): string;
  function FatorVencimento(AVencimento: TDateTime): string;
  function Modulo10(Valor: string): string;


implementation

function Modulo11(Valor: string; Base: Integer = 9): string;
var
  Soma: Integer;
  Contador, Peso, Resto: Integer;
begin
  Soma := 0;
  Peso := 2;
  for Contador := Length(Valor) downto 1 do
  begin
    Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
    if Peso < Base then
      Peso := Peso + 1
    else
      Peso := 2;
  end;
  Resto := Soma mod 11;
  Result := IntToStr(11 - Resto);
end;

function CalcDigitoVerificadorCodBarras(Valor: string): string;
var
  Soma: Integer;
  Contador, Peso, Resto, Subtracao, Digito: Integer;
begin
  Soma := 0;
  Peso := 2;
  for Contador := Length(Valor) downto 1 do
  begin
    Soma := Soma + (StrToInt(Valor[Contador]) * Peso);
    if Peso < 9 then
      Peso := Peso + 1
    else
      Peso := 2;
  end;
  Resto := Soma mod 11;
  Subtracao := 11 - Resto;
  if Subtracao in [0,1,10,11] then
    Digito := 1
  else
    Digito := Subtracao;
  Result := IntToStr(Digito);
end;

function FatorVencimento(AVencimento: TDateTime): string;
begin
  Result := IntToStr(Trunc(AVencimento - EncodeDate(1997, 10, 7)));
end;

function Modulo10(Valor: string): string;
var
  Soma: string;
  Contador, Peso: Integer;
  Digito: Integer;
begin
  Soma := '';
  Peso := 2;
  for Contador := Length(Valor) downto 1 do
  begin
    Soma :=  Soma + IntToStr(StrToInt(Valor[Contador]) * Peso);
    if Peso = 1 then
      Peso := 2
    else
      Peso := 1;
  end;
  Digito := 0;
  for Contador := 1 to Length(Soma) do
    Digito := Digito + StrToInt(Soma[Contador]);
  Digito := 10 - (Digito mod 10);
  if (Digito > 9) then
    Digito := 0;
  Result := IntToStr(Digito);
end;

function LeftPad(Value: String; Length: Integer; Pad: Char='0'): string;
begin
  Result := RightStr(StringOfChar(Pad, Length) + Value, Length );
end;

function RightPad(Value: String; Length: Integer; Pad: Char='0'): string;
begin
  Result := LeftStr(Value + StringOfChar(Pad, Length), Length );
end;

function IsNumber(Value: string): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 1 to Value.Length do
  begin
    if not (Value[I] in ['0'..'9']) then
    begin
      Result := False;
      Break;
    end;
  end;
end;

end.

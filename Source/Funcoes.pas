unit Funcoes;

interface

uses
  SysUtils, StrUtils;

  function LeftPad(Value: String; Length: Integer; Pad: Char='0'): string;
  function RightPad(Value: String; Length: Integer; Pad: Char='0'): string;
  function IsNumber(Value: string): Boolean;

implementation

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

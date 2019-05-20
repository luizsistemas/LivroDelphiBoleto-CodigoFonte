unit Boleto;

interface

uses
  Pessoa, Conta, Titulo;

type
  IBoleto = interface
    ['{824360BB-E02F-4F7B-9DCE-D4A58B23C79F}']
    function GetBeneficiario: IPessoa;
    function GetConta: IConta;
    function GetPagador: IPessoa;
    function GetTitulo: ITitulo;
  end;

implementation

end.

program GeraBoletoTest;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  DUnitTestRunner,
  Banco in '..\Source\Banco.pas',
  Conta in '..\Source\Conta.pas',
  Pessoa in '..\Source\Pessoa.pas',
  Titulo in '..\Source\Titulo.pas',
  Boleto in '..\Source\Boleto.pas',
  Boleto001 in '..\Source\Boleto001.pas',
  TestBoleto001 in 'TestBoleto001.pas',
  Funcoes in '..\Source\Funcoes.pas',
  Base in '..\Source\Base.pas';

{$R *.RES}

begin
  ReportMemoryLeaksOnShutdown := DebugHook <> 0;
  DUnitTestRunner.RunRegisteredTests;
end.


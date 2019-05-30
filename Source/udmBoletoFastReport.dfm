object dmBoletoFastReport: TdmBoletoFastReport
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 487
  Width = 721
  object Report: TfrxReport
    Tag = 1
    Version = '6.2.16'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 40401.475989294000000000
    ReportOptions.LastChange = 43614.330146388880000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 128
    Top = 24
  end
  object frxDsBoletos: TfrxDBDataset
    UserName = 'frxDsBoletos'
    CloseDataSource = False
    DataSet = dmDadosBoleto.Boletos
    BCDToCurrency = False
    Left = 48
    Top = 80
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 208
    Top = 24
  end
end

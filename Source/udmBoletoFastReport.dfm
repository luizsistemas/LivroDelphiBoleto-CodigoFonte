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
    ReportOptions.LastChange = 43614.384283078700000000
    ScriptLanguage = 'PascalScript'
    StoreInDFM = False
    OnReportPrint = 'frxReportOnReportPrint'
    Left = 128
    Top = 24
  end
  object frxDsBoletos: TfrxDBDataset
    UserName = 'frxDsBoletos'
    CloseDataSource = False
    FieldAliases.Strings = (
      'BancoNumero=BancoNumero'
      'BancoDigito=BancoDigito'
      'BancoNome=BancoNome'
      'ContaLocalPagto=ContaLocalPagto'
      'ContaCodBeneficiario=ContaCodBeneficiario'
      'ContaCarteira=ContaCarteira'
      'BenCnpjCpf=BenCnpjCpf'
      'BenNome=BenNome'
      'BenLogradouro=BenLogradouro'
      'BenNumero=BenNumero'
      'BenBairro=BenBairro'
      'BenCep=BenCep'
      'BenCidade=BenCidade'
      'BenUF=BenUF'
      'BenFone=BenFone'
      'TitData=TitData'
      'TitVencimento=TitVencimento'
      'TitNossoNumero=TitNossoNumero'
      'TitDataProc=TitDataProc'
      'TitDocumento=TitDocumento'
      'TitAceite=TitAceite'
      'TitEspecDoc=TitEspecDoc'
      'TitEspecMoeda=TitEspecMoeda'
      'TitValor=TitValor'
      'TitInstrucoes=TitInstrucoes'
      'PagCnpjCpf=PagCnpjCpf'
      'PagNome=PagNome'
      'PagLogradouro=PagLogradouro'
      'PagNumero=PagNumero'
      'PagBairro=PagBairro'
      'PagCep=PagCep'
      'PagCidade=PagCidade'
      'PagUF=PagUF'
      'PagFone=PagFone'
      'CodigoBarras=CodigoBarras'
      'LinhaDigitavel=LinhaDigitavel')
    DataSet = dmDadosBoleto.Boletos
    BCDToCurrency = False
    Left = 56
    Top = 24
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 208
    Top = 24
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 304
    Top = 24
  end
end

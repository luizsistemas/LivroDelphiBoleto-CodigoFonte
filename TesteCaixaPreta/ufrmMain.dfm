object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Gera'#231#227'o de Boletos: Teste'
  ClientHeight = 617
  ClientWidth = 646
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 576
    Width = 646
    Height = 41
    Align = alBottom
    TabOrder = 5
    object btnAdiciona: TButton
      Left = 1
      Top = 1
      Width = 89
      Height = 39
      Align = alLeft
      Caption = 'Adiciona Boleto'
      TabOrder = 0
      OnClick = btnAdicionaClick
    end
    object btnExclui: TButton
      Left = 90
      Top = 1
      Width = 89
      Height = 39
      Align = alLeft
      Caption = 'Exclui Boleto'
      TabOrder = 1
    end
    object btnImprime: TButton
      Left = 268
      Top = 1
      Width = 89
      Height = 39
      Align = alLeft
      Caption = 'Imprime'
      TabOrder = 3
    end
    object btnImpNoMemo: TButton
      Left = 179
      Top = 1
      Width = 89
      Height = 39
      Align = alLeft
      Caption = 'Ver no Memo'
      TabOrder = 2
      OnClick = btnImpNoMemoClick
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 105
    Width = 646
    Height = 65
    Align = alTop
    Caption = 'Conta'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 69
      Height = 13
      Caption = 'N'#250'mero Banco'
    end
    object Label2: TLabel
      Left = 88
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Ag'#234'ncia'
    end
    object Label4: TLabel
      Left = 168
      Top = 16
      Width = 29
      Height = 13
      Caption = 'Conta'
    end
    object Label7: TLabel
      Left = 336
      Top = 16
      Width = 45
      Height = 13
      Caption = 'Conv'#234'nio'
    end
    object Label8: TLabel
      Left = 432
      Top = 16
      Width = 49
      Height = 13
      Caption = 'Sequ'#234'ncia'
    end
    object Label3: TLabel
      Left = 280
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Carteira'
    end
    object edNumBanco: TEdit
      Left = 8
      Top = 32
      Width = 33
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      Text = '001'
    end
    object edAgencia: TEdit
      Left = 88
      Top = 32
      Width = 41
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 2
      Text = '9999'
    end
    object edDigAgencia: TEdit
      Left = 131
      Top = 32
      Width = 25
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 1
      NumbersOnly = True
      ParentFont = False
      TabOrder = 3
      Text = '9'
    end
    object edConta: TEdit
      Left = 168
      Top = 32
      Width = 73
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 4
      Text = '99999'
    end
    object edDigConta: TEdit
      Left = 243
      Top = 32
      Width = 22
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 1
      ParentFont = False
      TabOrder = 5
      Text = '9'
    end
    object edDigNumero: TEdit
      Left = 44
      Top = 32
      Width = 25
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 1
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
      Text = '9'
    end
    object edConvenio: TEdit
      Left = 336
      Top = 32
      Width = 81
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 7
      Text = '123456'
    end
    object edSequencia: TEdit
      Left = 432
      Top = 32
      Width = 49
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 8
      Text = '1'
    end
    object edCarteira: TEdit
      Left = 280
      Top = 32
      Width = 41
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 6
      Text = '17'
    end
  end
  object GroupBox2: TGroupBox
    Left = 0
    Top = 0
    Width = 646
    Height = 105
    Align = alTop
    Caption = 'Benefici'#225'rio'
    TabOrder = 0
    object Label6: TLabel
      Left = 8
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label11: TLabel
      Left = 240
      Top = 16
      Width = 48
      Height = 13
      Caption = 'CNPJ/CPF'
    end
    object Label12: TLabel
      Left = 8
      Top = 56
      Width = 55
      Height = 13
      Caption = 'Logradouro'
    end
    object Label13: TLabel
      Left = 240
      Top = 56
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label14: TLabel
      Left = 296
      Top = 56
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label15: TLabel
      Left = 400
      Top = 56
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label16: TLabel
      Left = 488
      Top = 56
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label17: TLabel
      Left = 600
      Top = 56
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object edBenNome: TEdit
      Left = 8
      Top = 32
      Width = 225
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = 'Teste Beneficiario'
    end
    object edBenCnpj: TEdit
      Left = 240
      Top = 32
      Width = 129
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = '99.999.999/9999-99'
    end
    object edBenLogradouro: TEdit
      Left = 8
      Top = 72
      Width = 225
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Text = 'Rua Ayn Rand'
    end
    object edBenNumero: TEdit
      Left = 240
      Top = 72
      Width = 49
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = '99'
    end
    object edBenBairro: TEdit
      Left = 296
      Top = 72
      Width = 97
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Text = 'Centro'
    end
    object edBenCep: TEdit
      Left = 400
      Top = 72
      Width = 81
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Text = '99.999-999'
    end
    object edBenCidade: TEdit
      Left = 488
      Top = 72
      Width = 105
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Text = 'Balsas'
    end
    object edBenUF: TEdit
      Left = 600
      Top = 72
      Width = 33
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 7
      Text = 'MA'
    end
  end
  object GroupBox3: TGroupBox
    Left = 0
    Top = 234
    Width = 646
    Height = 101
    Align = alTop
    Caption = 'Pagador'
    TabOrder = 3
    object Label18: TLabel
      Left = 8
      Top = 16
      Width = 27
      Height = 13
      Caption = 'Nome'
    end
    object Label19: TLabel
      Left = 240
      Top = 16
      Width = 48
      Height = 13
      Caption = 'CNPJ/CPF'
    end
    object Label20: TLabel
      Left = 8
      Top = 56
      Width = 55
      Height = 13
      Caption = 'Logradouro'
    end
    object Label21: TLabel
      Left = 240
      Top = 56
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object Label22: TLabel
      Left = 296
      Top = 56
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label23: TLabel
      Left = 400
      Top = 56
      Width = 19
      Height = 13
      Caption = 'CEP'
    end
    object Label24: TLabel
      Left = 488
      Top = 56
      Width = 33
      Height = 13
      Caption = 'Cidade'
    end
    object Label25: TLabel
      Left = 600
      Top = 56
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object edPagNome: TEdit
      Left = 8
      Top = 32
      Width = 225
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = 'Teste Pagador'
    end
    object edPagCnpj: TEdit
      Left = 240
      Top = 32
      Width = 129
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = '99.999.999/9999-99'
    end
    object edPagLogradouro: TEdit
      Left = 8
      Top = 72
      Width = 225
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      Text = 'Rua Ludwig von Mises'
    end
    object edPagNumero: TEdit
      Left = 240
      Top = 72
      Width = 49
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      Text = '99'
    end
    object edPagBairro: TEdit
      Left = 296
      Top = 72
      Width = 97
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Text = 'Centro'
    end
    object edPagCep: TEdit
      Left = 400
      Top = 72
      Width = 81
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Text = '88.888-888'
    end
    object edPagCidade: TEdit
      Left = 488
      Top = 72
      Width = 105
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      Text = 'S'#227'o Paulo'
    end
    object edPagUF: TEdit
      Left = 600
      Top = 72
      Width = 33
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 2
      ParentFont = False
      TabOrder = 7
      Text = 'SP'
    end
  end
  object GroupBox4: TGroupBox
    Left = 0
    Top = 170
    Width = 646
    Height = 64
    Align = alTop
    Caption = 'T'#237'tulo'
    TabOrder = 2
    object Label9: TLabel
      Left = 8
      Top = 16
      Width = 38
      Height = 13
      Caption = 'Emiss'#227'o'
    end
    object Label10: TLabel
      Left = 95
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Vencimento'
    end
    object Label5: TLabel
      Left = 398
      Top = 16
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object Label26: TLabel
      Left = 184
      Top = 16
      Width = 54
      Height = 13
      Caption = 'Documento'
    end
    object Label27: TLabel
      Left = 271
      Top = 16
      Width = 30
      Height = 13
      Caption = 'Aceite'
    end
    object Label28: TLabel
      Left = 311
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Data/Proc.'
    end
    object edData: TEdit
      Left = 8
      Top = 32
      Width = 82
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      Text = '15/04/2019'
    end
    object edVencimento: TEdit
      Left = 95
      Top = 32
      Width = 82
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      Text = '15/06/2019'
    end
    object edValor: TEdit
      Left = 398
      Top = 32
      Width = 82
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      Text = '300'
    end
    object edDocumento: TEdit
      Left = 184
      Top = 32
      Width = 81
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 2
      Text = 'Dup0230/3'
    end
    object edAceite: TEdit
      Left = 271
      Top = 32
      Width = 34
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 1
      ParentFont = False
      TabOrder = 3
      Text = 'N'
    end
    object edDataProc: TEdit
      Left = 311
      Top = 32
      Width = 82
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      Text = '15/04/2019'
    end
  end
  object memObs: TMemo
    Left = 0
    Top = 335
    Width = 646
    Height = 241
    Align = alClient
    TabOrder = 4
  end
end

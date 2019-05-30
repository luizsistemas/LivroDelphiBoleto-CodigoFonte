object dmDadosBoleto: TdmDadosBoleto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 464
  Width = 501
  object Boletos: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 48
    Top = 24
    object BoletosBancoNumero: TStringField
      FieldName = 'BancoNumero'
      Size = 3
    end
    object BoletosBancoDigito: TStringField
      FieldName = 'BancoDigito'
      Size = 1
    end
    object BoletosBancoNome: TStringField
      FieldName = 'BancoNome'
      Size = 60
    end
    object BoletosContaLocalPagto: TStringField
      FieldName = 'ContaLocalPagto'
      Size = 200
    end
    object BoletosContaCodBeneficiario: TStringField
      FieldName = 'ContaCodBeneficiario'
      Size = 30
    end
    object BoletosContaCarteira: TStringField
      FieldName = 'ContaCarteira'
      Size = 5
    end
    object BoletosBenCnpjCpf: TStringField
      FieldName = 'BenCnpjCpf'
    end
    object BoletosBenNome: TStringField
      FieldName = 'BenNome'
      Size = 100
    end
    object BoletosBenLogradouro: TStringField
      FieldName = 'BenLogradouro'
      Size = 100
    end
    object BoletosBenNumero: TStringField
      FieldName = 'BenNumero'
      Size = 15
    end
    object BoletosBenBairro: TStringField
      FieldName = 'BenBairro'
      Size = 60
    end
    object BoletosBenCep: TStringField
      FieldName = 'BenCep'
      Size = 15
    end
    object BoletosBenCidade: TStringField
      FieldName = 'BenCidade'
      Size = 100
    end
    object BoletosBenUF: TStringField
      FieldName = 'BenUF'
      Size = 2
    end
    object BoletosBenFone: TStringField
      FieldName = 'BenFone'
    end
    object BoletosTitData: TDateTimeField
      FieldName = 'TitData'
    end
    object BoletosTitVencimento: TDateTimeField
      FieldName = 'TitVencimento'
    end
    object BoletosTitNossoNumero: TStringField
      FieldName = 'TitNossoNumero'
      Size = 30
    end
    object BoletosTitDataProc: TDateTimeField
      FieldName = 'TitDataProc'
    end
    object BoletosTitDocumento: TStringField
      FieldName = 'TitDocumento'
      Size = 30
    end
    object BoletosTitAceite: TStringField
      FieldName = 'TitAceite'
      Size = 5
    end
    object BoletosTitEspecDoc: TStringField
      FieldName = 'TitEspecDoc'
      Size = 5
    end
    object BoletosTitEspecMoeda: TStringField
      FieldName = 'TitEspecMoeda'
      Size = 5
    end
    object BoletosTitValor: TCurrencyField
      FieldName = 'TitValor'
    end
    object BoletosTitInstrucoes: TMemoField
      FieldName = 'TitInstrucoes'
      BlobType = ftMemo
    end
    object BoletosPagCnpjCpf: TStringField
      FieldName = 'PagCnpjCpf'
    end
    object BoletosPagNome: TStringField
      FieldName = 'PagNome'
      Size = 100
    end
    object BoletosPagLogradouro: TStringField
      FieldName = 'PagLogradouro'
      Size = 100
    end
    object BoletosPagNumero: TStringField
      FieldName = 'PagNumero'
      Size = 15
    end
    object BoletosPagBairro: TStringField
      FieldName = 'PagBairro'
      Size = 60
    end
    object BoletosPagCep: TStringField
      FieldName = 'PagCep'
      Size = 15
    end
    object BoletosPagCidade: TStringField
      FieldName = 'PagCidade'
      Size = 100
    end
    object BoletosPagUF: TStringField
      FieldName = 'PagUF'
      Size = 2
    end
    object BoletosPagFone: TStringField
      FieldName = 'PagFone'
    end
    object BoletosCodigoBarras: TStringField
      FieldName = 'CodigoBarras'
      Size = 60
    end
    object BoletosLinhaDigitavel: TStringField
      FieldName = 'LinhaDigitavel'
      Size = 60
    end
  end
end

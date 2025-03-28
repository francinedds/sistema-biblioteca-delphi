object ServiceConexao: TServiceConexao
  Height = 759
  Width = 174
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Users\EMANUEL\Desktop\banco\BANCOFDDS.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 72
    Top = 72
  end
  object FDQuery_CadastrarLivros: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'select * from livros')
    Left = 72
    Top = 256
    object FDQuery_CadastrarLivrosLIV_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'LIV_CODIGO'
      Origin = 'LIV_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery_CadastrarLivrosLIV_TITULO: TStringField
      FieldName = 'LIV_TITULO'
      Origin = 'LIV_TITULO'
      Size = 255
    end
    object FDQuery_CadastrarLivrosLIV_AUTOR: TStringField
      FieldName = 'LIV_AUTOR'
      Origin = 'LIV_AUTOR'
      Size = 255
    end
    object FDQuery_CadastrarLivrosLIV_ANO_PUBLICACAO: TIntegerField
      FieldName = 'LIV_ANO_PUBLICACAO'
      Origin = 'LIV_ANO_PUBLICACAO'
    end
    object FDQuery_CadastrarLivrosLIV_STATUS: TStringField
      FieldName = 'LIV_STATUS'
      Origin = 'LIV_STATUS'
      Size = 10
    end
  end
  object FDQuery_CadastrarClientes: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'select * from pessoas')
    Left = 72
    Top = 184
    object FDQuery_CadastrarClientesPES_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'PES_CODIGO'
      Origin = 'PES_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery_CadastrarClientesPES_NOMECOMPLETO: TStringField
      FieldName = 'PES_NOMECOMPLETO'
      Origin = 'PES_NOMECOMPLETO'
      Size = 200
    end
    object FDQuery_CadastrarClientesPES_TELEFONE: TStringField
      FieldName = 'PES_TELEFONE'
      Origin = 'PES_TELEFONE'
      Size = 50
    end
    object FDQuery_CadastrarClientesPES_EMAIL: TStringField
      FieldName = 'PES_EMAIL'
      Origin = 'PES_EMAIL'
      Size = 200
    end
  end
  object FDQuery_Emprestimos: TFDQuery
    Active = True
    Connection = FDConnection
    SQL.Strings = (
      'select * from emprestimos')
    Left = 72
    Top = 328
    object FDQuery_EmprestimosEMP_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'EMP_CODIGO'
      Origin = 'EMP_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery_EmprestimosEMP_CLIENTE: TIntegerField
      FieldName = 'EMP_CLIENTE'
      Origin = 'EMP_CLIENTE'
    end
    object FDQuery_EmprestimosEMP_LIVRO: TIntegerField
      FieldName = 'EMP_LIVRO'
      Origin = 'EMP_LIVRO'
    end
    object FDQuery_EmprestimosEMP_DATA_EMPRESTIMO: TDateField
      FieldName = 'EMP_DATA_EMPRESTIMO'
      Origin = 'EMP_DATA_EMPRESTIMO'
    end
  end
  object FDQuery_Login: TFDQuery
    Connection = FDConnection
    SQL.Strings = (
      
        'SELECT * FROM login WHERE log_usuario = :log_usuario AND log_sen' +
        'ha = :log_senha')
    Left = 72
    Top = 400
    ParamData = <
      item
        Name = 'LOG_USUARIO'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end
      item
        Name = 'LOG_SENHA'
        DataType = ftString
        ParamType = ptInput
        Size = 50
      end>
    object FDQuery_LoginLOG_CODIGO: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'LOG_CODIGO'
      Origin = 'LOG_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQuery_LoginLOG_USUARIO: TStringField
      FieldName = 'LOG_USUARIO'
      Origin = 'LOG_USUARIO'
      Size = 50
    end
    object FDQuery_LoginLOG_SENHA: TStringField
      FieldName = 'LOG_SENHA'
      Origin = 'LOG_SENHA'
      Size = 50
    end
    object FDQuery_LoginLOG_CARGO: TStringField
      FieldName = 'LOG_CARGO'
      Origin = 'LOG_CARGO'
      Size = 50
    end
  end
  object frxReport: TfrxReport
    Version = '6.9.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45740.601676539400000000
    ReportOptions.LastChange = 45740.614820185180000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 72
    Top = 544
    Datasets = <
      item
        DataSet = frxDBDataset_Livros
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 58.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 6.102350000000000000
          Width = 218.488250000000000000
          Height = 24.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -20
          Font.Name = 'tahoma'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Relat'#243'rio de Livros')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 9.000000000000000000
          Top = 40.000000000000000000
          Width = 698.488250000000000000
          Height = 0.102350000000000000
          Frame.Typ = []
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 102.047310000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 2.629870000000000000
          Width = 80.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'C'#243'digo')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 104.000000000000000000
          Top = 1.629870000000000000
          Width = 96.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'T'#237'tulo do Livro')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 319.000000000000000000
          Top = 2.629870000000000000
          Width = 96.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Autor do Livro')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 477.000000000000000000
          Top = 1.629870000000000000
          Width = 117.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ano de Publica'#231#227'o')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 624.000000000000000000
          Top = 1.629870000000000000
          Width = 117.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Status')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 28.677180000000000000
        Top = 185.196970000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset_Livros
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1LIV_CODIGO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 4.480210000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'LIV_CODIGO'
          DataSet = frxDBDataset_Livros
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."LIV_CODIGO"]')
          ParentFont = False
        end
        object frxDBDataset1LIV_TITULO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 104.000000000000000000
          Top = 3.480210000000000000
          Width = 187.630180000000000000
          Height = 18.897650000000000000
          DataField = 'LIV_TITULO'
          DataSet = frxDBDataset_Livros
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."LIV_TITULO"]')
        end
        object frxDBDataset1LIV_AUTOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 319.000000000000000000
          Top = 4.480210000000000000
          Width = 135.630180000000000000
          Height = 18.897650000000000000
          DataField = 'LIV_AUTOR'
          DataSet = frxDBDataset_Livros
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."LIV_AUTOR"]')
        end
        object frxDBDataset1LIV_ANO_PUBLICACAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 479.000000000000000000
          Top = 3.480210000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'LIV_ANO_PUBLICACAO'
          DataSet = frxDBDataset_Livros
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."LIV_ANO_PUBLICACAO"]')
        end
        object frxDBDataset1LIV_STATUS: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 624.000000000000000000
          Top = 4.480210000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'LIV_STATUS'
          DataSet = frxDBDataset_Livros
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."LIV_STATUS"]')
        end
      end
    end
  end
  object frxDBDataset_Livros: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = FDQuery_CadastrarLivros
    BCDToCurrency = False
    Left = 72
    Top = 608
  end
end

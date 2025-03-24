object ViewLogin: TViewLogin
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'ViewLogin'
  ClientHeight = 268
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object pnlLeft: TPanel
    AlignWithMargins = True
    Left = 2
    Top = 2
    Width = 185
    Height = 264
    Margins.Left = 2
    Margins.Top = 2
    Margins.Right = 0
    Margins.Bottom = 2
    Align = alLeft
    BevelOuter = bvNone
    Color = 4149117
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 3
    ExplicitTop = 3
    ExplicitHeight = 262
    object Image1: TImage
      Left = 8
      Top = 8
      Width = 41
      Height = 41
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D494844520000001E0000
        001E08060000003B30AEA2000000097048597300000B1300000B1301009A9C18
        000000D14944415478DA63641820C038E82CFEFFFFBF2D903207626632CDFE0B
        C4271919190F136D31D0D27C2035814A9ECB035A3E99588B9F0329092A59FC02
        68B124B116FF87321B819A1A4811433203C4AF075B0204A3168F5A4C8CC5D380
        F81D109F00E22DF4B4181B18DE161F04E27620B60462500927406B8B0F800C02
        F20F22A903595A00C41F80E213686231A960D4E2518B472D1EB598EE163F0352
        920CD4014F81F6CA106B711E909A48054B4121076ADE4E21CA62A8E53640CA11
        88B9C9B4F42B10EF035A7A149BE4E0EBC2D01A0000011A2A2E21F37FF0000000
        0049454E44AE426082}
    end
    object pnlEmpresa: TPanel
      Left = 0
      Top = 218
      Width = 185
      Height = 46
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      ExplicitTop = 216
      object lblTituloEmpresa: TLabel
        Left = 42
        Top = 2
        Width = 100
        Height = 18
        Caption = 'BIBLIOTECA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -21
        Font.Name = 'Terminal'
        Font.Style = []
        ParentFont = False
      end
      object lblNomeEmpresa: TLabel
        Left = 34
        Top = 22
        Width = 116
        Height = 14
        Caption = 'Nome da Biblioteca'
        Color = 7895383
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBtnFace
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
  end
  object pnlContent: TPanel
    AlignWithMargins = True
    Left = 187
    Top = 2
    Width = 348
    Height = 264
    Margins.Left = 0
    Margins.Top = 2
    Margins.Right = 2
    Margins.Bottom = 2
    Align = alClient
    BevelOuter = bvNone
    Color = 11061214
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    ExplicitLeft = 188
    ExplicitTop = 3
    ExplicitWidth = 346
    ExplicitHeight = 262
    object lblUsuario: TLabel
      Left = 41
      Top = 72
      Width = 110
      Height = 14
      Caption = 'Digite seu usu'#225'rio'
      Color = 11127007
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lblSenha: TLabel
      Left = 41
      Top = 123
      Width = 101
      Height = 14
      Caption = 'Digite sua senha'
      Color = 11127007
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object btnClose: TSpeedButton
      Left = 328
      Top = 1
      Width = 17
      Height = 16
      Cursor = crHandPoint
      Caption = #10006
      Flat = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      OnClick = btnCloseClick
    end
    object edtUsuario: TEdit
      Left = 41
      Top = 95
      Width = 265
      Height = 22
      BorderStyle = bsNone
      TabOrder = 0
    end
    object edtSenha: TEdit
      Left = 41
      Top = 144
      Width = 265
      Height = 22
      BorderStyle = bsNone
      TabOrder = 1
    end
    object pnlBtnEntrar: TPanel
      Left = 177
      Top = 184
      Width = 129
      Height = 33
      BevelOuter = bvNone
      Color = 4149117
      ParentBackground = False
      TabOrder = 2
      object btnEntrar: TSpeedButton
        Left = 0
        Top = 0
        Width = 129
        Height = 33
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Entrar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = btnEntrarClick
        ExplicitTop = 8
      end
    end
  end
end

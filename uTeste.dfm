object frmTesteTarget: TfrmTesteTarget
  Left = 0
  Top = 0
  Caption = 'Teste'
  ClientHeight = 479
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object gbFibonacci: TGroupBox
    Left = 0
    Top = 0
    Width = 662
    Height = 105
    Align = alTop
    Caption = 
      '<< Fun'#231#227'o para informar se um n'#250'mero pertence a sequ'#234'ncia de Fib' +
      'onacci >>'
    TabOrder = 0
    ExplicitLeft = 224
    ExplicitTop = 232
    ExplicitWidth = 185
    object edtFibonacci: TEdit
      Left = 24
      Top = 24
      Width = 185
      Height = 21
      TabOrder = 0
      OnKeyPress = edtFibonacciKeyPress
    end
    object btnFibonacci: TButton
      Left = 24
      Top = 51
      Width = 185
      Height = 25
      Caption = 'Verificar Fibonacci'
      TabOrder = 1
      OnClick = btnFibonacciClick
    end
  end
  object gbStringInversa: TGroupBox
    Left = 0
    Top = 105
    Width = 662
    Height = 105
    Align = alTop
    Caption = '<< Fun'#231#227'o para Inverter String >>'
    TabOrder = 1
    ExplicitTop = 8
    ExplicitWidth = 649
    object lbStringInvertida: TLabel
      Left = 248
      Top = 32
      Width = 152
      Height = 23
      Alignment = taCenter
      Caption = 'String Invertida'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edtString: TEdit
      Left = 24
      Top = 24
      Width = 185
      Height = 21
      TabOrder = 0
    end
    object btnInverterString: TButton
      Left = 24
      Top = 51
      Width = 185
      Height = 25
      Caption = 'Inverter String'
      TabOrder = 1
      OnClick = btnInverterStringClick
    end
  end
  object gbCalculaPercentual: TGroupBox
    Left = 0
    Top = 210
    Width = 662
    Height = 105
    Align = alTop
    Caption = '<< Fun'#231#227'o para calcular percentual de faturmaneto por Estado >>'
    TabOrder = 2
    ExplicitTop = 216
    ExplicitWidth = 649
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object lbTotalFaturamento: TLabel
      Left = 406
      Top = 46
      Width = 139
      Height = 16
      Caption = 'Total do Faturamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbPercentualEstados: TComboBox
      Left = 24
      Top = 41
      Width = 185
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Items.Strings = (
        'SP - R$ 67836,43'
        'RJ - R$ 36678,66'
        'MG - R$ 29229,88'
        'ES - R$ 27165,48'
        'Outros - R$ 19849,53')
    end
    object btnCalcularTotal: TButton
      Left = 24
      Top = 68
      Width = 185
      Height = 25
      Caption = 'Calcular Total'
      TabOrder = 1
      OnClick = btnCalcularTotalClick
    end
    object btnCalcularPercentual: TButton
      Left = 215
      Top = 68
      Width = 185
      Height = 25
      Caption = 'Calcular Percentual do Estado'
      TabOrder = 2
      OnClick = btnCalcularPercentualClick
    end
  end
  object gbLerArquivo: TGroupBox
    Left = 0
    Top = 315
    Width = 662
    Height = 105
    Align = alTop
    Caption = '<< Fun'#231#227'o Para Ler Arquivo e Calcular valores >>'
    TabOrder = 3
    ExplicitTop = 218
    object Label2: TLabel
      Left = 24
      Top = 24
      Width = 33
      Height = 13
      Caption = 'Estado'
    end
    object btnExibirMaior: TButton
      Left = 24
      Top = 68
      Width = 185
      Height = 25
      Caption = 'Exibir Maior Valor'
      TabOrder = 0
      OnClick = btnExibirMaiorClick
    end
    object edtArquivo: TEdit
      Left = 24
      Top = 41
      Width = 297
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object btnCarregarJson: TButton
      Left = 324
      Top = 39
      Width = 108
      Height = 25
      Caption = 'Carregar arquivo'
      TabOrder = 2
      OnClick = btnCarregarJsonClick
    end
    object btnExibirMenor: TButton
      Left = 215
      Top = 68
      Width = 185
      Height = 25
      Caption = 'Exibir Menor Valor'
      TabOrder = 3
      OnClick = btnExibirMenorClick
    end
  end
  object OpJson: TOpenDialog
    Left = 416
    Top = 424
  end
end

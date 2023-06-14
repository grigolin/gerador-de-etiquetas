object FmrPrincipal: TFmrPrincipal
  Left = 174
  Top = 138
  Width = 980
  Height = 507
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 969
    Height = 473
    Align = alCustom
    Alignment = taLeftJustify
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    object Label1: TLabel
      Left = 30
      Top = 24
      Width = 81
      Height = 25
      Caption = 'Pesquisa:'
    end
    object Label2: TLabel
      Left = 680
      Top = 56
      Width = 96
      Height = 25
      Caption = 'Impress'#227'o:'
    end
    object btnAdicionar: TBitBtn
      Left = 159
      Top = 376
      Width = 132
      Height = 38
      Caption = 'Adicionar a Fila'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnAdicionarClick
    end
    object btnRemover: TBitBtn
      Left = 608
      Top = 378
      Width = 132
      Height = 37
      Caption = 'Remover da Fila'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnRemoverClick
    end
    object BtnImprimir: TBitBtn
      Left = 752
      Top = 378
      Width = 132
      Height = 37
      Caption = 'Impress'#227'o'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clDefault
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = BtnImprimirClick
    end
    object btnAlterar: TBitBtn
      Left = 176
      Top = 424
      Width = 100
      Height = 37
      Caption = 'Editar'
      TabOrder = 3
      OnClick = btnAlterarClick
    end
    object btnExcluir: TBitBtn
      Left = 288
      Top = 424
      Width = 100
      Height = 37
      Caption = 'Excluir'
      TabOrder = 4
      OnClick = btnExcluirClick
    end
    object btnCadastrar: TBitBtn
      Left = 64
      Top = 424
      Width = 100
      Height = 37
      Caption = 'Cadastrar'
      TabOrder = 5
      OnClick = btnCadastrarClick
    end
    object CheckBox3: TCheckBox
      Left = 641
      Top = 432
      Width = 121
      Height = 25
      Caption = 'Pular Linha'
      TabOrder = 6
      OnClick = CheckBox3Click
    end
    object Panel1: TPanel
      Left = 770
      Top = 424
      Width = 129
      Height = 41
      TabOrder = 7
      Visible = False
      object Button1: TButton
        Left = 56
        Top = 8
        Width = 33
        Height = 25
        Caption = '+'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 88
        Top = 8
        Width = 33
        Height = 25
        Caption = '-'
        TabOrder = 1
        OnClick = Button2Click
      end
      object Edit1: TEdit
        Left = 8
        Top = 8
        Width = 41
        Height = 25
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        Text = '0'
      end
    end
    object CheckBox1: TCheckBox
      Left = 508
      Top = 432
      Width = 105
      Height = 25
      Caption = 'Imagem'
      TabOrder = 8
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 96
    Width = 465
    Height = 273
    Align = alCustom
    BorderStyle = bsNone
    Ctl3D = True
    DataSource = DataSource1
    FixedColor = clMedGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'serial'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 504
    Top = 96
    Width = 465
    Height = 273
    Align = alCustom
    BorderStyle = bsNone
    Ctl3D = True
    DataSource = DSGridEtiquetas
    FixedColor = clMedGray
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Width = 28
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nome'
        Width = 250
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'serial'
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Visible = True
      end>
  end
  object EditPesquisa: TEdit
    Left = 29
    Top = 56
    Width = 252
    Height = 21
    TabOrder = 3
    OnChange = EditPesquisaChange
  end
  object MainMenu1: TMainMenu
    Left = 976
    Top = 400
  end
  object Conexao: TZConnection
    Protocol = 'postgresql-7'
    HostName = 'localhost'
    Port = 5432
    Database = 'impressao'
    User = 'postgres'
    Password = 'postdba'
    Connected = True
    Left = 928
    Top = 272
  end
  object DataSource1: TDataSource
    DataSet = QrySelectGeral
    Left = 928
    Top = 304
  end
  object QrySelectGeral: TZQuery
    Connection = Conexao
    Active = True
    SQL.Strings = (
      'SELECT * FROM IMPRESSAO;')
    Params = <>
    Left = 928
    Top = 336
  end
  object DSGridEtiquetas: TDataSource
    DataSet = QrySelectEtiquetas
    Left = 928
    Top = 368
  end
  object QrySelectEtiquetas: TZQuery
    Connection = Conexao
    Active = True
    SQL.Strings = (
      'SELECT * FROM IMPRESSAO WHERE PENDENTE = TRUE;')
    Params = <>
    Left = 928
    Top = 400
  end
end

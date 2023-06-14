object FmrImpressao: TFmrImpressao
  Left = 214
  Top = 121
  Width = 961
  Height = 566
  Caption = 'Impressao'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object RelEtiquetas: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DSEtiquetas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    BeforePrint = RelEtiquetasBeforePrint
    object RLDetailGrid1: TRLDetailGrid
      Left = 38
      Top = 38
      Width = 718
      Height = 227
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = False
      ColCount = 3
      ColSpacing = 2.000000000000000000
      object RLPanel1: TRLPanel
        Left = 8
        Top = 16
        Width = 217
        Height = 201
        BeforePrint = RLPanel1BeforePrint
        object RLDraw1: TRLDraw
          Left = 1
          Top = 4
          Width = 216
          Height = 197
        end
        object RLDBBarcode1: TRLDBBarcode
          Left = 12
          Top = 140
          Width = 104
          Height = 57
          BarcodeType = bcEAN13
          DataField = 'codigobarra'
          DataSource = DSEtiquetas
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          InvalidCode = icCrossOut
          Margins.LeftMargin = 1.000000000000000000
          Margins.RightMargin = 1.000000000000000000
          ParentFont = False
          ShowText = boCode
        end
        object RLDBText1: TRLDBText
          Left = 1
          Top = 0
          Width = 216
          Height = 57
          AutoSize = False
          Color = clMenuHighlight
          DataField = 'nome'
          DataSource = DSEtiquetas
          Font.Charset = ANSI_CHARSET
          Font.Color = clNone
          Font.Height = -19
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          Layout = tlCenter
          ParentColor = False
          ParentFont = False
          Transparent = False
        end
        object RLDBText2: TRLDBText
          Left = 13
          Top = 80
          Width = 44
          Height = 24
          DataField = 'serial'
          DataSource = DSEtiquetas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          Layout = tlCenter
          ParentFont = False
        end
        object RLDBText3: TRLDBText
          Left = 13
          Top = 110
          Width = 39
          Height = 24
          DataField = 'data'
          DataSource = DSEtiquetas
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -17
          Font.Name = 'Segoe UI'
          Font.Style = []
          Layout = tlCenter
          ParentFont = False
        end
        object RLImage2: TRLImage
          Left = 24
          Top = 5
          Width = 137
          Height = 68
          Scaled = True
          Transparent = False
        end
      end
    end
    object RLBand1: TRLBand
      Left = 38
      Top = 265
      Width = 718
      Height = 16
      BandType = btSummary
      AfterPrint = RLBand1AfterPrint
    end
  end
  object QryRelatorioEtiquetas: TZQuery
    Connection = FmrPrincipal.Conexao
    Params = <>
    Left = 864
  end
  object DSEtiquetas: TDataSource
    DataSet = QryRelatorioEtiquetas
    Left = 864
    Top = 29
  end
end

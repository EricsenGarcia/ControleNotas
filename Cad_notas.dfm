inherited FrmCad_notas: TFrmCad_notas
  Caption = 'Cadastro de notas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    ExplicitLeft = 0
    ExplicitWidth = 557
    inherited Label1: TLabel
      Caption = 'Cadastro de notas'
    end
  end
  inherited PageControl1: TPageControl
    ActivePage = TbConsulta
    inherited TbConsulta: TTabSheet
      ExplicitHeight = 308
      inherited JvDBGrid1: TJvDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Width = 215
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTA_01'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTA_02'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTA_03'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOTA_04'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            Width = 50
            Visible = True
          end>
      end
      inherited Panel4: TPanel
        ExplicitTop = 251
        ExplicitWidth = 529
        inherited BtnAlterar: TJvImgBtn
          ExplicitLeft = 348
          ExplicitTop = 4
        end
      end
    end
    inherited TbCadastro: TTabSheet
      ExplicitHeight = 308
      object Label2: TLabel [0]
        Left = 49
        Top = 24
        Width = 10
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Id'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label3: TLabel [1]
        Left = 32
        Top = 56
        Width = 27
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label4: TLabel [2]
        Left = 27
        Top = 92
        Width = 32
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Nota 1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label5: TLabel [3]
        Left = 27
        Top = 126
        Width = 32
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Nota 2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label6: TLabel [4]
        Left = 190
        Top = 92
        Width = 32
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Nota 3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label7: TLabel [5]
        Left = 190
        Top = 126
        Width = 32
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = 'Nota 4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      object Label8: TLabel [6]
        Left = 67
        Top = 148
        Width = 126
        Height = 13
        BiDiMode = bdLeftToRight
        Caption = '*Informar notas de 0 a 10'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
      end
      inherited Panel1: TPanel
        ExplicitTop = 251
        ExplicitWidth = 529
        inherited BtnEliminar: TJvImgBtn
          OnClick = BtnEliminarClick
          ExplicitLeft = 348
        end
        inherited BtnGravar: TJvImgBtn
          OnClick = BtnGravarClick
        end
      end
      object edId: TEdit
        Left = 65
        Top = 21
        Width = 48
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object edNota1: TJvCalcEdit
        Left = 65
        Top = 88
        Width = 64
        Height = 21
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 10.000000000000000000
        ParentFont = False
        ShowButton = False
        TabOrder = 3
        DecimalPlacesAlwaysShown = False
      end
      object edNota2: TJvCalcEdit
        Left = 65
        Top = 122
        Width = 64
        Height = 21
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 10.000000000000000000
        ParentFont = False
        ShowButton = False
        TabOrder = 4
        DecimalPlacesAlwaysShown = False
      end
      object edNota3: TJvCalcEdit
        Left = 225
        Top = 88
        Width = 64
        Height = 21
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 10.000000000000000000
        ParentFont = False
        ShowButton = False
        TabOrder = 5
        DecimalPlacesAlwaysShown = False
      end
      object edNota4: TJvCalcEdit
        Left = 225
        Top = 122
        Width = 64
        Height = 21
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        MaxValue = 10.000000000000000000
        ParentFont = False
        ShowButton = False
        TabOrder = 6
        DecimalPlacesAlwaysShown = False
      end
      object DBAlunos: TDBLookupComboBox
        Left = 65
        Top = 52
        Width = 440
        Height = 21
        KeyField = 'ID'
        ListField = 'NOME'
        ListSource = dsAluno
        TabOrder = 2
      end
    end
  end
  inherited FDCons: TFDQuery
    SQL.Strings = (
      'Select a.nome, n.* '
      'from notas n'
      'inner join alunos a on n.id_aluno = a.id')
    Left = 504
    object FDConsNOME: TStringField
      DisplayLabel = 'Aluno'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
    object FDConsID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDConsID_ALUNO: TIntegerField
      FieldName = 'ID_ALUNO'
      Origin = 'ID_ALUNO'
    end
    object FDConsNOTA_01: TBCDField
      DisplayLabel = 'Nota 1'
      FieldName = 'NOTA_01'
      Origin = 'NOTA_01'
      Precision = 18
      Size = 2
    end
    object FDConsNOTA_02: TBCDField
      DisplayLabel = 'Nota 2'
      FieldName = 'NOTA_02'
      Origin = 'NOTA_02'
      Precision = 18
      Size = 2
    end
    object FDConsNOTA_03: TBCDField
      DisplayLabel = 'Nota 3'
      FieldName = 'NOTA_03'
      Origin = 'NOTA_03'
      Precision = 18
      Size = 2
    end
    object FDConsNOTA_04: TBCDField
      DisplayLabel = 'Nota 4'
      FieldName = 'NOTA_04'
      Origin = 'NOTA_04'
      Precision = 18
      Size = 2
    end
  end
  inherited dsCons: TDataSource
    Left = 504
  end
  object FDAluno: TFDQuery
    Connection = Dm.FDC
    SQL.Strings = (
      'Select *'
      'from alunos a ')
    Left = 408
    Top = 152
    object FDAlunoID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDAlunoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
  end
  object dsAluno: TDataSource
    DataSet = FDAluno
    Left = 408
    Top = 208
  end
end

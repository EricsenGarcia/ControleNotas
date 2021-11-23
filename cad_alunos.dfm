inherited FrmCad_alunos: TFrmCad_alunos
  Caption = 'Cadastro de alunos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel3: TPanel
    ExplicitLeft = 0
    ExplicitWidth = 557
    inherited Label1: TLabel
      Caption = 'Cadastro de alunos'
    end
  end
  inherited PageControl1: TPageControl
    inherited TbConsulta: TTabSheet
      ExplicitHeight = 308
      inherited JvDBGrid1: TJvDBGrid
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME'
            Width = 418
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
      object edNome: TEdit
        Left = 65
        Top = 53
        Width = 440
        Height = 21
        MaxLength = 255
        TabOrder = 2
      end
    end
  end
  inherited FDCons: TFDQuery
    SQL.Strings = (
      'Select * '
      'from alunos')
    object FDConsID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDConsNOME: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'NOME'
      Origin = 'NOME'
      Size = 255
    end
  end
end

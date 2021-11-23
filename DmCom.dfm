object Dm: TDm
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 344
  Width = 254
  object FDC: TFDConnection
    Params.Strings = (
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    FetchOptions.AssignedValues = [evRowsetSize, evRecordCountMode, evCursorKind, evDetailCascade]
    FetchOptions.CursorKind = ckDefault
    FetchOptions.RowsetSize = 100000
    FetchOptions.DetailCascade = True
    UpdateOptions.AssignedValues = [uvLockMode, uvLockWait, uvUpdateNonBaseFields]
    UpdateOptions.UpdateNonBaseFields = True
    UpdateOptions.LockMode = lmPessimistic
    UpdateOptions.LockWait = True
    TxOptions.EnableNested = False
    LoginPrompt = False
    Left = 104
    Top = 48
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 101
    Top = 104
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 101
    Top = 168
  end
  object FDPhysDataSnapDriverLink1: TFDPhysDataSnapDriverLink
    Left = 101
    Top = 232
  end
end

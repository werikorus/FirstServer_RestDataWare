object DataModule1: TDataModule1
  OldCreateOrder = False
  Encoding = esASCII
  Height = 418
  Width = 534
  object FDConnect: TFDConnection
    Params.Strings = (
      'Database=RadFolha'
      'User_Name=sa'
      'Password=rad@123'
      'Server=DEV-15\RADINFO'
      'DriverID=MSSQL')
    Left = 40
    Top = 144
  end
  object FDTransaction1: TFDTransaction
    Connection = FDConnect
    Left = 40
    Top = 192
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 41
    Top = 248
  end
  object RESTDWPoolerDB1: TRESTDWPoolerDB
    RESTDriver = RESTDWDriverFD1
    Compression = True
    Encoding = esUtf8
    StrsTrim = False
    StrsEmpty2Null = False
    StrsTrim2Len = True
    Active = True
    PoolerOffMessage = 'RESTPooler not active.'
    ParamCreate = True
    Left = 40
    Top = 32
  end
  object RESTDWDriverFD1: TRESTDWDriverFD
    CommitRecords = 100
    Connection = FDConnect
    Left = 40
    Top = 88
  end
  object dwEvents: TDWServerEvents
    IgnoreInvalidParams = False
    Events = <
      item
        Routes = [crAll]
        DWParams = <
          item
            TypeObject = toParam
            ObjectDirection = odIN
            ObjectValue = ovString
            ParamName = 'meudado'
            Encoded = True
          end>
        JsonMode = jmPureJSON
        Name = 'meuevento'
        OnReplyEvent = dwEventsEventsmeueventoReplyEvent
      end>
    ContextName = 'meucontexto'
    Left = 400
    Top = 48
  end
end

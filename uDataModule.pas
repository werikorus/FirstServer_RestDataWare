unit uDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.UI, FireDAC.Comp.Client, Data.DB, UdWDataModule,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, uRESTDWDriverRDW,
  uRESTDWPoolerDB, uRestDWDriverFD, uDWAbout, uRESTDWServerEvents, uDWJSONObject;

type
  TDataModule1 = class(TServerMethodDataModule)
    FDConnect: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    RESTDWPoolerDB1: TRESTDWPoolerDB;
    RESTDWDriverFD1: TRESTDWDriverFD;
    dwEvents: TDWServerEvents;
    procedure dwEventsEventsmeueventoReplyEvent(var Params: TDWParams;
      var Result: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  uMain;

procedure TDataModule1.dwEventsEventsmeueventoReplyEvent(
  var Params: TDWParams; var Result: string);
begin
  if Params.ItemsString['meudado'] <> nil then
   begin
    if Params.ItemsString['meudado'].AsString <> '' then
     Result := Format('{"reply":"Existe meu dado e seu valor é :%s"}',[Params.ItemsString['meudado'].AsString])
    else
     Result := '{"reply":"Existe meu dado, porém não foi enviado nada"}';
   end
  else
  result := '{"reply":"não existe meu dado"}';

end;

end.

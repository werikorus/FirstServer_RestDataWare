program FirstServer;

uses
  Vcl.Forms,
  uDataModule in 'uDataModule.pas' {DataModule1: TDataModule},
  uMain in 'uMain.pas' {frmMain},
  uEvents in 'uEvents.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

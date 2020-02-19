unit uMain;
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait, Vcl.StdCtrls,
  uRESTDWBase, FireDAC.Comp.UI, FireDAC.Comp.Client, Data.DB,
  uRESTDWPoolerDB, uRestDWDriverFD, uDWAbout, uRESTDWDriverRDW, Vcl.Grids,
  Vcl.DBGrids, Vcl.DBLookup, Vcl.WinXCtrls, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, cxCheckBox,
  dxToggleSwitch, dxGDIPlusClasses, Vcl.ExtCtrls, cxGroupBox, Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    cxGroupBox1: TcxGroupBox;
    edtLogin: TEdit;
    edtPorta: TEdit;
    edtSenha: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    pnStatus: TPanel;
    RESTServicePooler1: TRESTServicePooler;
    btn_login: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_loginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidaLogin():boolean;

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  uDataModule;

procedure TFfrmMainFormCreate(Sender: TObject);
begin
end;

procedure TfrmMain.btn_loginClick(Sender: TObject);
begin
 if not ValidaLogin then exit
 else

 RESTServicePooler1.Active := Not RESTServicePooler1.Active;

 if RESTServicePooler1.Active then
  begin
    Caption             := 'SERVER ON-LINE';
    pnStatus.caption    := 'SERVER ON-LINE';
    btn_login.Caption   := 'STOP SERVER';
    pnStatus.Font.Color :=  clLime;
  end
 else
  begin
    Caption             := 'SERVER OFF-LINE';
    pnStatus.caption    := 'SERVER OFF-LINE';
    btn_login.Caption   := 'START SERVER';
    pnStatus.Font.Color :=  clRed;
  end;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
 Computer: PChar;
 CSize: DWORD;
begin
 RESTServicePooler1.ServerMethodClass := TDataModule1;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
 edtLogin.SetFocus;
end;

function TfrmMain.ValidaLogin: boolean;
begin
 result := false;

 if edtLogin.Text = '' then
  BEGIN
    ShowMessage('Informe o Login!');
    Exit;
  END
 else
  begin
   if RESTServicePooler1.ServerParams.UserName <> edtLogin.Text  then
    begin
     ShowMessage('Login incorreto!');
     exit
    end;
  end;

 if edtSenha.Text = '' then
  BEGIN
    ShowMessage('Informe a Senha!');
    Exit;
  END
 else
  begin
   if RESTServicePooler1.ServerParams.Password <> edtSenha.Text  then
    begin
     ShowMessage('Senha Incorreta!');
     exit
    end;

  end;

 if edtPorta.Text = '' then
  BEGIN
    ShowMessage('Informe a Porta!');
    Exit;
  END
 else
  begin
    begin
     if  RESTServicePooler1.ServicePort <> StrToInt(edtPorta.Text)  then
      begin
        ShowMessage('Porta não autorizada!');
        exit
      end;
    end;

  end;

 result := True;
end;

end.

﻿unit OsnovneIformacije;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFOsnovneIformacije = class(TForm)
    Instagram: TLabel;
    Facebook: TLabel;
    Telefon: TLabel;
    Viber: TLabel;
    RadnoVreme: TLabel;
    ImageControl1: TImageControl;
    BtnPrikazNaloga: TButton;

    //procedure BtnPrikazNalogaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOsnovneIformacije: TFOsnovneIformacije;

implementation

{$R *.fmx}




{
procedure TFOsnovneIformacije.BtnPrikazNalogaClick(Sender: TObject);
begin
    {var KorisnickiNalog := TFKorisnickiNalog.Create(self);
    KorisnickiNalog.Show;
    self.Hide;

    if not Assigned(FKorisnickiNalog) then
      begin
        FKorisnickiNalog:= TFKorisnickiNalog.Create(self);
        FKorisnickiNalog.ImeKorisnika.text:= FOsnovneIformacije.EmailEdit.Text;
        FKorisnickiNalog.Show;
      end;
end; }

procedure TFOsnovneIformacije.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //application.Terminate;
end;

end.

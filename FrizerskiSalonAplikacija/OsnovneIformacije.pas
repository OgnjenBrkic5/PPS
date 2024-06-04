﻿unit OsnovneIformacije;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.Ani;

type
  TFOsnovneIformacije = class(TForm)
    InstagramLabel: TLabel;
    FacebookLabel: TLabel;
    TelefonLabel: TLabel;
    ViberLabel: TLabel;
    RadnoVremeLabel: TLabel;
    LogoImageControl: TImageControl;
    Nazad: TButton;
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    Line2: TLine;
    Line1: TLine;

    //procedure BtnPrikazNalogaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NazadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOsnovneIformacije: TFOsnovneIformacije;

implementation
uses KorisnickiNalogGlavnaForma;
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
    application.Terminate;
end;

procedure TFOsnovneIformacije.NazadClick(Sender: TObject);
begin
      FKorisnickiNalog.Show;
      self.Hide;
end;

end.

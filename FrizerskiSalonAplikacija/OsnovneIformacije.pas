﻿unit OsnovneIformacije;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, KorisnickiNalog;

type
  TFOsnovneIformacije = class(TForm)
    Instagram: TLabel;
    Facebook: TLabel;
    Telefon: TLabel;
    Viber: TLabel;
    RadnoVreme: TLabel;
    ImageControl1: TImageControl;
    BtnPrikazNaloga: TButton;

    procedure BtnPrikazNalogaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOsnovneIformacije: TFOsnovneIformacije;

implementation

{$R *.fmx}




procedure TFOsnovneIformacije.BtnPrikazNalogaClick(Sender: TObject);
begin
    var KorisnickiNalog := TFNalog.Create(self);
          KorisnickiNalog.Show;
end;

end.

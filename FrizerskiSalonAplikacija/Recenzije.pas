unit Recenzije;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFRecenzije = class(TForm)
    ImageControl1: TImageControl;
    Frizer: TLabel;
    Nazad: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NazadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRecenzije: TFRecenzije;

implementation
uses KorisnickiNalogGlavnaForma;
{$R *.fmx}

procedure TFRecenzije.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFRecenzije.NazadClick(Sender: TObject);
begin
      FKorisnickiNalog.Show;
      self.Hide;
end;

end.

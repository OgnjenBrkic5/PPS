unit PregledRezervacije;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation;

type
  TFPregledRezervacije = class(TForm)
    ImageControl1: TImageControl;
    Frizer: TLabel;
    IzborUsluge: TLabel;
    NacinPlacanja: TLabel;
    BtnIzadjiIzPregleda: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnIzadjiIzPregledaClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPregledRezervacije: TFPregledRezervacije;

implementation
uses KorisnickiNalogGlavnaForma;
{$R *.fmx}


procedure TFPregledRezervacije.BtnIzadjiIzPregledaClick(Sender: TObject);
begin
    FKorisnickiNalog.Show;
    self.Close;
end;

procedure TFPregledRezervacije.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    //application.Terminate;
end;

end.

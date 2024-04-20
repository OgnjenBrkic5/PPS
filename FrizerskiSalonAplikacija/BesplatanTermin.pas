unit BesplatanTermin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, PregledRezervacije;

type
  TFBesplatanTermin = class(TForm)
    Cestitamo: TLabel;
    BtnNazaNaPregledRezervacije: TButton;
    procedure BtnNazaNaPregledRezervacijeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBesplatanTermin: TFBesplatanTermin;

implementation

{$R *.fmx}

procedure TFBesplatanTermin.BtnNazaNaPregledRezervacijeClick(Sender: TObject);
begin
    var PregledRezervaciaja := TFPregledRezervacije.Create(self);
              PregledRezervaciaja.Show;
end ;


end.

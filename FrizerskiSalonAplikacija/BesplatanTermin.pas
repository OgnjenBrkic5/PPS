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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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
      self.Hide;
end;


procedure TFBesplatanTermin.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      //application.Terminate;
end;

end.

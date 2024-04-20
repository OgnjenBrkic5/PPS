unit Placanje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, PregledRezervacije;

type
  TFPlacanje = class(TForm)
    Placanje: TLabel;
    LKes: TCheckBox;
    LKarticom: TCheckBox;
    Karticom: TCheckBox;
    Potvrdi: TButton;
    procedure PotvrdiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlacanje: TFPlacanje;

implementation

{$R *.fmx}

procedure TFPlacanje.PotvrdiClick(Sender: TObject);
begin
     var pregledReyervacije := TFPregledRezervacije.Create(self);
         pregledReyervacije.Show;
end;

end.

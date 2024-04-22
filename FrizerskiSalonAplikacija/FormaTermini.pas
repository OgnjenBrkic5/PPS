unit FormaTermini;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, Informacije, Placanje;

type
  TFTermini = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Text1: TText;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Line1: TLine;
    Text2: TText;
    BtnINF: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure BtnINFClick(Sendre: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

    var
  FTermini: TFTermini;

implementation

{$R *.fmx}

var status:String = '';
var termin:String = '';

procedure TFTermini.Button1Click(Sender: TObject);
begin
           termin:= '09:00 - 09:30';
           status:= 'Slobodno';
           //promena statusa termina u bazi na zazeto
           //prelazak na formu za placanje
           var placanje := TFPlacanje.Create(self);
           placanje.Show;
           end;

procedure TFTermini.Button2Click(Sender: TObject);
begin
           termin:= '10:00 - 10:30';
           status:= 'Zauzeto';
           //promena statusa termina u bazi na zazeto
           //prelazak na formu za placanje
end;

procedure TFTermini.Button3Click(Sender: TObject);
begin
           termin:= '10:30 - 11:00';
           status:= 'Zauzeto';
           //promena statusa termina u bazi na zazeto
           //prelazak na formu za placanje
end;

       procedure TFTermini.BtnINFClick(Sendre: TObject);
begin
      var Informacije := TFInformacije.Create(self);
        Informacije.Show;
end;

end.

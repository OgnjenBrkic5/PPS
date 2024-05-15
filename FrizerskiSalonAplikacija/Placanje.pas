unit Placanje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, PregledRezervacije;

type
  TFPlacanje = class(TForm)
    Placanje: TLabel;
    Potvrdi: TButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure PotvrdiClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlacanje: TFPlacanje;

implementation

{$R *.fmx}

procedure TFPlacanje.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //application.Terminate;
end;

procedure TFPlacanje.PotvrdiClick(Sender: TObject);
begin
     var pregledRezervacije := TFPregledRezervacije.Create(self);
     pregledRezervacije.Show;
     self.Hide;
end;

end.

unit Prijava;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, OsnovneIformacije;

type
  TFPrijava = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Email: TLabel;
    UlogujSe: TButton;
    Sifra: TLabel;
    procedure UlogujSeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrijava: TFPrijava;

implementation

{$R *.fmx}

procedure TFPrijava.UlogujSeClick(Sender: TObject);
begin
       var OsnovneIformacije := TFOsnovneIformacije.Create(self);
             OsnovneIformacije.Show;
end;

end.

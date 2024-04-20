unit Registracija;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, OsnovneIformacije;

type
  TForm6 = class(TForm)
    Email: TLabel;
    Ime: TLabel;
    Prezime: TLabel;
    �ifra: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    UlogujSe: TButton;
    procedure UlogujSeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.fmx}

procedure TForm6.UlogujSeClick(Sender: TObject);
begin
    var OsnovneIformacije := TFOsnovneIformacije.Create(self);
             OsnovneIformacije.Show;
end;
end.

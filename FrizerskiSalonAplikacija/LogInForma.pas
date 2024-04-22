unit LogInForma;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Registracija, Prijava;

type
  TFLogIn = class(TForm)
    Ulogujse: TButton;
    Registrujse: TButton;
    procedure UlogujseClick(Sender: TObject);
    procedure RegistrujseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogIn: TFLogIn;

implementation

{$R *.fmx}

procedure TFLogIn.RegistrujseClick(Sender: TObject);
begin
  var ForamaRegistrujse := TFRegistracija.Create(self);
    ForamaRegistrujse.Show;
  end;
procedure TFLogIn.UlogujseClick(Sender: TObject);
begin
    var FormaPrijava := TFPrijava.Create(self);
       FormaPrijava.Show;
end;


end.

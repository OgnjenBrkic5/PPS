unit LogInForma;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Registracija, Prijava;

type
  TForm5 = class(TForm)
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
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.RegistrujseClick(Sender: TObject);
begin
  var ForamaRegistrujse := TForm6.Create(self);
    ForamaRegistrujse.Show;
  end;
procedure TForm5.UlogujseClick(Sender: TObject);
begin
    var FormaPrijava := TForm7.Create(self);
       FormaPrijava.Show;
end;


end.
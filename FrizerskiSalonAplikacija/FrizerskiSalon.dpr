program FrizerskiSalon;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormaKalendar in 'FormaKalendar.pas' {Form1},
  FormaIzborUsluga in 'FormaIzborUsluga.pas' {Form2},
  FormaTermini in 'FormaTermini.pas' {Form3},
  LogInForma in 'LogInForma.pas' {Form5},
  Prijava in 'Prijava.pas' {Form7},
  Registracija in 'Registracija.pas' {Form6},
  Informacije in 'Informacije.pas' {Form4};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm4, Form4);
  Application.Run;
end.

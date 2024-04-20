program FrizerskiSalon;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormaKalendar in 'FormaKalendar.pas' {Form1},
  FormaIzborUsluga in 'FormaIzborUsluga.pas' {Form2},
  FormaTermini in 'FormaTermini.pas' {Form3},
  LogInForma in 'LogInForma.pas' {Form5},
  Registracija in 'Registracija.pas' {Form6},
  Prijava in 'Prijava.pas' {Form7},
  Informacije in 'Informacije.pas' {Form4},
  OsnovneIformacije in 'OsnovneIformacije.pas' {FOsnovneIformacije},
  KorisničkiNalog in 'KorisničkiNalog.pas' {FNalog},
  PregledRezervacije in 'PregledRezervacije.pas' {FPregledRezervacije},
  BesplatanTermin in 'BesplatanTermin.pas' {FBesplatanTermin},
  Placanje in 'Placanje.pas' {FPlacanje},
  Recenzije in 'Recenzije.pas' {FRecenzije},
  Obavestenja in 'Obavestenja.pas' {FObavestenja};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TFOsnovneIformacije, FOsnovneIformacije);
  Application.CreateForm(TFNalog, FNalog);
  Application.CreateForm(TFPlacanje, FPlacanje);
  Application.CreateForm(TFPregledRezervacije, FPregledRezervacije);
  Application.CreateForm(TFBesplatanTermin, FBesplatanTermin);
  Application.CreateForm(TFPlacanje, FPlacanje);
  Application.CreateForm(TFRecenzije, FRecenzije);
  Application.CreateForm(TFObavestenja, FObavestenja);
  Application.Run;
end.

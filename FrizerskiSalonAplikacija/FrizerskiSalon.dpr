program FrizerskiSalon;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormaKalendar in 'FormaKalendar.pas' {Form1},
  FormaIzborUsluga in 'FormaIzborUsluga.pas' {Form2},
  FormaTermini in 'FormaTermini.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.

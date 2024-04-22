﻿program FrizerskiSalon;

uses
  System.StartUpCopy,
  FMX.Forms,
  FormaKalendar in 'FormaKalendar.pas' {FKalendar},
  FormaIzborUsluga in 'FormaIzborUsluga.pas' {FIzborUsluga},
  FormaTermini in 'FormaTermini.pas' {FTermini},
  LogInForma in 'LogInForma.pas' {FLogIn},
  Registracija in 'Registracija.pas' {FRegistracija},
  Prijava in 'Prijava.pas' {FPrijava},
  Informacije in 'Informacije.pas' {FInformacije},
  OsnovneIformacije in 'OsnovneIformacije.pas' {FOsnovneIformacije},
  PregledRezervacije in 'PregledRezervacije.pas' {FPregledRezervacije},
  BesplatanTermin in 'BesplatanTermin.pas' {FBesplatanTermin},
  Placanje in 'Placanje.pas' {FPlacanje},
  Recenzije in 'Recenzije.pas' {FRecenzije},
  Obavestenja in 'Obavestenja.pas' {FObavestenja},
  KorisnickiNalog in 'KorisnickiNalog.pas' {FKorisnickiNalog},
  DataModule in 'DataModule.pas' {FDataModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFLogIn, FLogIn);
  Application.CreateForm(TFDataModule, FDataModule);
  Application.Run;
end.

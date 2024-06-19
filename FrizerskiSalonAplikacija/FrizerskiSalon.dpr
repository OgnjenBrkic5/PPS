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
  PregledRezervacije in 'PregledRezervacije.pas' {FPregledRezervacije},
  BesplatanTermin in 'BesplatanTermin.pas' {FBesplatanTermin},
  Placanje in 'Placanje.pas' {FPlacanje},
  Recenzije in 'Recenzije.pas' {FRecenzije},
  Obavestenja in 'Obavestenja.pas' {FObavestenja},
  DataModule in 'DataModule.pas' {FDataModule: TDataModule},
  OsnovneIformacije in 'OsnovneIformacije.pas' {FOsnovneIformacije},
  KorisnickiNalogGlavnaForma in 'KorisnickiNalogGlavnaForma.pas' {FKorisnickiNalog: TFKorisnickiNalog},
  FormaPlacanjeKarticom in 'FormaPlacanjeKarticom.pas' {FPlacanjeKarticom},
  Izbor in 'Izbor.pas' {FIzbor},
  RadnickiNalog in 'RadnickiNalog.pas' {FRadnickiNalog},
  StanjeAlata in 'StanjeAlata.pas' {FStanjeAlata};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFDataModule, FDataModule);
  Application.CreateForm(TFLogIn, FLogIn);
  Application.CreateForm(TFKorisnickiNalog, FKorisnickiNalog);
  Application.Run;
end.

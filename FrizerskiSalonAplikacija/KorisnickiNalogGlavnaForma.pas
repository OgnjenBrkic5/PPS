﻿unit KorisnickiNalogGlavnaForma;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, System.Rtti, FMX.Grid.Style,
  FMX.Grid, FMX.ScrollBox, FMX.Layouts, FormaKalendar, DataModule, OsnovneIformacije, Obavestenja, Recenzije;

type
  TFKorisnickiNalog = class(TForm)
    BtnIzaberiUslugu: TButton;
    Line1: TLine;
    IstorijaUslugaLabel: TLabel;
    OsnovneInformacijeBtn: TButton;
    Line2: TLine;
    IstrorijaStringGrid: TStringGrid;
    colBerberin: TColumn;
    colCena: TColumn;
    colDatum: TColumn;
    colTermin: TColumn;
    colUsluga: TColumn;
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    ImeKorisnikaLabel: TLabel;
    InputeRectangle: TRectangle;
    OdjaviSeBtn: TButton;
    ObavestenjaBtn: TButton;
    RecenzijeBtn: TButton;
    procedure BtnIzaberiUsluguClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OsnovneInformacijeBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OdjaviSeBtnClick(Sender: TObject);
    procedure RecenzijeBtnClick(Sender: TObject);
    procedure ObavestenjaBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    IDKorisnika: integer;
    KorisnickoIme: string;
    Email: string;
    SifraNaloga: string;

  end;

var
  FKorisnickiNalog: TFKorisnickiNalog;

implementation
uses Prijava, Placanje;
{$R *.fmx}
{$R *.LgXhdpiPh.fmx ANDROID}

procedure TFKorisnickiNalog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFKorisnickiNalog.BtnIzaberiUsluguClick(Sender: TObject);
begin
      FKalendar := TFKalendar.Create(self);
      FKalendar.Show;
      self.Hide;
end;

procedure TFKorisnickiNalog.OsnovneInformacijeBtnClick(Sender: TObject);
begin
      FOsnovneIformacije := TFOsnovneIformacije.Create(self);
      FOsnovneIformacije.Show;
      self.Hide;
end;

procedure TFKorisnickiNalog.ObavestenjaBtnClick(Sender: TObject);
begin
      FObavestenja := TFObavestenja.Create(self);
      FObavestenja.Show;
      self.Hide;
end;

procedure TFKorisnickiNalog.RecenzijeBtnClick(Sender: TObject);
begin
      FRecenzije := TFRecenzije.Create(self);
      FRecenzije.Show;
      self.Hide;
end;

procedure TFKorisnickiNalog.FormShow(Sender: TObject);
begin

      ImeKorisnikaLabel.Text := KorisnickoIme;


      RecenzijeBtn.Text:= 'Recenzije' + #13#10 + 'radnika';
      OsnovneInformacijeBtn.Text:= 'Osnovne' + #13#10 + 'informacije';


       if IstrorijaStringGrid.RowCount > 0 then
       begin
       {
             for var counter := 0 to IstrorijaStringGrid.RowCount-1 do
             begin
                      IstrorijaStringGrid.Cells[0,counter]:= '';
                      IstrorijaStringGrid.Cells[1,counter]:= '';
                      IstrorijaStringGrid.Cells[2,counter]:= '';
                      IstrorijaStringGrid.Cells[3,counter]:= '';
                      IstrorijaStringGrid.Cells[4,counter]:= '';
             end;
        }
             IstrorijaStringGrid.RowCount:= 0;
       end;

       with FDataModule do
       begin

       FDQueryTemp.Sql.Clear;
       FDQueryTemp.Sql.Text := 'SELECT * FROM Zakazivanje WHERE IDKorisnika = ' + IDKorisnika.ToString;
       FDQueryTemp.Open;

       var i: integer;
       var rowCount: integer;
       rowCount := FDQueryTemp.RecordCount;

              while not FDQueryTemp.Eof do
              begin

                    i := IstrorijaStringGrid.RowCount;
                    IstrorijaStringGrid.RowCount:= IstrorijaStringGrid.RowCount + 1;


                    FDQuerySelectRadnik.Sql.Clear;
                    FDQuerySelectRadnik.Sql.Text := 'SELECT KorisnickoIme FROM Radnik WHERE IDRadnika = ' + quotedstr(FDQueryTemp['IDRadnika']);
                    FDQuerySelectRadnik.Open;


                    IstrorijaStringGrid.Cells[0, i] := FDQuerySelectRadnik['KorisnickoIme'];

                    //---------------------------------------------------------------------------------

                    //Potencijalno izmenjen deo

                    FDQuerySelectSifarnikUsluga.Sql.Clear;
                    FDQuerySelectSifarnikUsluga.Sql.Text := 'SELECT NazivUsluge, CenaUsluge FROM SifarnikUsluga WHERE IDUsluge = ' + quotedstr(FDQueryTemp['IDUsluge']);
                    FDQuerySelectSifarnikUsluga.Open;


                    IstrorijaStringGrid.Cells[1,i] :=  FDQuerySelectSifarnikUsluga['NazivUsluge'];
                    IstrorijaStringGrid.Cells[2,i] :=  FDQuerySelectSifarnikUsluga['CenaUsluge'];

                    //---------------------------------------------------------------------------------

                    FDQuerySelectDostupniTermini.Sql.Clear;
                    FDQuerySelectDostupniTermini.Sql.Text := 'SELECT Datum FROM DostupniTermini WHERE  Datum =' + quotedstr(FDQueryTemp['Datum']) + 'AND IDTermina = ' + quotedstr(FDQueryTemp['IDTermina']);
                    FDQuerySelectDostupniTermini.Open;


                    IstrorijaStringGrid.Cells[3,i] :=  FDQuerySelectDostupniTermini['Datum'];


                    FDQuerySelectMoguciTermini.Sql.Clear;
                    FDQuerySelectMoguciTermini.Sql.Text := 'SELECT PocetakTermina FROM MoguciTermini WHERE  IDTremina =' + quotedstr(FDQueryTemp['IDTermina']);
                    FDQuerySelectMoguciTermini.Open;


                    IstrorijaStringGrid.Cells[4,i] :=  FDQuerySelectMoguciTermini['PocetakTermina'];


                    FDQueryTemp.Next
              end;

              IstrorijaStringGrid.AutoCalculateContentSize;
              FDQuerySelectRadnik.Close;
              FDQuerySelectSifarnikUsluga.Close;
              FDQuerySelectDostupniTermini.Close;
              FDQuerySelectMoguciTermini.Close;
              FDQueryTemp.Close;
        end;

end;

procedure TFKorisnickiNalog.OdjaviSeBtnClick(Sender: TObject);
begin
      IDKorisnika:= 0;
      KorisnickoIme:= '';
      Email:= '';
      SifraNaloga:= '';
      FPrijava.Show;
      self.Hide;
end;

end.


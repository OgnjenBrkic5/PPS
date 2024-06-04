unit KorisnickiNalogGlavnaForma;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects,
  Datasnap.Provider, Data.DB, Datasnap.DBClient, System.Rtti, FMX.Grid.Style,
  FMX.Grid, FMX.ScrollBox, FMX.Layouts, FormaKalendar, DataModule, OsnovneIformacije, Obavestenja, Recenzije;

  {System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrlsDataModule, FormaKalendar,
  OsnovneIformacije, FMX.Objects, FMX.StdCtrls; }
  {System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, DataModule, FormaKalendar,
  OsnovneIformacije; }

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

procedure TFKorisnickiNalog.BtnIzaberiUsluguClick(Sender: TObject);
begin

    {
    FPlacanje.IDKorisnika:= IDKorisnika;
    FPlacanje.KorisnickoIme:= KorisnickoIme;
    FPlacanje.Email:= Email;
    FPlacanje.SifraNaloga:= SifraNaloga;
    }


    FKalendar := TFKalendar.Create(self);
    FKalendar.Show;
    self.Hide;

end;


{procedure TFKorisnickiNalog.BtnOsnovneInformacijeClick(Sender: TObject);
begin
    var Kalendar := TFKalendar.Create(self);
    Kalendar.Show;
    self.Hide;
end;  }

procedure TFKorisnickiNalog.OsnovneInformacijeBtnClick(Sender: TObject);
begin
  //if not Assigned (FOsnovneIformacije) then
  //begin
    FOsnovneIformacije := TFOsnovneIformacije.Create(self);
    FOsnovneIformacije.Show;
    self.Hide;
  //end;
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

procedure TFKorisnickiNalog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    application.Terminate;
end;


procedure TFKorisnickiNalog.FormShow(Sender: TObject);
begin

    ImeKorisnikaLabel.Text := KorisnickoIme;

    RecenzijeBtn.Text:= 'Recenzije' + #13#10 + 'radnika';
    OsnovneInformacijeBtn.Text:= 'Osnovne' + #13#10 + 'informacije';



    //EncodeTime(0,30,0,0)


     //Showmessage(Timetostr(EncodeTime(0,10,0,0) mod EncodeTime(0,30,0,0)));


    //IstrorijaStringGrid.CleanupInstance;
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


    {Showmessage(IDKorisnika.ToString);
    Showmessage(KorisnickoIme);
    Showmessage(Email);
    Showmessage(SifraNaloga);}

  with FDataModule do
  begin

    //Promeniti u slučaju izmena tabele Zakazivanje u bazi

    //FDDatabaseConnection.Open;
    FDQueryTemp.Sql.Clear;
    FDQueryTemp.Sql.Text := 'SELECT * FROM Zakazivanje WHERE IDKorisnika = ' + IDKorisnika.ToString;
    FDQueryTemp.Open;

    var i: integer;
    var rowCount: integer;
    rowCount := FDQueryTemp.RecordCount;
    //Showmessage(rowCount.ToString +'hehe');
    //Showmessage(rowCount.ToString);


    {while(rowCount>0) do
    begin
      Showmessage(FDQueryTemp['IDRadnika']);//(FDQueryTemp['IDRadnika'].getValue);
      FDQueryTemp.Next;
      rowCount := rowCount-1;
    end;}


    {Showmessage(i.ToString);
    IstrorijaStringGrid.RowCount:= IstrorijaStringGrid.RowCount + 1;
    i := IstrorijaStringGrid.RowCount;
    Showmessage(i.ToString);}


    while not FDQueryTemp.Eof do
    begin

      i := IstrorijaStringGrid.RowCount;
      IstrorijaStringGrid.RowCount:= IstrorijaStringGrid.RowCount + 1;

      FDQuerySelectRadnik.Sql.Clear;
      FDQuerySelectRadnik.Sql.Text := 'SELECT KorisnickoIme FROM Radnik WHERE IDRadnika = ' + quotedstr(FDQueryTemp['IDRadnika']); //.ToString;
      FDQuerySelectRadnik.Open;

      IstrorijaStringGrid.Cells[0, i] := FDQuerySelectRadnik['KorisnickoIme'];//.ToString;

      //---------------------------------------------------------------------------------

      //Potencijalno izmenjen deo

      FDQuerySelectSifarnikUsluga.Sql.Clear;
      FDQuerySelectSifarnikUsluga.Sql.Text := 'SELECT NazivUsluge, CenaUsluge FROM SifarnikUsluga WHERE IDUsluge = ' + quotedstr(FDQueryTemp['IDUsluge']); //.ToString;
      FDQuerySelectSifarnikUsluga.Open;

      IstrorijaStringGrid.Cells[1,i] :=  FDQuerySelectSifarnikUsluga['NazivUsluge'];//.ToString;
      IstrorijaStringGrid.Cells[2,i] :=  FDQuerySelectSifarnikUsluga['CenaUsluge'];//.ToString;

      //---------------------------------------------------------------------------------

      FDQuerySelectDostupniTermini.Sql.Clear;
      FDQuerySelectDostupniTermini.Sql.Text := 'SELECT Datum FROM DostupniTermini WHERE  Datum =' + quotedstr(FDQueryTemp['Datum']) + 'AND IDTermina = ' + quotedstr(FDQueryTemp['IDTermina']); //.ToString;
      FDQuerySelectDostupniTermini.Open;

      IstrorijaStringGrid.Cells[3,i] :=  FDQuerySelectDostupniTermini['Datum'];//.ToString;


      FDQuerySelectMoguciTermini.Sql.Clear;
      FDQuerySelectMoguciTermini.Sql.Text := 'SELECT PocetakTermina FROM MoguciTermini WHERE  IDTremina =' + quotedstr(FDQueryTemp['IDTermina']); //.ToString;
      FDQuerySelectMoguciTermini.Open;

      IstrorijaStringGrid.Cells[4,i] :=  FDQuerySelectMoguciTermini['PocetakTermina'];//.ToString;

      FDQueryTemp.Next
    end;

    IstrorijaStringGrid.AutoCalculateContentSize;
    FDQuerySelectRadnik.Close;
    FDQuerySelectSifarnikUsluga.Close;
    FDQuerySelectDostupniTermini.Close;
    FDQuerySelectMoguciTermini.Close;
    FDQueryTemp.Close;


    //Berberin.items.add('');
    //IstrorijaStringGrid.;
    //Berberin.Items := FDQueryTemp['IDRadnika'] ; //.AddObject(FDQueryTemp['IDRadnika'].toString);
    //Berberin
    //Usluga
    //Cena
    //Datum
    //Termin

    {while(rowCount>0) do
    begin
      FDQuerySelectRadnik.Sql.Clear;
      FDQuerySelectRadnik.Sql.Text := 'SELECT KorisnickoIme FROM Radnik WHERE IDRadnika = ' + IDKorisnika.ToString;
      FDQuerySelectRadnik.Open;


      FDQueryTemp.Close;

      //IstrorijaStringGrid.Cells[0,0] :='a';

        IstorijaGrid.Cells[

      //.Cells[0, 0] :=
      //IstorijaGrid.Objects[0][0] := '';
      //[rowCount, 0] :=


      rowCount := rowCount-1;
    end;   }


    //-----------------

    {FDQuerySelectRadnik.Sql.Clear;
    FDQuerySelectRadnik.Sql.Text := 'SELECT KorisnickoIme FROM Radnik WHERE IDRadnika = ' + FDQueryTemp['IDRadnika'].ToString;
    FDQuerySelectRadnik.Open;

    FDQuerySelectSifarnikUsluga.Sql.Clear;
    FDQuerySelectSifarnikUsluga.Sql.Text := 'SELECT NazivUsluge, CenaUsluge FROM Radnik WHERE IDUsluge = ' + FDQueryTemp['IDUsluge'].ToString;
    FDQuerySelectSifarnikUsluga.Open;

    {while(rowCount>0) do
    begin
      Showmessage(FDQueryTemp['IDRadnika']);//(FDQueryTemp['IDRadnika'].getValue);
      FDQueryTemp.Next;
      rowCount := rowCount-1;
    end; }


    {for i := 0 to rowCount-1 do
    begin

      IstrorijaStringGrid.Cells[i,0] :=  FDQuerySelectRadnik['KorisnickoIme'].ToString;
      FDQuerySelectRadnik.Next;
       //Showmessage('1');

      IstrorijaStringGrid.Cells[i,1] :=  FDQuerySelectSifarnikUsluga['NazivUsluge'].ToString;
      IstrorijaStringGrid.Cells[i,2] :=  FDQuerySelectSifarnikUsluga['CenaUsluge'].ToString;
      //Showmessage('2');

      //
  end;}

    //FDQuerySelectRadnik.Close;
    //FDQuerySelectSifarnikUsluga.Close;



    //IstrorijaStringGrid.AutoCalculateContentSize;

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


unit FormaTermini;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, DateUtils, FMX.ListBox,
  DataModule, Informacije, Placanje, FMX.Layouts;

type
  TFTermini = class(TForm)
    IzaberiBtn: TButton;
    BtnINF: TButton;
    DostupniTerminiComboBox: TComboBox;
    TrajanjeCenaLabel: TLabel;
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    Line1: TLine;
    NazadBtn: TButton;
    procedure BtnINFClick(Sendre: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure IzaberiBtnClick(Sender: TObject);
    procedure DostupniTerminiComboBoxChange(Sender: TObject);
    procedure NazadBtnClick(Sender: TObject);
  private
    { Private declarations }
    IDTerminaArray: array of integer;
    PocetakTerminaArray: array of String;
    KrajTerminaArray: array of String;
    StatusArray: array of String;

  public
    { Public declarations }
    ukupnoVremeUsluga: TTime;
    ukupnaCenaUsluga: integer;
    izabraniIDTermina: integer;
    izabraniPocetakTermina: String;
    izabraniKrajTermina: String;
    izabraniStatus: String;
    izabraniIDTerminaArray: array of integer;
    izabraniPocetakTerminaArray: array of String;
    izabraniKrajTerminaArray: array of String;
    izabraniStatusArray: array of String;
  end;

    var
  FTermini: TFTermini;

implementation
uses FormaIzborUsluga, FormaKalendar, KorisnickiNalogGlavnaForma;
{$R *.fmx}

procedure TFTermini.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFTermini.DostupniTerminiComboBoxChange(Sender: TObject);
begin

      if (DostupniTerminiComboBox.ItemIndex <> -1) then
      begin
            izabraniIDTermina:= IDTerminaArray[DostupniTerminiComboBox.ItemIndex];
            izabraniPocetakTermina:= PocetakTerminaArray[DostupniTerminiComboBox.ItemIndex];
            izabraniKrajTermina:= KrajTerminaArray[DostupniTerminiComboBox.ItemIndex];
            izabraniStatus:= StatusArray[DostupniTerminiComboBox.ItemIndex];
      end;
end;


procedure TFTermini.FormShow(Sender: TObject);
begin
      ukupnoVremeUsluga:= Encodetime(0,0,0,0); //Strtotime('0:0:0');
      ukupnaCenaUsluga:= 0;
      var i: integer;

      for i:= 0 to Length(FIzborUsluga.unetiVremeTrajanjaArray)-1 do
      begin
            ukupnoVremeUsluga:= ukupnoVremeUsluga +  EncodeTime(0, FIzborUsluga.unetiVremeTrajanjaArray[i],0 ,0);
            ukupnaCenaUsluga:= ukupnaCenaUsluga + FIzborUsluga.unetiCenaUslugeArray[i];
      end;

      TrajanjeCenaLabel.Text:= 'Ukupno vreme: ' + Timetostr(ukupnoVremeUsluga) + #13#10 + 'Ukupna cena ' + ukupnaCenaUsluga.ToString + ' din.';

      //TrajanjeCenaLabel.Text:= 'Ukupno vreme: ' + HourOf(ukupnoVremeUsluga).ToString + ':' + MinuteOf(ukupnoVremeUsluga).ToString + #13#10 + 'Ukupna cena ' + ukupnaCenaUsluga.ToString + ' din.';


      with FDataModule do
      begin
            //   !!!------ Date format: 2.6.2024. ; NOT: 02.06.2024. ------!!!
            //     !!!------ Time format: 09.40.05. ; NOT: 9.40.5 ------!!!
            //      !!!------ Day format: Sunday: 1 Saturday: 7 ------!!!

            //FDDatabaseConnection.Open;
            FDQueryTemp.Sql.Clear;
            FDQueryTemp.Sql.Text:= 'SELECT * FROM MoguciTermini';
            FDQueryTemp.Open;
            DostupniTerminiComboBox.Items.Clear;
            var unos: string;

            while not FDQueryTemp.Eof do
            begin
                  SetLength(IDTerminaArray, Length(IDTerminaArray)+1);
                  SetLength(PocetakTerminaArray, Length(PocetakTerminaArray)+1);
                  SetLength(KrajTerminaArray, Length(KrajTerminaArray)+1);
                  SetLength(StatusArray, Length(StatusArray)+1);


                  IDTerminaArray[Length(IDTerminaArray) -1]:= FDQueryTemp['IDTremina'];
                  PocetakTerminaArray[Length(PocetakTerminaArray) -1]:= FDQueryTemp['PocetakTermina'];
                  KrajTerminaArray[Length(KrajTerminaArray) -1]:= FDQueryTemp['KrajTermina'];


                  unos:= FDQueryTemp.FieldByName('PocetakTermina').AsString + ' - ' + FDQueryTemp.FieldByName('KrajTermina').AsString;


                  FDQuerySelectDostupnostRadnika.Sql.Clear;
                  //FDQuerySelectDostupnostRadnika.Sql.Text:= 'SELECT * FROM DostupnostRadnika WHERE IDRadnika = ' + FKalendar.IDRadnika.ToString + ' AND Datum = ' + quotedstr(FKalendar.Datum) + ' AND IDTermina = ' + quotedstr(FDQueryTemp['IDTremina']);
                  FDQuerySelectDostupnostRadnika.Sql.Text:= 'SELECT * FROM DostupnostRadnika WHERE IDRadnika = '
                  + FKalendar.IDRadnika.ToString + ' AND Datum = '
                  + quotedstr(DatetoStr(FKalendar.Datum)) + ' AND IDTermina = '
                  + quotedstr(FDQueryTemp['IDTremina']);

                  FDQuerySelectDostupnostRadnika.Open;


                  if FDQuerySelectDostupnostRadnika.RecordCount = 0 then
                  begin
                        unos:= unos + ' - Slobodan';
                        StatusArray[Length(StatusArray) -1]:= 'Slobodan';
                  end

                  else
                  begin
                        unos:= unos + ' - Zauzet';
                        StatusArray[Length(StatusArray) -1]:= 'Zauzet';
                  end;

                  DostupniTerminiComboBox.Items.Add(unos);
                  FDQueryTemp.Next;
            end;
              
            FDQuerySelectDostupnostRadnika.Close;
            FDQueryTemp.Close;
      end;

end;



procedure TFTermini.IzaberiBtnClick(Sender: TObject);
begin
      if(DostupniTerminiComboBox.ItemIndex <> -1) then
      begin

            if(izabraniStatus = 'Zauzet') then
            begin
                  Showmessage('Izabrani termin je zauzet. Morate izabrati drugi termin!');
                  DostupniTerminiComboBox.SetFocus;
            end

            else
            begin

                  var potrebnoVreme: TTime := EncodeTime(0,0,0,0);
                  var brojTermina: integer := 0;

                  while potrebnoVreme < ukupnoVremeUsluga do
                  begin
                        potrebnoVreme:= potrebnoVreme + EncodeTime(0,30,0,0);
                        brojTermina:= brojTermina +1;
                  end;


                  if (izabraniIDTermina + brojTermina -1) <= IDTerminaArray[Length(IDTerminaArray)-1] then
                  begin

                        var sviDostupni: boolean := true;
                        var counter: integer := DostupniTerminiComboBox.ItemIndex;

                        while  (counter < DostupniTerminiComboBox.ItemIndex + brojTermina) and sviDostupni do
                        begin
                              if StatusArray[counter] = 'Zauzet' then
                              begin
                                  sviDostupni:= false;
                              end;

                            counter:= counter +1;
                        end;


                        if sviDostupni then
                        begin
                              for var indexCounter := 0 to brojTermina-1 do
                              begin
                                    SetLength(izabraniIDTerminaArray, Length(izabraniIDTerminaArray)+1);
                                    SetLength(izabraniPocetakTerminaArray, Length(izabraniPocetakTerminaArray)+1);
                                    SetLength(izabraniKrajTerminaArray, Length(izabraniKrajTerminaArray)+1);
                                    SetLength(izabraniStatusArray, Length(izabraniStatusArray)+1);


                                    izabraniIDTerminaArray[indexCounter]:= IDTerminaArray[DostupniTerminiComboBox.ItemIndex + indexCounter];
                                    izabraniPocetakTerminaArray[indexCounter]:= PocetakTerminaArray[DostupniTerminiComboBox.ItemIndex + indexCounter];
                                    izabraniKrajTerminaArray[indexCounter]:= KrajTerminaArray[DostupniTerminiComboBox.ItemIndex + indexCounter];
                                    izabraniStatusArray[indexCounter]:= 'Zauzet';
                              end;

                              FPlacanje := TFPlacanje.Create(self);
                              FPlacanje.Show;
                              self.Hide;
                        end

                        else
                        begin
                              Showmessage('Ne možete izvršiti željene usluge u izabranom termiu.' + #13#10 + 'Morate izabrati drugi termin!');
                              DostupniTerminiComboBox.SetFocus;
                        end;

                  end
                  else

                  begin
                        Showmessage('Ne možete izvršiti željene usluge do kraja radnog vremena.' + #13#10 + 'Morate izabrati drugi termin!');
                        DostupniTerminiComboBox.SetFocus;
                  end;

            end;

      end

      else
      begin
            Showmessage('Morate izabrati termin da nastavite!');
            DostupniTerminiComboBox.SetFocus;
      end;
end;

procedure TFTermini.NazadBtnClick(Sender: TObject);
begin
      if Length(IDTerminaArray) > 0 then
      begin
            for var counter := 0 to Length(IDTerminaArray) -1 do
            begin
                  IDTerminaArray[counter]:= 0;
                  PocetakTerminaArray[counter]:= '';
                  KrajTerminaArray[counter]:= '';
                  StatusArray[counter]:= '';
            end;

      end;

      Setlength(IDTerminaArray, 0);
      Setlength(PocetakTerminaArray, 0);
      Setlength(KrajTerminaArray, 0);
      Setlength(StatusArray, 0);

      ukupnoVremeUsluga:= Encodetime(0,0,0,0);
      ukupnaCenaUsluga:= 0;
      izabraniIDTermina:= 0;
      izabraniPocetakTermina:= '';
      izabraniKrajTermina:= '';
      izabraniStatus:= '';

      if Length(izabraniIDTerminaArray) > 0 then
      begin
            for var counter := 0 to Length(izabraniIDTerminaArray) -1 do
            begin
                  izabraniIDTerminaArray[counter]:= 0;
                  izabraniPocetakTerminaArray[counter]:= '';
                  izabraniKrajTerminaArray[counter]:= '';
                  izabraniStatusArray[counter]:= '';
            end;

      end;

      Setlength(izabraniIDTerminaArray, 0);
      Setlength(izabraniPocetakTerminaArray, 0);
      Setlength(izabraniKrajTerminaArray, 0);
      Setlength(izabraniStatusArray, 0);


      DostupniTerminiComboBox.Items.Clear;


      FIzborUsluga.Show;
      self.Hide;
end;

procedure TFTermini.BtnINFClick(Sendre: TObject);
begin
      FInformacije := TFInformacije.Create(self);
      FInformacije.Show;
end;

end.

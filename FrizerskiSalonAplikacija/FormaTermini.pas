﻿unit FormaTermini;

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
    //procedure Button1Click(Sender: TObject);
    //procedure Button2Click(Sender: TObject);
    //procedure Button3Click(Sender: TObject);
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

//var status:String = '';
//var termin:String = '';

procedure TFTermini.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    application.Terminate;
end;

procedure TFTermini.DostupniTerminiComboBoxChange(Sender: TObject);
begin
        //id change
        izabraniIDTermina:= IDTerminaArray[DostupniTerminiComboBox.ItemIndex];
        izabraniPocetakTermina:= PocetakTerminaArray[DostupniTerminiComboBox.ItemIndex];
        izabraniKrajTermina:= KrajTerminaArray[DostupniTerminiComboBox.ItemIndex];
        izabraniStatus:= StatusArray[DostupniTerminiComboBox.ItemIndex];

        //Showmessage(izabraniIDTermina.ToString + '  ' + izabraniPocetakTermina + '  ' + izabraniKrajTermina + '  ' + izabraniStatus);
end;


procedure TFTermini.FormShow(Sender: TObject);
begin


          //Showmessage(FKalendar.Datum);
          //Strtodate(FKalendar.Datum);
          //Showmessage(IntToStr(1));
          //Showmessage(DayOfWeek(Strtodate(FKalendar.Datum)).ToString);

          //Showmessage(FKorisnickiNalog.IDKorisnika.ToString);
          //Showmessage(FKalendar.IDRadnika.ToString);
          //do something


          // rad sa vemenom
          //Showmessage(Timetostr(Time()+Strtotime('23:59:59')));

          //ukupnoVremeUsluga:=Strtotime('0:0:0');
          //ukupnaCenaUsluga:= 0;
          //var i: integer;
          //Showmessage(Timetostr(ukupnoVremeUsluga));

          //Showmessage(Timetostr(EncodeTime(15,40,0,0) + EncodeTime(15,10,0,0)));
          //Showmessage(Timetostr(EncodeTime(0,40,0,0) + EncodeTime(0,45,0,0)));


          //EncodeTime(1,30,0,0) mod  EncodeTime(0,30,0,0)  EncodeTime(0,0,0,0)

          //var vreme: integer;
          //vreme := DateTimeToUnix(Time());

          //Showmessage(DateTimeToStr(now));

          //DecodeTime(0,0,0,0,0);


          {param1:TTime := EncodeTime(15,40,0,0);
          var broj: longInt:= 0;
          DecodeTime(DateTime(),Hour,Min,Sec,MSec);}

          {if EncodeTime(1,30,0,0) mod  EncodeTime(0,30,0,0) then
          begin

          end;}



          {
          Var myDate: TDateTime;
          var myYear, myMonth, myDay: Word;
          var myHour, myMin, mySec, myMilli: Word;


          myDate := Now;
          }

          //Showmessage(MinutesBetween(EncodeTime(15,40,0,0), EncodeTime(15,20,0,0)));


          {
          var currentTime: TTime;
          var minutes: integer;

          currentTime:= EncodeTime(15,40,0,0);


          // uses DateUtils !!!
          minutes := MinuteOf(currentTime);
          }

          //var promenjiva:= DecodeDateTime(myDate, myYear, myMonth, myDay, myHour, myMin, mySec, myMilli);
          //ShowMessage('Number of milliseconds past midnight = ' + IntToStr(myMilli + (mySec * 1000) + (myMin * 60 * 1000) + (myHour * 60 * 60 * 1000)));

          //-----------------------------------------------------------------------------------------------

          ukupnoVremeUsluga:= Strtotime('0:0:0');
          ukupnaCenaUsluga:= 0;
          var i: integer;

          // uses DateUtils !!!
          //minutes := MinuteOf(currentTime);


          for i:= 0 to Length(FIzborUsluga.unetiVremeTrajanjaArray)-1 do
          begin
                ukupnoVremeUsluga:= ukupnoVremeUsluga +  EncodeTime(0, FIzborUsluga.unetiVremeTrajanjaArray[i],0 ,0);
                ukupnaCenaUsluga:= ukupnaCenaUsluga + FIzborUsluga.unetiCenaUslugeArray[i];

                
                //Showmessage(FIzborUsluga.unetiIDUslugeArray[i].ToString + #13#10
                //+ FIzborUsluga.unetiNazivUslugeArray[i] + #13#10
                //+ FIzborUsluga.unetiCenaUslugeArray[i].ToString + #13#10
                //+ FIzborUsluga.unetiVremeTrajanjaArray[i].ToString);
          end;


          TrajanjeCenaLabel.Text:= 'Ukupno vreme: ' + Timetostr(ukupnoVremeUsluga) + #13#10 + 'Ukupna cena ' + ukupnaCenaUsluga.ToString + ' din.';

          //ShowMessage('Ukupno vreme: ' + Timetostr(ukupnoVremeUsluga) + #13#10 + 'Ukupna cena: ' + ukupnaCenaUsluga.ToString);

          //Showmessage(FKalendar.Datum);

          {
           if EncodeTime(0,40,0,0) > EncodeTime(1,20,0,0) then
          begin
             Showmessage('da');
          end
          else
          begin
             Showmessage('ne');
          end;
          }

          
{-------
          with FDataModule do
          begin
              //Showmessage('Datum: ' + FKalendar.Datum);
              //Showmessage(FKalendar.Datum);


              //   !!!------ Date format: 2.6.2024. ; NOT: 02.06.2024. ------!!!
              //     !!!------ Time format: 09.40.05. ; NOT: 9.40.5 ------!!!
              //      !!!------ Day format: Sunday: 1 Saturday: 7 ------!!!


              //Showmessage(DayOfWeek(Strtodate(FKalendar.Datum)).ToString);
              //Showmessage(FKalendar.Datum);

              //FDDatabaseConnection.Open;
              FDQueryTemp.Sql.Clear;
              FDQueryTemp.Sql.Text:= 'SELECT * FROM DostupnostRadnika WHERE IDRadnika = ' + FKalendar.IDRadnika.ToString;
              //FDQueryTemp.Sql.Text:= 'SELECT * FROM DostupnostRadnika WHERE Datum >= ' + quotedstr(FKalendar.Datum);
              //FDQueryTemp.Sql.Text:= 'SELECT * FROM DostupnostRadnika WHERE NOT Datum = ' + quotedstr(FKalendar.Datum);
              //FDQueryTemp.Sql.Text:= 'SELECT * FROM DostupnostRadnika';

              //Showmessage(Timetostr(EncodeTime(9,40,5,0)));

              FDQueryTemp.Open;
              DostupniTerminiComboBox.Items.Clear;

              while not FDQueryTemp.Eof do
              begin

                  Showmessage(quotedstr(FDQueryTemp['IDRadnika']) + ' - ' + quotedstr(FDQueryTemp['Datum']) + ' - ' +  quotedstr(FDQueryTemp['IDTermina']));
              
                  //Showmessage(FDQueryTemp['IDRadnika']);
                  //Showmessage(FDQueryTemp['Datum']);
                  //Showmessage(FDQueryTemp['IDTermina']);


                  {
                  if StrToDate(FDQueryTemp['Datum']) >= StrToDate(FKalendar.Datum) then
                  begin

                      //Showmessage(quotedstr(FDQueryTemp['IDRadnika']) + ' - ' + quotedstr(FDQueryTemp['Datum']) + ' - ' +  quotedstr(FDQueryTemp['IDTermina']));
                  end;
                  // end here <------------

                  FDQueryTemp.Next;
              end;


              
              var Termini: TTime := EncodeTime(9,0,0,0);

              while (Termini < EncodeTime(19,0,0,0)) do
              begin

                  if TimeToStr(Termini) <> TimeToStr(EncodeTime(12,0,0,0)) then
                  begin
                        //unesi u listu
                        DostupniTerminiComboBox.Items.Add(TimeToStr(Termini));
                  end;
                  
                  Termini := Termini + EncodeTime(0,30,0,0);
              end;
                


              FDQueryTemp.Close;
          end;
}

          //MoguciTermini


          with FDataModule do
          begin
              //Showmessage('Datum: ' + FKalendar.Datum);
              //Showmessage(FKalendar.Datum);


              //   !!!------ Date format: 2.6.2024. ; NOT: 02.06.2024. ------!!!
              //     !!!------ Time format: 09.40.05. ; NOT: 9.40.5 ------!!!
              //      !!!------ Day format: Sunday: 1 Saturday: 7 ------!!!


              //Showmessage(DayOfWeek(Strtodate(FKalendar.Datum)).ToString);
              //Showmessage(FKalendar.Datum);

              //FDDatabaseConnection.Open;
              FDQueryTemp.Sql.Clear;
              FDQueryTemp.Sql.Text:= 'SELECT * FROM MoguciTermini';

              //FDQueryTemp.Sql.Text:= 'SELECT * FROM DostupnostRadnika WHERE Datum >= ' + quotedstr(FKalendar.Datum);
              //FDQueryTemp.Sql.Text:= 'SELECT * FROM DostupnostRadnika WHERE NOT Datum = ' + quotedstr(FKalendar.Datum);
              //FDQueryTemp.Sql.Text:= 'SELECT * FROM DostupnostRadnika';

              //Showmessage(Timetostr(EncodeTime(9,40,5,0)));

              FDQueryTemp.Open;
              DostupniTerminiComboBox.Items.Clear;
              var unos: string;

              while not FDQueryTemp.Eof do
              begin

                  SetLength(IDTerminaArray, Length(IDTerminaArray)+1);
                  SetLength(PocetakTerminaArray, Length(PocetakTerminaArray)+1);
                  SetLength(KrajTerminaArray, Length(KrajTerminaArray)+1);
                  SetLength(StatusArray, Length(StatusArray)+1);

                  //Showmessage('msg1');

                  IDTerminaArray[Length(IDTerminaArray) -1]:= FDQueryTemp['IDTremina'];
                  PocetakTerminaArray[Length(PocetakTerminaArray) -1]:= FDQueryTemp['PocetakTermina'];
                  KrajTerminaArray[Length(KrajTerminaArray) -1]:= FDQueryTemp['KrajTermina'];

                  //Showmessage('msg2');

                  unos:= FDQueryTemp.FieldByName('PocetakTermina').AsString + ' - ' + FDQueryTemp.FieldByName('KrajTermina').AsString;

                  //Showmessage('msg3');


                  //Showmessage('SELECT * FROM DostupnostRadnika WHERE IDRadnika = ' + FKalendar.IDRadnika.ToString + ' AND Datum = ' + quotedstr(FKalendar.Datum) + ' AND IDTermina = ' + quotedstr(FDQueryTemp['IDTremina']));

                  FDQuerySelectDostupnostRadnika.Sql.Clear;
                  FDQuerySelectDostupnostRadnika.Sql.Text:= 'SELECT * FROM DostupnostRadnika WHERE IDRadnika = ' + FKalendar.IDRadnika.ToString + ' AND Datum = ' + quotedstr(FKalendar.Datum) + ' AND IDTermina = ' + quotedstr(FDQueryTemp['IDTremina']);
                  FDQuerySelectDostupnostRadnika.Open;

                  //Showmessage('msg4');

                  if FDQuerySelectDostupnostRadnika.RecordCount = 0 then
                  begin
                        unos:= unos + ' - Slobodan';
                        StatusArray[Length(StatusArray) -1]:= 'Slobodan';
                        //Showmessage('msg5');
                  end

                  else
                  begin
                        unos:= unos + ' - Zauzet';
                        StatusArray[Length(StatusArray) -1]:= 'Zauzet';
                        //Showmessage('msg6');
                  end;


                  DostupniTerminiComboBox.Items.Add(unos);
                  //DostupniTerminiComboBox.Items.Add(FDQueryTemp['PocetakTermina'] + ' - ' + FDQueryTemp['KrajTermina']);



                  {
                  Showmessage(IDTerminaArray[Length(IDTerminaArray) -1].toString + #13#10
                  + PocetakTerminaArray[Length(PocetakTerminaArray) -1] + #13#10
                  + KrajTerminaArray[Length(KrajTerminaArray) -1]);
                  }



                  //Showmessage(IDTerminaArray[Length(IDTerminaArray) -1].toString);
                  //add
                  //IDTerminaArray: array of String;
                  //PocetakTerminaArray: array of String;
                  //KrajTerminaArray: array of String;



                  //IDRadnika = FKalendar.IDRadnika , and FDQueryTemp['IDTermina'] != DostupnostRadnika.'IDTermina'

                  //DostupniTerminiComboBox.Items.Add(FDQueryTemp['PocetakTermina']); // + ' - ' + FDQueryTemp['KrajTermina']);

                  //DST TERMINI

                   
                  //Showmessage(quotedstr(FDQueryTemp['IDRadnika']) + ' - ' + quotedstr(FDQueryTemp['Datum']) + ' - ' +  quotedstr(FDQueryTemp['IDTermina']));
              
                  //Showmessage(FDQueryTemp['IDRadnika']);
                  //Showmessage(FDQueryTemp['Datum']);
                  //Showmessage(FDQueryTemp['IDTermina']);


                  {
                  if StrToDate(FDQueryTemp['Datum']) >= StrToDate(FKalendar.Datum) then
                  begin

                      //Showmessage(quotedstr(FDQueryTemp['IDRadnika']) + ' - ' + quotedstr(FDQueryTemp['Datum']) + ' - ' +  quotedstr(FDQueryTemp['IDTermina']));
                  end;
                  }

                  FDQueryTemp.Next;
              end;
              
              FDQuerySelectDostupnostRadnika.Close;

              
              {
              var Termini: TTime := EncodeTime(9,0,0,0);

              while (Termini < EncodeTime(19,0,0,0)) do
              begin

                  if TimeToStr(Termini) <> TimeToStr(EncodeTime(12,0,0,0)) then
                  begin
                        //unesi u listu
                        DostupniTerminiComboBox.Items.Add(TimeToStr(Termini));
                  end;
                  
                  Termini := Termini + EncodeTime(0,30,0,0);
              end;
              }  


              FDQueryTemp.Close;
          end;

end;



procedure TFTermini.IzaberiBtnClick(Sender: TObject);
begin

            //SetLength(izabraniIDTerminaArray, Length(izabraniIDTerminaArray)+1);
                        //dodati nizove Za broj termina

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

                    //Showmessage(Timetostr(potrebnoVreme) + '  ' + brojTermina.ToString);

                    //var counter: integer := DostupniTerminiComboBox.ItemIndex;


                    //Showmessage(IDTerminaArray[Length(IDTerminaArray)-1].toString);
                    //Showmessage((izabraniIDTermina + brojTermina -1).ToString);

                    if (izabraniIDTermina + brojTermina -1) <= IDTerminaArray[Length(IDTerminaArray)-1] then
                    begin

                        var sviDostupni: boolean := true;
                        var counter: integer := DostupniTerminiComboBox.ItemIndex;
                        while  (counter < DostupniTerminiComboBox.ItemIndex + brojTermina) and sviDostupni do
                        begin

                            //Showmessage(counter.ToString);

                            if StatusArray[counter] = 'Zauzet' then
                            begin
                                sviDostupni:= false;
                            end;

                            counter:= counter +1;
                        end;


                        if sviDostupni then
                        begin
                            //Showmessage('Success');

                            // add code for memorizing selected services in array


                            {
                                IDTerminaArray: array of integer;
                                PocetakTerminaArray: array of String;
                                KrajTerminaArray: array of String;
                                StatusArray: array of String;
                            //--------------------------------------------------
                                izabraniIDTermina: integer;
                                izabraniPocetakTermina: String;
                                izabraniKrajTermina: String;
                                izabraniStatus: String;
                            //--------------------------------------------------
                                izabraniIDTerminaArray: array of integer;
                                izabraniPocetakTerminaArray: array of String;
                                izabraniKrajTerminaArray: array of String;
                                izabraniStatusArray: array of String;

                                imamo brojTermina

                                nizovi su prazni


                            }

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

                                  {
                                  Showmessage(izabraniIDTerminaArray[indexCounter].ToString + #13#10
                                  + izabraniPocetakTerminaArray[indexCounter] + #13#10
                                  + izabraniKrajTerminaArray[indexCounter] + #13#10
                                  + izabraniStatusArray[indexCounter] + #13#10);
                                  }
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
        FIzborUsluga.Show;
        self.Hide;
end;

{
procedure TFTermini.Button1Click(Sender: TObject);
begin
           termin:= '09:00 - 09:30';
           status:= 'Slobodno';
           //promena statusa termina u bazi na zazeto
           //prelazak na formu za placanje
           var placanje := TFPlacanje.Create(self);
           placanje.Show;
           self.Hide;
           end;

procedure TFTermini.Button2Click(Sender: TObject);
begin
           termin:= '10:00 - 10:30';
           status:= 'Zauzeto';
           var placanje := TFPlacanje.Create(self);
           placanje.Show;
           self.Hide;
           //promena statusa termina u bazi na zazeto
           //prelazak na formu za placanje
end;

procedure TFTermini.Button3Click(Sender: TObject);
begin
           termin:= '10:30 - 11:00';
           status:= 'Zauzeto';
           var placanje := TFPlacanje.Create(self);
           placanje.Show;
           self.Hide;
           //promena statusa termina u bazi na zazeto
           //prelazak na formu za placanje
end;
}

procedure TFTermini.BtnINFClick(Sendre: TObject);
begin
      FInformacije := TFInformacije.Create(self);
      FInformacije.Show;
end;

end.

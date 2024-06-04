﻿unit FormaKalendar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Calendar,FMX.StdCtrls,
  FMX.ListBox, FMX.Layouts, FMX.Objects, FormaIzborUsluga, DataModule;

type
  TFKalendar = class(TForm)
    Calendar: TCalendar;
    IzaberiBtn: TButton;
    NotificationButton: TButton;
    RadniciListBox: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    RadniciComboBox: TComboBox;
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    Line1: TLine;
    IzaberiteRadnikaLabel: TLabel;
    NazadBtn: TButton;
    IzaberiteDatumLabel: TLabel;
    procedure IzaberiBtnClick(Sender: TObject);
    //procedure Radnik2Click(Sender: TObject);
    //procedure Radnik3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CalendarChange(Sender: TObject);
    procedure RadniciComboBoxChange(Sender: TObject);
    procedure NazadBtnClick(Sender: TObject);
  private
    { Private declarations }
    RadnikIDArray: array of integer;
  public
    { Public declarations }
    Datum: string;
    //Datum: TDate;
    IDRadnika: integer;
    RadnikKorisnickoIme: string;

  end;

var
  FKalendar: TFKalendar;


implementation
uses KorisnickiNalogGlavnaForma; // ,Placanje
{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}



//var imeRadnika: String = '';
//var radnoVreme: String = '';

procedure TFKalendar.CalendarChange(Sender: TObject);
begin
          Datum:= DateToStr(Calendar.Date);

          //Showmessage(Datum);

          //insert into DostupniTermin
          {
          with FDataModule do
          begin
              FDQueryTemp.Sql.Clear;
              FDQueryTemp.ExecSql ('INSERT INTO DostupniTermini (Datum, IDTermina, Dostupnost) VALUES (' + quotedstr(Datum) + ', 9 , "Slobodan" )' );
          end;
          }

end;

procedure TFKalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
          application.Terminate;
end;

procedure TFKalendar.FormShow(Sender: TObject);
begin
          //sets date to today
          //Calendar.TodayDefault := true;
          Datum:= DateToStr(Calendar.Date);
          //Showmessage(FKorisnickiNalog.IDKorisnika.ToString + ' ' +  FKorisnickiNalog.KorisnickoIme + ' ' + FKorisnickiNalog.Email + ' ' +FKorisnickiNalog.SifraNaloga);

          with FDataModule do
          begin
                  //FDDatabaseConnection.Open;
                  FDQueryTemp.Sql.Clear;
                  FDQueryTemp.Sql.Text:='SELECT * FROM Radnik';
                  FDQueryTemp.Open;

                  RadniciComboBox.Items.Clear;
                  //var i:= 0;
                  while not FDQueryTemp.Eof do
                  begin
                       RadniciComboBox.Items.Add(FDQueryTemp['KorisnickoIme']);
                       SetLength(RadnikIDArray, Length(RadnikIDArray)+1);         //<----------------------
                       RadnikIDArray[Length(RadnikIDArray)-1]:=  FDQueryTemp['IDRadnika'];
                       //Showmessage(RadnikIDArray[Length(RadnikIDArray)-1].ToString + ' ' + FDQueryTemp['KorisnickoIme']);
                       //i:= i+1;
                       FDQueryTemp.Next
                  end;

                  FDQueryTemp.Close;
          end;
end;

procedure TFKalendar.RadniciComboBoxChange(Sender: TObject);
begin
          //Showmessage(RadniciComboBox.Selected.Index.ToString);
          //IDRadnika:= RadnikIDArray[RadniciComboBox.Selected.Index];
          IDRadnika:= RadnikIDArray[RadniciComboBox.ItemIndex];
          RadnikKorisnickoIme:= RadniciComboBox.Selected.Text;
          //index of selected checkbox item
          //Showmessage(RadnikKorisnickoIme);
          //Showmessage(IDRadnika.ToString + '. ' + RadnikKorisnickoIme);
end;

procedure TFKalendar.IzaberiBtnClick(Sender: TObject);
begin
          //imeRadnika:= 'Radnik1';
          //radnoVreme:= '09:00 - 17:00';

          //Showmessage(IDRadnika.ToString + '. ' + RadnikKorisnickoIme);

          if(RadniciComboBox.ItemIndex <> -1) then
          begin

            {
            FPlacanje.Datum:= Datum;
            FPlacanje.IDRadnika:= IDRadnika;
            FPlacanje.RadnikKorisnickoIme:= RadnikKorisnickoIme;

            }

            //Showmessage(DayOfWeek(Strtodate(FKalendar.Datum)).ToString);

            //Showmessage(Calendar.TodayDefault.ToString());

            if Calendar.Date < Date then
            begin
               Showmessage('Ne možete izabrati datum u prošlosti. Morate izabrati drugi datum!');
               RadniciComboBox.SetFocus;
            end

            else
            begin

                    //      !!!------ Day format: Sunday: 1 Saturday: 7 ------!!!
                if (DayOfWeek(Strtodate(Datum)) <> 1) and (DayOfWeek(Strtodate(Datum)) <> 7) then
                begin
                  FIzborUsluga := TFIzborUsluga.Create(self);
                  //FIzborUsluga.RadnikLabel.Text:= RadnikKorisnickoIme;
                  FIzborUsluga.Show;
                  self.Hide;
                end

                else
                begin
                  Showmessage('Subotom i Nedeljom ne radimo. Morate izabrati drugi datum!');
                  RadniciComboBox.SetFocus;
                end;

            end;




          end

          else
          begin
            Showmessage('Morate izabrati radnika da nastavite!');
            RadniciComboBox.SetFocus;
          end;
          //slanje vrednosti imeRadnika i radnoVreme;
end;


procedure TFKalendar.NazadBtnClick(Sender: TObject);
begin
          FKorisnickiNalog.Show;
          self.Hide;
end;


{procedure TFKalendar.Radnik1Click(Sender: TObject);
begin
          imeRadnika:= 'Radnik1';
          radnoVreme:= '09:00 - 17:00';
          var formaIzborUsluga := TFIzborUsluga.Create(self);
          formaIzborUsluga.Show;
          self.Hide;
          //slanje vrednosti imeRadnika i radnoVreme;
end;


procedure TFKalendar.Radnik2Click(Sender: TObject);
begin
          imeRadnika:= 'Radnik2';
          radnoVreme:= '09:00 - 17:00';
          var formaIzborUsluga := TFIzborUsluga.Create(self);
          formaIzborUsluga.Show;
          self.Hide;
          //slanje vrednosti imeRadnika i radnoVreme;
end;


procedure TFKalendar.Radnik3Click(Sender: TObject);
begin
          imeRadnika:= 'Radnik3';
          radnoVreme:= '09:00 - 17:00';
          var formaIzborUsluga := TFIzborUsluga.Create(self);
          formaIzborUsluga.Show;
          self.Hide;
          //slanje vrednosti imeRadnika i radnoVreme;
end;

}

end.

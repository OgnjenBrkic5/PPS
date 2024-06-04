﻿unit FormaIzborUsluga;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, FMX.ListBox, DataModule, FormaTermini,
  FMX.Layouts;

type
  TFIzborUsluga = class(TForm)
    ImageControl1: TImageControl;
    UslugeLabel: TLabel;
    Zakazi: TButton;
    UslugeGrid: TStringGrid;
    colUsluga: TColumn;
    colCena: TColumn;
    colVremeTrajanja: TColumn;
    UslugeComboBox: TComboBox;
    IzaberiBtn: TButton;
    RadnikLabel: TLabel;
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    Line1: TLine;
    NazadBtn: TButton;
    procedure ZakaziClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure IzaberiBtnClick(Sender: TObject);
    procedure NazadBtnClick(Sender: TObject);
  private
    { Private declarations }
    IDUslugeArray: array of integer;
    NazivUslugeArray: array of String;
    CenaUslugeArray: array of integer;
    VremeTrajanjaArray: array of integer;
  public
    { Public declarations }
    unetiIDUslugeArray: array of integer;
    unetiNazivUslugeArray: array of String;
    unetiCenaUslugeArray: array of integer;
    unetiVremeTrajanjaArray: array of integer;
  end;

var
  FIzborUsluga: TFIzborUsluga;

implementation
uses   KorisnickiNalogGlavnaForma, FormaKalendar;
{$R *.fmx}

procedure TFIzborUsluga.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFIzborUsluga.FormShow(Sender: TObject);
begin

      RadnikLabel.Text:= FKalendar.RadnikKorisnickoIme;

      if UslugeGrid.RowCount > 0 then
      begin
      {
            for var counter := 0 to UslugeGrid.RowCount-1 do
            begin
                     UslugeGrid.Cells[0,counter]:= '';
                     UslugeGrid.Cells[1,counter]:= '';
                     UslugeGrid.Cells[2,counter]:= '';
            end;
      }
            UslugeGrid.RowCount:= 0;
      end;


      with FDataModule do
      begin
            //FDDatabaseConnection.Open;
            FDQueryTemp.Sql.Clear;
            FDQueryTemp.Sql.Text:='SELECT * FROM SifarnikUsluga';
            FDQueryTemp.Open;

            UslugeComboBox.Items.Clear;
            var unos: string;
            UslugeComboBox.ItemHeight:= 30;

            while not FDQueryTemp.Eof do
            begin
                 SetLength(IDUslugeArray, Length(IDUslugeArray) +1);
                 SetLength(NazivUslugeArray, Length(NazivUslugeArray) +1);
                 SetLength(CenaUslugeArray, Length(CenaUslugeArray) +1);
                 SetLength(VremeTrajanjaArray, Length(VremeTrajanjaArray) +1);


                 IDUslugeArray[Length(IDUslugeArray) -1]:= FDQueryTemp['IDUsluge'];
                 NazivUslugeArray[Length(NazivUslugeArray) -1]:= FDQueryTemp['NazivUsluge'];
                 CenaUslugeArray[Length(CenaUslugeArray) -1]:= FDQueryTemp['CenaUsluge'];
                 VremeTrajanjaArray[Length(VremeTrajanjaArray)-1]:= FDQueryTemp['VremeTrajanja'];


                 unos:= FDQueryTemp.FieldByName('NazivUsluge').AsString + #13#10 + 'cena: '
                 + FDQueryTemp.FieldByName('CenaUsluge').AsString + ' din. trajanje: '
                 + FDQueryTemp.FieldByName('VremeTrajanja').AsString + 'min.';

                 UslugeComboBox.Items.Add(unos);

                 FDQueryTemp.Next
            end;

            FDQueryTemp.Close;
      end;

end;

procedure TFIzborUsluga.IzaberiBtnClick(Sender: TObject);
begin
      if (UslugeComboBox.ItemIndex <> -1) then
      begin
            if (UslugeGrid.RowCount > 0) then
            begin
                  var counter := 0;
                  var ponavniUnos: boolean := false;

                  while counter < UslugeGrid.RowCount do
                  begin
                        if (UslugeGrid.Cells[0, counter] = NazivUslugeArray[UslugeComboBox.ItemIndex])
                        and (UslugeGrid.Cells[1, counter] = CenaUslugeArray[UslugeComboBox.ItemIndex].ToString)
                        and (UslugeGrid.Cells[2, counter] = VremeTrajanjaArray[UslugeComboBox.ItemIndex].ToString) then
                        begin
                              ponavniUnos:= true;
                        end;
                        counter:= counter +1;
                  end;

                  if ponavniUnos then
                  begin
                        Showmessage('Već ste odabrali tu uslugu!');
                        UslugeComboBox.SetFocus;
                  end

                  else
                  begin
                        UslugeGrid.RowCount := UslugeGrid.RowCount +1;
                        UslugeGrid.Cells[0, UslugeGrid.RowCount -1]:= NazivUslugeArray[UslugeComboBox.ItemIndex];
                        UslugeGrid.Cells[1, UslugeGrid.RowCount -1]:= CenaUslugeArray[UslugeComboBox.ItemIndex].ToString;
                        UslugeGrid.Cells[2, UslugeGrid.RowCount -1]:= VremeTrajanjaArray[UslugeComboBox.ItemIndex].ToString;


                        SetLength(unetiIDUslugeArray, Length(unetiIDUslugeArray) +1);
                        SetLength(unetiNazivUslugeArray, Length(unetiNazivUslugeArray) +1);
                        SetLength(unetiCenaUslugeArray, Length(unetiCenaUslugeArray) +1);
                        SetLength(unetiVremeTrajanjaArray, Length(unetiVremeTrajanjaArray) +1);


                        unetiIDUslugeArray[Length(unetiIDUslugeArray) -1]:= IDUslugeArray[UslugeComboBox.ItemIndex];
                        unetiNazivUslugeArray[Length(unetiNazivUslugeArray) -1]:= NazivUslugeArray[UslugeComboBox.ItemIndex];
                        unetiCenaUslugeArray[Length(unetiCenaUslugeArray) -1]:= CenaUslugeArray[UslugeComboBox.ItemIndex];
                        unetiVremeTrajanjaArray[Length(unetiVremeTrajanjaArray) -1]:= VremeTrajanjaArray[UslugeComboBox.ItemIndex];
                  end;

            end

            else
            begin
                  UslugeGrid.RowCount := UslugeGrid.RowCount +1;
                  UslugeGrid.Cells[0, UslugeGrid.RowCount -1]:= NazivUslugeArray[UslugeComboBox.ItemIndex];
                  UslugeGrid.Cells[1, UslugeGrid.RowCount -1]:= CenaUslugeArray[UslugeComboBox.ItemIndex].ToString;
                  UslugeGrid.Cells[2, UslugeGrid.RowCount -1]:= VremeTrajanjaArray[UslugeComboBox.ItemIndex].ToString;


                  SetLength(unetiIDUslugeArray, Length(unetiIDUslugeArray) +1);
                  SetLength(unetiNazivUslugeArray, Length(unetiNazivUslugeArray) +1);
                  SetLength(unetiCenaUslugeArray, Length(unetiCenaUslugeArray) +1);
                  SetLength(unetiVremeTrajanjaArray, Length(unetiVremeTrajanjaArray) +1);


                  unetiIDUslugeArray[Length(unetiIDUslugeArray) -1]:= IDUslugeArray[UslugeComboBox.ItemIndex];
                  unetiNazivUslugeArray[Length(unetiNazivUslugeArray) -1]:= NazivUslugeArray[UslugeComboBox.ItemIndex];
                  unetiCenaUslugeArray[Length(unetiCenaUslugeArray) -1]:= CenaUslugeArray[UslugeComboBox.ItemIndex];
                  unetiVremeTrajanjaArray[Length(unetiVremeTrajanjaArray) -1]:= VremeTrajanjaArray[UslugeComboBox.ItemIndex];
            end;

      end

      else
      begin
            Showmessage('Niste odabrali ni jednu uslugu!');
            UslugeComboBox.SetFocus;
      end;

end;

procedure TFIzborUsluga.NazadBtnClick(Sender: TObject);
begin
      FKalendar.Show;
      self.Hide;
end;

procedure TFIzborUsluga.ZakaziClick(Sender: TObject);
begin
      if(UslugeGrid.RowCount > 0) then
      begin

          FTermini := TFTermini.Create(self);
          FTermini.Show;
          self.Hide;
      end

      else
      begin
          Showmessage('Morate izabrati barem jednu uslugu da nastavite!');
          UslugeComboBox.SetFocus;
      end;
end;

end.

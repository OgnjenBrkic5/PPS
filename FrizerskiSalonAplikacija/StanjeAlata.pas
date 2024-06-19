﻿unit StanjeAlata;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Grid, FMX.ScrollBox, FMX.ListBox, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, DataModule;

type
  TFStanjeAlata = class(TForm)
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    Line2: TLine;
    Line1: TLine;
    Line3: TLine;
    ImageControl1: TImageControl;
    Nazad: TButton;
    KorisnickoImeLabel: TLabel;
    OcenaLabel: TLabel;
    AlatiComboBox: TComboBox;
    RadnikLabel: TLabel;
    IstorijaOdrzavanjaGrid: TStringGrid;
    colAlat: TStringColumn;
    colDatum: TColumn;
    ZakaziOpravkuBtn: TButton;
    StanjeAlataLabel: TLabel;
    StanjeLabel: TLabel;
    procedure FormShow(Sender: TObject);
    procedure ZakaziOpravkuBtnClick(Sender: TObject);
    procedure AlatiComboBoxChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NazadClick(Sender: TObject);
  private
    { Private declarations }
    IDZaduzenogAlataArray: array of Integer;
    IDTipaAlataArray: array of Integer;
    StanjeArray: array of String;
    NazivTipaAlataArray: array of String;
  public
    { Public declarations }
  end;

var
  FStanjeAlata: TFStanjeAlata;

implementation
uses RadnickiNalog;
{$R *.fmx}

procedure TFStanjeAlata.AlatiComboBoxChange(Sender: TObject);
begin
      if (AlatiComboBox.ItemIndex <> -1) then
      begin

            StanjeAlataLabel.Text:= StanjeArray[AlatiComboBox.ItemIndex];

            if IstorijaOdrzavanjaGrid.RowCount > 0 then
            begin
            {
                  for var counter := 0 to RecenzijeGrid.RowCount-1 do
                  begin
                           RecenzijeGrid.Cells[0,counter]:= '';
                           RecenzijeGrid.Cells[1,counter]:= '';
                           RecenzijeGrid.Cells[2,counter]:= '';
                  end;
             }
                  IstorijaOdrzavanjaGrid.RowCount:= 0;
            end;

            var i: integer;

            with FDataModule do
            begin
                  FDQueryTemp.Sql.Clear;
                  FDQueryTemp.Sql.Text:='SELECT * FROM IstorijaOdrzavana WHERE IDZaduzenogAlata = ' + quotedstr(IDZaduzenogAlataArray[AlatiComboBox.ItemIndex].ToString);
                  FDQueryTemp.Open;

                  while not FDQueryTemp.Eof do
                  begin
                        i := IstorijaOdrzavanjaGrid.RowCount;
                        IstorijaOdrzavanjaGrid.RowCount:= IstorijaOdrzavanjaGrid.RowCount +1;


                        IstorijaOdrzavanjaGrid.Cells[0, i]:= NazivTipaAlataArray[AlatiComboBox.ItemIndex];
                        IstorijaOdrzavanjaGrid.Cells[1, i]:= FDQueryTemp['Datum'];

                        FDQueryTemp.Next;
                  end;

                  FDQueryTemp.Close;
            end;

      end;

end;

procedure TFStanjeAlata.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFStanjeAlata.FormShow(Sender: TObject);
begin
      KorisnickoImeLabel.Text:= FRadnickiNalog.KorisnickoIme;

      if IstorijaOdrzavanjaGrid.RowCount > 0 then
      begin
      {
            for var counter := 0 to RecenzijeGrid.RowCount-1 do
            begin
                     RecenzijeGrid.Cells[0,counter]:= '';
                     RecenzijeGrid.Cells[1,counter]:= '';
                     RecenzijeGrid.Cells[2,counter]:= '';
            end;
       }
            IstorijaOdrzavanjaGrid.RowCount:= 0;
      end;

      with FDataModule do
      begin
            FDQueryTemp.Sql.Clear;
            FDQueryTemp.Sql.Text:='SELECT * FROM ZaduzeniAlat WHERE IDRadnika = ' + quotedstr(FRadnickiNalog.IDRadnika.ToString);
            FDQueryTemp.Open;


            while not FDQueryTemp.Eof do
            begin
                  //IDZaduzenogAlata
                  Setlength(IDZaduzenogAlataArray, Length(IDZaduzenogAlataArray) +1);
                  Setlength(IDTipaAlataArray, Length(IDTipaAlataArray) +1);
                  Setlength(StanjeArray, Length(StanjeArray) +1);
                  Setlength(NazivTipaAlataArray, Length(NazivTipaAlataArray) +1);

                  IDZaduzenogAlataArray[Length(IDZaduzenogAlataArray) -1]:= FDQueryTemp['IDZaduzenogAlata'];
                  IDTipaAlataArray[Length(IDTipaAlataArray) -1]:= FDQueryTemp['IDTipaAlata'];
                  StanjeArray[Length(StanjeArray) -1]:= FDQueryTemp['Stanje'];

                  FDQuerySelectTipoviAlata.Sql.Clear;
                  FDQuerySelectTipoviAlata.Sql.Text := 'SELECT NazivTipaAlata FROM TipoviAlata WHERE IDTipaAlata = ' + quotedstr(FDQueryTemp['IDTipaAlata']);
                  FDQuerySelectTipoviAlata.Open;

                  NazivTipaAlataArray[Length(NazivTipaAlataArray) -1]:= FDQuerySelectTipoviAlata['NazivTipaAlata'];

                  FDQuerySelectTipoviAlata.Close;

                  AlatiComboBox.Items.Add(NazivTipaAlataArray[Length(NazivTipaAlataArray) -1]); //Naziv alata;

                  FDQueryTemp.Next;
            end;


            {
            var i: integer;
            i:= 0;

            while i <  do


            FDQueryTemp.Close;

            FDQueryTemp.Sql.Clear;
            FDQueryTemp.Sql.Text:='SELECT * FROM IstorijaOdrzavana WHERE IDRadnika = ' + quotedstr(FRadnickiNalog.IDRadnika.ToString);
            FDQueryTemp.Open;

            }
      end;

end;

procedure TFStanjeAlata.ZakaziOpravkuBtnClick(Sender: TObject);
begin
      if (AlatiComboBox.ItemIndex <> -1) then
      begin
            if (StanjeArray[AlatiComboBox.ItemIndex] <> 'Potrebno održavanje') then
            begin
                  StanjeAlataLabel.Text:= 'Potrebno održavanje';
                  StanjeArray[AlatiComboBox.ItemIndex]:= 'Potrebno održavanje';

                  with FDataModule do
                  begin
                        FDQueryTemp.Sql.Clear;
                        FDQueryTemp.Sql.Text:='UPDATE ZaduzeniAlat SET Stanje = ' + quotedstr('Potrebno održavanje') +  '  WHERE IDZaduzenogAlata = ' + quotedstr(IDZaduzenogAlataArray[AlatiComboBox.ItemIndex].ToString);
                        //FDQueryTemp.ParamByName();
                        FDQueryTemp.ExecSql;

                        {
                        while not FDQueryTemp.Eof do
                        begin
                              i := IstorijaOdrzavanjaGrid.RowCount;
                              IstorijaOdrzavanjaGrid.RowCount:= IstorijaOdrzavanjaGrid.RowCount +1;


                              IstorijaOdrzavanjaGrid.Cells[0, i]:= NazivTipaAlataArray[AlatiComboBox.ItemIndex];
                              IstorijaOdrzavanjaGrid.Cells[1, i]:= FDQueryTemp['Datum'];

                              FDQueryTemp.Next;
                        end;
                        }



                        //Showmessage('msg1');
                        FDQueryTemp.Sql.Clear;
                        FDQueryTemp.Sql.Text:= ('INSERT INTO IstorijaOdrzavana (IDZaduzenogAlata, Datum) VALUES ('
                        + IDZaduzenogAlataArray[AlatiComboBox.ItemIndex].ToString + ', :Datum )' );
                        FDQueryTemp.ParamByName('Datum').AsDate:= Now;
                        FDQueryTemp.ExecSql;

                        //Showmessage('msg2');

                        {
                        FDQueryTemp.Sql.Clear;
                  FDQueryTemp.Sql.Text := ('INSERT INTO DostupnostRadnika (IDRadnika, Datum, IDTermina) VALUES ('
                  + quotedstr(FKalendar.IDRadnika.ToString) + ', '
                  + ' :Datum , '
                  + quotedstr(FTermini.izabraniIDTerminaArray[terminiIndex].ToString) + ')');
                  FDQueryTemp.ParamByName('Datum').AsDate := FKalendar.Datum;
                  FDQueryTemp.ExecSql;
                        }

                        if IstorijaOdrzavanjaGrid.RowCount > 0 then
                        begin
                        {
                              for var counter := 0 to RecenzijeGrid.RowCount-1 do
                              begin
                                       RecenzijeGrid.Cells[0,counter]:= '';
                                       RecenzijeGrid.Cells[1,counter]:= '';
                                       RecenzijeGrid.Cells[2,counter]:= '';
                              end;
                         }
                              IstorijaOdrzavanjaGrid.RowCount:= 0;
                        end;

                        var i: integer;

                        with FDataModule do
                        begin
                              FDQueryTemp.Sql.Clear;
                              FDQueryTemp.Sql.Text:='SELECT * FROM IstorijaOdrzavana WHERE IDZaduzenogAlata = ' + quotedstr(IDZaduzenogAlataArray[AlatiComboBox.ItemIndex].ToString);
                              FDQueryTemp.Open;

                              while not FDQueryTemp.Eof do
                              begin
                                    i := IstorijaOdrzavanjaGrid.RowCount;
                                    IstorijaOdrzavanjaGrid.RowCount:= IstorijaOdrzavanjaGrid.RowCount +1;


                                    IstorijaOdrzavanjaGrid.Cells[0, i]:= NazivTipaAlataArray[AlatiComboBox.ItemIndex];
                                    IstorijaOdrzavanjaGrid.Cells[1, i]:= FDQueryTemp['Datum'];

                                    FDQueryTemp.Next;
                              end;

                              FDQueryTemp.Close;
                        end;



                        Showmessage('Uspešno ste poslali alat na održavanje');
                  end;




            end

            else
            begin
                  Showmessage('Alat je već poslat na održavanje!');
                  AlatiComboBox.SetFocus;
            end;

      end

      else
      begin
            Showmessage('Morate izabrati alat da zakažete održavanje');
            AlatiComboBox.SetFocus;
      end;

end;

procedure TFStanjeAlata.NazadClick(Sender: TObject);
begin
      Setlength(IDZaduzenogAlataArray, 0);
      Setlength(IDTipaAlataArray, 0);
      Setlength(StanjeArray, 0);
      Setlength(NazivTipaAlataArray, 0);

      FRadnickiNalog.Show;
      self.Hide;
end;

end.

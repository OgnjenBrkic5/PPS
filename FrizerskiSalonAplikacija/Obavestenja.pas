﻿unit Obavestenja;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, System.Rtti, FMX.Grid.Style,
  FMX.Grid, FMX.ScrollBox, DataModule, FMX.Objects, FMX.Layouts;

type
  TFObavestenja = class(TForm)
    NazadBtn: TButton;
    ObavestenjaLabel: TLabel;
    ObavestenjaStringGrid: TStringGrid;
    colRadnik: TColumn;
    colPocetniDatum: TColumn;
    colKrajnjiDatum: TColumn;
    colTekstualnaPoruka: TColumn;
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    Line2: TLine;
    Line1: TLine;
    NotificationButton: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NazadBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObavestenja: TFObavestenja;

implementation
uses KorisnickiNalogGlavnaForma;
{$R *.fmx}

procedure TFObavestenja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFObavestenja.FormShow(Sender: TObject);
begin
      if ObavestenjaStringGrid.RowCount > 0 then
      begin
      {
           for var counter := 0 to ObavestenjaStringGrid.RowCount-1 do
           begin
                    ObavestenjaStringGrid.Cells[0,counter]:= '';
                    ObavestenjaStringGrid.Cells[1,counter]:= '';
                    ObavestenjaStringGrid.Cells[2,counter]:= '';
                    ObavestenjaStringGrid.Cells[3,counter]:= '';
                    ObavestenjaStringGrid.Cells[4,counter]:= '';
           end;
      }
           ObavestenjaStringGrid.RowCount:= 0;
      end;

      with FDataModule do
      begin
            //Promeniti u slučaju izmena tabele Zakazivanje u bazi

            //FDDatabaseConnection.Open;
            FDQueryTemp.Sql.Clear;
            FDQueryTemp.Sql.Text := 'SELECT * FROM Obavestenje';
            FDQueryTemp.Open;


            var i: integer;
            while not FDQueryTemp.Eof do
            begin
                  i:= ObavestenjaStringGrid.RowCount;
                  ObavestenjaStringGrid.RowCount:= ObavestenjaStringGrid.RowCount +1;


                  FDQuerySelectObavestenje.Sql.Clear;
                  FDQuerySelectObavestenje.Sql.Text:= 'SELECT KorisnickoIme FROM Radnik WHERE IDRadnika = ' + quotedstr(FDQueryTemp['IDRadnika']);
                  FDQuerySelectObavestenje.Open;


                  ObavestenjaStringGrid.Cells[0, i]:= FDQuerySelectObavestenje['KorisnickoIme'];
                  ObavestenjaStringGrid.Cells[1, i]:= FDQueryTemp['PocetniDatum'];
                  ObavestenjaStringGrid.Cells[2, i]:= FDQueryTemp['KrajnjiDatum'];
                  ObavestenjaStringGrid.Cells[3, i]:= FDQueryTemp['TekstualnaPoruka'];


                  FDQuerySelectObavestenje.Close;
                  FDQueryTemp.Next;
            end;

            FDQueryTemp.Close;
      end;

end;

procedure TFObavestenja.NazadBtnClick(Sender: TObject);
begin
      FKorisnickiNalog.Show;
      self.Hide;
end;

end.

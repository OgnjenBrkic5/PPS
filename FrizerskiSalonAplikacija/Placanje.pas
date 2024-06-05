﻿unit Placanje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.ListBox, PregledRezervacije, DataModule,
  FMX.Objects, FMX.Layouts;

type
  TFPlacanje = class(TForm)
    PlacanjeLabel: TLabel;
    PotvrdiBtn: TButton;
    NacinPlacanjaComboBox: TComboBox;
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    NazadBtn: TButton;
    procedure PotvrdiBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure NacinPlacanjaComboBoxChange(Sender: TObject);
    procedure NazadBtnClick(Sender: TObject);
  private
    { Private declarations }
    IDNacinaPlacanjaArray: array of integer;
  public
    { Public declarations }
    IDNacinaPlacanja: integer;
    NazivNacinaPlacanja: String;
  end;

var
  FPlacanje: TFPlacanje;

implementation
uses FormaTermini;
{$R *.fmx}

procedure TFPlacanje.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFPlacanje.FormShow(Sender: TObject);
begin
      with FDataModule do
      begin
            FDQueryTemp.Sql.Clear;
            FDQueryTemp.Sql.Text:='SELECT * FROM NacinPlacanja';
            FDQueryTemp.Open;


            NacinPlacanjaComboBox.Items.Clear;
            while not FDQueryTemp.Eof do
            begin
                 NacinPlacanjaComboBox.Items.Add(FDQueryTemp['NazivNacinaPlacanja']);


                 Setlength(IDNacinaPlacanjaArray, Length(IDNacinaPlacanjaArray)+1);


                 IDNacinaPlacanjaArray[Length(IDNacinaPlacanjaArray)-1]:=  FDQueryTemp['IDNacinaPlacanja'];


                 FDQueryTemp.Next
            end;

            FDQueryTemp.Close;
      end;
end;

procedure TFPlacanje.NacinPlacanjaComboBoxChange(Sender: TObject);
begin
      if (NacinPlacanjaComboBox.ItemIndex <> -1) then
      begin
            IDNacinaPlacanja:= IDNacinaPlacanjaArray[NacinPlacanjaComboBox.ItemIndex];
            NazivNacinaPlacanja:= NacinPlacanjaComboBox.Selected.Text;
      end;
end;

procedure TFPlacanje.NazadBtnClick(Sender: TObject);
begin

      if Length(IDNacinaPlacanjaArray) > 0 then
      begin
            for var counter := 0 to Length(IDNacinaPlacanjaArray) -1 do
            begin
                  IDNacinaPlacanjaArray[counter]:= 0;
            end;

      end;

      Setlength(IDNacinaPlacanjaArray, 0);

      IDNacinaPlacanja:= 0;
      NazivNacinaPlacanja:= '';

      NacinPlacanjaComboBox.Items.Clear;


      FTermini.Show;
      self.Hide;
end;

procedure TFPlacanje.PotvrdiBtnClick(Sender: TObject);
begin
      if(NacinPlacanjaComboBox.ItemIndex <> -1) then
      begin
            FPregledRezervacije := TFPregledRezervacije.Create(self);
            FPregledRezervacije.Show;
            self.Hide;
      end

      else
      begin
            Showmessage('Morate izabrati način plaćanja da nastavite!');
            NacinPlacanjaComboBox.SetFocus;
      end;

end;

end.

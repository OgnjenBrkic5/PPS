﻿unit FormaIzborUsluga;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Controls.Presentation, FormaTermini;

type
  TFIzborUsluga = class(TForm)
    ImageControl1: TImageControl;
    Text1: TText;
    Line1: TLine;
    Label1: TLabel;
    Zakazi: TButton;
    Opcija1: TCheckBox;
    Opcija2: TCheckBox;
    Opcija3: TCheckBox;
    Opcija4: TCheckBox;
    Opcija5: TCheckBox;
    Opcija6: TCheckBox;
    procedure Opcija1Change(Sender: TObject);
    procedure Opcija2Change(Sender: TObject);
    procedure Opcija3Change(Sender: TObject);
    procedure Opcija4Change(Sender: TObject);
    procedure Opcija5Change(Sender: TObject);
    procedure Opcija6Change(Sender: TObject);
    procedure ZakaziClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FIzborUsluga: TFIzborUsluga;

implementation

{$R *.fmx}

var imeRadnika: String = '';
var radnoVreme: String = '';
var izabranaUsluga: String = '';
var vremeTrajanjaUsluge: Integer = 0;
var cenaUsluge:Integer = 0;


procedure TFIzborUsluga.Opcija1Change(Sender: TObject);
begin
              izabranaUsluga:= 'Brijanje glave' + ' ' + izabranaUsluga;
              vremeTrajanjaUsluge:= vremeTrajanjaUsluge + 25;
              cenaUsluge:= cenaUsluge + 350;
end;

procedure TFIzborUsluga.Opcija2Change(Sender: TObject);
begin
              izabranaUsluga:= 'Šišanje duge kose makazama' + ' ' + izabranaUsluga;
              vremeTrajanjaUsluge:= vremeTrajanjaUsluge + 20;
              cenaUsluge:= cenaUsluge + 400;
end;

procedure TFIzborUsluga.Opcija3Change(Sender: TObject);
begin
              izabranaUsluga:= 'Fade šišanje' + ' ' + izabranaUsluga;
              vremeTrajanjaUsluge:= vremeTrajanjaUsluge + 30;
              cenaUsluge:= cenaUsluge + 700;
end;

procedure TFIzborUsluga.Opcija4Change(Sender: TObject);
begin
              izabranaUsluga:= 'Kratko šišanje mašinicom' + ' ' + izabranaUsluga;
              vremeTrajanjaUsluge:= vremeTrajanjaUsluge + 15;
              cenaUsluge:= cenaUsluge + 500;
end;

procedure TFIzborUsluga.Opcija5Change(Sender: TObject);
begin
              izabranaUsluga:= 'Sređivanje brade s podbrijavanjem' + ' ' + izabranaUsluga;
              vremeTrajanjaUsluge:= vremeTrajanjaUsluge + 20;
              cenaUsluge:= cenaUsluge + 450;
end;

procedure TFIzborUsluga.Opcija6Change(Sender: TObject);
begin
              izabranaUsluga:= 'Farbanje kose' + ' ' + izabranaUsluga;
              vremeTrajanjaUsluge:= vremeTrajanjaUsluge + 45;
              cenaUsluge:= cenaUsluge + 900;
end;



procedure TFIzborUsluga.ZakaziClick(Sender: TObject);
begin

              var formaTermini := TFTermini.Create(self);
              formaTermini.Show;
              //slanje vrednosti imeRadnika, radnoVreme, izabranaUsluga, vremeTrajanjaUsluge, cenaUsluge;
end;

end.

unit FormaPlacanjeKarticom;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Objects, FMX.Controls.Presentation, FMX.Layouts, PregledRezervacije;

type
  TFPlacanjeKarticom = class(TForm)
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    Line1: TLine;
    IzaberiBtn: TButton;
    BrojRacunaLabel: TLabel;
    DatumIstekaLabel: TLabel;
    NazadBtn: TButton;
    BrojRacunaEdit: TEdit;
    GodinaEdit: TEdit;
    CCVEdit: TEdit;
    MeesecEdit: TEdit;
    CVVLabel: TLabel;
    Line2: TLine;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NazadBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IzaberiBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPlacanjeKarticom: TFPlacanjeKarticom;

implementation
uses Placanje;
{$R *.fmx}

procedure TFPlacanjeKarticom.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFPlacanjeKarticom.FormShow(Sender: TObject);
begin
      BrojRacunaEdit.Text:= '';
      MeesecEdit.Text:= '';
      GodinaEdit.Text:= '';
      CCVEdit.Text:='';
end;

procedure TFPlacanjeKarticom.IzaberiBtnClick(Sender: TObject);
begin
      FPregledRezervacije:= TFPregledRezervacije.Create(self);
      FPregledRezervacije.Show;
      self.Hide;
end;

procedure TFPlacanjeKarticom.NazadBtnClick(Sender: TObject);
begin
      FPlacanje.Show;
      self.Hide;
end;

end.

unit Registracija;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, KorisnickiNalogGlavnaForma, DataModule,
  FMX.Objects, FMX.Layouts;

type
  TFRegistracija = class(TForm)
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    UlogujSe: TButton;
    EmailLine: TLine;
    EmailEdit: TEdit;
    SifraLine: TLine;
    SifraEdit: TEdit;
    SifraLabel: TLabel;
    InputLayout: TLayout;
    EmailLabel: TLabel;
    KorisnickoImeLine: TLine;
    KorisnickoImeEdit: TEdit;
    KorisnickoImeLabel: TLabel;
    Nazad: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NazadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRegistracija: TFRegistracija;

implementation
uses LogInForma;
{$R *.fmx}

procedure TFRegistracija.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //application.Terminate;
end;

{procedure TFRegistracija.UlogujSeClick(Sender: TObject);
begin
    var FKorisnickiNalog := TFKorisnickiNalog.Create(self);
    FKorisnickiNalog.Show;
    self.Hide;
end;}

procedure TFRegistracija.NazadClick(Sender: TObject);
begin
    FLogIn.Show;
    self.Close;
end;

end.

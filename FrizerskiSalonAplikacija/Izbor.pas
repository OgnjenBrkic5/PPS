unit Izbor;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts,
   KorisnickiNalogGlavnaForma, RadnickiNalog;

type
  TFIzbor = class(TForm)
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    RadnikBtn: TButton;
    KorisnikBtn: TButton;
    InputLayout: TLayout;
    NazadBtn: TButton;
    procedure NazadBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure KorisnikBtnClick(Sender: TObject);
    procedure RadnikBtnClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ID: integer;
    KorisnickoIme: String;
    Email: String;
    SifraNaloga: String;

  end;

var
  FIzbor: TFIzbor;

implementation
uses Registracija;
{$R *.fmx}


{
FKorisnickiNalog.IDKorisnika := FDQueryTemp['IDKorisnika'];
                              FKorisnickiNalog.KorisnickoIme  := FDQueryTemp['KorisnickoIme'];
                              FKorisnickiNalog.Email := FDQueryTemp['Email'];
                              FKorisnickiNalog.SifraNaloga := FDQueryTemp['SifraNaloga'];

}

procedure TFIzbor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFIzbor.KorisnikBtnClick(Sender: TObject);
begin
      FKorisnickiNalog:= TFKorisnickiNalog.Create(self);

      FKorisnickiNalog.IDKorisnika:= ID;
      FKorisnickiNalog.KorisnickoIme:= KorisnickoIme;
      FKorisnickiNalog.Email:= Email;
      FKorisnickiNalog.SifraNaloga:= SifraNaloga;

      FKorisnickiNalog.Show;
      self.Hide;
end;

procedure TFIzbor.RadnikBtnClick(Sender: TObject);
begin
      FRadnickiNalog:= TFRadnickiNalog.Create(self);

      FRadnickiNalog.IDRadnika:= ID;
      FRadnickiNalog.KorisnickoIme:= KorisnickoIme;
      FRadnickiNalog.Email:= Email;
      FRadnickiNalog.SifraNaloga:= SifraNaloga;

      FRadnickiNalog.Show;
      self.Hide;
end;

procedure TFIzbor.NazadBtnClick(Sender: TObject);
begin
      FRegistracija.Show;
      self.Hide;
end;

end.

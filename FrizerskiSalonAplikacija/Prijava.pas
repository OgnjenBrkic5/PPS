unit Prijava;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.Ani,
  KorisnickiNalogGlavnaForma, DataModule;

type
  TFPrijava = class(TForm)
    NazadBtn: TButton;
    EmailEdit: TEdit;
    EmailLabel: TLabel;
    UlogujSeBtn: TButton;
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    InputLayout: TLayout;
    EmailLine: TLine;
    SifraLine: TLine;
    SifraEdit: TEdit;
    SifraLabel: TLabel;
    PrikazSifreChB: TCheckBox;
    procedure UlogujSeBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NazadBtnClick(Sender: TObject);
    procedure PrikazSifreChBChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrijava: TFPrijava;

implementation
uses LogInForma;
{$R *.fmx}

procedure TFPrijava.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFPrijava.NazadBtnClick(Sender: TObject);
begin
      FLogIn.Show;
      self.Hide;
end;

procedure TFPrijava.PrikazSifreChBChange(Sender: TObject);
begin
      SifraEdit.Password:= not PrikazSifreChB.IsChecked;
end;

procedure TFPrijava.UlogujSeBtnClick(Sender: TObject);
begin
      var pwd: string;
      if trim(EmailEdit.Text)='' then
      begin
        Showmessage('Unesite e-mail adresu!');
        EmailEdit.SetFocus;
      end
      else
      begin
            with FDataModule do
            begin
                  FDDatabaseConnection.Open;
                  FDQueryTemp.Sql.Clear;
                  FDQueryTemp.Sql.Text:='SELECT * FROM Korisnik WHERE Email=' + quotedstr(EmailEdit.Text);
                  FDQueryTemp.Open;

                  if FDQueryTemp.RecordCount = 1  then
                  begin
                        pwd:= FDQueryTemp.FieldByName('SifraNaloga').AsString;
                        if pwd=SifraEdit.Text then
                        begin
                              FDQueryTemp.Sql.Clear;
                              FDQueryTemp.Sql.Text:='SELECT * FROM Korisnik WHERE Email=' + quotedstr(EmailEdit.Text);
                              FDQueryTemp.Open;


                              FKorisnickiNalog:=TFKorisnickiNalog.Create(self);


                              FKorisnickiNalog.IDKorisnika := FDQueryTemp['IDKorisnika'];
                              FKorisnickiNalog.KorisnickoIme  := FDQueryTemp['KorisnickoIme'];
                              FKorisnickiNalog.Email := FDQueryTemp['Email'];
                              FKorisnickiNalog.SifraNaloga := FDQueryTemp['SifraNaloga'];


                              FDQueryTemp.Close;


                              FKorisnickiNalog.Show;
                              self.Hide;
                        end

                        else
                        begin
                              Showmessage('Netačna lozinka!');
                              SifraEdit.SetFocus;
                        end;


                  end

                  else
                  begin
                        Showmessage('Neispravan e-mail!');
                        EmailEdit.SetFocus;
                  end;

            end;

      end;

end;

end.

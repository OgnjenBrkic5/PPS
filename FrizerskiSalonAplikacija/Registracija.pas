unit Registracija;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, Prijava, DataModule,
  FMX.Objects, FMX.Layouts;                 //KorisnickiNalogGlavnaForma

type
  TFRegistracija = class(TForm)
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    RegistrujSeBtn: TButton;
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
    NazadBtn: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NazadBtnClick(Sender: TObject);
    procedure RegistrujSeBtnClick(Sender: TObject);
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
    application.Terminate;
end;

procedure TFRegistracija.NazadBtnClick(Sender: TObject);
begin
      FLogIn.Show;
      self.Hide;
end;

procedure TFRegistracija.RegistrujSeBtnClick(Sender: TObject);
begin
      var pwd: string;
      if trim(KorisnickoImeEdit.Text)='' then
      begin
            Showmessage('Unesite korisničko ime!');
            KorisnickoImeEdit.SetFocus;
      end

      else
      begin
            if trim(EmailEdit.Text)='' then
            begin
                  Showmessage('Unesite e-mail adresu!');
                  EmailEdit.SetFocus;
            end

            else
            begin
                  if trim(SifraEdit.Text)='' then
                  begin
                        Showmessage('Unesite šifru!');
                        SifraEdit.SetFocus;
                  end

                  else
                  begin
                        with FDataModule do
                        begin
                              FDDatabaseConnection.Open;
                              FDQueryTemp.Sql.Clear;
                              FDQueryTemp.Sql.Text:='SELECT * FROM Korisnik WHERE Email=' + quotedstr(EmailEdit.Text);
                              FDQueryTemp.Open;

                              if FDQueryTemp.RecordCount>0 then
                              begin
                                    Showmessage('Uneti e-mail već postoji. Unesite drugi e-mail!');
                                    EmailEdit.SetFocus;
                              end

                              else
                              begin

                                    FDQueryTemp.Sql.Clear;
                                    FDQueryTemp.ExecSql ('INSERT INTO Korisnik (KorisnickoIme, Email, SifraNaloga) VALUES ('+ quotedstr(KorisnickoImeEdit.Text) + ', ' + quotedstr(EmailEdit.Text)+ ', ' + quotedstr(SifraEdit.Text) +')');


                                    Showmessage('Uspešno ste se registrovali!');


                                    FPrijava:=TFPrijava.Create(self);
                                    FPrijava.Show;
                                    self.Hide;
                              end;

                        end;

                  end;

            end;

      end;

end;

end.

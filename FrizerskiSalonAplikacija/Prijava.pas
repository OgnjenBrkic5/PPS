unit Prijava;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.Ani,
  KorisnickiNalogGlavnaForma, DataModule;

type
  TFPrijava = class(TForm)
    Nazad: TButton;
    EmailEdit: TEdit;
    EmailLabel: TLabel;
    UlogujSe: TButton;
    FormBackgroundLayout: TLayout;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    InputLayout: TLayout;
    EmailLine: TLine;
    SifraLine: TLine;
    SifraEdit: TEdit;
    SifraLabel: TLabel;
    PrikazSifre: TCheckBox;
    procedure UlogujSeClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NazadClick(Sender: TObject);
    procedure PrikazSifreChange(Sender: TObject);
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

{
procedure TFPrijava.Button1Click(Sender: TObject);
begin
          //TFPrijava.Close;
          //FormaPrijava.Free;
end;
}


procedure TFPrijava.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //application.Terminate;
end;

procedure TFPrijava.NazadClick(Sender: TObject);
begin
    FLogIn.Show;
    self.Close;
end;

procedure TFPrijava.PrikazSifreChange(Sender: TObject);
begin
    SifraEdit.Password:= not PrikazSifre.IsChecked;
end;

procedure TFPrijava.UlogujSeClick(Sender: TObject);

//var OsnovneIformacije:= TFOsnovneIformacije.Create(self);
var pwd: string;
begin
    if trim(EmailEdit.Text)='' then
    begin
      Showmessage('Unesite e-mail adresu!');
      EmailEdit.SetFocus;
    end
    else
    begin
      //if trim(SifraEdit.Text)='' then
      //begin
        //Showmessage('Unesite šiftu!');
        //SifraEdit.SetFocus;
      //end
      //else
      //begin
        with FDataModule do
        begin
          FDDatabaseConnection.Open;
          //Showmessage('msg1');
          FDQueryTemp.Sql.Clear;
          FDQueryTemp.Sql.Text:='SELECT * FROM Korisnik WHERE Email=' + quotedstr(EmailEdit.Text);
          //Showmessage('msg2');
          FDQueryTemp.Open;
          //Showmessage('mdg3');

          //if FDQueryTemp.RecordCount > 0  then
          if FDQueryTemp.RecordCount = 1  then
          begin
            //SifraEdit.Text
            //Showmessage('msg4');
            pwd:= FDQueryTemp.FieldByName('SifraNaloga').AsString;
            if pwd=SifraEdit.Text then
            begin
              //Showmessage('msg5');
              //FKorisnickiNalog:=TFKorisnickiNalog.Create(self);
              //FKorisnickiNalog.ImeKorisnika.text:= EmailEdit.text;

              //FPrijava.Hide;
              FKorisnickiNalog:=TFKorisnickiNalog.Create(self);
              //FKorisnickiNalog.ImeKorisnika.text:= EmailEdit.text;


              {Showmessage(FDQueryTemp.FieldByName('IDKorisnika').AsString);
              Showmessage('msg4');}



              //FDQueryTemp
               //FDQuerySelectKorisnik.Open;
               //Showmessage(FDQuerySelectKorisnik['SifraNaloga']);//['IDKorisnika']);
               //FDataModule.FDQueryTemp.ExecSQL()

               FDQueryTemp.Sql.Clear;
               FDQueryTemp.Sql.Text:='SELECT * FROM Korisnik WHERE Email=' + quotedstr(EmailEdit.Text);
               FDQueryTemp.Open;
               //Showmessage(FDQueryTemp['IDKorisnika']);

              {FKorisnickiNalog.IDKorisnika := FDQueryTemp.FieldByName('IDKorisnika').AsInteger;
              FKorisnickiNalog.KorisnickoIme  := FDQueryTemp.FieldByName('KorisnickoIme').AsString;
              FKorisnickiNalog.Email := FDQueryTemp.FieldByName('Email').AsString;
              FKorisnickiNalog.SifraNaloga := FDQueryTemp.FieldByName('SifraNaloga').AsString;
              Showmessage('msg5');}

              FKorisnickiNalog.IDKorisnika := FDQueryTemp['IDKorisnika'];
              FKorisnickiNalog.KorisnickoIme  := FDQueryTemp['KorisnickoIme'];
              FKorisnickiNalog.Email := FDQueryTemp['Email'];
              FKorisnickiNalog.SifraNaloga := FDQueryTemp['SifraNaloga'];
              //Showmessage('msg5');

              FDQueryTemp.Close;

              FKorisnickiNalog.Show;
              self.Close;

              //self.Hide;

              {FKorisnickiNalog.ShowModal(
                  procedure (Modalresult: TModalResult)
                  begin
                    Showmessage('msg5');
                    if ModalResult = mrClose then Application.Terminate;
                  end);

              FPrijava.Hide;

              {if not Assigned(FKorisnickiNalog) then
              begin
                Showmessage('msg6');
                FKorisnickiNalog:=TFKorisnickiNalog.Create(self);
                //Showmessage('msg7');
                FKorisnickiNalog.ImeKorisnika.text:= EmailEdit.text;


              FKorisnickiNalog.ShowModal(
                  procedure (Modalresult: TModalResult)
                  begin
                    if ModalResult = mrClose then Application.Terminate;
                  end);






              //ImeKorisnika
                {FKorisnickiNalog.ShowModal(Modalresult:TFModalresult)
                  begin
                    if ModalResult = mrClose then Application.Terminate;

                  end;

              end;

              //self.Close;
              end;}
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
      //end;

    end;






    {var OsnovneIformacije := TFOsnovneIformacije.Create(self);
    OsnovneIformacije.Show;
    self.Hide;}
end;

end.

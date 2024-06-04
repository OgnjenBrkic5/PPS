unit LogInForma;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Registracija, Prijava,
  FMX.Layouts, FMX.Objects;      //, DataModule

type
  TFLogIn = class(TForm)
    RegistrujSeBtn: TButton;
    FormBackgroundLayout: TLayout;
    InputLayout: TLayout;
    UlogujSeBtn: TButton;
    FormBackgroundRectangle: TRectangle;
    InputeRectangle: TRectangle;
    procedure UlogujSeBtnClick(Sender: TObject);
    procedure RegistrujSeBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FLogIn: TFLogIn;

implementation

{$R *.fmx}

procedure TFLogIn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    application.Terminate;
end;

procedure TFLogIn.RegistrujSeBtnClick(Sender: TObject);
begin
    var ForamaRegistrujse := TFRegistracija.Create(self);
    ForamaRegistrujse.Show;
    self.Hide;
  end;

procedure TFLogIn.UlogujSeBtnClick(Sender: TObject);
begin
    var FormaPrijava := TFPrijava.Create(self);
    FormaPrijava.Show;
    //FLogin.Hide;
    self.Hide;
    //self.Close;
end;


end.

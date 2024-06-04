unit Informacije;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFInformacije = class(TForm)
    BestlatnaUslugaLabel: TLabel;
    KasnjenjeLabel: TLabel;
    RadnoVremeLabel: TLabel;
    NazadBtn: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NazadBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FInformacije: TFInformacije;

implementation
uses FormaTermini;
{$R *.fmx}



procedure TFInformacije.FormShow(Sender: TObject);
begin
    RadnoVremeLabel.Text:= 'Radno vreme Ponedeljak-Petak: 09:00 - 19:00' + #13#10
    + 'Pauza: 12:00-13:00' + #13#10
    + 'Subotm i Nedeljom ne radimo';
end;

procedure TFInformacije.NazadBtnClick(Sender: TObject);
begin
    FTermini.Show;
    self.Hide;
end;


procedure TFInformacije.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    application.Terminate;
end;

end.

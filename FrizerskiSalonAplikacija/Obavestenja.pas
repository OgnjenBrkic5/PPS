unit Obavestenja;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFObavestenja = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Nazad: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NazadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FObavestenja: TFObavestenja;

implementation
uses KorisnickiNalogGlavnaForma;
{$R *.fmx}

procedure TFObavestenja.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFObavestenja.NazadClick(Sender: TObject);
begin
      FKorisnickiNalog.Show;
      self.Hide;
end;

end.

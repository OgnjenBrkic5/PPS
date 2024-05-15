unit Informacije;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls;

type
  TFInformacije = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);

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



procedure TFInformacije.Button1Click(Sender: TObject);
begin
    FTermini.Show;
    self.Hide;
end;


procedure TFInformacije.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //application.Terminate;
end;

end.

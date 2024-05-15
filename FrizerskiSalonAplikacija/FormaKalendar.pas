unit FormaKalendar;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Calendar,FMX.StdCtrls, FormaIzborUsluga,
  FMX.ListBox, FMX.Layouts;

type
  TFKalendar = class(TForm)
    Calendar1: TCalendar;
    Radnik1: TButton;
    Radnik2: TButton;
    Radnik3: TButton;
    NotificationButton: TButton;
    ListBox1: TListBox;
    ListBoxItem1: TListBoxItem;
    ListBoxItem2: TListBoxItem;
    ListBoxItem3: TListBoxItem;
    ListBoxItem4: TListBoxItem;
    ListBoxItem5: TListBoxItem;
    ListBoxItem6: TListBoxItem;
    procedure Radnik1Click(Sender: TObject);
    procedure Radnik2Click(Sender: TObject);
    procedure Radnik3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FKalendar: TFKalendar;


implementation

{$R *.fmx}
{$R *.NmXhdpiPh.fmx ANDROID}
{$R *.LgXhdpiPh.fmx ANDROID}


var imeRadnika: String = '';
var radnoVreme: String = '';

procedure TFKalendar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    //application.Terminate;
end;

procedure TFKalendar.Radnik1Click(Sender: TObject);
begin
          imeRadnika:= 'Radnik1';
          radnoVreme:= '09:00 - 17:00';
          var formaIzborUsluga := TFIzborUsluga.Create(self);
          formaIzborUsluga.Show;
          self.Hide;
          //slanje vrednosti imeRadnika i radnoVreme;
end;

procedure TFKalendar.Radnik2Click(Sender: TObject);
begin
          imeRadnika:= 'Radnik2';
          radnoVreme:= '09:00 - 17:00';
          var formaIzborUsluga := TFIzborUsluga.Create(self);
          formaIzborUsluga.Show;
          self.Hide;
          //slanje vrednosti imeRadnika i radnoVreme;
end;


procedure TFKalendar.Radnik3Click(Sender: TObject);
begin
          imeRadnika:= 'Radnik3';
          radnoVreme:= '09:00 - 17:00';
          var formaIzborUsluga := TFIzborUsluga.Create(self);
          formaIzborUsluga.Show;
          self.Hide;
          //slanje vrednosti imeRadnika i radnoVreme;
end;

end.

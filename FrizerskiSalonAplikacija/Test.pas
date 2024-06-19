unit Test;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.StdCtrls, FMX.Grid, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Layouts, DataModule;

type
  TFTest = class(TForm)
    FormBackgroundLayout: TLayout;
    TestGrid: TStringGrid;
    colID: TColumn;
    colDatum: TColumn;
    OsnovneInformacijeBtn: TButton;
    NazadBtn: TButton;
    RecenzijeBtn: TButton;
    procedure NazadBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FTest: TFTest;

implementation
uses LogInForma;
{$R *.fmx}

procedure TFTest.FormClose(Sender: TObject; var Action: TCloseAction);
begin
      application.Terminate;
end;

procedure TFTest.FormShow(Sender: TObject);
begin


      with FDataModule do
      begin
            if TestGrid.RowCount > 0 then
            begin
            {
                  for var counter := 0 to IstrorijaStringGrid.RowCount-1 do
                  begin
                           IstrorijaStringGrid.Cells[0,counter]:= '';
                           IstrorijaStringGrid.Cells[1,counter]:= '';
                           IstrorijaStringGrid.Cells[2,counter]:= '';
                           IstrorijaStringGrid.Cells[3,counter]:= '';
                           IstrorijaStringGrid.Cells[4,counter]:= '';
                  end;
             }
                  TestGrid.RowCount:= 0;
            end;



            FDQueryTemp.Sql.Clear;
            FDQueryTemp.Sql.Text := 'SELECT * FROM Test ORDER BY Datum DESC';
            FDQueryTemp.Open;

            var i: integer;
            while not FDQueryTemp.Eof do
            begin
                  i := TestGrid.RowCount;
                  TestGrid.RowCount:= TestGrid.RowCount + 1;

                  TestGrid.Cells[0,i]:= FDQueryTemp['ID'];
                  TestGrid.Cells[1,i]:= FDQueryTemp['Datum'];

                  FDQueryTemp.Next;
            end;


            FDQueryTemp.Close;

            {
            FDQueryTemp.Sql.Clear;
            FDQueryTemp.Sql.Text := 'INSERT INTO Test (Datum) VALUES (' + quotedstr(TestGrid.Cells[1,1])  + ')';
            FDQueryTemp.Open;

            FDQueryTemp.Close;
            }
      end;

end;

procedure TFTest.NazadBtnClick(Sender: TObject);
begin
      FLogIn.Show;
      self.Hide;
end;

end.

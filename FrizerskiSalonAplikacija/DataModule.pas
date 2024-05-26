unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Stan.ExprFuncs, FireDAC.Phys.SQLiteWrapper.Stat, System.IOUtils,
  FireDAC.Phys.SQLiteDef, FireDAC.Phys.SQLite, FireDAC.Comp.Client, Data.DB,
  FireDAC.Comp.DataSet, Data.FMTBcd, Data.SqlExpr, Data.Bind.Components,
  Data.Bind.DBScope;

type
  TFDataModule = class(TDataModule)
    FDDatabaseConnectionDBFolder: TFDConnection;
    FDMemTable1: TFDMemTable;
    FDTable1: TFDTable;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDSQLiteSecurity1: TFDSQLiteSecurity;
    FDQueryTemp: TFDQuery;
    FDQuerySelectKorisnik: TFDQuery;
    FDQueryCreateTableKorisnik: TFDQuery;
    FDQueryCreateTableRadnik: TFDQuery;
    FDQueryCreateTableDostupniTermini: TFDQuery;
    FDQueryCreateTableDostupnostRadnika: TFDQuery;
    FDQueryCreateTableIzabraneUsluge: TFDQuery;
    FDQueryCreateTableMoguciTermini: TFDQuery;
    FDQueryCreateTableNacinPlacanja: TFDQuery;
    FDQueryCreateTableObavestenje: TFDQuery;
    FDQueryCreateTableRacun: TFDQuery;
    FDQueryCreateTableRadnaPozicija: TFDQuery;
    FDQueryCreateTableRecenzije: TFDQuery;
    FDQueryCreateTableSifarnikUsluga: TFDQuery;
    FDQueryCreateTableZakazivanje: TFDQuery;
    FDQueryCreateDatabase: TFDQuery;
    FDDatabaseConnection: TFDConnection;
    BindSourceDB1: TBindSourceDB;
    FDQuery1: TFDQuery;
    FDQuerySelectRadnik: TFDQuery;
    FDQuerySelectDostupniTermini: TFDQuery;
    FDQuerySelectDostupnostRadnika: TFDQuery;
    FDQuerySelectIzabraneUsluge: TFDQuery;
    FDQuerySelectMoguciTermini: TFDQuery;
    FDQuerySelectNacinPlacanja: TFDQuery;
    FDQuerySelectObavestenje: TFDQuery;
    FDQuerySelectRacun: TFDQuery;
    FDQuerySelectRadnaPozicija: TFDQuery;
    FDQuerySelectRecenzije: TFDQuery;
    FDQuerySelectSifarnikUsluga: TFDQuery;
    FDQuerySelectZakazivanje: TFDQuery;
    procedure FDDatabaseConnectionBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

CONST
    DB_FILENAME = 'database.db';
    //DB_PASSWORD = 'MYSQLitePassword';
    //DB_ENCRIPTION = 'aes-256';

    DB_TABLE_KORISNIK = 'Korisnik';
    DB_TABLE_RADNA_POZICIJA = 'RadnaPozicija';
    DB_TABLE_RADNIK = 'Radnik';
    DB_TABLE_RECENZIJE = 'Recenzije';
    DB_TABLE_OBAVESTENJE = 'Obavestenje';
    DB_TABLE_MOGUCI_TERMINI = 'MoguciTermini';
    DB_TABLE_DOSTUPNI_TERMINI = 'DostupinTermini';
    DB_TABLE_DOSTUPNOST_RADNIKA = 'DostupnostRadnika';
    DB_TABLE_SIFARNIK_USLUGA = 'SifarnikUsluga';
    DB_TABLE_IZABRANE_USLUGE = 'IzabraneUsluge';
    DB_TABLE_ZAKAZIVANJE = 'Zakazivanje';
    DB_TABLE_NACIN_PLACANJA = 'NacinPlacanja';
    DB_TABLE_RACUN = 'Racun';



var
  FDataModule: TFDataModule;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}

procedure TFDataModule.FDDatabaseConnectionBeforeConnect(Sender: TObject);
begin
   //set the database file for each device
   {$IF DEFINED (ANDROID)}
   FDDatabaseConnection.Params.Values['Database'] := TPath.GetDocumentsPath + PathDelim + 'FrizerskiSalonDatabase.db';
   {$ELSEIF DEFINED (MSWINDOWS)}
   {$ENDIF}

end;

end.

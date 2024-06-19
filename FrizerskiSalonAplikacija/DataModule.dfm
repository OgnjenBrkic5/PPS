object FDataModule: TFDataModule
  Height = 999
  Width = 1211
  PixelsPerInch = 120
  object FDQueryTemp: TFDQuery
    Connection = FDDatabaseConnection
    Left = 648
    Top = 16
  end
  object FDQuerySelectKorisnik: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM Korisnik;')
    Left = 392
    Top = 144
  end
  object FDQueryCreateTableKorisnik: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS Korisnik ('
      '    IDKorisnika   INTEGER      NOT NULL'
      '                               UNIQUE'
      '                               DEFAULT (1),'
      '    KorisnickoIme VARCHAR (20) NOT NULL,'
      '    Email         VARCHAR (30) NOT NULL,'
      '    SifraNaloga   VARCHAR (20) NOT NULL,'
      '    SlikaProfila  BLOB,'
      '    PRIMARY KEY ('
      '        IDKorisnika ASC AUTOINCREMENT'
      '    )'
      ');')
    Left = 120
    Top = 144
  end
  object FDQueryCreateTableRadnik: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS Radnik ('
      '    IDRadnika     INTEGER      UNIQUE'
      '                               NOT NULL'
      '                               DEFAULT (1),'
      '    KorisnickoIme VARCHAR (20) NOT NULL,'
      
        '    IDPozicije    INTEGER      REFERENCES RadnaPozicija (IDPozic' +
        'ije) ON DELETE CASCADE'
      
        '                                                                ' +
        '     ON UPDATE CASCADE'
      
        '                                                                ' +
        '     MATCH [FULL]'
      '                               NOT NULL,'
      '    Email         VARCHAR (30) NOT NULL,'
      '    SifraNaloga   VARCHAR (20) NOT NULL,'
      '    SlikaProfila  BLOB,'
      '    PRIMARY KEY ('
      '        IDRadnika ASC AUTOINCREMENT')
    Left = 120
    Top = 208
  end
  object FDQueryCreateTableDostupniTermini: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS DostupniTermini ('
      '    Datum      DATE         NOT NULL,'
      
        '    IDTermina  INTEGER      REFERENCES MoguciTermini (IDTremina)' +
        ' ON DELETE CASCADE'
      
        '                                                                ' +
        ' ON UPDATE CASCADE'
      
        '                                                                ' +
        ' MATCH [FULL]'
      '                            NOT NULL,'
      '    Dostupnost VARCHAR (20) NOT NULL,'
      '    PRIMARY KEY ('
      '        Datum,'
      '        IDTermina'
      '    ),'
      '    FOREIGN KEY ('
      '        IDTermina'
      '    )'
      '    REFERENCES MoguciTermini (IDTremina) ON UPDATE CASCADE'
      ');'
      '')
    Left = 120
    Top = 272
  end
  object FDQueryCreateTableDostupnostRadnika: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS DostupnostRadnika ('
      
        '    IDRadnika INTEGER REFERENCES Radnik (IDRadnika) ON DELETE CA' +
        'SCADE'
      
        '                                                    ON UPDATE CA' +
        'SCADE'
      '                                                    MATCH [FULL]'
      '                      NOT NULL,'
      '    Datum     DATE    NOT NULL,'
      '    IDTermina INTEGER NOT NULL,'
      '    PRIMARY KEY ('
      '        IDRadnika,'
      '        Datum,'
      '        IDTermina'
      '    ),'
      '    FOREIGN KEY ('
      '        IDRadnika'
      '    )'
      '    REFERENCES Radnik (IDRadnika) ON UPDATE CASCADE,'
      '    FOREIGN KEY ('
      '        Datum,'
      '        IDTermina'
      '    )'
      '    REFERENCES DostupniTermini (Datum,'
      '    IDTermina) ON UPDATE CASCADE'
      ');')
    Left = 120
    Top = 336
  end
  object FDQueryCreateTableIzabraneUsluge: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS IzabraneUsluge ('
      '    IDIzabraneUsluge INTEGER UNIQUE'
      '                             NOT NULL'
      '                             DEFAULT (1),'
      '    IDKorisnika      INTEGER NOT NULL,'
      '    IDUsluge         INTEGER NOT NULL,'
      '    PRIMARY KEY ('
      '        IDIzabraneUsluge ASC AUTOINCREMENT'
      '    ),'
      '    FOREIGN KEY ('
      '        IDKorisnika'
      '    )'
      '    REFERENCES Korisnik (IDKorisnika) ON UPDATE CASCADE,'
      '    FOREIGN KEY ('
      '        IDUsluge'
      '    )'
      '    REFERENCES SifarnikUsluga (IDUsluge) ON UPDATE CASCADE'
      ');')
    Left = 120
    Top = 400
  end
  object FDQueryCreateTableMoguciTermini: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE  IF NOT EXISTS MoguciTermini ('
      '    IDTremina      INTEGER      UNIQUE'
      '                                NOT NULL'
      '                                DEFAULT (1),'
      '    PocetakTermina VARCHAR (20) UNIQUE'
      '                                NOT NULL,'
      '    KrajTermina    VARCHAR (20) UNIQUE'
      '                                NOT NULL,'
      '    PRIMARY KEY ('
      '        IDTremina ASC AUTOINCREMENT'
      '    )'
      ');')
    Left = 120
    Top = 464
  end
  object FDQueryCreateTableNacinPlacanja: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE  IF NOT EXISTS NacinPlacanja ('
      '    IDNacinaPlacanja    INTEGER      NOT NULL'
      '                                     UNIQUE,'
      '    NazivNacinaPlacanja VARCHAR (20) NOT NULL,'
      '    PRIMARY KEY ('
      '        IDNacinaPlacanja ASC AUTOINCREMENT'
      '    )'
      ');'
      ''
      ');')
    Left = 120
    Top = 528
  end
  object FDQueryCreateTableObavestenje: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS Obavestenje ('
      '    IDObavestenja    INTEGER       NOT NULL'
      '                                   UNIQUE'
      '                                   DEFAULT (1),'
      
        '    IDRadnika        INTEGER       REFERENCES Radnik (IDRadnika)' +
        ' ON DELETE CASCADE'
      
        '                                                                ' +
        ' ON UPDATE CASCADE'
      
        '                                                                ' +
        ' MATCH [FULL]'
      '                                   NOT NULL,'
      '    PocetniDatum     DATE,'
      '    KrajnjiDatum     DATE,'
      '    TekstualnaPoruka VARCHAR (250),'
      '    PRIMARY KEY ('
      '        IDObavestenja ASC AUTOINCREMENT'
      '    ),'
      '    FOREIGN KEY ('
      '        IDRadnika'
      '    )'
      '    REFERENCES Radnik (IDRadnika) ON UPDATE CASCADE'
      ');'
      '')
    Left = 120
    Top = 592
  end
  object FDQueryCreateTableRacun: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS Racun ('
      '    IDRacuna         INTEGER       NOT NULL'
      '                                   UNIQUE,'
      '    IDZakazaneUsluge INTEGER       NOT NULL,'
      '    IDNacinaPlacanja INTEGER       NOT NULL,'
      '    PRIMARY KEY ('
      '        IDRacuna ASC AUTOINCREMENT'
      '    ),'
      '    FOREIGN KEY ('
      '        IDZakazaneUsluge'
      '    )'
      '    REFERENCES Zakazivanje (IDZakazaneUsluge) ON UPDATE CASCADE,'
      '    FOREIGN KEY ('
      '        IDNacinaPlacanja'
      '    )'
      
        '    REFERENCES NacinPlacanja (IDNacinaPlacanja) ON UPDATE CASCAD' +
        'E'
      ');')
    Left = 120
    Top = 656
  end
  object FDQueryCreateTableRadnaPozicija: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS RadnaPozicija ('
      '    IDPozicije     INTEGER      NOT NULL'
      '                                UNIQUE'
      '                                DEFAULT (1),'
      '    NazivZanimanja VARCHAR (20) NOT NULL,'
      '    PRIMARY KEY ('
      '        IDPozicije ASC AUTOINCREMENT'
      '    )'
      ');'
      '')
    Left = 120
    Top = 720
  end
  object FDQueryCreateTableRecenzije: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS Recenzije ('
      '    IDRecenzije      INTEGER        NOT NULL'
      '                                    DEFAULT (1) '
      '                                    UNIQUE,'
      '    IDKorisnika      INTEGER        NOT NULL,'
      '    IDRadnika        INTEGER        NOT NULL,'
      '    TekstualnaPoruka VARCHAR (250),'
      '    Ocena            INTEGER (1, 5) NOT NULL,'
      '    PRIMARY KEY ('
      '        IDRecenzije ASC AUTOINCREMENT'
      '    ),'
      '    FOREIGN KEY ('
      '        IDKorisnika'
      '    )'
      '    REFERENCES Korisnik (IDKorisnika) ON UPDATE CASCADE,'
      '    FOREIGN KEY ('
      '        IDRadnika'
      '    )'
      '    REFERENCES Radnik (IDRadnika) ON UPDATE CASCADE'
      ');'
      '')
    Left = 120
    Top = 784
  end
  object FDQueryCreateTableSifarnikUsluga: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS SifarnikUsluga ('
      '    IDUsluge      INTEGER      NOT NULL'
      '                               UNIQUE'
      '                               DEFAULT (1),'
      '    NazivUsluge   VARCHAR (30) NOT NULL,'
      '    CenaUsluge    INTEGER      NOT NULL,'
      '    VremeTrajanja INTEGER      NOT NULL,'
      '    PRIMARY KEY ('
      '        IDUsluge ASC AUTOINCREMENT'
      '    )'
      ');'
      '')
    Left = 120
    Top = 848
  end
  object FDQueryCreateTableZakazivanje: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS Zakazivanje;'
      ''
      'CREATE TABLE Zakazivanje ('
      '    IDZakazaneUsluge INTEGER NOT NULL'
      '                             UNIQUE,'
      '    IDKorisnika      INTEGER NOT NULL,'
      '    IDUsluge         INTEGER NOT NULL,'
      '    IDRadnika        INTEGER NOT NULL,'
      '    Datum            DATE    NOT NULL,'
      '    IDTermina        INTEGER NOT NULL,'
      '    PRIMARY KEY ('
      '        IDZakazaneUsluge ASC AUTOINCREMENT'
      '    ),'
      '    FOREIGN KEY ('
      '        IDKorisnika'
      '    )'
      '    REFERENCES Korisnik (IDKorisnika) ON UPDATE CASCADE,'
      '    FOREIGN KEY ('
      '        IDUsluge'
      '    )'
      '    REFERENCES SifarnikUsluga (IDUsluge) ON UPDATE CASCADE,'
      '    FOREIGN KEY ('
      '        IDRadnika,'
      '        Datum,'
      '        IDTermina'
      '    )'
      '    REFERENCES DostupnostRadnika (IDRadnika,'
      '    Datum,'
      '    IDTermina) ON UPDATE CASCADE'
      ');')
    Left = 120
    Top = 912
  end
  object FDQueryCreateDatabase: TFDQuery
    SQL.Strings = (
      'CREATE DATABASE FrizerskiSalonDatabase;')
    Left = 384
    Top = 16
  end
  object FDDatabaseConnection: TFDConnection
    Params.Strings = (
      
        'Database=C:\Users\PC\Documents\GitHub\PPS\FrizerskiSalonAplikaci' +
        'ja\Database\FrizerskiSalonDatabase.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    LoginPrompt = False
    BeforeConnect = FDDatabaseConnectionBeforeConnect
    Left = 120
    Top = 16
  end
  object FDQuerySelectRadnik: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM Korisnik;')
    Left = 392
    Top = 208
  end
  object FDQuerySelectDostupniTermini: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM DostupniTermini;')
    Left = 392
    Top = 272
  end
  object FDQuerySelectDostupnostRadnika: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM DostupnostRadnika;')
    Left = 392
    Top = 336
  end
  object FDQuerySelectIzabraneUsluge: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM IzabraneUsluge;')
    Left = 392
    Top = 400
  end
  object FDQuerySelectMoguciTermini: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM MoguciTermini;')
    Left = 392
    Top = 464
  end
  object FDQuerySelectNacinPlacanja: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM NacinPlacanja;')
    Left = 392
    Top = 528
  end
  object FDQuerySelectObavestenje: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM Obavestenje;')
    Left = 392
    Top = 592
  end
  object FDQuerySelectRacun: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM NacinPlacanja;')
    Left = 392
    Top = 656
  end
  object FDQuerySelectRadnaPozicija: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM RadnaPozicija;')
    Left = 392
    Top = 720
  end
  object FDQuerySelectRecenzije: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM Recenzije;')
    Left = 392
    Top = 784
  end
  object FDQuerySelectSifarnikUsluga: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM SifarnikUsluga;')
    Left = 392
    Top = 848
  end
  object FDQuerySelectZakazivanje: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM Zakazivanje;')
    Left = 392
    Top = 912
  end
  object FDTransaction: TFDTransaction
    Connection = FDDatabaseConnection
    Left = 856
    Top = 16
  end
  object FDQueryCreateTableTipoviAlata: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS TipoviAlata ('
      '    IDTipaAlata    INTEGER      UNIQUE'
      '                                NOT NULL'
      '                                DEFAULT (1),'
      '    NazivTipaAlata VARCHAR (50) NOT NULL,'
      '    PRIMARY KEY ('
      '        IDTipaAlata ASC AUTOINCREMENT'
      '    )'
      ');')
    Left = 696
    Top = 144
  end
  object FDQueryCreateTableZaduzeniAlat: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS ZaduzeniAlat ('
      '    IDZaduzenogAlata INTEGER      UNIQUE'
      '                                  NOT NULL'
      '                                  DEFAULT (1),'
      '    IDRadnika        INTEGER      NOT NULL,'
      '    IDTipaAlata      INTEGER      NOT NULL,'
      '    Stanje           VARCHAR (60),'
      '    PRIMARY KEY ('
      '        IDZaduzenogAlata ASC AUTOINCREMENT'
      '    ),'
      '    FOREIGN KEY ('
      '        IDRadnika'
      '    )'
      '    REFERENCES Radnik (IDRadnika) ON UPDATE CASCADE,'
      '    FOREIGN KEY ('
      '        IDTipaAlata'
      '    )'
      '    REFERENCES TipoviAlata (IDTipaAlata) ON UPDATE CASCADE'
      ');'
      '')
    Left = 696
    Top = 208
  end
  object FDQueryCreateTableIstorijaOdrzavana: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS IstorijaOdrzavana ('
      '    IDOdrzavanja     INTEGER UNIQUE'
      '                             NOT NULL'
      '                             DEFAULT (1),'
      '    IDZaduzenogAlata INTEGER NOT NULL,'
      '    Datum            DATE,'
      '    PRIMARY KEY ('
      '        IDOdrzavanja ASC AUTOINCREMENT'
      '    ),'
      '    FOREIGN KEY ('
      '        IDZaduzenogAlata'
      '    )'
      '    REFERENCES ZaduzeniAlat (IDZaduzenogAlata) ON UPDATE CASCADE'
      ');')
    Left = 696
    Top = 272
  end
  object FDQuerySelectTipoviAlata: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM TipoviAlata;')
    Left = 968
    Top = 144
  end
  object FDQuerySelectZaduzeniAlat: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM ZaduzeniAlat;')
    Left = 968
    Top = 208
  end
  object FDQuerySelectIstorijaOdrzavana: TFDQuery
    Connection = FDDatabaseConnection
    SQL.Strings = (
      'SELECT * FROM IstorijaOdrzavana;')
    Left = 968
    Top = 272
  end
end

unit DM1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, sqlite3conn, sqldb, db, FileUtil;

type

  { TdmMain }

  TdmMain = class(TDataModule)
    DataSource1: TDataSource;
    DataSBatA: TDataSource;
    DataSBatB: TDataSource;
    DSQryT1: TDataSource;
    DSQryT2: TDataSource;
    SQLite3Connection1: TSQLite3Connection;
    SQLQuery1: TSQLQuery;
    SQLQryPlayerT1: TSQLQuery;
    SQLQryPlayerT2: TSQLQuery;
    SQLQryBatA: TSQLQuery;
    SQLQryBatB: TSQLQuery;
    SQLQryWrite: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
  private
    { private declarations }
  public
    sTeamDB : String;
  end;

var
  dmMain: TdmMain;

implementation

{$R *.lfm}

end.


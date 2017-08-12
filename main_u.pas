unit main_u;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  ExtCtrls, StdCtrls, DBGrids, FileCtrl, DbCtrls, Spin, Menus;

type

  { TfrmMain }

  TfrmMain = class(TForm)
    btnCreate: TButton;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    dblTeam1: TDBText;
    dblTeam2: TDBText;
    edtNameT1: TEdit;
    edtSurnameT1: TEdit;
    edtNameT2: TEdit;
    edtSurnameT2: TEdit;
    edtDBname: TEdit;
    edtN1: TEdit;
    edtN2: TEdit;
    FileListBox1: TFileListBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblDays: TLabel;
    lblOvers: TLabel;
    lblT1VS: TLabel;
    lblT2VS: TLabel;
    lblT1: TLabel;
    lblT2: TLabel;
    PageControl: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    spOvers: TSpinEdit;
    spDays: TSpinEdit;
    tsMain: TTabSheet;
    tsNewMatch: TTabSheet;
    tsLoadMatch: TTabSheet;
    tsAddPlayer: TTabSheet;
    procedure btnCreateClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure dblTeam1Click(Sender: TObject);
    procedure dblTeam2Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.lfm}

uses DM1, Scorer_u;

{ TfrmMain }

procedure TfrmMain.Panel1Click(Sender: TObject);
begin
  PageControl.PageIndex:=1;
end;

procedure TfrmMain.btnCreateClick(Sender: TObject);
var
  sDbName : String;
begin
  sDbName := edtDBname.Text;

  if DirectoryExists('C:/Xander Files/cricketTest') then
  begin
    ShowMessage('Dir Exists');
  end else
  begin
    ForceDirectories('C:/Xander Files/cricketTest');
  end;

    dmMain.SQLite3Connection1.DatabaseName:='C:/Xander Files/cricketTest/'+sDbName+
    '.sqlite';
    if FileExists(dmMain.SQLite3Connection1.DatabaseName) then
    ShowMessage('ERROR : Database already exists!') else
      begin
        dmMain.SQLite3Connection1.Open;
        dmMain.SQLTransaction1.Active:=True;
//teams TABLE
        dmMain.SQLite3Connection1.ExecuteDirect(
        'CREATE TABLE "teams" ("id" Integer NOT NULL PRIMARY KEY AUTOINCREMENT,'+
                                         '"team1_name" VARCHAR(20) NOT NULL,' +
                                         '"team2_name" VARCHAR(20) NOT NULL);' );


//NEW TABLE
        dmMain.SQLite3Connection1.ExecuteDirect(
                'CREATE TABLE "team1" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,' +
                                                  '"name" VARCHAR(20), '+
                                                  '"surname" VARCHAR(20), '+
                                                  '"1s" VARCHAR(20), '+
                                                  '"2s" VARCHAR(20), '+
                                                  '"3s" VARCHAR(20), '+
                                                  '"4s" VARCHAR(20), '+
                                                  '"5s" VARCHAR(20), '+
                                                  '"6s" VARCHAR(20), '+
                                                  '"run_rate" VARCHAR(20), '+
                                                  '"runs_per_ball" VARCHAR(20), '+
                                                  '"runs_per_over" VARCHAR(20), '+
                                                  '"balls_faced" VARCHAR(20), '+
                                                  '"total_runs" VARCHAR(20), '+
                                                  '"way_out" VARCHAR(20), '  +
      					          '"wides" VARCHAR(20), ' +
      					          '"no_balls" VARCHAR(20), ' +
      					          '"wickets" VARCHAR(20), ' +
      					          '"avg_runs_per_over" VARCHAR(20), ' +
      					          '"total_runs_against" VARCHAR(20), ' +
      					          '"avg_runs_per_ball" VARCHAR(20), ' +
      					          '"dot_balls" VARCHAR(20), ' +
      					          '"maiden_overs" VARCHAR(20), ' +
                                                  '"balls_bowled" VARCHAR(20), ' +
      					          '"overs_bowled" VARCHAR(20));');

        dmMain.SQLite3Connection1.ExecuteDirect(
                'CREATE TABLE "team2" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,' +
                                                  '"name" VARCHAR(20), '+
                                                  '"surname" VARCHAR(20), '+
                                                  '"1s" VARCHAR(20), '+
                                                  '"2s" VARCHAR(20), '+
                                                  '"3s" VARCHAR(20), '+
                                                  '"4s" VARCHAR(20), '+
                                                  '"5s" VARCHAR(20), '+
                                                  '"6s" VARCHAR(20), '+
                                                  '"run_rate" VARCHAR(20), '+
                                                  '"runs_per_ball" VARCHAR(20), '+
                                                  '"runs_per_over" VARCHAR(20), '+
                                                  '"balls_faced" VARCHAR(20), '+
                                                  '"total_runs" VARCHAR(20), '+
                                                  '"way_out" VARCHAR(20), '  +
      					          '"wides" VARCHAR(20), ' +
      					          '"no_balls" VARCHAR(20), ' +
      					          '"wickets" VARCHAR(20), ' +
      					          '"avg_runs_per_over" VARCHAR(20), ' +
      					          '"total_runs_against" VARCHAR(20), ' +
      					          '"avg_runs_per_ball" VARCHAR(20), ' +
      					          '"dot_balls" VARCHAR(20), ' +
      					          '"maiden_overs" VARCHAR(20), ' +
                                                  '"balls_bowled" VARCHAR(20), ' +
      					          '"overs_bowled" VARCHAR(20));');

//
        dmMain.SQLTransaction1.Commit;
        ShowMessage('MATCH CREATED!');

//Add team names
        dmMain.SQLQuery1.Active:=False;
        dmMain.SQLQuery1.SQL.Text:='INSERT INTO teams (team1_name, team2_name) VALUES ("'+edtN1.Text+'", '+
        '"'+edtN2.Text+'")';
        dmMain.SQLQuery1.ExecSQL;
        dmMain.SQLTransaction1.Commit;

//Test Database
        dmMain.SQLQuery1.SQL.Text := 'SELECT * FROM team1';
        dmMain.SQLQuery1.Active:=True;
        dmMain.DataSource1.DataSet := dmMain.SQLQuery1;

        DBGrid1.DataSource := dmMain.Datasource1;
//End test Database
      end;
//Change labels to team names
  lblT1.Caption := edtN1.Text;
  lblT2.Caption:=edtN2.Text;
  lblT1VS.Caption:=edtN1.Text;
  lblT2VS.Caption:=edtN2.Text;

  PageControl.PageIndex:=3;

  ShowMessage('Add names in BATTING ORDER!');

//DONE : Display team names on dbLabels

//Display team names on labels
  dmMain.SQLQuery1.Active:=False;
  dmMain.SQLQuery1.SQL.Text:='SELECT * FROM teams;';
  dmMain.SQLQuery1.Active:=True;
  dmMain.DataSource1.DataSet := dmMain.SQLQuery1;
  dblTeam1.DataSource:= dmMain.Datasource1;
  dblTeam2.DataSource:= dmMain.Datasource1;
  dblTeam1.DataField:='team1_name';
  dblTeam2.DataField:='team2_name';
end;

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  dmMain.SQLQryBatA.Active := False;
  dmMain.SQLQryBatB.Active := False;
  dmMain.SQLQryBatA.SQL.Text := 'SELECT * FROM team1 WHERE "id" = 1';
  dmMain.SQLQryBatA.Active := True;
  frmScorer.Show;
  frmMain.Hide;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
begin
  //prcOverFinish;
end;

procedure TfrmMain.CheckBox1Change(Sender: TObject);
begin
  if CheckBox1.Checked = True then
    begin
      lblDays.Visible:=True;
      spDays.Visible:=True;

      lblOvers.Visible:=False;
      spOvers.Visible:=False;
    end else
    begin
      lblDays.Visible:=False;
      spDays.Visible:=False;

      lblOvers.Visible:=True;
      spOvers.Visible:=True;
    end;
end;

procedure TfrmMain.dblTeam1Click(Sender: TObject);
begin
  //ToDo : Set team 1 For first innings
end;

procedure TfrmMain.dblTeam2Click(Sender: TObject);
begin
  //ToDo : Set team 2 for first innings
end;


procedure TfrmMain.Panel2Click(Sender: TObject);
begin
  PageControl.PageIndex:=2;
end;

procedure TfrmMain.Panel3Click(Sender: TObject);
var
  sPlayerName, sPlayerSurname : String;
begin
  sPlayerName := edtNameT1.Text;
  sPlayerSurname := edtSurnameT1.Text;

  dmMain.SQLQuery1.Active:=False;
  dmMain.SQLQryPlayerT2.Active:=False;

  dmMain.SQLQryPlayerT1.Active:=False;
  dmMain.SQLQryPlayerT1.SQL.Text:=
  'INSERT INTO "team1" (name, surname) VALUES("'+sPlayerName+'", '+
                                                                   '"'+sPlayerSurname+'")';

  dmMain.SQLQryPlayerT1.ExecSQL;
  dmMain.SQLTransaction1.Commit;

  dmMain.SQLQryPlayerT1.SQL.Text:='SELECT name, surname FROM "team1"';
  dmMain.SQLQryPlayerT1.Active:=True;

  dmMain.SQLQryPlayerT2.SQl.Text:='SELECT name, surname FROM "team2"';
  dmMain.SQLQryPlayerT2.Active:=True;


  edtNameT1.Text := '';
  edtSurnameT1.Text := '';

  edtNameT1.SetFocus;
end;

procedure TfrmMain.Panel4Click(Sender: TObject);
var
  sPlayerName, sPlayerSurname : String;
begin
  sPlayerName := edtNameT2.Text;
  sPlayerSurname := edtSurnameT2.Text;

  dmMain.SQLQuery1.Active:=False;
  dmMain.SQLQryPlayerT1.Active:=False;

  dmMain.SQLQryPlayerT2.Active:=False;
  dmMain.SQLQryPlayerT2.SQL.Text:=
  'INSERT INTO "team2" (name, surname) VALUES("'+sPlayerName+'", '+
                                                                   '"'+sPlayerSurname+'")';

  dmMain.SQLQryPlayerT2.ExecSQL;
  dmMain.SQLTransaction1.Commit;

  dmMain.SQLQryPlayerT2.SQL.Text:='SELECT name, surname FROM "team2"';
  dmMain.SQLQryPlayerT2.Active:=True;

  dmMain.SQLQryPlayerT1.SQL.Text:='SELECT name, surname FROM "team1"';
  dmMain.SQLQryPlayerT1.Active:=True;


  edtNameT2.Text := '';
  edtSurnameT2.Text := '';

  edtNameT2.SetFocus;
end;



end.


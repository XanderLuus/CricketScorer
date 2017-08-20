unit RunOut_u;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, DbCtrls, ComCtrls, DBGrids, Buttons, Menus;

type

  { TfrmRunOut }

  TfrmRunOut = class(TForm)
    btSaveFielder: TBitBtn;
    btnConfirmBatF: TButton;
    btnConfirmBatO: TButton;
    dbgFielders: TDBGrid;
    dblBat1: TDBText;
    dblBat2: TDBText;
    dblBatF1: TDBText;
    dblBatF2: TDBText;
    GroupBox1: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Panel5: TPanel;
    Panel6: TPanel;
    pcOut: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    RadioGroup1: TRadioGroup;
    TabSheet1: TTabSheet;
    tsBatsman: TTabSheet;
    tsFielder: TTabSheet;
    procedure btnConfirmBatFClick(Sender: TObject);
    procedure btnConfirmBatOClick(Sender: TObject);
    procedure btSaveFielderClick(Sender: TObject);
    procedure dblBat1Click(Sender: TObject);
    procedure dblBat2Click(Sender: TObject);
  private
    bBat1, bBat2 : Boolean;
  public
    sFielder : String;
  end;

var
  frmRunOut: TfrmRunOut;

implementation

{$R *.lfm}

uses Scorer_u, DM1;

{ TfrmRunOut }

//procedure prcOut;
//begin
  //if frmScorer.iBatFace = 1 then
  //begin
  //  dmMain.SQLQryWrite.Active:=False;
  //  dmMain.SQLQryWrite.SQL.Text :=
  //  'UPDATE  "'+dmMain.sSQL_Team+'" SET ' +
  //  '1s = "'+ IntToStr(frmScorer.iSingle1) +
  //  '", 2s = "'+ IntToStr(frmScorer.iDouble1) +
  //  '", 3s = "'+ IntToStr(frmScorer.iTriple1) +
  //  '", 4s = "'+ IntToStr(frmScorer.iFour1) +
  //  '", 5s = "'+ IntToStr(frmScorer.iFive1) +
  //  '", 6s = "'+ IntToStr(frmScorer.iSix1) +
  //  '", run_rate = "'+ FloatToStrF(frmScorer.rRunRate1,ffFixed,10,2) +
  //  '", runs_per_ball = "'+ FloatToStrF(frmScorer.rRunsPB1,ffFixed,10,2) +
  //  '", runs_per_over = "'+ FloatToStrF(frmScorer.rRunsPO1,ffFixed,10,2) +
  //  '", balls_faced = "'+ IntToStr(frmScorer.iBatBallsF1) +
  //  '", total_runs = "'+ IntToStr(frmScorer.iBatTotal1) +
  //  '", way_out = "'+ frmScorer.sWayOut +
  //  '" WHERE id = ' + IntToStr(frmScorer.iBat1Nr);
  //  dmMain.SQLQryWrite.ExecSQL;
  //  dmMain.SQLTransaction1.Commit;
  //
  //end else
  //begin
  //  dmMain.SQLQryWrite.Active:=False;
  //  dmMain.SQLQryWrite.SQL.Text :=
  //  'UPDATE  "team2" SET ' +
  //  '1s = "'+ IntToStr(frmScorer.iSingle2) +
  //  '", 2s = "'+ IntToStr(frmScorer.iDouble2) +
  //  '", 3s = "'+ IntToStr(frmScorer.iTriple2) +
  //  '", 4s = "'+ IntToStr(frmScorer.iFour2) +
  //  '", 5s = "'+ IntToStr(frmScorer.iFive2) +
  //  '", 6s = "'+ IntToStr(frmScorer.iSix2) +
  //  '", run_rate = "'+ FloatToStrF(frmScorer.rRunRate2,ffFixed,10,2) +
  //  '", runs_per_ball = "'+ FloatToStrF(frmScorer.rRunsPB2,ffFixed,10,2) +
  //  '", runs_per_over = "'+ FloatToStrF(frmScorer.rRunsPO2,ffFixed,10,2) +
  //  '", balls_faced = "'+ IntToStr(frmScorer.iBatBallsF2) +
  //  '", total_runs = "'+ IntToStr(frmScorer.iBatTotal2) +
  //  '", way_out = "'+ frmScorer.sWayOut +
  //  '" WHERE id = ' + IntToStr(frmScorer.iBat2Nr);
  //  dmMain.SQLQryWrite.ExecSQL;
  //  dmMain.SQLTransaction1.Commit;
  //end;

//  prcOut;
//  //ToDO : Resest Vars for out batsman
//end;

procedure TfrmRunOut.btnConfirmBatOClick(Sender: TObject);
var
  iRun : Integer;
begin

  if RadioGroup1.ItemIndex = 0 then iRun := 9 else     //CHANGE
  if RadioGroup1.ItemIndex = 1 then iRun := 1 else
  if RadioGroup1.ItemIndex = 2 then iRun := 2 else
  if RadioGroup1.ItemIndex = 3 then iRun := 3 else
  if RadioGroup1.ItemIndex = 4 then iRun := 4 else
  if RadioGroup1.ItemIndex = 5 then iRun := 5 else
  if RadioGroup1.ItemIndex = 6 then iRun := 6 else;

  frmScorer.rgRuns.ItemIndex := iRun;         //ToDo : CHANGE here is ERROR
  frmScorer.btnRunsConfirm.Click;

  if bBat1 = True then
  begin
    frmScorer.iBatF := 1;
  end else   //bBat2 = True
  begin
    frmScorer.iBatF := 2;
  end;
  //ToDo : Change SQLquery for DS (QueryBatA/B)
end;

procedure TfrmRunOut.btSaveFielderClick(Sender: TObject);
begin
  //ToDO : Take text from db
  //sFielder := dbgFielders.SelectedField.Text;
  //prcOut;
end;

procedure TfrmRunOut.dblBat1Click(Sender: TObject);
begin
  bBat1 := True;
  bBat2 := False;

  dblBat1.Font.Color := clGreen;
  dblBat2.Font.Color := clDefault;
end;

procedure TfrmRunOut.dblBat2Click(Sender: TObject);
begin
  bBat1 := False;
  bBat2 := True;

  dblBat1.Font.Color := clDefault;
  dblBat2.Font.Color := clGreen;
end;

procedure TfrmRunOut.btnConfirmBatFClick(Sender: TObject);
begin
  //ToDo : Change SQLquery for Ds (Query1)
end;

end.


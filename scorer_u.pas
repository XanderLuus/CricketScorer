unit Scorer_u;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, ExtCtrls, DbCtrls, Buttons, DBGrids;

type

  { TfrmScorer }

  TfrmScorer = class(TForm)
    btnRunsConfirm: TButton;
    btnConfirmB_Chooser: TButton;
    btnBowled: TButton;
    btnOutSum: TButton;
    btnCaught: TButton;
    btnRunOut: TButton;
    btnClose: TButton;
    Button5: TButton;
    btnLBW: TButton;
    Button7: TButton;
    Button8: TButton;
    btnResetStats: TButton;
    DBGrid1: TDBGrid;
    DBText1: TDBText;
    DBText2: TDBText;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    Label1: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblRunRate: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    PageControl1: TPageControl;
    pnlBatsmanFacing: TPanel;
    pnlB2RunRate: TPanel;
    pnlTarget: TPanel;
    pnlOversLeft: TPanel;
    pnlRunRate: TPanel;
    pnlCurrentBowler: TPanel;
    Panel3: TPanel;
    pnlB1Runs: TPanel;
    pnlB1BallsFaced: TPanel;
    pnlB1RunRate: TPanel;
    Panel7: TPanel;
    pnlB2Runs: TPanel;
    pnlB2BallsFaced: TPanel;
    rgRuns: TRadioGroup;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure btnBowledClick(Sender: TObject);
    procedure btnCaughtClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnConfirmB_ChooserClick(Sender: TObject);
    procedure btnLBWClick(Sender: TObject);
    procedure btnOutSumClick(Sender: TObject);
    procedure btnResetStatsClick(Sender: TObject);
    procedure btnRunOutClick(Sender: TObject);
    procedure btnRunsConfirmClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
  private

  public
    iBatTotal1, iBatTotal2, iTotal, iBatFace, iBatBallsF1, iBatBallsF2,
    iOver, iExtraTotal, iBowlerRA, iBowlerRA_V, iBowlerEx, iBowlerExV,
    iBatsmanAexF, iBatsmanBexF, iBatsmanExF_V, iBatF, iBatsmanNr, iBowlerWic,
    iBat1Nr, iBat2Nr : Integer;

    sBatA, sBatB, sWayOut : String;

    iDot1, iDot2, iSingle1, iSingle2, iDouble1, iDouble2, iTriple1, iTriple2,
    iFour1, iFour2, iFive1, iFive2, iSix1, iSix2 : Integer;

    rRunRate1, rRunRate2, rRunsPO1, rRunsPO2, rRunsPB1, rRunsPB2 : Real;
  end;

var
  frmScorer: TfrmScorer;

implementation
                                         //ToDo : Add option to choose which batsman bat
{$R *.lfm}

uses
  DM1, RunOut_u, main_u;

{ TfrmScorer }

procedure prcOverFinish;
begin

end;

procedure TfrmScorer.btnRunsConfirmClick(Sender: TObject);
var
  iTotalV, iExtraTotalV, iOverV : Integer;
begin
  if rgRuns.ItemIndex = 0 then //1
  begin
    iTotalV := 1;
    iBowlerRA_V := 1;
    iOverV := 1;
    iBowlerExV := 0;
    iBatsmanExF_V := 0;
    iExtraTotalV := 0;
  end else if rgRuns.ItemIndex = 1 then //2
      begin
        iTotalV := 2;
        iBowlerRA_V := 2;
        iOverV := 1;
        iBowlerExV := 0;
        iBatsmanExF_V := 0;
        iExtraTotalV := 0;
      end else if rgRuns.ItemIndex = 2 then //3
  begin
    iTotalV := 3;
    iBowlerRA_V := 3;
    iOverV := 1;
    iBowlerExV := 0;
    iBatsmanExF_V := 0;
    iExtraTotalV := 0;
  end else if rgRuns.ItemIndex = 3 then //4
      begin
        iTotalV := 4;
        iBowlerRA_V := 4;
        iOverV := 1;
        iBowlerExV := 0;
        iBatsmanExF_V := 0;
        iExtraTotalV := 0;
      end else if rgRuns.ItemIndex = 4 then //5
  begin
    iTotalV := 5;
    iBowlerRA_V := 5;
    iOverV := 1;
    iBowlerExV := 0;
    iBatsmanExF_V := 0;
    iExtraTotalV := 0;
  end else if rgRuns.ItemIndex = 5 then //6
      begin
        iTotalV := 6;
        iBowlerRA_V := 6;
        iOverV := 1;
        iBowlerExV := 0;
        iBatsmanExF_V := 0;
        iExtraTotalV := 0;
      end else if rgRuns.ItemIndex = 6 then //WIDE
  begin
    iTotalV := 2;
    iBowlerRA_V := 2;
    iOverV := 1;
    iBowlerExV := 1;
    iBatsmanExF_V := 1;
    iExtraTotalV := 1;
  end else if rgRuns.ItemIndex = 7 then //NO BALL
      begin
        iTotalV := 2;
        iBowlerRA_V := 2;
        iOverV := 1;
        iBowlerExV := 1;
        iBatsmanExF_V := 1;
        iExtraTotalV := 1;
      end;

//ADD TO BATSMAN
  if iBatF = 1 then        //BATSMAN A
  begin
    Inc(iTotal, iTotalV);
    Inc(iBatTotal1, iTotalV);
    Inc(iBowlerRA, iBowlerRA_V);
    Dec(iOver, iOverV);
    Inc(iBatBallsF1, 1);
    Inc(iBowlerEx, iBowlerExV);
    Inc(iBatsmanAexF, iBatsmanExF_V);
    Inc(iExtraTotal, iExtraTotalV);

    if rgRuns.ItemIndex = 0 then Inc(iSingle1, 1) else
    if rgRuns.ItemIndex = 1 then Inc(iDouble1, 1) else
    if rgRuns.ItemIndex = 2 then Inc(iTriple1, 1) else
    if rgRuns.ItemIndex = 3 then Inc(iFour1, 1) else
    if rgRuns.ItemIndex = 4 then Inc(iFive1, 1) else
    if rgRuns.ItemIndex = 5 then Inc(iSix1, 1) ;

    //IS OVER FINISHED
    if iOver = 0 then
    begin
      ShowMessage('Over is finished');
      //prcOverFinish;     //ToDo : Create over finish process
    end else
    begin
      if (odd(iTotalV) = false) OR (iTotalV=5) then iBatF := 1 else
      iBatF := 2;
    end;

  end else                    //BATSMAN B
      begin
        Inc(iTotal, iTotalV);
        Inc(iBatTotal2, iTotalV);
        Inc(iBowlerRA, iBowlerRA_V);
        Dec(iOver, iOverV);
        Inc(iBatBallsF2, 1);
        Inc(iBowlerEx, iBowlerExV);
        Inc(iBatsmanBexF, iBatsmanExF_V);
        Inc(iExtraTotal, iExtraTotalV);

        if rgRuns.ItemIndex = 0 then Inc(iSingle2, 1) else
        if rgRuns.ItemIndex = 1 then Inc(iDouble2, 1) else
        if rgRuns.ItemIndex = 2 then Inc(iTriple2, 1) else
        if rgRuns.ItemIndex = 3 then Inc(iFour2, 1) else
        if rgRuns.ItemIndex = 4 then Inc(iFive2, 1) else
        if rgRuns.ItemIndex = 5 then Inc(iSix2, 1);

        //IS OVER FINISHED
        if iOver = 0 then
        begin
          ShowMessage('Over is finished');
          //prcOverFinish;
        end else
        begin
          if (odd(iTotalV) = False) OR (iTotalV=5) then iBatF := 2 else
          iBatf := 1;
        end;
      end;

//DISPLAY ON FORM
  pnlB1Runs.Caption := IntToStr(iBatTotal1);
  pnlB2Runs.Caption := IntToStr(iBatTotal2);

  pnlB1BallsFaced.Caption := IntToStr(iBatBallsF1);
  pnlB2BallsFaced.Caption := IntToStr(iBatBallsF2);

  rgRuns.ItemIndex := -1;
end;

procedure TfrmScorer.DBGrid1CellClick(Column: TColumn);
var
  sSelectedName : String;
begin
  sSelectedName := DBGrid1.SelectedField.Text;
  dmMain.SQLQryPlayerT2.Active:=False;
  dmMain.SQLQryPlayerT2.SQL.Text:='SELECT "id" FROM '+dmMain.sSQL_Team+
  ' WHERE "name_surname" = '''+sSelectedName+''';';
  dmMain.SQLQryPlayerT2.Active:=True;
  DBText2.DataField:= 'id';
end;

procedure TfrmScorer.btnOutSumClick(Sender: TObject);
begin
  Inc(iBowlerWic,1);

  if frmScorer.iBatFace = 1 then
    begin
      dmMain.SQLQryWrite.Active:=False;
      dmMain.SQLQryWrite.SQL.Text :=
      'UPDATE  '+dmMain.sSQL_Team+' SET ' +
      '"1s" = '+ IntToStr(iSingle1) +
      ', "2s" = '+ IntToStr(iDouble1) +
      ', "3s" = '+ IntToStr(iTriple1) +
      ', "4s" = '+ IntToStr(iFour1) +
      ', "5s" = '+ IntToStr(iFive1) +
      ', "6s" = '+ IntToStr(iSix1) +
      ', "run_rate" = '+ FloatToStrF(rRunRate1,ffFixed,10,2) +
      ', "runs_per_ball" = '+ FloatToStrF(rRunsPB1,ffFixed,10,2) +
      ', "runs_per_over" = '+ FloatToStrF(rRunsPO1,ffFixed,10,2) +
      ', "balls_faced" = '+ IntToStr(iBatBallsF1) +
      ', "total_runs" = '+ IntToStr(iBatTotal1) +
      ', "way_out" = '''+ sWayOut +
      ''' WHERE "id" = ' + IntToStr(iBat1Nr);
      dmMain.SQLQryWrite.ExecSQL;
      dmMain.SQLTransaction1.Commit;

    end else
    begin
      dmMain.SQLQryWrite.Active:=False;
      dmMain.SQLQryWrite.SQL.Text :=
      'UPDATE  '+dmMain.sSQL_Team+' SET ' +
      '"1s" = '+ IntToStr(iSingle2) +
      ', "2s" = '+ IntToStr(iDouble2) +
      ', "3s" = '+ IntToStr(iTriple2) +
      ', "4s" = '+ IntToStr(iFour2) +
      ', "5s" = '+ IntToStr(iFive2) +
      ', "6s" = '+ IntToStr(iSix2) +
      ', "run_rate" = '+ FloatToStrF(rRunRate2,ffFixed,10,2) +
      ', "runs_per_ball" = '+ FloatToStrF(rRunsPB2,ffFixed,10,2) +
      ', "runs_per_over" = '+ FloatToStrF(rRunsPO2,ffFixed,10,2) +
      ', "balls_faced" = '+ IntToStr(iBatBallsF2) +
      ', "total_runs" = '+ IntToStr(iBatTotal2) +
      ', "way_out" = '''+ sWayOut +
      ''' WHERE "id" = ' + IntToStr(iBat2Nr);
      dmMain.SQLQryWrite.ExecSQL;
      dmMain.SQLTransaction1.Commit;
    end;
//Choose new batsman
  dmMain.SQLQryPlayerT1.Active:=False;
  dmMain.SQLQryPlayerT1.SQL.Text := 'SELECT name_surname FROM '+dmMain.sSQL_Team;
  dmMain.SQLQryPlayerT1.Active:=True;
  dmMain.DSQryT1.DataSet := dmMain.SQLQryPlayerT1;
  DBGrid1.DataSource := dmMain.DSQryT1;

  dmMain.DSQryT2.DataSet := dmMain.SQLQryPlayerT2;
  DBText2.DataSource := dmMain.DSQryT2;
  PageControl1.PageIndex := 1;
end;

procedure TfrmScorer.btnResetStatsClick(Sender: TObject);
begin
  if iBatF = 1 then
    begin
      iDot1 := 0;
      iSingle1 := 0;
      iDouble1 := 0;
      iTriple1 := 0;
      iFour1 := 0;
      iFive1 := 0;
      iSix1 := 0;
      rRunRate1 := 0;
      rRunsPB1 := 0;
      rRunsPO1 := 0;
      iBatBallsF1:= 0;
      iBatTotal1 := 0;
    end else  //iBatF = 2
    begin
      iDot2 := 0;
      iSingle2 := 0;
      iDouble2 := 0;
      iTriple2 := 0;
      iFour2 := 0;
      iFive2 := 0;
      iSix2 := 0;
      rRunRate2 := 0;
      rRunsPB2 := 0;
      rRunsPO2 := 0;
      iBatBallsF2:= 0;
      iBatTotal2 := 0;
    end;
end;

procedure TfrmScorer.btnRunOutClick(Sender: TObject);
begin
  sWayOut := 'Run Out';
  frmRunOut.Show;
end;

procedure TfrmScorer.btnBowledClick(Sender: TObject);
begin
  sWayOut := 'Bowled';
  btnOutSum.Click;
  btnResetStats.Click;
end;

procedure TfrmScorer.btnCaughtClick(Sender: TObject);
begin
  sWayOut := 'Caught';
  btnOutSum.Click;
  btnResetStats.Click;
end;

procedure TfrmScorer.btnCloseClick(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmScorer.btnConfirmB_ChooserClick(Sender: TObject);
var
  iNameChosen : Integer;
begin
  iNameChosen := StrToInt(DBText2.Caption);
  if iBatF = 1 then
    begin
      iBat1Nr := iNameChosen;
    end else
    begin
      iBat2Nr := iNameChosen;
    end;
  PageControl1.PageIndex:=0;
end;

procedure TfrmScorer.btnLBWClick(Sender: TObject);
begin
  sWayOut := 'LBW';
  btnOutSum.Click;
  btnResetStats.Click;
end;


procedure TfrmScorer.FormCreate(Sender: TObject);
begin
  iBatFace := 1;
  iOver := 6;
  iBat1Nr := 1;
  iBat2Nr := 2;
end;

end.


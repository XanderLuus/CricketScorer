program mainfrm;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, main_u, Scorer_u, DM1, RunOut_u
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmScorer, frmScorer);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmRunOut, frmRunOut);
  Application.Run;
end.


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
    btSaveBat: TBitBtn;
    dbgFielders: TDBGrid;
    dblBat1: TDBText;
    dblBat2: TDBText;
    dblBatF1: TDBText;
    dblBatF2: TDBText;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    pcOut: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    tsBatsman: TTabSheet;
    tsFielder: TTabSheet;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  frmRunOut: TfrmRunOut;

implementation

{$R *.lfm}

end.


unit View;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes,

  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,Vcl.Menus,
  Vcl.TabNotBk, Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg, Vcl.Buttons,

  Math, IniFiles, Model_Seg, Widget, Direct2D, D2D1;

type
  TForm1 = class(TForm)
    PageControlAll: TPageControl;
    TabSheetWellcome: TTabSheet;
    PageControl1: TPageControl;
    TabSheetSource: TTabSheet;
    PanelS3: TPanel;
    TabSheetLength: TTabSheet;
    TabSheetForce: TTabSheet;
    PanelF2: TPanel;
    TabSheetResult: TTabSheet;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel58: TPanel;
    ComboBox2: TComboBox;
    Panel60: TPanel;
    Label17: TLabel;
    HZ_2B: TEdit;
    Panel62: TPanel;
    HZ_1B: TEdit;
    Panel41: TPanel;
    PaintBoxA: TPaintBox;
    Panel89: TPanel;
    Panel129: TPanel;
    Timer1: TTimer;
    PanelS: TPanel;
    PanelSet3: TPanel;
    Panel171: TPanel;
    MHZ_threshold: TEdit;
    Panel172: TPanel;
    MHZ_Width: TEdit;
    PanelSet1: TPanel;
    Panel178: TPanel;
    Edit43: TEdit;
    Panel179: TPanel;
    Label74: TLabel;
    Num: TEdit;
    Panel180: TPanel;
    wave2: TEdit;
    Panel181: TPanel;
    wave1: TEdit;
    Panel36: TPanel;
    FileOpenDialog1: TFileOpenDialog;
    Panel46: TPanel;
    Panel49: TPanel;
    WindowW: TComboBox;
    PanelSet2: TPanel;
    Panel145: TPanel;
    ComboBox3: TComboBox;
    Panel147: TPanel;
    HZ_2: TEdit;
    Panel149: TPanel;
    HZ_1: TEdit;
    PanelSet4: TPanel;
    Panel162: TPanel;
    ES_thresholdEdit: TEdit;
    PanelSet_OK: TPanel;
    PanelSetBackup: TPanel;
    PanelMessage: TPanel;
    PaintBoxB: TPaintBox;
    PaintBoxC: TPaintBox;
    Panel74: TPanel;
    density: TEdit;
    PanelPaintSet: TPanel;
    Label27: TLabel;
    Panel124: TPanel;
    Panel187: TPanel;
    Label19: TLabel;
    Panel196: TPanel;
    Label29: TLabel;
    Panel203: TPanel;
    Label30: TLabel;
    LabelWindowRightAutoMove: TLabel;
    LabelWindowLeftAutoMove: TLabel;
    Panel208: TPanel;
    SelectWindowsMoveB: TLabel;
    SelectWindowsMoveA: TLabel;
    Timer2: TTimer;
    TabSheet1_1: TTabSheet;
    TabSheet1_2: TTabSheet;
    TabSheet1_3: TTabSheet;
    TabSheet1_4: TTabSheet;
    Panel5: TPanel;
    Panel6: TPanel;
    editFileName: TEdit;
    editName: TEdit;
    EditMileage: TEdit;
    EditBuilder: TEdit;
    EditTester: TEdit;
    EditData: TEdit;
    Panel254: TPanel;
    Panel261: TPanel;
    Panel265: TPanel;
    Label56: TLabel;
    Panel278: TPanel;
    EditFileName1: TEdit;
    EditLength: TEdit;
    EditForce: TEdit;
    EditDateB: TEdit;
    Panel293: TPanel;
    Panel306: TPanel;
    EditLengthB: TEdit;
    EditNumB: TEdit;
    EditDateC: TEdit;
    Panel308: TPanel;
    PaintBox1: TPaintBox;

    ListView1: TListView;

    Panel192: TPanel;
    PanelBackB: TPanel;
    Label89: TLabel;
    Panel128: TPanel;
    Panel357: TPanel;
    Label80: TLabel;
    Image30: TImage;
    Panel363: TPanel;
    Image31: TImage;
    Label85: TLabel;
    Panel366: TPanel;
    Image32: TImage;
    Label97: TLabel;
    Panel318: TPanel;
    Label111: TLabel;
    Panel169: TPanel;
    Panel13: TPanel;
    Panel190: TPanel;
    Panel338: TPanel;
    Panel353: TPanel;
    Label90: TLabel;
    Label48: TLabel;
    Label32: TLabel;
    Label47: TLabel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Image53: TImage;
    Label51: TLabel;
    Label1: TLabel;
    Label16: TLabel;
    Panel2: TPanel;
    Label18: TLabel;
    MHZ_WidthB: TEdit;
    Panel19: TPanel;
    Label6: TLabel;
    MHZ_thresholdB: TEdit;
    Panel20: TPanel;
    Label5: TLabel;
    WindowWB: TComboBox;
    Panel21: TPanel;
    Panel223: TPanel;
    Panel226: TPanel;
    ObjectName: TLabel;
    Label38: TLabel;
    Panel227: TPanel;
    Panel215: TPanel;
    LabelForce: TLabel;
    Label20: TLabel;
    Panel216: TPanel;
    LabelLength: TLabel;
    Label43: TLabel;
    Panel220: TPanel;
    Panel221: TPanel;
    Object_Hole_Number: TLabel;
    Label101: TLabel;
    Panel222: TPanel;
    Object_Number: TLabel;
    Label103: TLabel;
    Panel235: TPanel;
    Panel359: TPanel;
    Label37: TLabel;
    Label40: TLabel;
    Label44: TLabel;
    Label46: TLabel;
    Label36: TLabel;
    Label3: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label57: TLabel;
    Panel4: TPanel;
    Panel45: TPanel;
    Panel47: TPanel;
    Image2: TImage;
    Label58: TLabel;
    Panel48: TPanel;
    Image5: TImage;
    Label59: TLabel;
    Panel7: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Image6: TImage;
    Label68: TLabel;
    Panel52: TPanel;
    Image12: TImage;
    Label78: TLabel;
    Label81: TLabel;
    Label83: TLabel;
    Label82: TLabel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    TabSheet1: TTabSheet;
    Panel61: TPanel;
    Image18: TImage;
    Image24: TImage;
    Image26: TImage;
    Image27: TImage;
    Image29: TImage;
    Image33: TImage;
    Panel88: TPanel;
    Panel90: TPanel;
    Image66: TImage;
    Label125: TLabel;
    Panel91: TPanel;
    Image67: TImage;
    Label126: TLabel;
    Panel92: TPanel;
    Image68: TImage;
    Label127: TLabel;
    Panel93: TPanel;
    Image69: TImage;
    Label128: TLabel;
    Panel94: TPanel;
    Image70: TImage;
    Label129: TLabel;
    Panel95: TPanel;
    Image71: TImage;
    Label130: TLabel;
    Panel10: TPanel;
    Image1: TImage;
    Image3: TImage;
    Image4: TImage;
    Image7: TImage;
    Image8: TImage;
    Image15: TImage;
    Panel103: TPanel;
    FreedomLength: TLabel;
    Label39: TLabel;
    Panel116: TPanel;
    FixedLength: TLabel;
    Label21: TLabel;
    Panel39: TPanel;
    TapeNumber: TLabel;
    Panel32: TPanel;
    Label28: TLabel;
    Label50: TLabel;
    Label73: TLabel;
    Label75: TLabel;
    Label24: TLabel;
    Label62: TLabel;
    Label67: TLabel;
    Label63: TLabel;
    Label71: TLabel;
    Label70: TLabel;
    Label60: TLabel;
    ListView2: TListView;
    Panel26: TPanel;
    Panel40: TPanel;
    Label77: TLabel;
    baseHz5: TLabel;
    PanelWellcome2: TScrollBox;
    Panel0: TPanel;
    LabelData0: TLabel;
    Image22: TImage;
    PanelWCome: TPanel;
    TabSheetSet: TTabSheet;
    Panel28: TPanel;
    Panel30: TPanel;
    GridPanel1: TGridPanel;
    TabSheet2: TTabSheet;
    Panel43: TPanel;
    Panel63: TPanel;
    Label87: TLabel;
    Label88: TLabel;
    Panel64: TPanel;
    Panel66: TPanel;
    Label94: TLabel;
    Label96: TLabel;
    Panel67: TPanel;
    Panel68: TPanel;
    Label98: TLabel;
    Label99: TLabel;
    Panel69: TPanel;
    Label100: TLabel;
    Label102: TLabel;
    Panel31: TPanel;
    Label84: TLabel;
    Label86: TLabel;
    Panel56: TPanel;
    Panel57: TPanel;
    Label76: TLabel;
    Label104: TLabel;
    Panel73: TPanel;
    Label116: TLabel;
    Label117: TLabel;
    FlowPanel1: TFlowPanel;
    ImageData1: TImage;
    Image39: TImage;
    Image40: TImage;
    LabelData1: TLabel;
    ImageData2: TImage;
    LabelData2: TLabel;
    PanelWellcome: TFlowPanel;
    PanelRoundA: TPanel;
    PaintBoxRoundA: TPaintBox;
    Panel9: TPanel;
    PaintBoxRoundB: TPaintBox;
    Panel15: TPanel;
    PaintBoxRoundC: TPaintBox;
    Panel33: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel42: TPanel;
    Panel44: TPanel;
    Panel70: TPanel;
    Panel72: TPanel;
    Panel75: TPanel;
    Panel76: TPanel;
    Panel77: TPanel;
    Panel78: TPanel;
    Panel79: TPanel;
    Panel80: TPanel;
    Panel82: TPanel;
    Panel83: TPanel;
    Panel84: TPanel;
    LabelNum: TLabel;
    Label7: TLabel;
    Panel85: TPanel;
    LabelAnalyticalNum: TLabel;
    Label9: TLabel;
    Panel87: TPanel;
    LabelRelativeError: TLabel;
    Label11: TLabel;
    Panel98: TPanel;
    Label_MeanF: TLabel;
    Label13: TLabel;
    Panel100: TPanel;
    LabelRelativeErrorMin: TLabel;
    Label15: TLabel;
    Panel101: TPanel;
    LabelRelativeErrorMax: TLabel;
    Label26: TLabel;
    Panel102: TPanel;
    Panel104: TPanel;
    Panel105: TPanel;
    Panel106: TPanel;
    Panel107: TPanel;
    Panel8: TPanel;
    Image21: TImage;
    Image20: TImage;
    Panel111: TPanel;
    Panel113: TPanel;
    Label8: TLabel;
    Label4: TLabel;
    Panel22: TPanel;
    Mouse_x: TLabel;
    Label10: TLabel;
    Panel23: TPanel;
    Panel71: TPanel;
    Mouse_Time: TLabel;
    Label12: TLabel;
    Label2: TLabel;
    Panel27: TPanel;
    PanelTree: TPanel;
    MyPanelTree1: TScrollBox;
    MyPanelTree: TFlowPanel;
    Panel59: TPanel;
    PaintBoxE: TPaintBox;
    Panel120: TPanel;
    PanelEdit: TPanel;
    Label42: TLabel;
    Panel121: TPanel;
    Label53: TLabel;
    Panel29: TPanel;
    Image44: TImage;
    Image45: TImage;
    Image50: TImage;
    Image54: TImage;
    Image58: TImage;
    Image59: TImage;
    Label61: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label109: TLabel;
    Panel125: TPanel;
    Image79: TImage;
    Image80: TImage;
    Image81: TImage;
    Label110: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Image82: TImage;
    Label114: TLabel;
    Label115: TLabel;
    Panel126: TPanel;
    Label118: TLabel;
    Image84: TImage;
    Image73: TImage;
    Panel130: TPanel;
    Image83: TImage;
    Image85: TImage;
    Image86: TImage;
    Image87: TImage;
    Label131: TLabel;
    Label132: TLabel;
    Label133: TLabel;
    Label135: TLabel;
    Panel131: TPanel;
    Panel96: TPanel;
    Image72: TImage;
    Image75: TImage;
    Label119: TLabel;
    Label121: TLabel;
    Image76: TImage;
    Label122: TLabel;
    Label123: TLabel;
    Image77: TImage;
    Panel127: TPanel;
    Image16: TImage;
    Label136: TLabel;
    Image19: TImage;
    Label134: TLabel;
    Label124: TLabel;
    Image10: TImage;
    Image14: TImage;
    Label120: TLabel;
    Panel11: TPanel;
    Image11: TImage;
    Label106: TLabel;
    Image13: TImage;
    Label107: TLabel;
    Label108: TLabel;
    Image17: TImage;
    Label137: TLabel;
    Image38: TImage;
    Panel12: TPanel;
    Image47: TImage;
    Label138: TLabel;
    Image52: TImage;
    Label105: TLabel;
    Panel14: TPanel;
    Image9: TImage;
    Image46: TImage;
    Image48: TImage;
    Label66: TLabel;
    Label69: TLabel;
    Image51: TImage;
    Label92: TLabel;
    Label95: TLabel;
    Label139: TLabel;
    Image25: TImage;
    Panel122: TPanel;
    Image37: TImage;
    Label72: TLabel;
    Panel1: TPanel;
    Label140: TLabel;
    baseHz2: TLabel;
    Panel123: TPanel;
    Label142: TLabel;
    baseHz3: TLabel;
    Panel132: TPanel;
    Label144: TLabel;
    baseHz4: TLabel;
    Panel133: TPanel;
    Label146: TLabel;
    baseHz1: TLabel;
    Panel134: TPanel;
    Label148: TLabel;
    baseHz: TLabel;
    Panel135: TPanel;
    Label150: TLabel;
    Panel136: TPanel;
    Panel137: TPanel;
    Label79: TLabel;
    Label141: TLabel;
    Panel138: TPanel;
    Label143: TLabel;
    Label145: TLabel;
    { *** 函数/过程 目录 *** }
    { #.构造函数 }
    procedure FormCreate(Sender: TObject);
    procedure InitSegData();
    { #.开始界面 }
    procedure ShowBeginTabSheet();
    { #.其它 }
    procedure Timer1Timer(Sender: TObject);
    { #.绘图函数 }
    procedure PaintABCD(); // 根据当前界面参数属性值,选择绘制
    procedure PaintA(); // 原始数据_绘制图A
    procedure PaintB(); // 长度分析_绘制图B
    procedure PaintC(); // 预应力分析_绘制图C
    procedure PaintE(); // 原始数据_绘制图A
    procedure InitMyPen_WinLine();
    procedure PaintLine();

    { 0.总体面板控制,参数更新(由"参数类"+Timer共同完成) }
    procedure Show1(Sender: TObject); // 开始面板
    procedure Show1_1(Sender: TObject); // 开始面板子页1
    procedure Show1_2(Sender: TObject); // 开始面板子页2

    procedure ShowSet(Sender: TObject); // 展开参数设置面板

    procedure ShowSource(Sender: TObject);
    procedure ShowLength(Sender: TObject);
    procedure ShowForce(Sender: TObject);
    procedure ShowResult(Sender: TObject);

    Function OpenFile(FileName:String;number:Integer):Boolean;
    { 1.开始界面 }
    { 2.源数据分析 }
    procedure PaintBoxAMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, y: integer);
    { 3.长度分析 }
    { 4.预应力分析 }
    { 5.结果展示 }
    { @.calculate }
    procedure calculate();
    procedure MyAnonymousThread(i: integer);
    procedure PaintBoxBMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, y: integer);
    procedure PaintBoxBMouseMove(Sender: TObject; Shift: TShiftState;
      x, y: integer);
    procedure PaintBoxBMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, y: integer);
    procedure BitBtnOKClick(Sender: TObject);
    procedure PanelSet_OKClick(Sender: TObject);
    procedure PanelSetBackupClick(Sender: TObject);
    procedure SelectSTFTWindowsMoveAClick(Sender: TObject);
    procedure PaintBoxAPaint(Sender: TObject);
    procedure PaintBoxBPaint(Sender: TObject);
    procedure PaintBoxCPaint(Sender: TObject);
    procedure STFTWindowLeftAutoMove(Sender: TObject);
    procedure STFTWindowRightAutoMove(Sender: TObject);
    procedure STFTWindowLeftMove(Sender: TObject);
    procedure STFTWindowRightMove(Sender: TObject);
    procedure FrontClick(Sender: TObject);
    procedure Image20Click(Sender: TObject);
    procedure AnalysisLength_ReviaryClickFalse(Sender: TObject);
    procedure AnalysisLength_ReviaryClicktrue(Sender: TObject);
    procedure PaintBoxCMouseMove(Sender: TObject; Shift: TShiftState;
      x, y: integer);
    procedure PaintBoxCMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, y: integer);
    procedure PaintBoxCMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, y: integer);
    procedure Timer2Timer(Sender: TObject);
    procedure PaintBoxRoundPaint(Sender: TObject);
    procedure PaintBoxRoundMouseMove(Sender: TObject; Shift: TShiftState;
      x, y: integer);
    procedure PaintBoxRoundMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, y: integer);
    procedure ListView1CustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure BitBtnNextClick(Sender: TObject);
    procedure BitBtnBackClick(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);

    {************************}
    procedure LoadSegDataBase(var PanelWellcome:TFlowPanel;path: String);
    procedure PanelClick(Sender: TObject);    //开始界面Panel点击事件
    procedure BeginAnalize;
    procedure InitPanelTree(var TheMyTree:TMyTree);
    procedure ShowHide(var TheMyTree:TMyTree;Show:Boolean);
//    procedure HideAll(var TheMyTree:TMyTree;Show:Boolean);
    procedure LoadInfo(theType:Integer);

    procedure PanelTreeClick(Sender: TObject);


    //procedure PanelTreeClick(Sender: TObject);    //开始界面Panel点击事件
    { ********************** }
    procedure CreateParams(var Params: TCreateParams); override;
    procedure HistoryOpen(Sender: TObject);
    procedure LabelData0Click(Sender: TObject);
    procedure PaintBoxEPaint(Sender: TObject);

     //解决窗体打开时闪烁问题
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  Seg1: Seg;
  MyCircle1:MyCircle;
  MyDataBase:DataBase;
  MyTree:TMyTree;

  LWPNumber: integer; // 线程序号
  oldX, oldCX: integer;

  MyPanel:array of TPanel;
  MyLabel:array of array of TLabel;


  TheAnalysisNumber:Integer = 0;


implementation

{$R *.dfm}
{ *** 函数/过程 目录 *** }
{ #.构造函数 }
{ #.其它 }
{ #.绘图函数 }
{ 0.总体面板控制,参数更新(由"参数类"+Timer共同完成) }
{ 1.开始界面 }
{ 2.源数据分析 }
{ 3.长度分析 }
{ 4.预应力分析 }
{ 5.结果展示 }
{ ********************** }

procedure TForm1.CreateParams(var Params: TCreateParams);
 begin    //解决窗体打开时闪烁问题
   inherited;
   Params.ExStyle := 33554432; //0x 02 00 00 00
 end;

{ #.构造函数 }{ ****************************************************************** }{ 0.构造函数 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i: integer;
begin
  Form1.Hide;
  Form1.Height:=768-50;//Screen.Height;
  Form1.Width:=1280-100;//Screen.Width;
  Form1.Top := trunc((Screen.Height - Form1.Height) / 2)+10;
  Form1.Left := trunc((Screen.Width - Form1.Width) / 2);
  Form1.WindowState :=  wsMaximized;//窗体最大化

  for I := 0 to PageControlAll.PageCount-1 do
    PageControlAll.Pages[i].TabVisible:=false;


  PanelMessage.Hide;
  PanelMessage.Align := alNone;
  PanelMessage.Width := 500;
  PanelMessage.Height := 230;
  PanelMessage.Top := trunc((Screen.Height - PanelMessage.Height) / 2);
  PanelMessage.Left := trunc((Screen.Width - PanelMessage.Width) / 2);


//  PageControl1.ActivePage := TabSheet1_1;

  MyDataBase.FilePath := ExtractFileDir(Application.Exename)+ '\锚索测量数据库';
  if DirectoryExists(MyDataBase.FilePath) then
  begin
    MyDataBase.CurPath[0]:= MyDataBase.FilePath;
  end else begin
    MyDataBase.CurPath[0]:='C:\锚索测量数据库';
    MyDataBase.FilePath := 'C:\锚索测量数据库';
  end;

  LabelData1.Caption:=''; ImageData1.Hide;
  LabelData2.Caption:=''; ImageData2.Hide;


    ShowBeginTabSheet();
//  MyTree:=TMyTree.create(MyDataBase.FilePath,MyDataBase,0,0);
//  Form1.InitPanelTree(MyTree);
//  ShowHide(MyTree,true);

  PageControlAll.ActivePage := TabSheetWellcome;
  Form1.Show;
  LoadSegDataBase(PanelWellcome,MyDataBase.CurPath[MyDataBase.PageIndex]);
end;




procedure TForm1.STFTWindowLeftAutoMove(Sender: TObject);
begin
  if Seg1.Control1.WindowLeftAutoMove then
  begin
    Seg1.Control1.WindowLeftAutoMove := false;
    LabelWindowLeftAutoMove.Caption := '关';
  end
  else
  begin
    Seg1.Control1.WindowLeftAutoMove := true;
    LabelWindowLeftAutoMove.Caption := '开';
  end;

  Seg1.Control1.SelectWindowsMove := false;
  Seg1.Control1.WindowRightAutoMove := false;
  SelectWindowsMoveB.Caption := '关';
  LabelWindowRightAutoMove.Caption := '关';
end;

procedure TForm1.STFTWindowRightAutoMove(Sender: TObject);
begin
  if Seg1.Control1.WindowRightAutoMove then
  begin
    Seg1.Control1.WindowRightAutoMove := false;
    LabelWindowRightAutoMove.Caption := '关';
  end
  else
  begin
    Seg1.Control1.WindowRightAutoMove := true;
    LabelWindowRightAutoMove.Caption := '开';
  end;

  Seg1.Control1.WindowLeftAutoMove := false;
  Seg1.Control1.SelectWindowsMove := false;
  LabelWindowLeftAutoMove.Caption := '关';
  SelectWindowsMoveB.Caption := '关';
end;


procedure TForm1.STFTWindowLeftMove(Sender: TObject);
begin
  Seg1.Control1.SelectWindowsMove := false;
  Seg1.Control1.WindowRightAutoMove := false;
  Seg1.Control1.WindowLeftAutoMove := false;
  LabelWindowRightAutoMove.Caption := '关';
  LabelWindowLeftAutoMove.Caption := '关';
  SelectWindowsMoveB.Caption := '关';

  Seg1.PaintWindow(PaintBoxB, Seg1.Control1.WindowBegin);
  Seg1.Control1.WindowBegin := Seg1.Control1.WindowBegin - 20;
  if (Seg1.Control1.WindowBegin < 0) then
  begin
    Seg1.Control1.WindowBegin := 0;
  end;
  if (20 + Seg1.Control1.WindowBegin + Seg1.CanShu1.WindowW *
    (PaintBoxB.Width - 25) / Seg1.CanncelHead1[Seg1.Control1.TapeNumber]
    .DataNum) > PaintBoxB.Width - 10 then
  begin
    Seg1.Control1.WindowBegin := trunc(PaintBoxB.Width - Seg1.CanShu1.WindowW *
      (PaintBoxB.Width - 25) / Seg1.CanncelHead1[Seg1.Control1.TapeNumber]
      .DataNum - 10 - 20);
  end;

  Seg1.PaintWindow(PaintBoxB, Seg1.Control1.WindowBegin);
  PaintBoxB.Canvas.Pen.Mode := pmCopy;
  PaintBoxB.Canvas.Pen.Color := clBlack;

  Seg1.PaintOne(PaintBoxB, 20, integer(trunc(PaintBoxB.Height * 2 / 3)) + 15,
    PaintBoxB.Width - 25, integer(trunc(PaintBoxB.Height / 3)) - 25 - 5,
    Seg1.Control1.TapeNumber, 4);


end;

procedure TForm1.STFTWindowRightMove(Sender: TObject);
begin

  Seg1.Control1.SelectWindowsMove := false;
  Seg1.Control1.WindowRightAutoMove := false;
  Seg1.Control1.WindowLeftAutoMove := false;
  LabelWindowRightAutoMove.Caption := '关';
  LabelWindowLeftAutoMove.Caption := '关';
  SelectWindowsMoveB.Caption := '关';

  Seg1.PaintWindow(PaintBoxB, Seg1.Control1.WindowBegin);
  Seg1.Control1.WindowBegin := Seg1.Control1.WindowBegin + 20;
  if (Seg1.Control1.WindowBegin < 0) then
  begin
    Seg1.Control1.WindowBegin := 0;

  end;
  if (20 + Seg1.Control1.WindowBegin + Seg1.CanShu1.WindowW *
    (PaintBoxB.Width - 25) / Seg1.CanncelHead1[Seg1.Control1.TapeNumber]
    .DataNum) > PaintBoxB.Width - 10 then
  begin
    Seg1.Control1.WindowBegin := trunc(PaintBoxB.Width - Seg1.CanShu1.WindowW *
      (PaintBoxB.Width - 25) / Seg1.CanncelHead1[Seg1.Control1.TapeNumber]
      .DataNum - 10 - 20);

  end;

  Seg1.PaintWindow(PaintBoxB, Seg1.Control1.WindowBegin);
  PaintBoxB.Canvas.Pen.Mode := pmCopy;
  PaintBoxB.Canvas.Pen.Color := clBlack;

  Seg1.PaintOne(PaintBoxB, 20, integer(trunc(PaintBoxB.Height * 2 / 3)) + 15,
    PaintBoxB.Width - 25, integer(trunc(PaintBoxB.Height / 3)) - 25 - 5,
    Seg1.Control1.TapeNumber, 4);
end;



procedure TForm1.LabelData0Click(Sender: TObject);
begin
///
end;

procedure TForm1.ListView1Click(Sender: TObject);
var
  IniFile: TIniFile;
begin
//  if ListView1.Selected <> nil then
//  begin
//    MyDataBase.CurPath[MyDataBase.PageIndex+1] := ListView1.Selected.Caption;
//    if MyDataBase.SearchDir(MyDataBase.CurPath[MyDataBase.PageIndex] + '\' + MyDataBase.CurPath[MyDataBase.PageIndex+1], MyDataBase.PageIndex).Count = 0 then
//    begin
//      showmessage('当前目录下没有文件！请核对！');
//    end else
//    begin
//      MyDataBase.PageIndex := MyDataBase.PageIndex + 1;
//      ShowBeginTabSheet();
//    end;
//  end;
end;

procedure TForm1.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Item.index mod 2 = 0 then
    Sender.Canvas.Brush.Color := $00DCDCDC //clBtnFace//$00DCDCDC//clSkyBlue
  else
    Sender.Canvas.Brush.Color := clBtnFace;//clWhite;
end;

procedure TForm1.ShowBeginTabSheet();
var
  i:Integer;
  IniFile,IniFile1,IniFile2: TIniFile;
  Titem: TListItem;
begin
  case MyDataBase.PageIndex of
    0:begin
        PanelBackB.Hide;

        PageControl1.ActivePageIndex := 0;
//        MyDataBase.LoadSegDataBase(ListView1,MyDataBase.CurPath[MyDataBase.PageIndex]);
        LoadSegDataBase(PanelWellcome,MyDataBase.CurPath[MyDataBase.PageIndex]);

        IniFile := TIniFile.Create(MyDataBase.CurPath[MyDataBase.PageIndex] + '\history.ini');
        Label48.Caption:=inifile.Readstring('history','section','');
        Label47.Caption:=inifile.Readstring('history','project','');
        Label32.Caption:=inifile.Readstring('history','channel','');
        Label90.Caption:=inifile.Readstring('history','date','');
        IniFile.Free;
      end;
    1:begin
        MyDataBase.CurPath[MyDataBase.PageIndex+1]:=MyDataBase.CurPath[MyDataBase.PageIndex-1] + '\' + MyDataBase.CurPath[MyDataBase.PageIndex];
        // 读section.ini
        IniFile := TIniFile.Create(MyDataBase.CurPath[MyDataBase.PageIndex+1] + '\section.ini');
        editFileName.Text := MyDataBase.CurPath[MyDataBase.PageIndex];
        editName.Text:=inifile.Readstring('section','name','');
        Editmileage.Text:=inifile.Readstring('section','mileage','');
        EditBuilder.Text:=inifile.Readstring('section','builder','');
        EditTester.Text:=inifile.Readstring('section','tester','');
        EditData.Text:=inifile.Readstring('section','date','');
        IniFile.Free;

        PageControl1.ActivePageIndex := 1;
      end;
    2:begin
        //写 section.ini
        IniFile := TIniFile.Create(MyDataBase.CurPath[MyDataBase.PageIndex] + '\section.ini');
        inifile.writestring('section','name',editName.Text);
        inifile.writestring('section','mileage',EditMileage.Text);
        inifile.writestring('section','builder',EditBuilder.Text);
        inifile.writestring('section','tester',EditTester.Text);
        inifile.writestring('section','date',EditData.Text);
        IniFile.Free;

        LoadSegDataBase(PanelWellcome,MyDataBase.CurPath[MyDataBase.PageIndex]);
        PanelBackB.Show;

        PageControl1.ActivePageIndex:= 0;
      end;
    3:begin
        MyDataBase.CurPath[MyDataBase.PageIndex+1]:=MyDataBase.CurPath[MyDataBase.PageIndex-1] + '\' + MyDataBase.CurPath[MyDataBase.PageIndex];

        // 读project.ini
        IniFile := TIniFile.Create(MyDataBase.CurPath[MyDataBase.PageIndex+1] + '\project.ini');
        EditFileName1.Text:=MyDataBase.CurPath[MyDataBase.PageIndex];
        EditLength.Text:=inifile.Readstring('project','length','');
        EditForce.Text:=inifile.Readstring('project','force','');
        EditDateB.Text:=inifile.Readstring('project','date','');
        IniFile.Free;

        PageControl1.ActivePageIndex:= 2;
      end;
    4:begin
        //写project.ini
        IniFile := TIniFile.Create(MyDataBase.CurPath[MyDataBase.PageIndex] + '\project.ini');
        inifile.writestring('project','length',EditLength.Text);
        inifile.writestring('project','force',EditForce.Text);
        inifile.writestring('project','date',EditDateB.Text);
        IniFile.Free;

        LoadSegDataBase(PanelWellcome,MyDataBase.CurPath[MyDataBase.PageIndex]);
        PanelBackB.Show;

        PageControl1.ActivePageIndex:= 0;
      end;
    5:begin
        MyDataBase.CurPath[MyDataBase.PageIndex+1]:=MyDataBase.CurPath[MyDataBase.PageIndex-1] + '\' + MyDataBase.CurPath[MyDataBase.PageIndex];

        // 读channel.ini
        IniFile := TIniFile.Create(MyDataBase.CurPath[MyDataBase.PageIndex+1] + '\channel.ini');
        EditNumB.Text:=inifile.Readstring('channel','number','');
        EditLengthB.Text:=inifile.Readstring('channel','length','');
        EditDateC.Text:=inifile.Readstring('channel','date','');
        IniFile.Free;

        PageControl1.ActivePageIndex := 3;

        MyCircle1.inner_numAll := StrToInt(EditNumB.Text);
        setLength(MyCircle1.inner_Staus, MyCircle1.inner_numAll);

        for i := 0 to MyCircle1.inner_numAll - 1 do
        begin
          MyCircle1.inner_Staus[i] := 0;
        end;
        MyCircle1.Draw_out_inner(PaintBox1, MyCircle1.inner_numAll, MyCircle1.inner_Staus);

      end;
    6:begin
        //写channel.ini
        IniFile := TIniFile.Create(MyDataBase.CurPath[MyDataBase.PageIndex] + '\channel.ini');
        inifile.writestring('channel','number',EditNumB.Text);
        inifile.writestring('channel','length',EditLengthB.Text);
        inifile.writestring('channel','date',EditDateC.Text);
        IniFile.Free;

        MyCircle1.inner_numAll := StrToInt(EditNumB.Text);
        for i := 0 to MyCircle1.inner_numAll - 1 do
        begin
          MyCircle1.inner_Staus[i] := 0;
        end;
        MyCircle1.inner_Staus[0] := 2;
        Seg1.Control1.Analysis_Type:=0;

        if Form1.OpenFile(MyDataBase.CurPath[MyDataBase.PageIndex],1)=true then
        begin
            IniFile := TIniFile.Create(MyDataBase.CurPath[0] + '\history.ini');
            inifile.writestring('history','section',MyDataBase.CurPath[1]);
            inifile.writestring('history','project',MyDataBase.CurPath[3]);
            inifile.writestring('history','channel',MyDataBase.CurPath[5]);
            inifile.writestring('history','date',EditDateC.Text);

            IniFile := TIniFile.Create(MyDataBase.CurPath[0] + '\history.ini');
            Label48.Caption:=inifile.Readstring('history','section','');
            Label47.Caption:=inifile.Readstring('history','project','');
            Label32.Caption:=inifile.Readstring('history','channel','');
            Label90.Caption:=inifile.Readstring('history','date','');

//            ObjectName.Caption:=editFileName.Text;
//            Object_Number.Caption:=EditFileName1.Text;
//            Object_Hole_Number.Caption:=MyDataBase.CurPath[MyDataBase.PageIndex-1];
//            LabelLength.Caption:=EditLength.Text;
//            LabelForce.Caption:=EditForce.Text;
        end else
        begin
          ShowMessage('文件打开失败,请检测数据文件！');
        end;
        MyDataBase.PageIndex:=5;
      end;
  end;
end;

procedure TForm1.InitSegData();
var
  i: integer;
begin
  Seg1.CanShu1.HZ_Filter1.HZ_1 := StrToFloat(HZ_1.Text);
  Seg1.CanShu1.HZ_Filter1.HZ_2 := StrToFloat(HZ_2.Text);
  Seg1.CanShu1.MHZ_Width := StrToFloat(MHZ_Width.Text); // 最大宽度
  Seg1.CanShu1.MHZ_threshold := StrToFloat(MHZ_threshold.Text) / 100; // 主频阈值
  Seg1.CanShu1.WindowW := StrToInt(WindowW.Text);

  Seg1.CanShu1.ES_threshold := StrToInt(ES_thresholdEdit.Text)/100;   //灌浆饱和度阈值

  Seg1.Control1.WindowBegin := 0;

  Seg1.CanShu1.wave1 := StrToFloat(wave1.Text);
  Seg1.CanShu1.wave2 := StrToFloat(wave2.Text);
end;

{ #.其它 }{ ********************************************************************** }{ #.其它 }
procedure TForm1.Timer1Timer(Sender: TObject);
begin
//  LabelTime.Caption := FormatDateTime('hh:nn',Now());

//  FreedomLengthB.Text := FreedomLength.Caption;
  Seg1.Result1[TheAnalysisNumber].FreeLong:= StrTofloat(FreedomLength.Caption);
//  densityB.Text := density.Text;

  if PageControlAll.ActivePage = TabSheetLength then
  begin


    TapeNumber.Caption := IntToStr(Seg1.Control1.TapeNumber + 1)+'/'+IntToStr(Seg1.TapeHead1.TapeNum);
    FreedomLength.Caption :=
      FloatToStr(trunc((Seg1.Control1.FreedomEnd / (PaintBoxB.Width - 25) *
      Seg1.CanncelHead1[Seg1.Control1.TapeNumber].DataNum * 0.000002 *
      Seg1.CanShu1.wave1 / 2 + 0.05) * 10) / 10);
    FixedLength.Caption :=
      FloatToStr(trunc(((Seg1.Control1.FixedEnd - Seg1.Control1.FreedomEnd) /
      (PaintBoxB.Width - 25) * Seg1.CanncelHead1[Seg1.Control1.TapeNumber]
      .DataNum * 0.000002 * Seg1.CanShu1.wave2 / 2 + 0.05) * 10) / 10);
  end;

  if LWPNumber = Seg1.TapeHead1.TapeNum then
  begin
    PanelMessage.Hide;
    Form1.Enabled := true;
    PaintABCD();
    LWPNumber := 0;
  end;

  if Seg1.Control1.WindowRightAutoMove or Seg1.Control1.WindowLeftAutoMove then
  begin
    Seg1.PaintWindow(PaintBoxB, Seg1.Control1.WindowBegin);

    if Seg1.Control1.WindowRightAutoMove then
    begin
      Seg1.Control1.WindowBegin := Seg1.Control1.WindowBegin + 2;
    end
    else if Seg1.Control1.WindowLeftAutoMove then
    begin
      Seg1.Control1.WindowBegin := Seg1.Control1.WindowBegin - 2;
    end;

    if (Seg1.Control1.WindowBegin < 0) then
    begin
      Seg1.Control1.WindowBegin := 0;

      Seg1.Control1.SelectWindowsMove := false;
      Seg1.Control1.WindowRightAutoMove := false;
      Seg1.Control1.WindowLeftAutoMove := false;
      LabelWindowRightAutoMove.Caption := '关';
      LabelWindowLeftAutoMove.Caption := '关';
      SelectWindowsMoveB.Caption := '关';
    end;
    if (20 + Seg1.Control1.WindowBegin + Seg1.CanShu1.WindowW *
      (PaintBoxB.Width - 25) / Seg1.CanncelHead1[Seg1.Control1.TapeNumber]
      .DataNum) > PaintBoxB.Width - 10 then
    begin
      Seg1.Control1.WindowBegin := trunc(PaintBoxB.Width - Seg1.CanShu1.WindowW
        * (PaintBoxB.Width - 25) / Seg1.CanncelHead1[Seg1.Control1.TapeNumber]
        .DataNum - 10 - 20);

      Seg1.Control1.SelectWindowsMove := false;
      Seg1.Control1.WindowRightAutoMove := false;
      Seg1.Control1.WindowLeftAutoMove := false;
      LabelWindowRightAutoMove.Caption := '关';
      LabelWindowLeftAutoMove.Caption := '关';
      SelectWindowsMoveB.Caption := '关';

    end;

    Seg1.PaintWindow(PaintBoxB, Seg1.Control1.WindowBegin);
    PaintBoxB.Canvas.Pen.Mode := pmCopy;
    PaintBoxB.Canvas.Pen.Color := clBlack;

    Seg1.PaintOne(PaintBoxB, 20, integer(trunc(PaintBoxB.Height * 2 / 3)) + 15,
      PaintBoxB.Width - 25, integer(trunc(PaintBoxB.Height / 3)) - 25 - 5,
      Seg1.Control1.TapeNumber, 4);
  end

end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  i: integer;
  n, TheBaseHz: Double;
begin
  if (PageControlAll.ActivePage = TabSheetForce) and
    (Seg1.Control1.calculateF = false) then
  begin
    n := 1;
    while (n < Seg1.Control1.FreedomEnd / (PaintBoxC.Width - 25) *
      Seg1.CanncelHead1[Seg1.Control1.TapeNumber].DataNum) do n:=n*2;
      n := n * 2 * 2; // 继续放大一倍，提高精度

      TheBaseHz := 0;
      for i := 0 to Seg1.TapeHead1.TapeNum - 1 do
      begin
        Seg1.Result1[TheAnalysisNumber].baseHzVal[i] :=  (Seg1.Control1.baseHzEnd[i] -
          Seg1.Control1.baseHzBegin[i])*n/(PaintBoxC.Width-25)/20 * 500 / n;

        TheBaseHz := TheBaseHz + Seg1.Result1[TheAnalysisNumber].baseHzVal[i];
      end;
      Seg1.Result1[TheAnalysisNumber].baseHz := TheBaseHz / Seg1.TapeHead1.TapeNum *1000 ;
      baseHz.Caption := FloatToStr(trunc(Seg1.Result1[TheAnalysisNumber].baseHz /1000 * 100) / 100);

      baseHz1.Caption := FloatToStr(trunc(Seg1.Result1[TheAnalysisNumber].BaseHzVal[0]  * 100) / 100);
      baseHz2.Caption := FloatToStr(trunc(Seg1.Result1[TheAnalysisNumber].BaseHzVal[1]  * 100) / 100);
      baseHz3.Caption := FloatToStr(trunc(Seg1.Result1[TheAnalysisNumber].BaseHzVal[2]  * 100) / 100);
      baseHz4.Caption := FloatToStr(trunc(Seg1.Result1[TheAnalysisNumber].BaseHzVal[3]  * 100) / 100);
      baseHz5.Caption := FloatToStr(trunc(Seg1.Result1[TheAnalysisNumber].BaseHzVal[4]  * 100) / 100);



  end;
end;

{ #.绘图函数 }{ ****************************************************************** }{ 0.绘图函数 }
procedure TForm1.PaintABCD(); // 原始数据_绘制图A
begin

  if PageControlAll.ActivePage = TabSheetSource then
  begin
    if Seg1.Control1.Analysis_Type < 1 then
    begin
      Seg1.Control1.Analysis_Type := 1;
    end;
    PaintBoxA.Refresh;
    PaintA();
  end
  else if PageControlAll.ActivePage = TabSheetLength then
  begin
    PaintBoxB.Refresh;
    PaintB();
  end
  else if PageControlAll.ActivePage = TabSheetForce then
  begin
    PaintBoxC.Refresh;
    PaintC();
  end;
end;

procedure TForm1.PaintA(); // 原始数据_绘制图A
begin
  Seg1.PaintN(PaintBoxA, 0, 0, PaintBoxA.Width, PaintBoxA.Height, 11);
end;

procedure TForm1.PaintB(); // 长度分析_绘制图B
begin
  if Seg1.Control1.AnalysisLength_Reviary then
  begin
    Seg1.PaintN(PaintBoxB, 0, 0, PaintBoxB.Width, PaintBoxB.Height, 22);
    InitMyPen_WinLine();
  end
  else
  begin
    Seg1.PaintN(PaintBoxB, 0, 0, PaintBoxB.Width, PaintBoxB.Height, 21);
    Seg1.PaintWindow(PaintBoxB, Seg1.Control1.WindowBegin);
    InitMyPen_WinLine();
  end;
end;

procedure TForm1.PaintC(); // 预应力分析_绘制图C
begin
  Seg1.PaintN(PaintBoxC, 0, 0, PaintBoxC.Width, PaintBoxC.Height, 31);
  InitMyPen_WinLine();
end;

procedure TForm1.PanelSetBackupClick(Sender: TObject);
begin
  HZ_1.Text := FloatToStr(Seg1.CanShu1.HZ_Filter1.HZ_1);
  HZ_2.Text := FloatToStr(Seg1.CanShu1.HZ_Filter1.HZ_2);
  MHZ_Width.Text := FloatToStr(Seg1.CanShu1.MHZ_Width);
  MHZ_threshold.Text := FloatToStr(Seg1.CanShu1.MHZ_threshold * 100);
  WindowW.Text := IntToStr(Seg1.CanShu1.WindowW);
  wave1.Text := FloatToStr(Seg1.CanShu1.wave1);
  wave2.Text := FloatToStr(Seg1.CanShu1.wave2);
end;


procedure TForm1.PaintE(); // 原始数据_绘制图A
begin
  Seg1.PaintN(PaintBoxE, 0, 0, PaintBoxA.Width, PaintBoxA.Height, 51);
end;


//procedure TForm1.OK();
//begin
//  HZ_1B.Text := HZ_1.Text;
//  HZ_2B.Text := HZ_2.Text;
//  MHZ_WidthB.Text := MHZ_Width.Text;
//  MHZ_thresholdB.Text := MHZ_threshold.Text;
//  WindowWB.Text := WindowW.Text;
//
//  InitSegData();
//  Seg1.BufFFtToBufFilter(Seg1.CanShu1.HZ_Filter1.HZ_1,
//    Seg1.CanShu1.HZ_Filter1.HZ_2);
//  calculate();
//end;

procedure TForm1.PanelSet_OKClick(Sender: TObject);
begin
  HZ_1B.Text := HZ_1.Text;
  HZ_2B.Text := HZ_2.Text;
  MHZ_WidthB.Text := MHZ_Width.Text;
  MHZ_thresholdB.Text := MHZ_threshold.Text;
  WindowWB.Text := WindowW.Text;

  InitSegData();
  Seg1.BufFFtToBufFilter(Seg1.CanShu1.HZ_Filter1.HZ_1,
    Seg1.CanShu1.HZ_Filter1.HZ_2);
  calculate();
end;



procedure TForm1.Image20Click(Sender: TObject);
begin
  if (Seg1.Control1.TapeNumber >= 0) and
    (Seg1.Control1.TapeNumber < Seg1.TapeHead1.TapeNum - 1) then
  begin
    Seg1.Control1.TapeNumber := Seg1.Control1.TapeNumber + 1;
    PaintB();
  end;
end;

procedure TForm1.FrontClick(Sender: TObject);
begin
  if (Seg1.Control1.TapeNumber > 0) and
    (Seg1.Control1.TapeNumber <= Seg1.TapeHead1.TapeNum - 1) then
  begin
    Seg1.Control1.TapeNumber := Seg1.Control1.TapeNumber - 1;
    PaintB();
  end;
end;

procedure TForm1.InitMyPen_WinLine();
var
  i: integer;
begin
  if PageControlAll.ActivePage = TabSheetLength then
  begin
    if Seg1.Control1.AnalysisLength_Reviary then
    begin
      for i := 0 to (Seg1.TapeHead1.TapeNum - 1) do
      begin
        if i = Seg1.TapeHead1.TapeNum - 1 then
        begin
          PaintBoxB.Canvas.Pen.Mode := pmNotXor;
          PaintBoxB.Canvas.Pen.Style := psDash;
          PaintBoxB.Canvas.Pen.Color := $0000FF;
          PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FreedomEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * i) + 15);
          PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FreedomEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * (i + 1) + 15 - 5 -
            29 + 0.5));
          PaintBoxB.Canvas.Pen.Color := $800000;
          PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FixedEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * i) + 15);
          PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FixedEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * (i + 1) + 15 - 5 -
            29 + 0.5));

        end
        else
        begin
          PaintBoxB.Canvas.Pen.Mode := pmNotXor;
          PaintBoxB.Canvas.Pen.Style := psDash;
          PaintBoxB.Canvas.Pen.Color := $0000FF;
          PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FreedomEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * i) + 15);
          PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FreedomEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * (i + 1) + 15 -
            29 + 0.5));
          PaintBoxB.Canvas.Pen.Color := $800000;
          PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FixedEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * i) + 15);
          PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FixedEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * (i + 1) + 15 -
            29 + 0.5));
        end;
      end;
    end
    else
    begin
      PaintBoxB.Canvas.Pen.Mode := pmNotXor;
      PaintBoxB.Canvas.Pen.Style := psDash;
      PaintBoxB.Canvas.Pen.Color := $0000FF;
      PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FreedomEnd, 15);
      PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FreedomEnd,
        trunc(15 + PaintBoxB.Height / 3 - 29 + 0.5));

      PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FreedomEnd,
        trunc(15 + PaintBoxB.Height / 3 + 0.5));
      PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FreedomEnd,
        trunc(15 + PaintBoxB.Height * 2 / 3 - 29 + 0.5));

      PaintBoxB.Canvas.Pen.Color := $800000;
      PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FixedEnd, 15);
      PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FixedEnd,
        trunc(15 + PaintBoxB.Height / 3 - 29 + 0.5));

      PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FixedEnd,
        trunc(15 + PaintBoxB.Height / 3 + 0.5));
      PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FixedEnd,
        trunc(15 + PaintBoxB.Height * 2 / 3 - 29 + 0.5));
      PaintBoxB.Canvas.Pen.Style := psSolid;
    end
  end;

    for i := 0 to (Seg1.TapeHead1.TapeNum-1) do
    begin

        PaintBoxC.Canvas.Pen.Mode := pmNotXor;
        PaintBoxC.Canvas.Pen.Style := psDash;
        PaintBoxC.Canvas.Pen.Color := $0000FF;
        PaintBoxC.Canvas.MoveTo(20 + Seg1.Control1.baseHzBegin[i], trunc(PaintBoxC.Height/Seg1.TapeHead1.TapeNum*i)+14);
        PaintBoxC.Canvas.LineTo(20 + Seg1.Control1.baseHzBegin[i], trunc(PaintBoxC.Height / Seg1.TapeHead1.TapeNum*(i+1)+15 - 25 + 0.5));
        PaintBoxC.Canvas.Pen.Color:=$800000;
        PaintBoxC.Canvas.MoveTo(20 + Seg1.Control1.baseHzEnd[i], trunc(PaintBoxC.Height/Seg1.TapeHead1.TapeNum*i)+14);
        PaintBoxC.Canvas.LineTo(20 + Seg1.Control1.baseHzEnd[i], trunc(PaintBoxC.Height / Seg1.TapeHead1.TapeNum*(i+1)+15 - 25 + 0.5));

    end;
end;

procedure TForm1.PaintLine();
var
  i: integer;
begin
  if PageControlAll.ActivePage = TabSheetLength then
  begin
    if Seg1.Control1.AnalysisLength_Reviary then
    begin
      for i := 0 to (Seg1.TapeHead1.TapeNum - 1) do
      begin
        if i = Seg1.TapeHead1.TapeNum - 1 then
        begin
          PaintBoxB.Canvas.Pen.Mode := pmNotXor;
          PaintBoxB.Canvas.Pen.Style := psDash;
          PaintBoxB.Canvas.Pen.Color := $0000FF;
          PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FreedomEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * i) + 15);
          PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FreedomEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * (i + 1) + 15 - 5 -
            29 + 0.5));
          PaintBoxB.Canvas.Pen.Color := $800000;
          PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FixedEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * i) + 15);
          PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FixedEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * (i + 1) + 15 - 5 -
            29 + 0.5));

        end
        else
        begin
          PaintBoxB.Canvas.Pen.Mode := pmNotXor;
          PaintBoxB.Canvas.Pen.Style := psDash;
          PaintBoxB.Canvas.Pen.Color := $0000FF;
          PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FreedomEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * i) + 15);
          PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FreedomEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * (i + 1) + 15 -
            29 + 0.5));
          PaintBoxB.Canvas.Pen.Color := $800000;
          PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FixedEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * i) + 15);
          PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FixedEnd,
            trunc(PaintBoxB.Height / Seg1.TapeHead1.TapeNum * (i + 1) + 15 -
            29 + 0.5));
        end;
      end;
    end
    else
    begin
      if Seg1.Control1.FreedomEndChoose = true then
      begin
        PaintBoxB.Canvas.Pen.Mode := pmNotXor;
        PaintBoxB.Canvas.Pen.Style := psDash;
        PaintBoxB.Canvas.Pen.Color := $0000FF;
        PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FreedomEnd, 15);
        PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FreedomEnd,
          trunc(15 + PaintBoxB.Height / 3 - 29 + 0.5));

        PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FreedomEnd,
          trunc(15 + PaintBoxB.Height / 3 + 0.5));
        PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FreedomEnd,
          trunc(15 + PaintBoxB.Height * 2 / 3 - 29 + 0.5));
      end
      else if Seg1.Control1.FixedEndChoose = true then
      begin
        PaintBoxB.Canvas.Pen.Mode := pmNotXor;
        PaintBoxB.Canvas.Pen.Style := psDash;
        PaintBoxB.Canvas.Pen.Color := $800000;
        PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FixedEnd, 15);
        PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FixedEnd,
          trunc(15 + PaintBoxB.Height / 3 - 29 + 0.5));

        PaintBoxB.Canvas.MoveTo(20 + Seg1.Control1.FixedEnd,
          trunc(15 + PaintBoxB.Height / 3 + 0.5));
        PaintBoxB.Canvas.LineTo(20 + Seg1.Control1.FixedEnd,
          trunc(15 + PaintBoxB.Height * 2 / 3 - 29 + 0.5));
      end;
    end
  end;

  if PageControlAll.ActivePage = TabSheetForce then
  begin
      for i := 0 to (Seg1.TapeHead1.TapeNum-1) do
      begin

          PaintBoxC.Canvas.Pen.Mode := pmNotXor;
          PaintBoxC.Canvas.Pen.Style := psDash;
          PaintBoxC.Canvas.Pen.Color := $0000FF;
          PaintBoxC.Canvas.MoveTo(20 + Seg1.Control1.baseHzBegin[i], trunc(PaintBoxC.Height/Seg1.TapeHead1.TapeNum*i)+15);
          PaintBoxC.Canvas.LineTo(20 + Seg1.Control1.baseHzBegin[i], trunc(PaintBoxC.Height / Seg1.TapeHead1.TapeNum*(i+1)+15 - 29 + 0.5));
          PaintBoxC.Canvas.Pen.Color:=$800000;
          PaintBoxC.Canvas.MoveTo(20 + Seg1.Control1.baseHzEnd[i], trunc(PaintBoxC.Height/Seg1.TapeHead1.TapeNum*i)+15);
          PaintBoxC.Canvas.LineTo(20 + Seg1.Control1.baseHzEnd[i], trunc(PaintBoxC.Height / Seg1.TapeHead1.TapeNum*(i+1)+15 - 29 + 0.5));
      end;
  end
end;

{ 0.总体面板控制,参数更新(由"参数类"+Timer共同完成) }{ ************************** }{ 0.总体面板控制 }


procedure TForm1.SelectSTFTWindowsMoveAClick(Sender: TObject);
begin
  if Seg1.Control1.SelectWindowsMove then
  begin
    Seg1.Control1.SelectWindowsMove := false;
    Seg1.Control1.WindowRightAutoMove := false;
    Seg1.Control1.WindowLeftAutoMove := false;
    LabelWindowRightAutoMove.Caption := '关';
    LabelWindowLeftAutoMove.Caption := '关';
    SelectWindowsMoveB.Caption := '关';
  end
  else
  begin
    Seg1.Control1.SelectWindowsMove := true;
    Form1.SelectWindowsMoveB.Caption := '开';

    Seg1.Control1.WindowRightAutoMove := false;
    Seg1.Control1.WindowLeftAutoMove := false;
    LabelWindowRightAutoMove.Caption := '关';
    LabelWindowLeftAutoMove.Caption := '关';
  end
end;

procedure TForm1.Show1(Sender: TObject);
begin
  PageControlAll.ActivePage := TabSheetWellcome; // 设置PageControl组件的当前页
end;

procedure TForm1.Show1_1(Sender: TObject); // 开始面板子页1
begin
  PageControl1.ActivePage := TabSheet1_1; // 设置PageControl组件的当前页
end;

procedure TForm1.Show1_2(Sender: TObject); // 开始面板子页2
begin
  PageControl1.ActivePage := TabSheet1_2; // 设置PageControl组件的当前页
end;

procedure TForm1.ShowSet(Sender: TObject); // 展开参数设置面板
begin
  if Seg1.Control1.Analysis_Type=0 then
  begin
     showmessage('请选择数据！');
  end else begin
    PageControlAll.ActivePage := TabSheetSet;
  end;
end;

procedure TForm1.HistoryOpen(Sender: TObject);
var
  i:Integer;
begin
  MyDataBase.PageIndex:=0;
  if (Label48.Caption <> '') and (Label47.Caption <> '') and (Label32.Caption <> '') then
  begin
    MyDataBase.CurPath[1]:= Label48.Caption;
    MyDataBase.CurPath[2]:= MyDataBase.CurPath[0]+'\'+MyDataBase.CurPath[1];
    MyDataBase.CurPath[3]:= Label47.Caption;
    MyDataBase.CurPath[4]:= MyDataBase.CurPath[2]+'\'+MyDataBase.CurPath[3];
    MyDataBase.CurPath[5]:= Label32.Caption;
    MyDataBase.CurPath[6]:= MyDataBase.CurPath[4]+'\'+MyDataBase.CurPath[5];

    if ((MyDataBase.SearchDir(MyDataBase.CurPath[2], 0).Count <> 0)  and
       (MyDataBase.SearchDir(MyDataBase.CurPath[4], 0).Count <> 0)  and
       (MyDataBase.SearchDir(MyDataBase.CurPath[6], 4).Count <> 0))  then
    begin
      MyDataBase.PageIndex:=4;
      LoadSegDataBase(PanelWellcome,MyDataBase.CurPath[4]);
      LabelData1.Caption:=MyDataBase.CurPath[3]; ImageData1.Show;
      LabelData2.Caption:=MyDataBase.CurPath[5]; ImageData2.Show;

      MyDataBase.PageIndex:=6;
      BeginAnalize;
    end else
    begin
      showmessage('当前目录下没有文件！请核对！');
      MyDataBase.PageIndex:=0;
//      LoadSegDataBase(PanelWellcome,MyDataBase.CurPath[0]);
//      LabelData1.Caption:=MyDataBase.CurPath[3]; ImageData1.Show;
//      LabelData2.Caption:=MyDataBase.CurPath[5]; ImageData2.Show;
    end;
  end else
  begin
     showmessage('历史信息缺失！请重新选择文件.');
     MyDataBase.PageIndex:=0;
//     LoadSegDataBase(PanelWellcome,MyDataBase.CurPath[0]);
//     LabelData1.Caption:=MyDataBase.CurPath[3]; ImageData1.Show;
//     LabelData2.Caption:=MyDataBase.CurPath[5]; ImageData2.Show;
  end;
end;

procedure TForm1.ShowSource(Sender: TObject);
begin
  if Seg1.Control1.Analysis_Type=0 then
  begin
     showmessage('请选择数据！');
  end else
  if Seg1.Control1.Analysis_Type >0 then
  begin
    PageControlAll.ActivePage := TabSheetSource; // 设置PageControl组件的当前页
    if Seg1.Control1.Analysis_Type < 1 then
    begin
      Seg1.Control1.Analysis_Type := 1;
    end;
  end;
end;

procedure TForm1.ShowLength(Sender: TObject);
begin
  if Seg1.Control1.Analysis_Type=0 then
  begin
     showmessage('请选择数据！');
  end else
  begin
      PageControlAll.ActivePage := TabSheetLength; // 设置PageControl组件的当前页
      if Seg1.Control1.Analysis_Type < 2 then
      begin
        Seg1.Control1.Analysis_Type := 2;
      end;
  end;
end;

procedure TForm1.ShowForce(Sender: TObject);
begin
  if Seg1.Control1.Analysis_Type=0 then
  begin
     showmessage('请选择数据！');
  end else
  if Seg1.Control1.Analysis_Type >= 2 then
  begin
    PageControlAll.ActivePage := TabSheetForce; // 设置PageControl组件的当前页
    if Seg1.Control1.Analysis_Type = 2 then
    begin
      Seg1.Control1.Analysis_Type := 3;
    end;
  end
  else
  begin
    showmessage('长度分析未完成,无法继续！');
  end

end;

procedure TForm1.ShowResult(Sender: TObject);
var
  Titem: TListItem;
  i,AnalyticalNum: integer;
  MeanForce,DesignForce,MaxForce,MinForce:double;
begin
  if Seg1.Control1.Analysis_Type=0 then
  begin
     showmessage('请选择数据！');
  end
  else
  if Seg1.Control1.Analysis_Type >= 3 then
  begin
    PageControlAll.ActivePage := TabSheetResult; // 设置PageControl组件的当前页
    Seg1.Control1.Analysis_Type := 4;
    AnalyticalNum:=0;
    MeanForce:=0;
    MaxForce:=0;


    ObjectName.Caption:=Label87.Caption;
    Object_Number.Caption:=Label100.Caption;
    Object_Hole_Number.Caption:=Label98.Caption;
    LabelLength.Caption:=Label94.Caption;
//    LabelForce.Caption:=;

    for i := 0 to MyCircle1.inner_numAll - 1 do
    begin
        if (MyCircle1.inner_Staus[i]=1) or (MyCircle1.inner_Staus[i]=2) then
        begin
          Seg1.Result1[i].F := trunc(4 * StrToFloat(density.Text) * sqr(Seg1.Result1[i].FreeLong) *
              sqr(Seg1.Result1[i].baseHz/1000)*100)/100;
          MeanForce:=MeanForce+Seg1.Result1[i].F;
          if MaxForce < Seg1.Result1[i].F then
          begin
             MaxForce:= Seg1.Result1[i].F;
          end;

          AnalyticalNum:=AnalyticalNum+1;
          ListView2.Items[i].SubItems[0] := FloatToStr(Trunc(Seg1.Result1[i].F *100)/100);
          ListView2.Items[i].SubItems[1] := FloatToStr(trunc(Seg1.Result1[i].BaseHz/1000*100)/100);
          ListView2.Items[i].SubItems[2] := FloatToStr(Seg1.Result1[i].FreeLong);


        end;
    end;
    MinForce:=MaxForce;
    for i := 0 to MyCircle1.inner_numAll - 1 do
    begin
      if (MyCircle1.inner_Staus[i]=1) or (MyCircle1.inner_Staus[i]=2) then
      begin
        if MinForce > Seg1.Result1[i].F then
        begin
           MinForce:= Seg1.Result1[i].F;
        end;
      end;
    end;


    LabelNum.Caption:= IntToStr(MyCircle1.inner_numAll);
    LabelAnalyticalNum.Caption:=IntToStr(AnalyticalNum);
//    DesignForce:= StrToFloat(EditForce.Text);
    Label_MeanF.Caption:=FloatToStr(abs(trunc(MeanForce/AnalyticalNum*100)/100));
//    LabelRelativeError.Caption:=FloatToStr(abs(trunc((MeanForce/AnalyticalNum-DesignForce/MyCircle1.inner_numAll)/(DesignForce/MyCircle1.inner_numAll)*10000)/100));
//    LabelRelativeErrorMax.Caption:=FloatToStr(abs(trunc((MaxForce-DesignForce/MyCircle1.inner_numAll)/(DesignForce/MyCircle1.inner_numAll)*10000)/100));
//    LabelRelativeErrorMin.Caption:=FloatToStr(abs(trunc((MinForce-DesignForce/MyCircle1.inner_numAll)/(DesignForce/MyCircle1.inner_numAll)*10000)/100));




  end
  else
  begin
    showmessage('预应力分析未完成,无法继续！');
  end
end;

{ 1.开始界面 }{ ***************************************************************** }{ 1.开始界面 }
Function TForm1.OpenFile(FileName:String;number:Integer):Boolean;
var
  i: integer;
  Titem: TListItem;
begin
  FileName:=FileName + '\' + IntToStr(number)+'.seg';
  if (FileName <> '') and fileexists(FileName) then
  begin
    Seg1.ReadSeg(Filename);
     Num.Text := IntToStr(Seg1.TapeHead1.TapeNum);

    if Seg1.Control1.Analysis_Type=0 then
    begin
      PageControlAll.ActivePage := TabSheetSource; // 设置PageControl组件的当前页

      Seg1.Control1.FreedomEnd := trunc(PaintBoxB.Width / 3);
      Seg1.Control1.FixedEnd := trunc(PaintBoxB.Width * 2 / 3);
      for i := 0 to Seg1.TapeHead1.TapeNum - 1 do
      begin
        Seg1.Control1.baseHzBegin[i] := trunc(PaintBoxC.Width / 3);
        Seg1.Control1.baseHzEnd[i] := trunc(PaintBoxC.Width / 3) + 15;
        Seg1.Control1.baseHzBeginChoose[i] := false;
        Seg1.Control1.baseHzEndChoose[i] := false;
      end;
    end;

    self.PanelSet_OKClick(self);

    TheAnalysisNumber:=number-1;
    Result:=true;

    ListView2.Clear;
    ListView2.Columns.Clear;
    ListView2.Columns.Add; ListView2.Columns.Add;
    ListView2.Columns.Add; ListView2.Columns.Add;
    ListView2.Columns.Items[0].Caption := '编号';
    ListView2.Columns.Items[1].Caption := '预应力(KN)';
    ListView2.Columns.Items[2].Caption := '基频(平均值)KHz';
    ListView2.Columns.Items[3].Caption := '自由段长度 m';
    ListView2.Columns.Items[0].Width := 150;
    ListView2.Columns.Items[1].Width := 210;
    ListView2.Columns.Items[2].Width := 220;
    ListView2.Columns.Items[3].Width := 210;

    ListView2.Columns.Add;
    ListView2.Columns.Items[4].Width := ListView2.Width-150-210-220-120;

    ListView2.ViewStyle := vsreport;
    ListView2.GridLines := true;
    ListView2.Font.Height:=18;
    for i := 0 to MyCircle1.inner_numAll-1 do
    begin
       Titem := ListView2.Items.Add;
       Titem.Caption := IntToStr(i+1);
       Titem.SubItems.Add('23');
       Titem.SubItems.Add('0');
       Titem.SubItems.Add('0');
    end;


  end else
  begin
//    ShowMessage('文件缺失');
    Result:=false;
  end;
end;

procedure TForm1.AnalysisLength_ReviaryClickFalse(Sender: TObject);
begin
  if Seg1.Control1.AnalysisLength_Reviary then
  begin
    Seg1.Control1.AnalysisLength_Reviary := false;
//    PanelPaintSet.Show;

    PaintB();
  end;
end;

procedure TForm1.AnalysisLength_ReviaryClicktrue(Sender: TObject);
begin
  if Seg1.Control1.AnalysisLength_Reviary = false then
  begin
    Seg1.Control1.AnalysisLength_Reviary := true;
//    PanelPaintSet.Hide;

    PaintB();
  end;
end;

procedure TForm1.BitBtnNextClick(Sender: TObject);
var
  IniFile: TIniFile;
begin
  MyDataBase.PageIndex := MyDataBase.PageIndex + 1;
  ShowBeginTabSheet();
end;



procedure TForm1.BitBtnOKClick(Sender: TObject);
begin
  HZ_1.Text := HZ_1B.Text;
  HZ_2.Text := HZ_2B.Text;
  MHZ_Width.Text := MHZ_WidthB.Text;
  MHZ_threshold.Text := MHZ_thresholdB.Text;

// ES_threshold1.Text := ES_threshold.Text;


  WindowW.Text := WindowWB.Text;

  InitSegData();
  Seg1.BufFFtToBufFilter(Seg1.CanShu1.HZ_Filter1.HZ_1,
    Seg1.CanShu1.HZ_Filter1.HZ_2);
  calculate();
  // PaintABCD();
end;

{ 2.源数据分析 }{ *************************************************************** }{ 2.源数据分析 }


procedure TForm1.PaintBox1Paint(Sender: TObject);
begin
  MyCircle1.Draw_out_inner(PaintBox1, MyCircle1.inner_numAll, MyCircle1.inner_Staus);
end;

procedure TForm1.PaintBoxEPaint(Sender: TObject);
begin
  PaintE();
end;

procedure TForm1.PaintBoxAMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, y: integer);
begin
  if PageControlAll.ActivePage = TabSheetSource then
  begin
    Seg1.Control1.TapeNumber :=
      (y div (PaintBoxA.Height div Seg1.TapeHead1.TapeNum));
    Seg1.Control1.WindowBegin := 0;
    PageControlAll.ActivePage := TabSheetLength; // 设置PageControl组件的当前页

    if Seg1.Control1.Analysis_Type < 2 then
    begin
      Seg1.Control1.Analysis_Type := 2;
    end;
  end;

end;

procedure TForm1.PaintBoxAPaint(Sender: TObject);
begin
  PaintA();
end;

{ 3.长度分析 }{ *************************************************************** }{ 3.长度分析 }
procedure TForm1.PaintBoxBMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, y: integer);
begin
  oldX := x;
  Seg1.Control1.WindowsMove := true;

  if (x - 20 >= Seg1.Control1.FreedomEnd - 10) and
    (x - 20 <= Seg1.Control1.FreedomEnd + 10) then
    Seg1.Control1.FreedomEndChoose := true;
  if (x - 20 >= Seg1.Control1.FixedEnd - 10) and
    (x - 20 <= Seg1.Control1.FixedEnd + 10) then
    Seg1.Control1.FixedEndChoose := true;
end;

procedure TForm1.PaintBoxBMouseMove(Sender: TObject; Shift: TShiftState;
  x, y: integer);
begin
  {****************************************************************************}
  {界面提示}
  Mouse_Time.Caption:= FloatToStr(trunc(((x-20)/ (PaintBoxB.Width - 25) *
      Seg1.CanncelHead1[Seg1.Control1.TapeNumber].DataNum * 0.000002 *
      Seg1.CanShu1.wave1 / 2 + 0.05) * 10) / 10);
  Mouse_x.Caption:=FloatToStr(trunc(((x-20)/ (PaintBoxB.Width - 25) *
      Seg1.CanncelHead1[Seg1.Control1.TapeNumber].DataNum * 2 *
       + 0.05) * 10) / 10);
//  {****************************************************************************}


  if Seg1.Control1.WindowsMove and Seg1.Control1.SelectWindowsMove then
  begin
    Seg1.PaintWindow(PaintBoxB, Seg1.Control1.WindowBegin);
    Seg1.Control1.WindowBegin := Seg1.Control1.WindowBegin + x - oldX;
    if (Seg1.Control1.WindowBegin < 0) then
    begin
      Seg1.Control1.WindowBegin := 0;
    end;
    if (20 + Seg1.Control1.WindowBegin + Seg1.CanShu1.WindowW *
      (PaintBoxB.Width - 25) / Seg1.CanncelHead1[Seg1.Control1.TapeNumber]
      .DataNum) > PaintBoxB.Width - 10 then
    begin
      Seg1.Control1.WindowBegin := trunc(PaintBoxB.Width - Seg1.CanShu1.WindowW
        * (PaintBoxB.Width - 25) / Seg1.CanncelHead1[Seg1.Control1.TapeNumber]
        .DataNum - 10 - 20);
    end;

    Seg1.PaintWindow(PaintBoxB, Seg1.Control1.WindowBegin);
    PaintBoxB.Canvas.Pen.Mode := pmCopy;
    PaintBoxB.Canvas.Pen.Color := clBlack;

    Seg1.PaintOne(PaintBoxB, 20, integer(trunc(PaintBoxB.Height * 2 / 3)) + 15,
      PaintBoxB.Width - 25, integer(trunc(PaintBoxB.Height / 3)) - 25 - 5,
      Seg1.Control1.TapeNumber, 4);

    oldX := x;
  end;

  if Seg1.Control1.SelectWindowsMove = false then
  begin
    if (Seg1.Control1.FreedomEnd >= 20 + trunc(Seg1.Control1.FreedomBegin *
      PaintBoxB.Width / Seg1.CanncelHead1[Seg1.Control1.TapeNumber].DataNum +
      0.5) + 5) and (Seg1.Control1.FreedomEnd <= Seg1.Control1.FixedEnd - 30)
      and (Seg1.Control1.FreedomEndChoose = true) then
    begin
      PaintLine();

      Seg1.Control1.FreedomEnd := Seg1.Control1.FreedomEnd + x - oldX;

      if (Seg1.Control1.FreedomEnd < 20 + trunc(Seg1.Control1.FreedomBegin *
        PaintBoxB.Width / Seg1.CanncelHead1[Seg1.Control1.TapeNumber].DataNum +
        0.5) + 5) then
        Seg1.Control1.FreedomEnd := 20 +
          trunc(Seg1.Control1.FreedomBegin * PaintBoxB.Width / Seg1.CanncelHead1
          [Seg1.Control1.TapeNumber].DataNum + 0.5) + 5;
      if Seg1.Control1.FreedomEnd > Seg1.Control1.FixedEnd - 30 then
        Seg1.Control1.FreedomEnd := Seg1.Control1.FixedEnd - 30;

      PaintLine();

      PaintBoxB.Canvas.Pen.Style := psSolid;
      oldX := x;

      Seg1.PaintN(PaintBoxB, 0, 0, PaintBoxB.Width, PaintBoxB.Height, 20);
    end
    else if (Seg1.Control1.FixedEnd >= Seg1.Control1.FreedomEnd + 30) and
      (20 + Seg1.Control1.FixedEnd <= PaintBoxB.Width - 27) and
      (Seg1.Control1.FixedEndChoose = true) then
    begin
      PaintLine();

      Seg1.Control1.FixedEnd := Seg1.Control1.FixedEnd + x - oldX;
      if Seg1.Control1.FixedEnd < Seg1.Control1.FreedomEnd + 30 then
        Seg1.Control1.FixedEnd := Seg1.Control1.FreedomEnd + 30;
      if Seg1.Control1.FixedEnd > PaintBoxB.Width - 27 - 20 then
        Seg1.Control1.FixedEnd := PaintBoxB.Width - 27 - 20;

      PaintLine();

      PaintBoxB.Canvas.Pen.Style := psSolid;
      oldX := x;

      Seg1.PaintN(PaintBoxB, 0, 0, PaintBoxB.Width, PaintBoxB.Height, 20);
    end;
  end;
end;

procedure TForm1.PaintBoxBMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, y: integer);
begin
  if Seg1.Control1.FreedomEndChoose or Seg1.Control1.FixedEndChoose then
  begin
    Seg1.Control1.FreedomEndChoose := false;
    Seg1.Control1.FixedEndChoose := false;
    // paintB();
  end;

  Seg1.Control1.WindowsMove := false;

  PaintBoxB.Canvas.Pen.Mode := pmCopy;
  PaintBoxB.Canvas.Pen.Color := clBlack;
end;

procedure TForm1.PaintBoxBPaint(Sender: TObject);
begin
  PaintB();
end;

procedure TForm1.PaintBoxCMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, y: integer);
begin

  Seg1.Control1.baseHzNumber :=
   (y div (PaintBoxC.Height div Seg1.TapeHead1.TapeNum));
  oldX := x;

  if (x - 20 >= Seg1.Control1.baseHzBegin[Seg1.Control1.baseHzNumber] - 3) and
    (x - 20 <= Seg1.Control1.baseHzBegin[Seg1.Control1.baseHzNumber] + 3) then
    Seg1.Control1.baseHzBeginChoose[Seg1.Control1.baseHzNumber] := true;

  if (x - 20 >= Seg1.Control1.baseHzEnd[Seg1.Control1.baseHzNumber] - 3) and
    (x - 20 <= Seg1.Control1.baseHzEnd[Seg1.Control1.baseHzNumber] + 3) then
    Seg1.Control1.baseHzEndChoose[Seg1.Control1.baseHzNumber] := true;
end;

procedure TForm1.PaintBoxCMouseMove(Sender: TObject; Shift: TShiftState;
  x, y: integer);
var
  i,TheBegin,TheEnd:Integer;
begin
  TheBegin:=Seg1.Control1.baseHzBegin[Seg1.Control1.baseHzNumber];
  TheEnd:=Seg1.Control1.baseHzEnd[Seg1.Control1.baseHzNumber];

  if (TheBegin >= 20 ) and (TheBegin <= TheEnd - 7)
  and (Seg1.Control1.baseHzBeginChoose[Seg1.Control1.baseHzNumber])
  then
  begin
    PaintLine();
    TheBegin := TheBegin + x - oldX;
    Seg1.Control1.baseHzBegin[Seg1.Control1.baseHzNumber] := TheBegin ;

    if (TheBegin < 20 ) then TheBegin:= 20 ;
    if TheBegin > TheEnd - 7 then TheBegin := TheEnd - 7;
    Seg1.Control1.baseHzBegin[Seg1.Control1.baseHzNumber] := TheBegin ;
    PaintLine();

    PaintBoxC.Canvas.Pen.Style := psSolid;
    oldX := x;
  end;

  if (TheEnd >= TheBegin + 7) and (TheEnd <= PaintBoxC.Width - 27)
    and (Seg1.Control1.baseHzEndChoose[Seg1.Control1.baseHzNumber]) then
  begin
    PaintLine();

    TheEnd := TheEnd + x - oldX;
    Seg1.Control1.baseHzEnd[Seg1.Control1.baseHzNumber] := TheEnd ;

    if TheEnd < TheBegin + 7 then TheEnd := TheBegin + 7;
    if TheEnd > PaintBoxC.Width - 27 then TheEnd:= PaintBoxC.Width - 27 ;
    Seg1.Control1.baseHzEnd[Seg1.Control1.baseHzNumber] := TheEnd ;

    PaintLine();
    PaintBoxC.Canvas.Pen.Style := psSolid;
    oldX := x;
  end;

end;

procedure TForm1.PaintBoxCMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, y: integer);
var
  i, j, HzBegin, HzEnd, Max: integer;
  n, TheBaseHz: Double;
begin
  Seg1.Control1.baseHzBeginChoose[Seg1.Control1.baseHzNumber] := false;
  Seg1.Control1.baseHzEndChoose[Seg1.Control1.baseHzNumber] := false;

  PaintBoxC.Canvas.Pen.Mode := pmCopy;
  PaintBoxC.Canvas.Pen.Color := clBlack;
end;

procedure TForm1.PaintBoxCPaint(Sender: TObject);
begin
  PaintC();
end;

procedure TForm1.PaintBoxRoundMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, y: integer);
var
  i, inner_click_num: integer;
begin
  inner_click_num := MyCircle1.inner_mouseon_num(MyCircle1.out_px, MyCircle1.out_py, MyCircle1.out_r, x, y,MyCircle1.inner_numAll) - 1;
    // 返回鼠标所在位置 第一个圆返回 1
  if inner_click_num >= 0 then
  begin
      if Form1.OpenFile(MyDataBase.CurPath[6],inner_click_num+1 ) then
      begin

        for i := 0 to MyCircle1.inner_numAll - 1 do
        begin
          if MyCircle1.inner_Staus[i] = 2 then MyCircle1.inner_Staus[i] := 1;
        end;
        MyCircle1.inner_Staus[inner_click_num] := 2;

        MyCircle1.Draw_out_inner(PaintBoxRoundA, MyCircle1.inner_numAll, MyCircle1.inner_Staus);
        MyCircle1.Draw_out_inner(PaintBoxRoundB, MyCircle1.inner_numAll, MyCircle1.inner_Staus);
        MyCircle1.Draw_out_inner(PaintBoxRoundC, MyCircle1.inner_numAll, MyCircle1.inner_Staus);

      end;
  end;
end;

procedure TForm1.PaintBoxRoundMouseMove(Sender: TObject; Shift: TShiftState;
  x, y: integer);
var
  inner_click_num: integer;
begin
  MyCircle1.out_r := PaintBoxRoundA.Width div 2;
  inner_click_num := MyCircle1.inner_mouseon_num(MyCircle1.out_px, MyCircle1.out_py, MyCircle1.out_r, x, y,
    MyCircle1.inner_numAll) - 1; // 返回鼠标所在位置 第一个圆返回 1
end;

procedure TForm1.PaintBoxRoundPaint(Sender: TObject);
begin
  MyCircle1.Draw_out_inner(PaintBoxRoundA, MyCircle1.inner_numAll, MyCircle1.inner_Staus);
  MyCircle1.Draw_out_inner(PaintBoxRoundB, MyCircle1.inner_numAll, MyCircle1.inner_Staus);
  MyCircle1.Draw_out_inner(PaintBoxRoundC, MyCircle1.inner_numAll, MyCircle1.inner_Staus);
end;

{ 4.预应力分析 }{ ************************************************************** }{ 4.预应力分析 }

{ 5.结果展示 }{ **************************************************************** }{ 5.结果展示 }

{ @.calculate }{ ********************************************************************* }{ calculate }
procedure TForm1.calculate();
var
  i: integer;
begin
  PanelMessage.BringToFront;
  Form1.Enabled := false;
  PanelMessage.Show;
  LWPNumber := 0;

  for i := 1 to Seg1.TapeHead1.TapeNum do
  begin
    MyAnonymousThread(i - 1);
  end;
end;

procedure TForm1.MyAnonymousThread(i: integer);
begin
  TThread.CreateAnonymousThread(
    procedure
    begin
      Seg1.BufToBufES(Seg1.CanShu1.WindowW, i);
      LWPNumber := LWPNumber + 1;
    end).Start; // 开启匿名多线程!!!
end;


{***************************************************************************}
procedure TForm1.LoadSegDataBase(var PanelWellcome:TFlowPanel;path: String);
var
  number: integer;
  i: integer;
  sl: TStringList;
  PanelW,PanelH:Integer;
begin

  for i:= PanelWellcome.ComponentCount-1 DownTo 0 do
          PanelWellcome.Components[i].Free;

  sl := MyDataBase.SearchDir(path, 0);
  number := sl.Count;
  MyLabel:=nil;
  MyPanel:=nil;
  setLength(MyPanel,number);
  setLength(MyLabel,3);
  setLength(MyLabel[0],number);
  setLength(MyLabel[1],number);
  setLength(MyLabel[2],number);

  PanelW:=300;PanelH:=200;
  PanelW:=trunc(172*Screen.Width/800);
  PanelH:=trunc(80*Screen.Height/600);
  if PanelH<100 then PanelH:=100;


  for i := 0 to number-1 do
  begin
    MyPanel[i]:=TPanel.Create(PanelWellcome);
    MyPanel[i].Width:=PanelW;
    MyPanel[i].Height:=PanelH;
    MyPanel[i].BevelOuter:=bvNone;
    MyPanel[i].BevelKind:=bkFlat;
    MyPanel[i].ParentBackground := False;
    MyPanel[i].Align:=alTop;
    MyPanel[i].AlignWithMargins:=true;
    MyPanel[i].Margins.Left:=20;
    MyPanel[i].Margins.Top:=20;
    MyPanel[i].OnClick := PanelClick;       // 指定button click事件
    MyPanel[i].Parent:=PanelWellcome;

    {********************************************}
    if DirectoryExists(path + '\' + sl[i]) then
    begin
      MyLabel[0][i]:=TLabel.Create(PanelWellcome);
      MyLabel[0][i].Caption := sl[i];
      MyLabel[0][i].Font.Height:=25;
      MyLabel[0][i].Font.Name:='微软雅黑';
//      MyLabel[0][i].Font.Color:= $00656565;
//      MyLabel[0][i].Font.Style:=MyLabel[0][i].Font.Style + [fsBold];
      MyLabel[0][i].Align:=alTop;
      MyLabel[0][i].AlignWithMargins:=true;
      MyLabel[0][i].Margins.Left:=10;
      MyLabel[0][i].Parent:=MyPanel[i];
      MyLabel[0][i].OnClick := PanelClick;
      MyPanel[i].Caption:=MyLabel[0][i].Caption;
      MyPanel[i].ShowCaption:=false;

      MyLabel[1][i]:=TLabel.Create(PanelWellcome);
//      FileTimeToDosDateTime(sr.FindData.ftCreationTime, LongRec(dft).Hi,LongRec(dft).Lo);
//      MyLabel[1][i].Caption:= DateTimeToStr((FileDateToDateTime(dft)));
      MyLabel[1][i].Font.Height:=18;
      MyLabel[1][i].Font.Name:='微软雅黑';
      MyLabel[1][i].Font.Color:= $00656565;
      MyLabel[1][i].Top:=30;
      MyLabel[1][i].Left:=10;
      MyLabel[1][i].Parent:=MyPanel[i];

      MyLabel[2][i]:=TLabel.Create(PanelWellcome);
      MyLabel[2][i].Caption:=IntToStr(MyDataBase.SearchDir(MyDataBase.CurPath[MyDataBase.PageIndex] + '\' + sl[i],MyDataBase.PageIndex).Count);
      MyLabel[2][i].Font.Height:=25;
      MyLabel[2][i].Font.Name:='微软雅黑';
      MyLabel[2][i].Font.Color:= $00656565;
      MyLabel[2][i].Font.Style:=MyLabel[2][i].Font.Style + [fsBold];
      MyLabel[2][i].align:=alBottom;
      MyLabel[2][i].Alignment:=taRightJustify;
      MyLabel[2][i].AlignWithMargins:=true;
      MyLabel[2][i].Margins.Right:=5;
      MyLabel[2][i].Margins.left:=PanelW-20;
      MyLabel[2][i].Margins.Bottom:=5;
      MyLabel[2][i].Parent:=MyPanel[i];
    end;
  end;
end;

procedure TForm1.PanelClick(Sender: TObject);
var
  i:Integer;
begin
  MyDataBase.PageIndex:=MyDataBase.PageIndex+1;
  MyDataBase.CurPath[MyDataBase.PageIndex]:= Tpanel(Sender).Caption;
  MyDataBase.PageIndex:=MyDataBase.PageIndex+1;
  MyDataBase.CurPath[MyDataBase.PageIndex]:=MyDataBase.CurPath[MyDataBase.PageIndex-2]+'\'+MyDataBase.CurPath[MyDataBase.PageIndex-1];

  if  MyDataBase.PageIndex <=4 then
  begin
      if(MyDataBase.PageIndex = 2)   then begin LabelData1.Caption:=Tpanel(Sender).Caption; ImageData1.Show; end;
      if(MyDataBase.PageIndex = 4)   then begin LabelData2.Caption:=Tpanel(Sender).Caption; ImageData2.Show; end;;
       loadSegDataBase(PanelWellcome,MyDataBase.CurPath[MyDataBase.PageIndex]);
  end
  else if (MyDataBase.PageIndex = 6) then
  begin
       BeginAnalize;
  end else
    MyDataBase.PageIndex:=MyDataBase.PageIndex-2;
end;

procedure TForm1.BitBtnBackClick(Sender: TObject);
begin
  if MyDataBase.PageIndex>=2 then
  begin
    if(MyDataBase.PageIndex = 2)   then begin LabelData1.Caption:=''; ImageData1.Hide; end;
    if(MyDataBase.PageIndex = 4)   then begin LabelData2.Caption:=''; ImageData2.Hide; end;

    MyDataBase.PageIndex := MyDataBase.PageIndex - 2;
    LoadSegDataBase(PanelWellcome,MyDataBase.CurPath[MyDataBase.PageIndex]);
  end;
end;

procedure TForm1.BeginAnalize;
var
  i:Integer;
begin
     MyCircle1.inner_numAll := MyDataBase.SearchDir(MyDataBase.CurPath[MyDataBase.PageIndex],4).Count;
     if MyCircle1.inner_numAll <> 0 then
     begin
        MyCircle1.inner_Staus:=nil;
        setLength(MyCircle1.inner_Staus, MyCircle1.inner_numAll);
        for i := 0 to MyCircle1.inner_numAll - 1 do
        begin
          MyCircle1.inner_Staus[i] := 0;
        end;
        MyCircle1.inner_Staus[0] := 2;
        Seg1.Control1.Analysis_Type:=0;

        if Form1.OpenFile(MyDataBase.CurPath[MyDataBase.PageIndex],1)=true then
        begin
            ObjectName.Caption:=editFileName.Text;
            Object_Number.Caption:=EditFileName1.Text;
            Object_Hole_Number.Caption:=MyDataBase.CurPath[MyDataBase.PageIndex-1];
            LabelLength.Caption:=EditLength.Text;
            LabelForce.Caption:=EditForce.Text;
        end else begin
          ShowMessage('文件打开失败,请检测数据文件！');
        end;
     end else begin
        ShowMessage('数据文件为空,请检测数据文件！');
     end;
     MyDataBase.PageIndex:=MyDataBase.PageIndex-2;
end;

{******************************************************************************}


procedure TForm1.InitPanelTree(var TheMyTree:TMyTree);
var
  i:Integer;
begin
  if TheMyTree.slist.Count>0 then
  begin
    SetLength(TheMyTree.MyLabel ,TheMyTree.slist.Count);
    SetLength(TheMyTree.MyPanel ,TheMyTree.slist.Count);
    for i := 0 to TheMyTree.slist.Count-1 do
    begin
       TheMyTree.MyPanel[i]:=TPanel.Create(self);
       TheMyTree.MyPanel[i].Align:= alTop;
       TheMyTree.MyPanel[i].Height:=30;
       TheMyTree.MyPanel[i].Width:=MyPanelTree.Width-40;
       TheMyTree.MyPanel[i].AlignWithMargins:=true;
       TheMyTree.MyPanel[i].Margins.Left:=20;
       TheMyTree.MyPanel[i].Margins.Right:=20;
       TheMyTree.MyPanel[i].Margins.Top:=3;
       TheMyTree.MyPanel[i].Margins.Bottom:=3;
       TheMyTree.MyPanel[i].ParentBackground := False;
       TheMyTree.MyPanel[i].Color:=$00DCDCDC;
       TheMyTree.MyPanel[i].BevelOuter:=bvNone;
       TheMyTree.MyPanel[i].BevelKind:=bkFlat;
       TheMyTree.MyPanel[i].Hide;
       TheMyTree.MyPanel[i].parent:=MyPanelTree;
//       TheMyTree.MyPanel[i].OnClick := PanelTreeClick;       // 指定button click事件
//       TheMyTree.MyPanel[i].Tag:= TheMyTree.ChildTree[i].Tag;


       TheMyTree.MyLabel[i]:=Tlabel.Create(self);
       TheMyTree.MyLabel[i].Transparent:=false;
       TheMyTree.MyLabel[i].Color:=$00DCDCDC;
       TheMyTree.MyLabel[i].AlignWithMargins:=true;
       TheMyTree.MyLabel[i].Margins.Top:=3;
       TheMyTree.MyLabel[i].Margins.Bottom:=3;
       TheMyTree.MyLabel[i].Margins.Left:=10+TheMyTree.Depth*30;
       TheMyTree.MyLabel[i].Margins.Right:=20;
       TheMyTree.MyLabel[i].Align:= alTop;
       TheMyTree.MyLabel[i].Font.Height:=20;
       TheMyTree.MyLabel[i].parent:=TheMyTree.MyPanel[i];
       TheMyTree.MyLabel[i].Tag:= TheMyTree.ChildTree[i].Tag;
       TheMyTree.MyLabel[i].OnClick := PanelTreeClick;       // 指定button click事件

       TheMyTree.MyLabel[i].Caption:=TheMyTree.ChildTree[i].FileName;
       InitPanelTree(TheMyTree.ChildTree[i]);
    end;
  end;

end;



procedure TForm1.PanelTreeClick(Sender: TObject);
var
  Tmp,buf:Integer;
  Tree:^TmyTree;
begin
     Tmp:=TLabel(Sender).Tag;
     Tmp:=trunc(Tmp/100);
     buf:=Tmp mod 100;
     Tree:=@MyTree;
     while buf >0 do
     begin
        Tree:=@Tree.ChildTree[Buf-1];
        Tmp:=trunc(Tmp/100);
        buf:=Tmp mod 100;
     end;

     if Tree.show then
     begin
            ShoWHide(Tree^,false);
     end else
     begin
            ShoWHide(Tree^,true);
     end;
end;


procedure TForm1.ShowHide(var TheMyTree:TMyTree;Show:Boolean);
var
  i:Integer;
begin
  if TheMyTree.slist.Count>0 then
  begin
      if Show then
      begin
          TheMyTree.show:=true;
          for i := 0 to TheMyTree.slist.Count-1 do
          begin
               TheMyTree.MyPanel[i].Show;
          end;
      end else begin
          TheMyTree.show:=false;
          for i := 0 to TheMyTree.slist.Count-1 do
          begin
               TheMyTree.MyPanel[i].Hide;
               ShowHide(TheMyTree.ChildTree[i],false);
          end;
      end;

  end;
end;


procedure TForm1.LoadInfo(theType:Integer);
var
  i:Integer;
begin
/////
///  /
///
///
///
///
///
///
///






end;





{******************************************************************************}

initialization
  // 这儿的代码在delphi程序初始化时自动执行
  Seg1 := Seg.Create;
  MyDataBase:=DataBase.Create;
  MyCircle1:=MyCircle.Create;

end.

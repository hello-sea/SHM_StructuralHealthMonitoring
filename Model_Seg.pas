unit Model_Seg;

interface

uses
  FFT, Math,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls, VCLTee.Series,
  VCLTee.DBChart, Vcl.Menus, Vcl.ComCtrls,
  Direct2D, D2D1;
type
{ ��� }{ ******************************************************************** } { ��� }
  Result = record       //���
    FreeLong:double;        //���ɶ˳���
    FixedLong:double;       //ê�̶γ���
    L:double;               //����
    F:double;               //yԤӦ��
    BaseHz:Double;         //��Ƶ
    baseHzVal:Array of double;

  end;
{ �˲����� }{ **************************************************************** } { �˲����� }
  Filter =record         //�˲�����
    HZ_1:Double;
    HZ_2:Double;
//    HZ_3:Integer;
//    HZ_4:Integer;
  end;
{ ��ʽ���� } { *************************************************************** } { ��ʽ���� }
  Control = record      //��ʽ����----
    //Mouse_Move:Integer;        //����ƶ�����  Ϊ0���ɼ���
    Analysis_Type:Integer;     //��ǰ��������   1��ʱ��ͼ*6    2��ʱ��ͼ+Ƶ��ͼ   3��ʱ��ͼ+Ƶ��ͼ+�˲�ͼ
    Paint_Type:Integer;        //��ǰ��ͼ����   1��ʱ��ͼ      2��Ƶ��ͼ   3���˲�ͼ
    TapeNumber:Integer;        //��ǰ��������  Channel_Number
    AnalysisLength_Reviary:Boolean;


    WindowBegin:Integer;
    WindowsMove:Boolean;
    SelectWindowsMove:Boolean;

    WindowRightAutoMove:Boolean;
    WindowLeftAutoMove:Boolean;

    FreedomBegin:Integer;      //���ɶ���ʼλ��
    FreedomEnd:Integer;        //���ɶν���λ��

    FreedomEndChoose:Boolean;  //����ƶ�����--���ɶ�λ��
    FixedEnd:Integer;          //ê�̶˽���λ��
    FixedEndChoose:Boolean;    //����ƶ�����--ê�̶�

    baseHzBegin:Array of Integer;//��Ƶ��ʼ��ʼλ��
    baseHzEnd:Array of Integer;  //��Ƶ����λ��


    baseHzBeginChoose:Array of Boolean;
    baseHzEndChoose:Array of Boolean;
    baseHzNumber:Integer;

    calculateF:Boolean;
    terminated1:Boolean;
    XChange,YChange,XBegin,YBegin: Integer;
  end;

{ ���� } { ******************************************************************* } { ���� }
  CanShu = record
    MHz:double;
    MHZ_width:double;
    MHZ_threshold:double;
    ES_threshold:double;
    WindowW:Integer;

    HZ_Filter1:Filter;
    wave1:double;
    wave2:double;
  end;

{ �Ŵ�ͷ } { ***************************************************************** } { �Ŵ�ͷ }
  TapeHead =  record    //�Ŵ�ͷ--SEG�ļ���ͷ 3200*Byte
    TapeNum: Integer;                          //��������ܵ���   0000-0001
    DataBuf:Array[0..748] of Integer;          //������������±ָ꣨�룩4���ֽ� 0002-2997
    FileJudge:Integer;                         //��¼�ļ��Ƿ���Ч,0Ϊ��Ч 2999-3000
  end;

  Reel = record         //����ͷ 400*Byte
  end;

  CanncelHead = record  //���ͷ 240*Byte
    //���ͷ����----
    //CanncelNum:Integer;                      //������
    DataNum:Integer;                           //�ɼ���Ŀ      114-115        =5120
//    DC_main:Double;                            //ֱ��ͨ��
    Sample_interval:Double;                    //��¼ÿһ�β������ 116-117
    WaveSpeed:Integer;                         //���٣�����5�� 238-239
    //CJudge:Integer;                          //��¼��ǰ���� �Ƿ���Ч(0Ϊ��Ч) �� ��ȷ�ȼ���  Channel_Judge
    //��Seg�ļ������λ���±�----
    HeadBegin:Integer;                         //�����ݣ����ͷ����ʼָ���±�
    DataBegin:Integer;                         //�������ݿ�ʼָ���±�   240
  end;

{******************************************************************************}

{******************************************************************************}

  //Seg�ļ�--------------------------------------------
  Seg = class      //����SEG��
//    private
    var
      //----  �ļ�  ��� & ���� ----
      SegFile:file;                            //�ļ�����
      SegFileName:String;                      //�ļ����
      SegFile_Buf: array of Byte;              //�ļ���������
      //----���ݵ�  ��� & ���� ----
      Reel1:Reel;                                    //����ͷ   =400*Byte
      BUF:array of array of integer;           //����     =���ɼ�����*2*Byte
      BufMean:array of Integer;                //buf��ƽ��ֵ
      //buf_Buckup:array of array of complex;  //BUF����  =���ɼ�����*2*Byte
      BufFFt:array of array of complex;        //����Ҷ��������
      BufFFtWindow:array of complex;

      BufFilter:array  of array of complex;    //�˲���������  ��¼��ǰ��������

      BufES:array of array of Double;          //����ͼ energy spectrum

      BitMap:Array[0..4] of TbitMap;           //λͼ

    public
    { ����Ŀ¼ }
      { ********************************************************************** }
      { 0.���캯������ʼ������ }
      constructor create;
      procedure ReadSeg(FileName:string);
      { ********************************************************************** }
      { 1.���ݼ��㡪-���ĺ��� }
      procedure BufToBufFFt();                        //ԭʼ���� תΪ ����Ҷ��������
      procedure BufFFtToBufFilter(A,B:Double);        //�˲�
      procedure BufToBufES(WindowW,all_one:integer);  //��Ƶ��ֵ������
      { ********************************************************************** }
      { 2.��ͼ }
      procedure PaintOne(var PB:TPaintBox;X,Y,W,H,Number,Paint_Type:integer);
      procedure PaintN(var PB:TPaintBox;X,Y,W,H,PaintType:integer);

      procedure PaintChartAll(var PB:TPaintBox;X,Y,W,H,Number,Paint_Type:Integer);
      Procedure PaintWindow(var PB:TPaintBox;X:Integer);
    var
      Control1:Control;                        //��ʽ����
      CanShu1:CanShu;
      TapeHead1:TapeHead;                      //�Ŵ�ͷ   =3200*Byte
      CanncelHead1: Array of CanncelHead;      //���ͷ   =240*Byte
      Result1:Array [0..20]of Result;

  end;
var
  Seg1: SEG;

  { Begin: ��ҫ����*************************************}
  function ReturnColor(var data:double):integer;
  function ReturnWidth(var data:double):integer;
  { End : ��ҫ����**************************************}

implementation
{*******************************************************************************}
{ 0.���캯������ʼ������ }
constructor Seg.create;
var
  i,j:Integer;
begin
//  Control1.Mouse_Move:=1;                     //����ƶ�����  Ϊ0���ɼ���
  Control1.Analysis_Type:=0;                  //��ǰ��������ͼ������   1:ʱ��ͼ  2��Ƶ��ͼ 3���˲�ͼ
  Control1.AnalysisLength_Reviary:=false;
  Control1.Paint_Type:=0;                     //��ǰ��ͼ����   1��ʱ��ͼ      2��Ƶ��ͼ   3���˲�ͼ
  Control1.TapeNumber:=0;                    //��ǰ��������  Channel_Number
  Control1.XChange:=30;
  Control1.YChange:=0;
  Control1.XBegin:=0;
  Control1.YBegin:=0;
  Control1.FixedEndChoose:=False;
  Control1.FreedomEndChoose:=False;
  Control1.WindowBegin:=0;
  Control1.WindowsMove:=false;
  Control1.SelectWindowsMove:=false;
  Control1.WindowRightAutoMove:=false;
  Control1.WindowLeftAutoMove:=false;
  Control1.calculateF:=false;
  Control1.baseHzNumber:=-1;

  Control1.FreedomEnd:=200;
  Control1.FixedEnd:=500;

  CanShu1.ES_threshold:=0.6;

  for i := 0 to 20 do
  begin
    setlength(Result1[i].baseHzVal,5);
  end;

end;


procedure SEG.ReadSeg(FileName:string);
var
    i,j,k:Integer;
begin
    //ShowMessage(FileName);
    AssignFile(SegFile,FileName);

    Reset(SegFile,1);
    SetLength(SegFile_Buf,FileSize(SegFile));

    BlockRead(SegFile,SegFile_Buf[0],FileSize(SegFile)-1);
    closeFile(SegFile);

    TapeHead1.FileJudge:=SegFile_Buf[2999]+SegFile_Buf[3000]*256 ;
    if TapeHead1.FileJudge<>0 then
    begin
        SetLength(SegFile_Buf,0);
        ShowMessage('�ļ���Ч��������ѡ��');
    end;

    TapeHead1.TapeNum:= SegFile_Buf[0]+SegFile_Buf[1]*256 ;

    //���ݵ�����=TapeHead1.TapeNum
    SetLength(CanncelHead1,TapeHead1.TapeNum);  //CanncelHead1 [TapeHead1.TapeNum]
    SetLength(BUF,TapeHead1.TapeNum);           //BUF [TapeHead1.TapeNum] []
    SetLength(BufFFt,TapeHead1.TapeNum);        //BufFFt [TapeHead1.TapeNum] []
    SetLength(BufFilter,TapeHead1.TapeNum);     //BufFilter [TapeHead1.TapeNum] []
    setLength(BufMean,TapeHead1.TapeNum);
    SetLength(BufES,TapeHead1.TapeNum);

    setLength(Control1.baseHzBegin,TapeHead1.TapeNum);
    setLength(Control1.baseHzEnd,TapeHead1.TapeNum);
    setLength(Control1.baseHzBeginChoose,TapeHead1.TapeNum);
    setLength(Control1.baseHzEndChoose,TapeHead1.TapeNum);

    for i := 0 to TapeHead1.TapeNum-1 do
    begin
        Control1.baseHzBegin[i]:= 150;
        Control1.baseHzEnd[i]:= 170;
        Control1.baseHzBeginChoose[i]:=false;
        Control1.baseHzEndChoose[i]:=false;
    end;
    //----------------------------

    CanncelHead1[0].HeadBegin:=3600;                                                //��¼ÿ�����ͷ��ʼλ��
    CanncelHead1[0].DataNum:=(SegFile_Buf[3714]+SegFile_Buf[3715]*256);  //5120     //��¼ÿһ�β�����Ŀ 114-115����0��ʼ���㣩
    CanncelHead1[0].DataBegin:=3840;                                                //�����㿪ʼλ��
    CanncelHead1[0].Sample_interval:=((SegFile_Buf[3716]+SegFile_Buf[3717]*256)/5); //��¼ÿһ�β������ 116-117   ΢��
    CanncelHead1[0].WaveSpeed:=(SegFile_Buf[3838]+SegFile_Buf[3839]*256);           //��¼ÿһ�����ͷ��ʾ����238-239

    //ShowMessage(FloatToStr(CanncelHead1[0].Sample_interval));

    for j := 1 to (TapeHead1.TapeNum-1) do
      begin
         CanncelHead1[j].HeadBegin:=CanncelHead1[j-1].DataBegin+CanncelHead1[j-1].DataNum*2;
         CanncelHead1[j].DataBegin:= CanncelHead1[j].HeadBegin+240;
         CanncelHead1[j].DataNum:=SegFile_Buf[CanncelHead1[j].HeadBegin+114]+ SegFile_Buf[CanncelHead1[j].HeadBegin+115]*256 ;            //��¼ÿһ�β�����Ŀ 114-115����0��ʼ���㣩
         CanncelHead1[j].Sample_interval:=(SegFile_Buf[CanncelHead1[j].HeadBegin+116]+ SegFile_Buf[CanncelHead1[j].HeadBegin+117]*256)/5 ;     //��¼ÿ������� 116-117
         CanncelHead1[j].WaveSpeed:=SegFile_Buf[CanncelHead1[j].HeadBegin+238]+ SegFile_Buf[CanncelHead1[j].HeadBegin+239]*256 ;              //��¼ÿһ�����ͷ��ʾ����238-239
      end;
    //----------------------------

    for i := 0 to (TapeHead1.TapeNum-1) do
    begin
      SetLength(BUF[i],CanncelHead1[i].DataNum);
    end;

    for i := 0 to (TapeHead1.TapeNum-1) do
    begin
      Bufmean[i]:=0;
      k:=CanncelHead1[i].DataBegin;
      for j := 0 to CanncelHead1[0].DataNum-1 do
      begin
          Buf[i][j]:=SegFile_Buf[k]+SegFile_Buf[k+1]*256;
          if (SegFile_Buf[k+1]>=128)then
          begin
            Buf[i][j]:=Buf[i][j]-65536;
          end;
          k:=k+2;
          Bufmean[i]:=Bufmean[i]+ Buf[i][j];
      end;
      Bufmean[i]:=(Bufmean[i] div CanncelHead1[i].DataNum);
    end;

    BufToBufFFt();
end;

{*******************************************************************************}
{ 1.���ݼ��㡪-���ĺ��� }
procedure Seg.BufToBufFFt();
var
  i,j,n:integer;
begin
  for i := 0 to TapeHead1.TapeNum-1 do
  begin
    n:=1;
    while n<CanncelHead1[i].DataNum do  n:=n*2;
//    n:=n*2; //�����Ŵ�һ������߾���
    setLength(BufFFt[i],n);

    for j := 0 to CanncelHead1[i].DataNum-1 do
      begin
        BufFft[i][j].r:=BUF[i][j];
        BufFFt[i][j].i:=0;
      end;
    if  CanncelHead1[i].DataNum <= n-1 then
    begin
      for j := CanncelHead1[i].DataNum to n-1 do
      begin
        BufFft[i][j].r:=0;
        BufFFt[i][j].i:=0;
      end;
    end;

    fftc(BufFFt[i], n ,1);
  end;
end;

procedure Seg.BufFFtToBufFilter(A,B:double);
var
  i,j,n,left,right:integer;
  h:array of Integer;     //�������
begin

  for i := 0 to TapeHead1.TapeNum-1 do
  begin
    n:=1;
    while n<CanncelHead1[i].DataNum do  n:=n*2;
//    n:=n*2; //�����Ŵ�һ������߾���
//    n:=High(BufFFt[i]);

    SetLength(BufFilter[i],n);

    setLength(h,n);
    h[0]:=1;
    for j := 1 to trunc(n/2-1) do
    begin
      h[j]:=2;
    end;
    h[trunc(n/2)]:=1;
    for j := trunc(n/2+1) to n-1 do
    begin
      h[j]:=0;
    end;

    for j := 0 to n-1 do
    begin
      BufFilter[i][j].r:=BufFFt[i][j].r*h[j];
      BufFilter[i][j].i:=BufFFt[i][j].i*h[j];
    end;

    left:=trunc(A/500*n+0.5);
    right:=trunc(B/500*n+0.5);

    for j := 0 to left-1 do
    begin
        BufFilter[i][j].r:=0;
        BufFilter[i][j].i:=0;
    end;
    for j := right to n-1 do
    begin
        BufFilter[i][j].r:=0;
        BufFilter[i][j].i:=0;
    end;

    fftc(BufFilter[i], n ,-1);
   end;
   h:=nil;
end;

procedure Seg.BufToBufES(WindowW,all_one:integer);
var
  i,j,k,l,n,MHz:integer;
  max,max_all,area_all,area_window:double;
  h:array of complex;
  m:array of integer;
begin
    i:=all_one;
    SetLength(BufES[i],CanncelHead1[i].DataNum-WindowW);
    n:=1;
    while n< WindowW  do  n:=n*2;
//    n:=n*2*2;
    n:=n*2;
    for j := 0 to (CanncelHead1[i].DataNum-WindowW-1) do
    begin
      h:=nil;
      SetLength(h,n);
      for k := 0 to WindowW-1  do
      begin
        h[k].r:=BUFFilter[i][j+k].r;
//        h[k].r:=BUF[i][j+k]-BufMean[i];
        h[k].i:=0;
      end;
      for k := WindowW  to n-1 do
      begin
        h[k].r:=0;
        h[k].i:=0;
      end;
      FFtc(h,n,1);

      max:=0;
      area_all:=0;
      area_window:=0;

      for k := 0 to (n div 2) do
      begin
        area_all:=area_all+sqrt(sqr(h[k].r)+sqr(h[k].i));
        if max<sqrt(sqr(h[k].r)+sqr(h[k].i)) then
        begin
          max:=sqrt(sqr(h[k].r)+sqr(h[k].i));
          MHz:=k;
        end;
      end;

      k:=MHz;

      while  (sqrt(sqr(h[k].r)+sqr(h[k].i))>max*CanShu1.MHZ_threshold) and (k>=0) and (k>MHz-trunc(CanShu1.MHZ_width/2*n/500))  do
      begin
            area_window:=area_window+sqrt(sqr(h[k].r)+sqr(h[k].i));
            k:=k-1;
      end;
      k:=MHz+1;
      while  (sqrt(sqr(h[k].r)+sqr(h[k].i))>max*CanShu1.MHZ_threshold) and (k<=trunc(n-1)) and (k<MHz+trunc(CanShu1.MHZ_width/2*n/500)) do
      begin
            area_window:=area_window+sqrt(sqr(h[k].r)+sqr(h[k].i));
            k:=k+1;
      end;
      BufES[i][j]:=(area_window/area_all);
    end;
  h:=nil;
end;

{*******************************************************************************}
{ 2.��ͼ }
procedure Seg.PaintChartAll(var PB:TPaintBox;X,Y,W,H,Number,Paint_Type:Integer);
var
  i,wIncremental: integer;
begin
  if Paint_Type = 1 then//�̶�_�������� { ************************************ }
  begin
    PB.Canvas.Pen.Color:=clBlack;
    Pb.Canvas.Font.Size:=9;
    Pb.Canvas.Font.Color:=$002D2D2D;
    i:=0;
    while i<W-50 do
    begin
//      PB.Canvas.TextOut(X+i,Y+H+3,FloatToStr(Trunc((i/W*CanncelHead1[Number].DataNum*0.001+0.05)*10)/10));
      PB.Canvas.TextOut(X+i,Y+H+2,FloatToStr(Trunc((i/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave1/2+0.05)*10)/10));

      i:=i+100;
    end;
//    PB.Canvas.TextOut(X+W-80,Y+H+3,'��������(k)   ');
    PB.Canvas.TextOut(X+W-80,Y+H+3,'����(m)    ');
  end
  else if Paint_Type = 2 then//���� km { ************************************* }
  begin

    PB.Canvas.Pen.Style:=psSolid;
    PB.Canvas.Pen.Width:=1;
    PB.Canvas.Pen.Color:=clWhite;
    Pb.Canvas.Brush.Color:=clWhite;
    if Control1.FreedomEndChoose = true then
    begin
      PB.Canvas.Rectangle(Control1.FreedomEnd-200,Y+H+3,X+W-60,Y+H+15);
    end;
    if Control1.FixedEndChoose = true then
    begin
      PB.Canvas.Rectangle(Control1.FixedEnd-200,Y+H+3,X+W-60,Y+H+15);
    end;

    PB.Canvas.Pen.Color:=clBlack;
    Pb.Canvas.Font.Size:=9;
    Pb.Canvas.Font.Color:=$002D2D2D;

    wIncremental:=80;
//    wIncremental:=trunc(CanncelHead1[Number].DataNum/w*10);
    i:=0;
    while i<Control1.FreedomEnd-wIncremental do
    begin
      PB.Canvas.TextOut(X+i,Y+H+2,FloatToStr(Trunc((i/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave1/2+0.05)*10)/10));
      i:=i+wIncremental;
    end;

    i:=Control1.FreedomEnd+wIncremental;
    while i<Control1.FixedEnd-20 do
    begin
    PB.Canvas.TextOut(X+i,Y+H+2,
      FloatToStr(Trunc((Control1.FreedomEnd/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave1/2+0.05)*10)/10+Trunc(((i-Control1.FreedomEnd)/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave2/2+0.05)*10)/10));
      i:=i+wIncremental;
    end;

    Pb.Canvas.Font.Size:=9;
    PB.Canvas.Font.Color:=$0000FF;
    PB.Canvas.TextOut(X+Control1.FreedomEnd,Y+H+2,
        FloatToStr(Trunc((Control1.FreedomEnd/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave1/2+0.05)*10)/10));

    PB.Canvas.Font.Color:=$800000;
    PB.Canvas.TextOut(X+Control1.FixedEnd,Y+H+2,
        FloatToStr(Trunc((Control1.FreedomEnd/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave1/2+0.05)*10)/10+Trunc(((Control1.FixedEnd-Control1.FreedomEnd)/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave2/2+0.05)*10)/10));

    PB.Canvas.TextOut(X+W-60,Y+H+3,'����(m)    ');
  end;
end;



procedure Seg.PaintWindow(var PB: TPaintBox; X: Integer);
begin
  PB.Canvas.Pen.Mode:=pmNotXor;
  PB.Canvas.Pen.Color:=clBlack;
  PB.Canvas.MoveTo(X+22,17);
  PB.Canvas.LineTo(trunc(X+22+CanShu1.WindowW*(PB.Width-25)/CanncelHead1[Control1.TapeNumber].DataNum),17);
  PB.Canvas.LineTo(trunc(X+22+CanShu1.WindowW*(PB.Width-25)/CanncelHead1[Control1.TapeNumber].DataNum),trunc(17+PB.Height/3-32+0.5));
  PB.Canvas.LineTo(X+22,trunc(17+PB.Height/3-32+0.5));
  PB.Canvas.LineTo(X+22,17);
  PB.Canvas.Pen.Style:=psSolid;
end;

procedure Seg.PaintN(var PB:TPaintBox;X,Y,W,H,PaintType:integer);
var
  i,j:Integer;
begin
  PB.Canvas.Brush.Color:=clWhite;
  PB.Canvas.Pen.Mode:=pmCopy;
  PB.Color:=clWhite;
  PB.Canvas.Font.style:=[fsBold];   //����
  case PaintType of
    11:begin
        PB.Canvas.Pen.Style:=psSolid;
        for i := 0 to (TapeHead1.TapeNum-1) do
        begin
          if i = TapeHead1.TapeNum-1 then
          begin
            PaintOne(PB,20,integer(trunc(H/TapeHead1.TapeNum*i))+15,W-25,integer(trunc(H/TapeHead1.TapeNum))-30,i,1);//ԭʼ����
            PaintChartAll(PB,20,integer(trunc(H/TapeHead1.TapeNum*i))+15,W-25,integer(trunc(H/TapeHead1.TapeNum))-30,i,1);
          end
          else
          begin
            PaintOne(PB,20,integer(trunc(H/TapeHead1.TapeNum*i))+15,W-25,integer(trunc(H/TapeHead1.TapeNum))-25,i,1);//ԭʼ����
            PaintChartAll(PB,20,integer(trunc(H/TapeHead1.TapeNum*i))+15,W-25,integer(trunc(H/TapeHead1.TapeNum))-25,i,1);
          end;
        end;
    end;
    12:begin

    end;
    20:begin
        if Control1.AnalysisLength_Reviary then
        begin
          for i := 0 to (TapeHead1.TapeNum-1) do
          begin
            if i = TapeHead1.TapeNum-1 then
            begin
              PaintChartAll(PB,20,integer(trunc(H/TapeHead1.TapeNum*i))+15,W-25,integer(trunc(H/TapeHead1.TapeNum))-30,i,2);
            end
            else
            begin
              PaintChartAll(PB,20,integer(trunc(H/TapeHead1.TapeNum*i))+15,W-25,integer(trunc(H/TapeHead1.TapeNum))-25,i,2);
            end;
          end;

        end
        else
        begin
          PaintChartAll(PB,20,15,W-25,trunc(H/3)-25,Control1.TapeNumber,2);
          PaintChartAll(PB,20,integer(trunc(H/3))+15,W-25,integer(trunc(H/3))-25,Control1.TapeNumber,2);
        end;
    end;
    21:begin
        PB.Canvas.Pen.Mode:=pmCopy;
        PB.Canvas.Pen.Color:=clWhite;
        PB.Canvas.Pen.Style:=psSolid;       //ʵ��
        PB.Canvas.Pen.Width:=2;
        Pb.Canvas.Brush.Color:=clWhite;
        PB.Canvas.Rectangle(X,Y,X+W,Y+H);

        PaintOne(PB,20,15,W-25,trunc(H/3)-25,Control1.TapeNumber,1);
        PaintChartAll(PB,20,15,W-25,trunc(H/3)-25,Control1.TapeNumber,2);

        PaintOne(PB,20,integer(trunc(H/3))+15,W-25,integer(trunc(H/3))-25,Control1.TapeNumber,6);
        PaintChartAll(PB,20,integer(trunc(H/3))+15,W-25,integer(trunc(H/3))-25,Control1.TapeNumber,2);

//        PaintOne(PB,20,integer(trunc(H*2/3))+15,W-25,integer(trunc(H/3))-25-5,Control1.TapeNumber,8);
        PaintOne(PB,20,integer(trunc(H*2/3))+15,W-25,integer(trunc(H/3))-25-5,Control1.TapeNumber,4);
    end;
    22:begin
        PB.Canvas.Pen.Mode:=pmCopy;
        PB.Canvas.Pen.Color:=clWhite;
        PB.Canvas.Pen.Style:=psSolid;       //ʵ��
        PB.Canvas.Pen.Width:=2;
        Pb.Canvas.Brush.Color:=clWhite;
        PB.Canvas.Rectangle(X,Y,X+W,Y+H);

        PB.Canvas.Pen.Style:=psSolid;
        for i := 0 to (TapeHead1.TapeNum-1) do
        begin
          if i = TapeHead1.TapeNum-1 then
          begin
            PaintOne(PB,20,integer(trunc(H/TapeHead1.TapeNum*i))+15,W-25,integer(trunc(H/TapeHead1.TapeNum))-30,i,6);
            PaintChartAll(PB,20,integer(trunc(H/TapeHead1.TapeNum*i))+15,W-25,integer(trunc(H/TapeHead1.TapeNum))-30,i,2);
          end
          else
          begin
            PaintOne(PB,20,integer(trunc(H/TapeHead1.TapeNum*i))+15,W-25,integer(trunc(H/TapeHead1.TapeNum))-25,i,6);
            PaintChartAll(PB,20,integer(trunc(H/TapeHead1.TapeNum*i))+15,W-25,integer(trunc(H/TapeHead1.TapeNum))-25,i,2);
          end;
        end;
    end;
    31:begin
        for i := 0 to (TapeHead1.TapeNum-1) do
        begin
          PaintOne(PB,20,integer(trunc(H/TapeHead1.TapeNum*i))+15,W-25,integer(trunc(H/TapeHead1.TapeNum))-25,i,5);//Ƶ������_���ɶ�
        end;
    end;
    32:begin

    end;
    41:begin

    end;
    51:begin
        PB.Canvas.Pen.Mode:=pmCopy;
        PB.Canvas.Pen.Color:=clWhite;
        PB.Canvas.Pen.Style:=psSolid;       //ʵ��
        PB.Canvas.Pen.Width:=2;
        Pb.Canvas.Brush.Color:=clWhite;
        PB.Canvas.Rectangle(X,Y,X+W,Y+H);

        PaintOne(PB,20,15,W-25,trunc(H/3)-25,Control1.TapeNumber,1);
        PaintChartAll(PB,20,15,W-25,trunc(H/3)-25,Control1.TapeNumber,2);

        PaintOne(PB,20,integer(trunc(H/3))+15,W-25,integer(trunc(H/3))-25,Control1.TapeNumber,6);
        PaintChartAll(PB,20,integer(trunc(H/3))+15,W-25,integer(trunc(H/3))-25,Control1.TapeNumber,2);

        PaintOne(PB,20,integer(trunc(H*2/3))+15,W-25,integer(trunc(H/3))-25-5,Control1.TapeNumber,8);
//        PaintOne(PB,20,integer(trunc(H*2/3))+15,W-25,integer(trunc(H/3))-25-5,Control1.TapeNumber,4);
    end;

  end;
end;

procedure Seg.PaintOne(var PB:TPaintBox;X,Y,W,H,Number,Paint_Type:integer);
{ ����˵��:
  *  PB:TPaintBox ��ͼ����
  *  x :��������ʼλ��,������
  *  y :��������ʼλ��,������
  *  w :����������
  *  H :��������߶�
  *  Paint_Type ����ͼ����,ȡֵΪ 1~8
  *    ��ͼ��������:
          1:ʱ��ͼ_ԭʼͼ
          2:ʱ��ͼ_�˲�ͼ
          3:Ƶ��ͼ_ȫ������
          4:Ƶ��ͼ_ʱ������
          5:Ƶ��ͼ_���ɶ�����
          6:��Ƶ��ֵ������
          7:��λͼ
          8:����ͼ
}
var
  //oo:double;
  //xx:Integer;
  i,j,n:Integer;
  //l1,l2,
  max:double;
  BufFFtFreedomWindow:array of complex;
  cvs: TDirect2DCanvas;

  { Begin ��ҫ����********************************************** }
  data:array of double;
  temp:double;
  start,ending,middle:integer;
  { End   ��ҫ����********************************************** }

begin
  cvs := TDirect2DCanvas.Create(PB.Canvas,PB.ClientRect);  //D2D1_ANTIALIAS_MODE_ALIASED     D2D1_ANTIALIAS_MODE_PER_PRIMITIVE
  cvs.RenderTarget.SetAntialiasMode(D2D1_ANTIALIAS_MODE_PER_PRIMITIVE ); //�����
  cvs.BeginDraw;
	//��ͼ����

  case Paint_Type of
    1:begin//ʱ��ͼ_ԭʼͼ---------------------------------------------------------------
//        cvs.Pen..Mode:=pmCopy;

        cvs.Pen.Color:=$002D2D2D;
        cvs.Pen.Style:=psSolid;       //ʵ��
        cvs.Pen.Width:=1;
        cvs.Brush.Color:=clWhite;
        cvs.Rectangle(X,Y,X+W,Y+H);

        cvs.Pen.Width:=1;
        cvs.Pen.Style:=psDot;
        for i := 1 to 3 do
        begin
          cvs.MoveTo(X,trunc(Y+H*i/4));
          cvs.LineTo(X+W-5,trunc(Y+H*i/4));
        end;
        cvs.Pen.Style:=psSolid;
        cvs.MoveTo(X,Y+Trunc(H/2));
        cvs.LineTo(X+W,Y+Trunc(H/2));

        { ********************************************************************* }
        max:=0;
        for i := 0 to (CanncelHead1[Number].DataNum-1) do
        begin
          if max<abs(BUF[Number][i]) then max:=abs(BUF[Number][i]);
        end;

        cvs.MoveTo(X,integer(Trunc(Y+H/2)));
        for i := 0 to (CanncelHead1[Number].DataNum-1) do
        begin
          cvs.Lineto(Trunc(w/CanncelHead1[Number].DataNum*i*(Control1.XChange/30)+X-Control1.XBegin*Control1.XChange/30+0.5),integer(Trunc(H/2-H/3/max*BUF[Number][i]))+Y);
        end;
        { ********************************************************************* }

    end;
    2:begin//ʱ��ͼ_�˲�ͼ
        cvs.Pen.Color:=$002D2D2D;
        cvs.Pen.Style:=psSolid;       //ʵ��
        cvs.Pen.Width:=1;
        cvs.Rectangle(X,Y,X+W,Y+H);

        cvs.Pen.Color:=$002D2D2D;
        cvs.Pen.Style:=psDot;
        for i := 1 to 3 do
        begin
          cvs.MoveTo(X,trunc(Y+H*i/4));
          cvs.LineTo(X+W-5,trunc(Y+H*i/4));
        end;
        cvs.Pen.Style:=psSolid;
        cvs.Pen.Width:=1;

        cvs.MoveTo(X,Y+Trunc(H/2));
        cvs.LineTo(X+W,Y+Trunc(H/2));
        cvs.MoveTo(X,integer(Trunc(Y+H/2)));

        max:=0;
        for i := 0 to (CanncelHead1[Number].DataNum-1) do
        begin
          if max<abs(BUF[Number][i]) then max:=abs(BUF[Number][i]);
        end;

        for i := 0 to (CanncelHead1[Number].DataNum-1) do
        begin
          cvs.Lineto(Trunc(w/CanncelHead1[Number].DataNum*i*(Control1.XChange/30)+X-Control1.XBegin*Control1.XChange/30+0.5),integer(Trunc(H/2-H/3/max*BUF[Number][i]))+Y);
        end;

        cvs.Font.Size:=6;
        cvs.Font.Color:=$002D2D2D;
        i:=0;
        while i<Control1.FreedomEnd-15 do
        begin
          cvs.TextOut(X+i,Y+H+2,FloatToStr(Trunc((i/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave1/2+0.05)*10)/10));
          i:=i+30;
        end;
        i:=Control1.FreedomEnd;
        while i<Control1.FixedEnd-15 do
        begin
          cvs.TextOut(X+i,Y+H+2,
              FloatToStr(Trunc((Control1.FreedomEnd/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave1/2+0.05)*10)/10+Trunc(((i-Control1.FreedomEnd)/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave2/2+0.05)*10)/10));
          i:=i+30;
        end;
        cvs.Font.Size:=8;
        cvs.Font.Color:=$0000FF;
        cvs.TextOut(X+Control1.FreedomEnd,Y+H+2,
              FloatToStr(Trunc((Control1.FreedomEnd/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave1/2+0.05)*10)/10));

        cvs.Font.Color:=$800000;
        cvs.TextOut(X+Control1.FixedEnd,Y+H+2,
              FloatToStr(Trunc((Control1.FreedomEnd/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave1/2+0.05)*10)/10+Trunc(((Control1.FixedEnd-Control1.FreedomEnd)/W*CanncelHead1[Number].DataNum*0.000002*CanShu1.wave2/2+0.05)*10)/10));
    end;
    3:begin//Ƶ��ͼ_ȫ������
//        PaintChart(PB,X,Y,W,H,Number);

        cvs.Font.Size:=6;
        cvs.Font.Color:=clRed;
        for i := 0 to 50 do
        begin
          cvs.TextOut(X+i*40,Y+H-12,IntToStr(Trunc(i*40*5000/2/(w*10)+0.5)));
        end;

        cvs.Pen.Style:=psSolid;
        cvs.MoveTo(X,Y+H-Trunc(H/12+0.5));
        cvs.LineTo(X+W,Y+H-Trunc(H/12+0.5));

        max:=0;
        for i := 0 to High(BufFFt[Number]) do
        begin
          if max<sqrt(sqr(BufFFt[Number][i].r)+sqr(BufFFT[Number][i].i)) then
          begin
            max:=sqrt(sqr(BufFFt[Number][i].r)+sqr(BufFFT[Number][i].i));
          end;
        end;

        cvs.MoveTo(X,integer(Trunc(H-H/12+0.5))+y);
        for i := 0 to Integer(Trunc( High(BufFFt[Number])/2) ) do
        begin
          cvs.Lineto(Trunc(10*w/(High(BufFFt[Number])/2)*i+0.5)+X,
              integer(Trunc(H-(10*H/12)/max*(  sqrt(sqr(BufFFt[Number][i].r)+sqr(BufFFT[Number][i].i)))-H/12))+Y);
        end;
    end;
    4:begin//Ƶ��ͼ_ʱ������
//        cvs.Pen.Mode:=pmCopy;
        cvs.Pen.Color:=$002D2D2D;
        cvs.Pen.Style:=psSolid;       //ʵ��
        cvs.Pen.Width:=1;
        cvs.Brush.Color:=clWhite;
        cvs.Rectangle(X,Y,X+W,Y+H);

        cvs.Pen.Width:=1;
        cvs.Pen.Style:=psDot;

        cvs.Font.Size:=8;
        cvs.Font.Color:=clBlack;
        for i := 1 to 4 do
        begin
          cvs.TextOut(1,trunc(Y+H*i/5-7),FloatToStr(1-i/5));
          cvs.MoveTo(X,trunc(Y+H*i/5));
          cvs.LineTo(X+W-5,trunc(Y+H*i/5));
        end;
        cvs.TextOut(4,Y-7,'1');
        cvs.TextOut(4,Y+H-7,'0');

        cvs.Pen.Style:=psSolid;
        { ********************************************************************* }
          n:=1;
          while n<CanShu1.WindowW do  n:=n*2;
          n:=n*2*2*2; //�����Ŵ�һ������߾���
          setLength(BufFFtWindow,n);
          for j := 0 to CanShu1.WindowW-1 do
          begin
            BufFFtWindow[j].r:=BUFFilter[Control1.TapeNumber][j+trunc((Control1.WindowBegin)*CanncelHead1[Control1.TapeNumber].DataNum/W)].r;
            BufFFtWindow[j].i:=0;
          end;
          for j := CanShu1.WindowW to n-1 do
          begin
            BufFFtWindow[j].r:=0;
            BufFFtWindow[j].i:=0;
          end;
          fftc(BufFFtWindow, n ,1);
        //--------------------------------------------------
        max:=0;
        for i := 0 to n-1 do
        begin
          if max<(sqr(BufFFtWindow[i].r)+sqr(BufFFtWindow[i].i)) then
          begin
            max:=(sqr(BufFFtWindow[i].r)+sqr(BufFFtWindow[i].i));
          end;
        end;

        i:=0;
        cvs.MoveTo(X,Trunc(H-H/max*(sqr(BufFFtWindow[i].r)+sqr(BufFFtWindow[i].i))+Y+Control1.YBegin));
        for i := 0 to n-1 do
        begin
          cvs.Lineto(Trunc(10*w/n*i*(Control1.XChange/30)+X-Control1.XBegin*Control1.XChange/30+0.5),
                           Trunc(H-H/max*(sqr(BufFFtWindow[i].r)+sqr(BufFFtWindow[i].i))+Y+Control1.YBegin));
        end;


        BufFFtWindow:=nil;

        cvs.Font.Size:=6;
        cvs.Font.Color:=$002D2D2D;
        i:=0;
        while i< n-1 do
        begin
          cvs.TextOut(Trunc(10*w/n*i*(Control1.XChange/30)+X-Control1.XBegin*Control1.XChange/30+0.5),Y+H,
                            FloatToStr(trunc((i*500/n)*100)/100));
                            //������Ϊ0.002΢��-->500KHz
          i:=i+8;
        end;

        BufFFtWindow:=nil;
    end;
    5:begin//Ƶ��ͼ_���ɶ�����
//        cvs.Pen.Mode:=pmCopy;
        cvs.Pen.Color:=$002D2D2D;
        cvs.Pen.Style:=psSolid;       //ʵ��
        cvs.Pen.Width:=1;
        cvs.Brush.Color:=clWhite;
        cvs.Rectangle(X,Y,X+W,Y+H);

        cvs.Pen.Width:=1;


        cvs.Pen.Color:=$002D2D2D;
        cvs.Pen.Style:=psDot;
        cvs.Font.Size:=8;
        cvs.Font.Color:=clBlack;
        for i := 1 to 4 do
        begin
          cvs.TextOut(1,trunc(Y+H*i/5-7),FloatToStr(1-i/5));
          cvs.MoveTo(X,trunc(Y+H*i/5));
          cvs.LineTo(X+W-5,trunc(Y+H*i/5));
        end;

        cvs.Pen.Style:=psSolid;
        cvs.Pen.Width:=1;

        //--------------------------------------------------
          n:=1;
          while (n < Control1.FreedomEnd/w*CanncelHead1[Number].DataNum) do n:=n*2;
          n:=n*2*2; //�����Ŵ�һ������߾���
          setLength(BufFFtFreedomWindow,n);

          for j := 0 to trunc(Control1.FreedomEnd/w*CanncelHead1[Number].DataNum-1) do
          begin
            BufFFtFreedomWindow[j].r:=BufFilter[Number][j].r;
            BufFFtFreedomWindow[j].i:=BufFilter[Number][j].i;
          end;
          for j := trunc(Control1.FreedomEnd/w*CanncelHead1[Number].DataNum) to n-1 do
          begin
            BufFFtFreedomWindow[j].r:=0;
            BufFFtFreedomWindow[j].i:=0;
          end;

          fftc(BufFFtFreedomWindow, n ,1);
        //-------------------------------------------------
        max:=0;
        for i := 0 to n-1 do
        begin
          if max<sqrt(sqr(BufFFtFreedomWindow[i].r)+sqr(BufFFtFreedomWindow[i].i)) then
          begin
            max:=sqrt(sqr(BufFFtFreedomWindow[i].r)+sqr(BufFFtFreedomWindow[i].i));
          end;
        end;

        cvs.MoveTo(X,Trunc(H-H/max*sqrt(sqr(BufFFtFreedomWindow[0].r)+sqr(BufFFtFreedomWindow[0].i))+Y+Control1.YBegin));

        for i := 0 to n-1 do
        begin
          cvs.Lineto(Trunc( w*30 /n*i*(Control1.XChange/30)+X-Control1.XBegin*Control1.XChange/30+0.5),
                           Trunc(H-H/max*sqrt(sqr(BufFFtFreedomWindow[i].r)+sqr(BufFFtFreedomWindow[i].i))+Y+Control1.YBegin));
        end;

        BufFFtFreedomWindow:=nil;

        cvs.Font.Size:=7;
        cvs.Font.Color:=$002D2D2D;
        i:=0;
        while i< n-1 do
        begin
          cvs.TextOut(Trunc(w*30/n*i*(Control1.XChange/30)+X-Control1.XBegin*Control1.XChange/30+0.5),Y+H,FloatToStr(trunc((i*500/n)*100)/100));
          i:=i+trunc(n/w*2.5);
        end;
    end;
    6:begin//��Ƶ��ֵ������

//      cvs.Pen.Mode:=pmCopy;
        cvs.Pen.Color:=$002D2D2D;
        cvs.Pen.Style:=psSolid;       //ʵ��
        cvs.Pen.Width:=1;
        cvs.Brush.Color:=clWhite;
        cvs.Rectangle(X,Y,X+W,Y+H);


        cvs.Pen.Width:=1;
        cvs.Pen.Style:=psDot;

        { ********************************************************************* }
        cvs.Pen.Color:=$002D2D2D;
        cvs.Pen.Style:=psDot;
        cvs.Font.Size:=8;
        cvs.Font.Color:=clBlack;
        for i := 1 to 4 do
        begin
          cvs.TextOut(1,trunc(Y+H*i/5-7),FloatToStr(1-i/5));
          cvs.MoveTo(X,trunc(Y+H*i/5));
          cvs.LineTo(X+W-5,trunc(Y+H*i/5));
        end;

//      cvs.Pen.Width:=1;
        cvs.Pen.Width:=1;
        cvs.Pen.Style:=psSolid;

        cvs.MoveTo(X+trunc(CanShu1.WindowW*PB.Width/CanncelHead1[Number].DataNum/2+0.5),trunc(H-H*BufES[Number][0]+Y));
        for i := 0 to (CanncelHead1[Number].DataNum-CanShu1.WindowW-1) do
        begin
          cvs.LineTo(trunc(W/(CanncelHead1[Number].DataNum)*i+X-Control1.XBegin+CanShu1.WindowW*PB.Width/CanncelHead1[Number].DataNum/2+0.5),
               trunc(H-H*BufES[Number][i]+Y));
        end;

//        CanShu1.ES_threshold:=0.7;

        //��ֵ����
        cvs.Pen.Color:=clPurple;
        cvs.MoveTo(X+0,trunc(H-H*CanShu1.ES_threshold+Y));
        cvs.LineTo(X+W,trunc(H-H*CanShu1.ES_threshold+Y));


    end;
    7:begin//��λͼ
        cvs.Font.Size:=6;
        cvs.Font.Color:=clBlack;
        for i := 0 to 50 do
        begin
          cvs.TextOut(X+i*40,Y+H+1,
              FloatToStr(Trunc(i*Control1.XChange*40/(w-10)*CanncelHead1[Number].DataNum*CanncelHead1[Number].Sample_interval/1000*1000)/0100));
        end;

        cvs.Pen.Style:=psSolid;
        cvs.MoveTo(X,Y+Trunc(H/2));
        cvs.LineTo(X+W,Y+Trunc(H/2));

        max:=0;

        for i := 0 to High(BufFilter[Number]) do
        begin
          if max<abs(arctan(BufFilter[Number][i].i/BufFilter[Number][i].r)) then
          begin
            max:=abs(arctan(BufFilter[Number][i].i/BufFilter[Number][i].r));
          end;
        end;

        cvs.MoveTo(X,integer(Trunc(Y+H/2)));
        for i := 0 to trunc(High(BufFilter[Number])/2)-1 do
        begin
            cvs.Lineto(Trunc(w/CanncelHead1[Number].DataNum*i*(Control1.XChange/30)+X-Control1.XBegin*Control1.XChange/30) ,
                  Trunc(H/2-H/6*max*arctan(BufFilter[Number][i].r/BufFilter[Number][i].i)+Y+Control1.YBegin));
        end;
    end;

    8:begin//����ͼ

      //���Ʊ��:
        cvs.Pen.Color:=$002D2D2D;

        cvs.Pen.Style:=psSolid;       //ʵ��
        cvs.Pen.Width:=1;
        cvs.Brush.Color:=clWhite;
//        cvs.Brush.Color:=clBlack;
        cvs.Rectangle(X,Y,X+W,Y+H);

        cvs.Pen.Width:=1;
//        cvs.Pen.Style:=psDot;
//        cvs.Brush.Color:=clSilver; clWebWhiteSmoke
        cvs.Brush.Color:=clWebWhiteSmoke;
        cvs.Rectangle(X,Y+trunc(0*h),X+W,Y+trunc(H*1));

        //��ҫ�����
        cvs.Pen.Style:=psSolid;       //ʵ��
        cvs.Pen.Width:=2;
        cvs.Brush.Color:=$002C2C2C;
        cvs.Rectangle(X,Y+trunc(0.30*h),X+W,Y+trunc(H*0.70));

        { ********************************************************************* }
        { ����˵��:
          *   BufES[Number][i]      :��Ƶ��ֵ������   NumberΪ�ڼ��β�������
          *   CanShu1.ES_threshold  :��Ƶ��ֵ������_��ֵ
          //        CanShu1.ES_threshold:=0.6;
        }

        setLength(data,length(BufES[0]));
        //��������ݽ��й�һ
        for I := 0 to TapeHead1.TapeNum-1 do
        begin
          for J := 0 to length(BufES[I]) do
          begin
            if BufES[I][J]>CanShu1.ES_threshold then
              data[J]:=data[J]+1;
          end;
        end;

          //���������ƽ��
          for I := 0 to length(BufES[0])-1 do
          begin
            data[i]:=data[i]/TapeHead1.TapeNum;
          end;

        //ÿ������������ƽ��ֵ
        for I := 0 to length(BufES[0])-5 do
        begin
          temp:=0;
          if I mod 5=0 then
          begin
            for J := 0 to 4 do
              temp:=temp+data[i+J];
            for J := 0 to 4 do
              data[i+J]:=temp/5;
          end;
        end;

        for I := 0 to length(data)-1 do
        begin
//            cvs.LineTo(trunc( W/(CanncelHead1[Number].DataNum)*i+  X   -    Control1.XBegin   +      CanShu1.WindowW*PB.Width/CanncelHead1[Number].DataNum/2+0.5),
          //����˵��:                                    // x��ͼ��ʼ   //Control1.XBeginʵ��ͼ�����ơ�����    //���һ�αؼӣ����ڡ���Ƶ��ֵ�����ߡ�λ�ö���
//                 trunc(H-H*BufES[Number][i]+Y));
            if (data[I] <> 0) then
            begin
                cvs.Pen.Color:=ReturnColor(data[i]);
                cvs.Brush.Color:=ReturnColor(data[i]);

//                cvs.Pen.Color:=$002C2C2C;
                //��ֱ��
                cvs.Ellipse(
                trunc(W/(CanncelHead1[Number].DataNum)*i+  X   -    Control1.XBegin   +      CanShu1.WindowW*PB.Width/CanncelHead1[Number].DataNum/2+0.5),
                trunc(H/2+Y-H*(data[i]/2)),
                trunc(W/(CanncelHead1[Number].DataNum)*i+  X   -    Control1.XBegin   +      CanShu1.WindowW*PB.Width/CanncelHead1[Number].DataNum/2+0.5+3),
                trunc(H/2+Y+H*(data[i]/2))
              );
            end;
//
        end;

//        for I := 0 to length(data)-1 do
//        begin
//        if (data[I] <> 0) and (start = 0) then
//        begin
//          start:=I;
//        end;
//        if (start <> 0) and (data[I] = 0) and (ending = 0) then
//        begin
//          ending:=I-1;
//        end;
//        if (start <> 0) and (ending <> 0) then
//        begin
//          middle:=trunc((start+ending)/2+0.5);
//          for J := ReturnWidth(data[middle]) downto 2 do
//          begin
//            cvs.Pen.Color:=ReturnColor(data[middle+J*3]);
//            cvs.Brush.Color:=ReturnColor(data[middle+J*3]);
//            cvs.Ellipse(
//              trunc(W/(CanncelHead1[Number].DataNum)*start+  X   -    Control1.XBegin   +      CanShu1.WindowW*PB.Width/CanncelHead1[Number].DataNum/2+0.5),
//              trunc(H/2+Y-H*(data[middle]/3)),
//              trunc(W/(CanncelHead1[Number].DataNum)*start+  X   -    Control1.XBegin   +      CanShu1.WindowW*PB.Width/CanncelHead1[Number].DataNum/2+0.5+J*3),
//              trunc(H/2+Y+H*(data[middle]/3))
//            );
//          end;
//          cvs.Pen.Color:=ReturnColor(data[middle]);
//          cvs.Brush.Color:=ReturnColor(data[middle]);
//          cvs.Ellipse(
//            trunc(W/(CanncelHead1[Number].DataNum)*start+  X   -    Control1.XBegin   +      CanShu1.WindowW*PB.Width/CanncelHead1[Number].DataNum/2+0.5),
//            trunc(H/2+Y-H*(data[middle]/3)),
//            trunc(W/(CanncelHead1[Number].DataNum)*ending+  X   -    Control1.XBegin   +      CanShu1.WindowW*PB.Width/CanncelHead1[Number].DataNum/2+0.5),
//            trunc(H/2+Y+H*(data[middle]/3))
//          );
//          start:=0;
//          ending:=0;
//          middle:=0;
//        end;
//      end;
    end;
  end;

  cvs.EndDraw;
  cvs.Free;
end;


{ Begin ��ҫ����********************************************** }


function ReturnColor(var data:double):integer;
begin
       if (data<=0.15)  and  (data >= 0) then  result:=$2F6B55
  else if (data<=0.25)  and  (data>0.15) then  result:=$908070
  else if (data<=0.35)  and  (data>0.25) then  result:=$32CD9A
  else if (data<=0.45)  and  (data>0.35) then  result:=$00FC7C
  else if (data<=0.55)  and  (data>0.45) then  result:=$00FFFF
  else if (data<=0.65)  and  (data>0.55) then  result:=$3C14DC
  else if (data<=1.00)  and  (data>0.65) then  result:=$0000FF

end;

function ReturnWidth(var data:double):integer;
begin
       if (data<=0.15)  and  (data >= 0) then  result:=1
  else if (data<=0.25)  and  (data>0.15) then  result:=2
  else if (data<=0.35)  and  (data>0.25) then  result:=3
  else if (data<=0.45)  and  (data>0.35) then  result:=4
  else if (data<=0.55)  and  (data>0.45) then  result:=5
  else if (data<=0.65)  and  (data>0.55) then  result:=6
  else if (data<=1.00)  and  (data>0.65) then  result:=7
end;

function ReturnHeight(var data:double):double;
begin
  if data = 0 then result:=0.5
  else if (data<=0.15)  and  (data >= 0) then  result:=1
  else if (data<=0.25)  and  (data>0.15) then  result:=2
  else if (data<=0.35)  and  (data>0.25) then  result:=3
  else if (data<=0.45)  and  (data>0.35) then  result:=4
  else if (data<=0.55)  and  (data>0.45) then  result:=5
  else if (data<=0.65)  and  (data>0.55) then  result:=6
  else if (data<=1.00)  and  (data>0.65) then  result:=7
end;

{ End ��ҫ����********************************************** }


end.

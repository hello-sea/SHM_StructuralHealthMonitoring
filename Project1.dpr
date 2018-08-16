program Project1;

uses
  Vcl.Forms,
  View in 'View.pas' {Form1},
  Model_Seg in 'Model_Seg.pas',
  FFT in 'FFT.pas',
  Widget in 'Widget.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

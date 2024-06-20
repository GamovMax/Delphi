program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Avtor},
  Unit3 in 'Unit3.pas' {Programm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TAvtor, Avtor);
  Application.CreateForm(TProgramm, Programm);
  Application.Run;
end.

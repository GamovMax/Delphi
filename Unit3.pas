unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TProgramm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Programm: TProgramm;

implementation

{$R *.dfm}

//Процедура закрытия программы
procedure TProgramm.Button1Click(Sender: TObject);
begin
Close;
end;

end.

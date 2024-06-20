unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAvtor = class(TForm)
    Label1: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Avtor: TAvtor;

implementation

{$R *.dfm}

//Процедура закрытия программы
procedure TAvtor.Button1Click(Sender: TObject);
begin
Close;
end;

end.

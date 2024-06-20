unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Menus, TeEngine, Series, ExtCtrls, TeeProcs,
  Chart;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    StringGrid1: TStringGrid;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    StringGrid2: TStringGrid;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Button4: TButton;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    Chart1: TChart;
    Series1: TBarSeries;
    Chart2: TChart;
    Series2: TBarSeries;
    Chart3: TChart;
    Series3: TBarSeries;
    Chart4: TChart;
    Series4: TBarSeries;
    PaintBox1: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  i,j:byte;
  W:array [1..5] of integer;
  V:array [1..4] of integer;
  WV:array [1..5,1..4] of integer;
  C1,C2:integer;
  pram:byte=0;

implementation

uses Unit2, Unit3;

{$R *.dfm}

// Заполнение полей таблицы при создании формы
procedure TForm1.FormCreate(Sender: TObject);
begin


  StringGrid1.Cells[0,0]:='Завод';
  StringGrid1.Cells[0,1]:='1';
  StringGrid1.Cells[0,2]:='2';
  StringGrid1.Cells[0,3]:='3';
  StringGrid1.Cells[0,4]:='4';
  StringGrid1.Cells[1,0]:='A';
  StringGrid1.Cells[2,0]:='B';
  StringGrid1.Cells[3,0]:='C';
  StringGrid1.Cells[4,0]:='D';
  StringGrid1.Cells[5,0]:='E';

end;
//процедура осуществляет
//построение первого допустимого пути
procedure TForm1.Button3Click(Sender: TObject);
Var
WS,VS:integer;
begin
  N2.Enabled:=False;//Делаем кнопку N2 недоступной
  N6.Enabled:=False; //Делаем кнопку N6 недоступной
  For i:=1 to StringGrid1.RowCount-1 do
  For j:=1 to StringGrid1.ColCount-1 do
  Begin
  try
//Присваиваем массиву WV значения из таблицы
  WV[j,i]:=StrToInt(StringGrid1.Cells[j,i]);
  except
//При ошибке присваивания выводится сообщение
    ShowMessage('Одно из чисел в таблице введено неверно');
    exit;//Выход из цикла

  end;
  end;



//Присваиваем массивам W и V значения
//из таблицы и делаем проверку на наличие ошибок
  try 
  Begin
  W[1]:=StrToInt(Edit1.Text);
  W[2]:=StrToInt(Edit2.Text);
  W[3]:=StrToInt(Edit3.Text);
  W[4]:=StrToInt(Edit4.Text);
  W[5]:=StrToInt(Edit5.Text);
  V[1]:=StrToInt(Edit6.Text);
  V[2]:=StrToInt(Edit7.Text);
  V[3]:=StrToInt(Edit8.Text);
  V[4]:=StrToInt(Edit9.Text);
  end;
  except
//При наличии ошибки выводится сообщение
    ShowMessage('Одно из чисел V или W введено неверно');
    exit;//выход из цикла
  end;


  //Подсчитываем сумму элементов массива W
  WS:=W[1]+W[2]+W[3]+W[4]+W[5];
  //Подсчитываем сумму элементов массива V
  VS:=V[1]+V[2]+V[3]+V[4];

  If WS<>VS//Выполняется проверка на равенство сумм WS и VS
  Then
    Begin
    //Если суммы не равыны то выводится сообщение
      ShowMessage('Суммы V и W не равны');
      exit;//Выход из цикла
    end;

  //Выполняется поэлементная очистка таблицы
  For i:=1 to StringGrid1.RowCount-1 do
  For j:=1 to StringGrid1.ColCount-1 do
  StringGrid1.Cells[j,i]:='';

//Присваиваем ячейкам таблиц значение суммы WS
  StringGrid1.Cells[0,0]:=IntToStr(WS);
  StringGrid2.Cells[0,0]:=IntToStr(WS);

//В цикле присваиваем ячейкам
//таблицы значения массива V
  For i:=1 to StringGrid1.RowCount-1 do
    Begin
      StringGrid1.Cells[0,i]:=IntToStr(V[i]);
      StringGrid2.Cells[0,i]:=IntToStr(V[i]);
    end;

//В цикле присваиваем ячейкам
//таблицы значения массива W
  For i:=1 to StringGrid1.ColCount-1 do
    Begin
      StringGrid1.Cells[i,0]:=IntToStr(W[i]);
      StringGrid2.Cells[i,0]:=IntToStr(W[i]);
    end;

//Делаем все компоненты типа
//TEdit невидимыми и недоступными
  For i:=0 to ComponentCount-1 do
  If Components[i] is TEdit
  Then
  begin
  TEdit(Components[i]).Visible:=False;
  TEdit(Components[i]).Enabled:=False;
  end;

//Делаем все компоненты типа TLabel невидимыми
  for i:=0 to ComponentCount - 1 do
  if Components[i] is TLabel
  then
  TLabel(Components[i]).Visible:=False;

//Устанавливаем необходимые
//свойства определённым компонентам
  Label12.Visible:=True;
  Label13.Visible:=True;
  Label14.Visible:=True;
  Label15.Visible:=True;
  Label16.Visible:=True;
  Label17.Visible:=True;
  Label18.Visible:=True;
  Label19.Visible:=True;
  Label20.Visible:=True;
  Label22.Visible:=True;
  Button3.Visible:=False;
  Button3.Enabled:=False;
  Button2.Visible:=True;
  Button2.Enabled:=True;
  StringGrid1.Enabled:=False;


  //Строим первый допустимы
  //путь чредой вычислений
  i:=4;
  j:=1;
  While (i>=1) and (j<=5) do
    Begin
      If V[i]>W[j]
      Then
        Begin
          StringGrid1.Cells[j,i]:=IntToStr(W[j]);
          V[i]:=V[i]-W[j];
          W[j]:=0;
          j:=j+1;
        end;

      If V[i]<W[j]
      Then
        Begin
          StringGrid1.Cells[j,i]:=IntToStr(V[i]);
          W[j]:=W[j]-V[i];
          V[i]:=0;
          i:=i-1;
        end;

      If V[i]=W[j]
      Then
        Begin
          StringGrid1.Cells[j,i]:=IntToStr(W[j]);
          V[i]:=0;
          W[j]:=0;
          j:=j+1;
          i:=i-1;
        end;

    end;

  //В массив V заносим значения из таблицы
  For i:=1 to StringGrid1.RowCount-1 do
    V[i]:=StrToInt(StringGrid1.Cells[0,i]);

  //В массив W заносим значения из таблицы
  For i:=1 to StringGrid1.ColCount-1 do
    W[i]:=StrToInt(StringGrid1.Cells[i,0]);

  //Строим второй допустимый путь чредой вычислений
  i:=4;
  j:=5;
  While (i>=1) and (j>=1) do
    Begin
      If V[i]>W[j]
      Then
        Begin
          StringGrid2.Cells[j,i]:=IntToStr(W[j]);
          V[i]:=V[i]-W[j];
          W[j]:=0;
          j:=j-1;
        end;

      If V[i]<W[j]
      Then
        Begin
          StringGrid2.Cells[j,i]:=IntToStr(V[i]);
          W[j]:=W[j]-V[i];
          V[i]:=0;
          i:=i-1;
        end;

      If V[i]=W[j]
      Then
        Begin
          StringGrid2.Cells[j,i]:=IntToStr(W[j]);
          V[i]:=0;
          W[j]:=0;
          j:=j-1;
          i:=i-1;
        end;

    end;


end;

//процедура, выполняющая построение
//второго допустимого пути
procedure TForm1.Button2Click(Sender: TObject);
begin
//Присваиваем определённым
//компонентам необходимые значения
  StringGrid1.Visible:=False;
  StringGrid2.Visible:=True;
  Label22.Visible:=False;
  Label21.Visible:=True;
  Button2.Visible:=False;
  Button2.Enabled:=False;
  Button1.Visible:=True;
  Button1.Enabled:=True;



end;

//процедура, производящая
//вывод оптимального пути на экран
procedure TForm1.Button1Click(Sender: TObject);
begin

  C1:=0;
  C2:=0;

//Поэлементно высчитываем
//затраты на первый допустимый путь
  For i:=1 to StringGrid1.RowCount-1 do
  For j:=1 to StringGrid1.ColCount-1 do
    begin
      If StringGrid1.Cells[j,i]<>''
      Then
      C1:=C1+StrToInt(StringGrid1.Cells[j,i])*WV[j,i];
    end;

//Поэлементно высчитываем затраты
//на второй допустимый путь
  For i:=1 to StringGrid2.RowCount-1 do
  For j:=1 to StringGrid2.ColCount-1 do
    begin
      If StringGrid2.Cells[j,i]<>''
      Then
      C2:=C2+StrToInt(StringGrid2.Cells[j,i])*WV[j,i];
    end;

    //Если первый допустимый путь
    //больше второго, то принимаем
    //второй допустимый путь за
    //оптимальный и строим диаграммы
    //соответствующим образом
  If C1>C2
  Then
    begin
        i:=1;
        For j:=1 to StringGrid2.ColCount-1 do
          Begin
            If StringGrid2.Cells[j,i]<>''
            Then
            Series1.Add(StrToInt(StringGrid2.Cells[j,i]),'W'+IntToStr(j),clblue);
          end;
        i:=2;
        For j:=1 to StringGrid2.ColCount-1 do
          Begin
            If StringGrid2.Cells[j,i]<>''
            Then
            Series2.Add(StrToInt(StringGrid2.Cells[j,i]),'W'+IntToStr(j),clblue);
          end;
        i:=3;
        For j:=1 to StringGrid2.ColCount-1 do
          Begin
            If StringGrid2.Cells[j,i]<>''
            Then
            Series3.Add(StrToInt(StringGrid2.Cells[j,i]),'W'+IntToStr(j),clblue);
          end;
        i:=4;
        For j:=1 to StringGrid2.ColCount-1 do
          Begin
            If StringGrid2.Cells[j,i]<>''
            Then
            Series4.Add(StrToInt(StringGrid2.Cells[j,i]),'W'+IntToStr(j),clblue);
          end;



      //Делаем диаграммы видимыми и доступными
      Chart1.Enabled:=True;
      Chart1.Visible:=True;
      Chart2.Enabled:=True;
      Chart2.Visible:=True;
      Chart3.Enabled:=True;
      Chart3.Visible:=True;
      Chart4.Enabled:=True;
      Chart4.Visible:=True;
      pram:=1;

      //В нередактируемое поле
      //выводим информацию об оптимальном пути
      Label25.Caption:='C1>C2    C2-оптимальный';
      end

  //Если второй допустимый
  //путь больше первого,
  //то принимаем второй допустимый
  //путь за оптимальный и строим
  //диаграммы соответствующим образом
  Else

      begin

       i:=1;
        For j:=1 to StringGrid1.ColCount-1 do
          Begin
            If StringGrid1.Cells[j,i]<>''
            Then
            Series1.Add(StrToInt(StringGrid1.Cells[j,i]),'W'+IntToStr(j),clblue);
          end;
        i:=2;
        For j:=1 to StringGrid1.ColCount-1 do
          Begin
            If StringGrid1.Cells[j,i]<>''
            Then
            Series2.Add(StrToInt(StringGrid1.Cells[j,i]),'W'+IntToStr(j),clblue);
          end;
        i:=3;
        For j:=1 to StringGrid1.ColCount-1 do
          Begin
            If StringGrid1.Cells[j,i]<>''
            Then
            Series3.Add(StrToInt(StringGrid1.Cells[j,i]),'W'+IntToStr(j),clblue);
          end;
        i:=4;
        For j:=1 to StringGrid1.ColCount-1 do
          Begin
            If StringGrid1.Cells[j,i]<>''
            Then
            Series4.Add(StrToInt(StringGrid1.Cells[j,i]),'W'+IntToStr(j),clblue);
          end;

      //Делаем диаграммы видимыми и доступными
      Chart1.Enabled:=True;
      Chart1.Visible:=True;
      Chart2.Enabled:=True;
      Chart2.Visible:=True;
      Chart3.Enabled:=True;
      Chart3.Visible:=True;
      Chart4.Enabled:=True;
      Chart4.Visible:=True;

      //Выводим на экран первую таблицу
      Label21.Visible:=False;
      Label22.Visible:=True;
      StringGrid1.Visible:=True;
      StringGrid2.Visible:=False;

//В нередактируемое поле
//выводим информацию об оптимальном пути
      Label25.Caption:='C2>C1    C1-оптимальный';
      end;

//Делаем нередактируемые поля видимыми
  Label23.Visible:=True;
  Label24.Visible:=True;
  Label25.Visible:=True;

//Выводим суммы затрат на
//первый и второй допустимые пути
  Label23.Caption:='C1='+ IntToStr(C1);
  Label24.Caption:='C2='+ IntToStr(C2);

//Делаем Button1 невидимой и недоступной
  Button1.Visible:=False;
  Button1.Enabled:=False;

//Делаем Button4 видимой и доступной
  Button4.Visible:=True;
  Button4.Enabled:=True;



end;

//процедура, выполняющая
//повторение программы сначала
procedure TForm1.Button4Click(Sender: TObject);
begin
  pram:=0;
  PaintBox1.Canvas.Brush.Color:=clBtnFace;
  PaintBox1.Canvas.FillRect(Bounds(0,0,PaintBox1.Width,PaintBox1.Height));
  Series1.Clear;//Очищаем диаграммы
  Series2.Clear;
  Series3.Clear;
  Series4.Clear;

  //Делаем диаграммы невидимыми и недоступными
  Chart1.Enabled:=False;
  Chart1.Visible:=False;
  Chart2.Enabled:=False;
  Chart2.Visible:=False;
  Chart3.Enabled:=False;
  Chart3.Visible:=False;
  Chart4.Enabled:=False;
  Chart4.Visible:=False;

//Очищаем и делаем все компоненты
//типа TEdit доступными и видимыми
  For i:=0 to ComponentCount-1 do 
  begin
  If Components[i] is TEdit
  Then
  begin
  TEdit(Components[i]).Visible:=True;
  TEdit(Components[i]).Enabled:=True;
  TEdit(Components[i]).Clear;
  end;
  if Components[i] is TLabel
  then
  TLabel(Components[i]).Visible:=False;
  If Components[i] is TStringGrid
  Then
  begin
  TStringGrid(Components[i]).Visible:=False;
  TStringGrid(Components[i]).Enabled:=False;
  end;
  end;


//Задаём определённым
//объектам необходимые свойства,
//которые были присвоены
//им вначале выполнения программы
  Label1.Visible:=True;
  Label2.Visible:=True;
  Label3.Visible:=True;
  Label4.Visible:=True;
  Label5.Visible:=True;
  Label6.Visible:=True;
  Label7.Visible:=True;
  Label8.Visible:=True;
  Label9.Visible:=True;
  Label10.Visible:=True;
  Label11.Visible:=True;
  Button3.Visible:=True;
  Button3.Enabled:=True;
  Button4.Visible:=False;
  Button4.Enabled:=False;
  StringGrid1.Visible:=True;
  StringGrid1.Enabled:=True;

//Очищаем первую таблицу
  For i:=0 to StringGrid1.RowCount-1 do
  For j:=0 to StringGrid1.ColCount-1 do
  StringGrid1.Cells[j,i]:='';

//Очищаем вторую таблицу
  For i:=0 to StringGrid2.RowCount-1 do
  For j:=0 to StringGrid2.ColCount-1 do
  StringGrid2.Cells[j,i]:='';

//Присваиваем необходиые
//значения определённым ячейкам таблицы
  StringGrid1.Cells[0,0]:='Завод';
  StringGrid1.Cells[0,1]:='1';
  StringGrid1.Cells[0,2]:='2';
  StringGrid1.Cells[0,3]:='3';
  StringGrid1.Cells[0,4]:='4';
  StringGrid1.Cells[1,0]:='A';
  StringGrid1.Cells[2,0]:='B';
  StringGrid1.Cells[3,0]:='C';
  StringGrid1.Cells[4,0]:='D';
  StringGrid1.Cells[5,0]:='E';

//Делаем кнопку N6 доступной
  N6.Enabled:=True;

//Делаем кнопку N2 доступной
  N2.Enabled:=True;
end;

//процедура, производящая
//выход из программы
procedure TForm1.N4Click(Sender: TObject);
begin
Close;
end;

//процедура, заполняющая
//поля ввода автоматически
//в соответствии с вариантом задания
procedure TForm1.N2Click(Sender: TObject);
begin
  Edit1.Text:='250';
  Edit2.Text:='1000';
  Edit3.Text:='700';
  Edit4.Text:='650';
  Edit5.Text:='450';
  Edit6.Text:='950';
  Edit7.Text:='300';
  Edit8.Text:='1350';
  Edit9.Text:='450';
  StringGrid1.Cells[1,1]:='12';
  StringGrid1.Cells[2,1]:='16';
  StringGrid1.Cells[3,1]:='21';
  StringGrid1.Cells[4,1]:='19';
  StringGrid1.Cells[5,1]:='32';
  StringGrid1.Cells[1,2]:='4';
  StringGrid1.Cells[2,2]:='4';
  StringGrid1.Cells[3,2]:='9';
  StringGrid1.Cells[4,2]:='5';
  StringGrid1.Cells[5,2]:='24';
  StringGrid1.Cells[1,3]:='3';
  StringGrid1.Cells[2,3]:='8';
  StringGrid1.Cells[3,3]:='14';
  StringGrid1.Cells[4,3]:='10';
  StringGrid1.Cells[5,3]:='26';
  StringGrid1.Cells[1,4]:='24';
  StringGrid1.Cells[2,4]:='33';
  StringGrid1.Cells[3,4]:='36';
  StringGrid1.Cells[4,4]:='34';
  StringGrid1.Cells[5,4]:='49';

end;


//процедура, очищающая поля
//ввода для последующего ввода
//с клавиатуры
procedure TForm1.N6Click(Sender: TObject);
begin
  Edit1.Text:='';
  Edit2.Text:='';
  Edit3.Text:='';
  Edit4.Text:='';
  Edit5.Text:='';
  Edit6.Text:='';
  Edit7.Text:='';
  Edit8.Text:='';
  Edit9.Text:='';

  For i:=1 to StringGrid1.RowCount-1 do
  For j:=1 to StringGrid1.ColCount-1 do
  StringGrid1.Cells[j,i]:='';

end;


//процедура, открывающая
//окно "Об авторе" где содержится
//информация об авторе программы
procedure TForm1.N8Click(Sender: TObject);
begin
Avtor.ShowModal;
end;


//процедура, открывающая окно
//"О программе" где содержится
//информация о разработанной программе
procedure TForm1.N9Click(Sender: TObject);
begin
Programm.ShowModal;
end;


//Процедура прорисовки оптимального плана перевозок
procedure TForm1.FormPaint(Sender: TObject);
Var
SQ,SQ2:integer;
begin
SQ:=0;

//Проверка условия на разрешение прорисовки
If pram<>0
Then

//Определение оптимального пути в условном
//операторе
If C1>C2
Then

  begin
  //Задаём необходимый формат прорисовки
  With PaintBox1.Canvas do
          Begin
            Font.Name:='Arial';
            Font.Size:=10;
            Pen.Color:=clBlack;
            Brush.Color:=clBlack;
            Font.Style:=[fsBold];
            Brush.Color:=clBtnFace;
          end;


        //Подсчитываем соотношение количества
        //потребителей к числу производителей
        i:=1;
        For j:=1 to StringGrid2.ColCount-1 do
            Begin
              If StringGrid2.Cells[j,i]<>''
              Then
              SQ:=SQ+1;
            end;

            //В соответствии с определённым соотношением
            //строим рисунок
            If SQ=1
            Then
              Begin
                PaintBox1.Canvas.Textout(10,50,'V1');
                PaintBox1.Canvas.MoveTo(30,60);
                PaintBox1.Canvas.LineTo(100,60);
                PaintBox1.Canvas.LineTo(85,55);
                PaintBox1.Canvas.MoveTo(100,60);
                PaintBox1.Canvas.LineTo(85,65);

                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                      begin
                        PaintBox1.Canvas.Textout(110,50,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,21,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=2
            Then
              Begin
                PaintBox1.Canvas.Textout(10,50,'V1');
                PaintBox1.Canvas.MoveTo(30,55);
                PaintBox1.Canvas.LineTo(100,30);
                PaintBox1.Canvas.LineTo(85,40);
                PaintBox1.Canvas.MoveTo(100,30);
                PaintBox1.Canvas.LineTo(82,32);

                PaintBox1.Canvas.MoveTo(30,60);
                PaintBox1.Canvas.LineTo(100,90);
                PaintBox1.Canvas.LineTo(85,78);
                PaintBox1.Canvas.MoveTo(100,90);
                PaintBox1.Canvas.LineTo(82,87);

                SQ2:=1;
                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,20,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,21,StringGrid2.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,80,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,83,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=3
            Then
              Begin
                PaintBox1.Canvas.Textout(10,50,'V1');
                PaintBox1.Canvas.MoveTo(30,55);
                PaintBox1.Canvas.LineTo(100,30);
                PaintBox1.Canvas.LineTo(85,40);
                PaintBox1.Canvas.MoveTo(100,30);
                PaintBox1.Canvas.LineTo(82,32);


                PaintBox1.Canvas.MoveTo(30,60);
                PaintBox1.Canvas.LineTo(100,60);
                PaintBox1.Canvas.LineTo(85,55);
                PaintBox1.Canvas.MoveTo(100,60);
                PaintBox1.Canvas.LineTo(85,65);


                PaintBox1.Canvas.MoveTo(30,60);
                PaintBox1.Canvas.LineTo(100,90);
                PaintBox1.Canvas.LineTo(85,78);
                PaintBox1.Canvas.MoveTo(100,90);
                PaintBox1.Canvas.LineTo(82,87);


                SQ2:=1;
                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,20,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,21,StringGrid2.Cells[j,i]);
                      end;
                    If SQ2=2
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,50,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(50,50,StringGrid2.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,80,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,83,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;

        //Подсчитываем соотношение количества
        //потребителей к числу производителей
        SQ:=0;
        i:=2;
        For j:=1 to StringGrid2.ColCount-1 do
            Begin
              If StringGrid2.Cells[j,i]<>''
              Then
              SQ:=SQ+1;
            end;

            //В соответствии с определённым соотношением
            //строим рисунок
            If SQ=1
            Then
              Begin
                PaintBox1.Canvas.Textout(10,150,'V1');
                PaintBox1.Canvas.MoveTo(30,160);
                PaintBox1.Canvas.LineTo(100,160);
                PaintBox1.Canvas.LineTo(85,155);
                PaintBox1.Canvas.MoveTo(100,160);
                PaintBox1.Canvas.LineTo(85,165);

                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                      begin
                        PaintBox1.Canvas.Textout(110,150,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,121,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=2
            Then
              Begin
                PaintBox1.Canvas.Textout(10,150,'V1');
                PaintBox1.Canvas.MoveTo(30,155);
                PaintBox1.Canvas.LineTo(100,130);
                PaintBox1.Canvas.LineTo(85,140);
                PaintBox1.Canvas.MoveTo(100,130);
                PaintBox1.Canvas.LineTo(82,132);

                PaintBox1.Canvas.MoveTo(30,160);
                PaintBox1.Canvas.LineTo(100,190);
                PaintBox1.Canvas.LineTo(85,178);
                PaintBox1.Canvas.MoveTo(100,190);
                PaintBox1.Canvas.LineTo(82,187);

                SQ2:=1;
                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,120,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,121,StringGrid2.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,180,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,183,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=3
            Then
              Begin
                PaintBox1.Canvas.Textout(10,150,'V1');
                PaintBox1.Canvas.MoveTo(30,155);
                PaintBox1.Canvas.LineTo(100,130);
                PaintBox1.Canvas.LineTo(85,140);
                PaintBox1.Canvas.MoveTo(100,130);
                PaintBox1.Canvas.LineTo(82,132);


                PaintBox1.Canvas.MoveTo(30,60);
                PaintBox1.Canvas.LineTo(100,160);
                PaintBox1.Canvas.LineTo(85,155);
                PaintBox1.Canvas.MoveTo(100,160);
                PaintBox1.Canvas.LineTo(85,165);


                PaintBox1.Canvas.MoveTo(30,160);
                PaintBox1.Canvas.LineTo(100,190);
                PaintBox1.Canvas.LineTo(85,178);
                PaintBox1.Canvas.MoveTo(100,190);
                PaintBox1.Canvas.LineTo(82,187);


                SQ2:=1;
                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,120,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,121,StringGrid2.Cells[j,i]);
                      end;
                    If SQ2=2
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,150,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(50,150,StringGrid2.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,180,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,183,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;


        //Подсчитываем соотношение количества
        //потребителей к числу производителей
        SQ:=0;
        i:=3;
        For j:=1 to StringGrid2.ColCount-1 do
            Begin
              If StringGrid2.Cells[j,i]<>''
              Then
              SQ:=SQ+1;
            end;


            //В соответствии с определённым соотношением
            //строим рисунок
            If SQ=1
            Then
              Begin
                PaintBox1.Canvas.Textout(10,250,'V1');
                PaintBox1.Canvas.MoveTo(30,260);
                PaintBox1.Canvas.LineTo(100,260);
                PaintBox1.Canvas.LineTo(85,255);
                PaintBox1.Canvas.MoveTo(100,260);
                PaintBox1.Canvas.LineTo(85,265);

                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                      begin
                        PaintBox1.Canvas.Textout(110,250,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,221,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=2
            Then
              Begin
                PaintBox1.Canvas.Textout(10,250,'V1');
                PaintBox1.Canvas.MoveTo(30,255);
                PaintBox1.Canvas.LineTo(100,230);
                PaintBox1.Canvas.LineTo(85,240);
                PaintBox1.Canvas.MoveTo(100,230);
                PaintBox1.Canvas.LineTo(82,232);

                PaintBox1.Canvas.MoveTo(30,260);
                PaintBox1.Canvas.LineTo(100,290);
                PaintBox1.Canvas.LineTo(85,278);
                PaintBox1.Canvas.MoveTo(100,290);
                PaintBox1.Canvas.LineTo(82,287);

                SQ2:=1;
                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,220,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,221,StringGrid2.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,280,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,283,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=3
            Then
              Begin
                PaintBox1.Canvas.Textout(10,250,'V1');
                PaintBox1.Canvas.MoveTo(30,255);
                PaintBox1.Canvas.LineTo(100,230);
                PaintBox1.Canvas.LineTo(85,240);
                PaintBox1.Canvas.MoveTo(100,230);
                PaintBox1.Canvas.LineTo(82,232);


                PaintBox1.Canvas.MoveTo(30,260);
                PaintBox1.Canvas.LineTo(100,260);
                PaintBox1.Canvas.LineTo(85,255);
                PaintBox1.Canvas.MoveTo(100,260);
                PaintBox1.Canvas.LineTo(85,265);


                PaintBox1.Canvas.MoveTo(30,260);
                PaintBox1.Canvas.LineTo(100,290);
                PaintBox1.Canvas.LineTo(85,278);
                PaintBox1.Canvas.MoveTo(100,290);
                PaintBox1.Canvas.LineTo(82,287);


                SQ2:=1;
                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,220,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,221,StringGrid2.Cells[j,i]);
                      end;
                    If SQ2=2
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,250,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(50,250,StringGrid2.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,280,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,283,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;

       //Подсчитываем соотношение количества
       //потребителей к числу производителей
       SQ:=0;
       i:=4;
        For j:=1 to StringGrid2.ColCount-1 do
            Begin
              If StringGrid2.Cells[j,i]<>''
              Then
              SQ:=SQ+1;
            end;
           //В соответствии с определённым соотношением
           //строим рисунок
            If SQ=1
            Then
              Begin
                PaintBox1.Canvas.Textout(10,350,'V1');
                PaintBox1.Canvas.MoveTo(30,360);
                PaintBox1.Canvas.LineTo(100,360);
                PaintBox1.Canvas.LineTo(85,355);
                PaintBox1.Canvas.MoveTo(100,360);
                PaintBox1.Canvas.LineTo(85,365);

                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                      begin
                        PaintBox1.Canvas.Textout(110,350,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,321,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=2
            Then
              Begin
                PaintBox1.Canvas.Textout(10,350,'V1');
                PaintBox1.Canvas.MoveTo(30,355);
                PaintBox1.Canvas.LineTo(100,330);
                PaintBox1.Canvas.LineTo(85,340);
                PaintBox1.Canvas.MoveTo(100,330);
                PaintBox1.Canvas.LineTo(82,332);

                PaintBox1.Canvas.MoveTo(30,360);
                PaintBox1.Canvas.LineTo(100,390);
                PaintBox1.Canvas.LineTo(85,378);
                PaintBox1.Canvas.MoveTo(100,390);
                PaintBox1.Canvas.LineTo(82,387);

                SQ2:=1;
                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,320,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,321,StringGrid2.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,380,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,383,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=3
            Then
              Begin
                PaintBox1.Canvas.Textout(10,350,'V1');
                PaintBox1.Canvas.MoveTo(30,355);
                PaintBox1.Canvas.LineTo(100,330);
                PaintBox1.Canvas.LineTo(85,340);
                PaintBox1.Canvas.MoveTo(100,330);
                PaintBox1.Canvas.LineTo(82,332);


                PaintBox1.Canvas.MoveTo(30,360);
                PaintBox1.Canvas.LineTo(100,360);
                PaintBox1.Canvas.LineTo(85,355);
                PaintBox1.Canvas.MoveTo(100,360);
                PaintBox1.Canvas.LineTo(85,365);


                PaintBox1.Canvas.MoveTo(30,360);
                PaintBox1.Canvas.LineTo(100,390);
                PaintBox1.Canvas.LineTo(85,378);
                PaintBox1.Canvas.MoveTo(100,390);
                PaintBox1.Canvas.LineTo(82,387);


                SQ2:=1;
                For j:=1 to StringGrid2.ColCount-1 do
                  Begin
                    If StringGrid2.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,320,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,321,StringGrid2.Cells[j,i]);
                      end;
                    If SQ2=2
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,350,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(50,350,StringGrid2.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,380,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,383,StringGrid2.Cells[j,i]);
                      end;
                  end;
              end;

  end

else
  
begin

  //Задаём необходимый формат рисования
  With PaintBox1.Canvas do
          Begin
            Font.Name:='Arial';
            Font.Size:=10;
            Pen.Color:=clBlack;
            Brush.Color:=clBlack;
            Font.Style:=[fsBold];
            Brush.Color:=clBtnFace;
          end;

        //Подсчитываем соотношение количества
       //потребителей к числу производителей
        i:=1;
        For j:=1 to StringGrid1.ColCount-1 do
            Begin
              If StringGrid1.Cells[j,i]<>''
              Then
              SQ:=SQ+1;
            end;

            //В соответствии с определённым соотношением
           //строим рисунок
            If SQ=1
            Then
              Begin
                PaintBox1.Canvas.Textout(10,50,'V1');
                PaintBox1.Canvas.MoveTo(30,60);
                PaintBox1.Canvas.LineTo(100,60);
                PaintBox1.Canvas.LineTo(85,55);
                PaintBox1.Canvas.MoveTo(100,60);
                PaintBox1.Canvas.LineTo(85,65);

                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                      begin
                        PaintBox1.Canvas.Textout(110,50,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,21,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=2
            Then
              Begin
                PaintBox1.Canvas.Textout(10,50,'V1');
                PaintBox1.Canvas.MoveTo(30,55);
                PaintBox1.Canvas.LineTo(100,30);
                PaintBox1.Canvas.LineTo(85,40);
                PaintBox1.Canvas.MoveTo(100,30);
                PaintBox1.Canvas.LineTo(82,32);

                PaintBox1.Canvas.MoveTo(30,60);
                PaintBox1.Canvas.LineTo(100,90);
                PaintBox1.Canvas.LineTo(85,78);
                PaintBox1.Canvas.MoveTo(100,90);
                PaintBox1.Canvas.LineTo(82,87);

                SQ2:=1;
                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,20,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,21,StringGrid1.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,80,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,83,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=3
            Then
              Begin
                PaintBox1.Canvas.Textout(10,50,'V1');
                PaintBox1.Canvas.MoveTo(30,55);
                PaintBox1.Canvas.LineTo(100,30);
                PaintBox1.Canvas.LineTo(85,40);
                PaintBox1.Canvas.MoveTo(100,30);
                PaintBox1.Canvas.LineTo(82,32);


                PaintBox1.Canvas.MoveTo(30,60);
                PaintBox1.Canvas.LineTo(100,60);
                PaintBox1.Canvas.LineTo(85,55);
                PaintBox1.Canvas.MoveTo(100,60);
                PaintBox1.Canvas.LineTo(85,65);


                PaintBox1.Canvas.MoveTo(30,60);
                PaintBox1.Canvas.LineTo(100,90);
                PaintBox1.Canvas.LineTo(85,78);
                PaintBox1.Canvas.MoveTo(100,90);
                PaintBox1.Canvas.LineTo(82,87);


                SQ2:=1;
                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,20,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,21,StringGrid1.Cells[j,i]);
                      end;
                    If SQ2=2
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,50,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(50,50,StringGrid1.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,80,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,83,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;

        //Подсчитываем соотношение количества
       //потребителей к числу производителей
        SQ:=0;
        i:=2;
        For j:=1 to StringGrid1.ColCount-1 do
            Begin
              If StringGrid1.Cells[j,i]<>''
              Then
              SQ:=SQ+1;
            end;

            //В соответствии с определённым соотношением
           //строим рисунок
            If SQ=1
            Then
              Begin
                PaintBox1.Canvas.Textout(10,150,'V1');
                PaintBox1.Canvas.MoveTo(30,160);
                PaintBox1.Canvas.LineTo(100,160);
                PaintBox1.Canvas.LineTo(85,155);
                PaintBox1.Canvas.MoveTo(100,160);
                PaintBox1.Canvas.LineTo(85,165);

                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                      begin
                        PaintBox1.Canvas.Textout(110,150,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,121,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=2
            Then
              Begin
                PaintBox1.Canvas.Textout(10,150,'V1');
                PaintBox1.Canvas.MoveTo(30,155);
                PaintBox1.Canvas.LineTo(100,130);
                PaintBox1.Canvas.LineTo(85,140);
                PaintBox1.Canvas.MoveTo(100,130);
                PaintBox1.Canvas.LineTo(82,132);

                PaintBox1.Canvas.MoveTo(30,160);
                PaintBox1.Canvas.LineTo(100,190);
                PaintBox1.Canvas.LineTo(85,178);
                PaintBox1.Canvas.MoveTo(100,190);
                PaintBox1.Canvas.LineTo(82,187);

                SQ2:=1;
                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,120,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,121,StringGrid1.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,180,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,183,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=3
            Then
              Begin
                PaintBox1.Canvas.Textout(10,150,'V1');
                PaintBox1.Canvas.MoveTo(30,155);
                PaintBox1.Canvas.LineTo(100,130);
                PaintBox1.Canvas.LineTo(85,140);
                PaintBox1.Canvas.MoveTo(100,130);
                PaintBox1.Canvas.LineTo(82,132);


                PaintBox1.Canvas.MoveTo(30,60);
                PaintBox1.Canvas.LineTo(100,160);
                PaintBox1.Canvas.LineTo(85,155);
                PaintBox1.Canvas.MoveTo(100,160);
                PaintBox1.Canvas.LineTo(85,165);


                PaintBox1.Canvas.MoveTo(30,160);
                PaintBox1.Canvas.LineTo(100,190);
                PaintBox1.Canvas.LineTo(85,178);
                PaintBox1.Canvas.MoveTo(100,190);
                PaintBox1.Canvas.LineTo(82,187);


                SQ2:=1;
                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,120,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,121,StringGrid1.Cells[j,i]);
                      end;
                    If SQ2=2
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,150,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(50,150,StringGrid1.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,180,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,183,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;


        //Подсчитываем соотношение количества
       //потребителей к числу производителей
        SQ:=0;
        i:=3;
        For j:=1 to StringGrid1.ColCount-1 do
            Begin
              If StringGrid1.Cells[j,i]<>''
              Then
              SQ:=SQ+1;
            end;


            //В соответствии с определённым соотношением
           //строим рисунок
            If SQ=1
            Then
              Begin
                PaintBox1.Canvas.Textout(10,250,'V1');
                PaintBox1.Canvas.MoveTo(30,260);
                PaintBox1.Canvas.LineTo(100,260);
                PaintBox1.Canvas.LineTo(85,255);
                PaintBox1.Canvas.MoveTo(100,260);
                PaintBox1.Canvas.LineTo(85,265);

                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                      begin
                        PaintBox1.Canvas.Textout(110,250,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,221,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=2
            Then
              Begin
                PaintBox1.Canvas.Textout(10,250,'V1');
                PaintBox1.Canvas.MoveTo(30,255);
                PaintBox1.Canvas.LineTo(100,230);
                PaintBox1.Canvas.LineTo(85,240);
                PaintBox1.Canvas.MoveTo(100,230);
                PaintBox1.Canvas.LineTo(82,232);

                PaintBox1.Canvas.MoveTo(30,260);
                PaintBox1.Canvas.LineTo(100,290);
                PaintBox1.Canvas.LineTo(85,278);
                PaintBox1.Canvas.MoveTo(100,290);
                PaintBox1.Canvas.LineTo(82,287);

                SQ2:=1;
                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,220,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,221,StringGrid1.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,280,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,283,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=3
            Then
              Begin
                PaintBox1.Canvas.Textout(10,250,'V1');
                PaintBox1.Canvas.MoveTo(30,255);
                PaintBox1.Canvas.LineTo(100,230);
                PaintBox1.Canvas.LineTo(85,240);
                PaintBox1.Canvas.MoveTo(100,230);
                PaintBox1.Canvas.LineTo(82,232);


                PaintBox1.Canvas.MoveTo(30,260);
                PaintBox1.Canvas.LineTo(100,260);
                PaintBox1.Canvas.LineTo(85,255);
                PaintBox1.Canvas.MoveTo(100,260);
                PaintBox1.Canvas.LineTo(85,265);


                PaintBox1.Canvas.MoveTo(30,260);
                PaintBox1.Canvas.LineTo(100,290);
                PaintBox1.Canvas.LineTo(85,278);
                PaintBox1.Canvas.MoveTo(100,290);
                PaintBox1.Canvas.LineTo(82,287);


                SQ2:=1;
                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,220,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,221,StringGrid1.Cells[j,i]);
                      end;
                    If SQ2=2
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,250,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(50,250,StringGrid1.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,280,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,283,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;


       //Подсчитываем соотношение количества
       //потребителей к числу производителей
       SQ:=0;
       i:=4;
        For j:=1 to StringGrid1.ColCount-1 do
            Begin
              If StringGrid1.Cells[j,i]<>''
              Then
              SQ:=SQ+1;
            end;


            //В соответствии с определённым соотношением
           //строим рисунок
            If SQ=1
            Then
              Begin
                PaintBox1.Canvas.Textout(10,350,'V1');
                PaintBox1.Canvas.MoveTo(30,360);
                PaintBox1.Canvas.LineTo(100,360);
                PaintBox1.Canvas.LineTo(85,355);
                PaintBox1.Canvas.MoveTo(100,360);
                PaintBox1.Canvas.LineTo(85,365);

                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                      begin
                        PaintBox1.Canvas.Textout(110,350,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,321,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=2
            Then
              Begin
                PaintBox1.Canvas.Textout(10,350,'V1');
                PaintBox1.Canvas.MoveTo(30,355);
                PaintBox1.Canvas.LineTo(100,330);
                PaintBox1.Canvas.LineTo(85,340);
                PaintBox1.Canvas.MoveTo(100,330);
                PaintBox1.Canvas.LineTo(82,332);

                PaintBox1.Canvas.MoveTo(30,360);
                PaintBox1.Canvas.LineTo(100,390);
                PaintBox1.Canvas.LineTo(85,378);
                PaintBox1.Canvas.MoveTo(100,390);
                PaintBox1.Canvas.LineTo(82,387);

                SQ2:=1;
                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,320,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,321,StringGrid1.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,380,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,383,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;

            If SQ=3
            Then
              Begin
                PaintBox1.Canvas.Textout(10,350,'V1');
                PaintBox1.Canvas.MoveTo(30,355);
                PaintBox1.Canvas.LineTo(100,330);
                PaintBox1.Canvas.LineTo(85,340);
                PaintBox1.Canvas.MoveTo(100,330);
                PaintBox1.Canvas.LineTo(82,332);


                PaintBox1.Canvas.MoveTo(30,360);
                PaintBox1.Canvas.LineTo(100,360);
                PaintBox1.Canvas.LineTo(85,355);
                PaintBox1.Canvas.MoveTo(100,360);
                PaintBox1.Canvas.LineTo(85,365);


                PaintBox1.Canvas.MoveTo(30,360);
                PaintBox1.Canvas.LineTo(100,390);
                PaintBox1.Canvas.LineTo(85,378);
                PaintBox1.Canvas.MoveTo(100,390);
                PaintBox1.Canvas.LineTo(82,387);


                SQ2:=1;
                For j:=1 to StringGrid1.ColCount-1 do
                  Begin
                    If StringGrid1.Cells[j,i]<>''
                    Then
                    If SQ2=1
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,320,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,321,StringGrid1.Cells[j,i]);
                      end;
                    If SQ2=2
                    Then
                      Begin
                        SQ2:=SQ2+1;
                        PaintBox1.Canvas.Textout(102,350,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(50,350,StringGrid1.Cells[j,i]);
                      end
                    else
                      begin
                        PaintBox1.Canvas.Textout(102,380,'W'+IntToStr(j));
                        PaintBox1.Canvas.Textout(58,383,StringGrid1.Cells[j,i]);
                      end;
                  end;
              end;

  end

  //Если прорисовка запрещена, то
  //область прорисовки очищается
  else
    begin
      PaintBox1.Canvas.Brush.Color:=clBtnFace;
      PaintBox1.Canvas.FillRect(Bounds(0,0,PaintBox1.Width,PaintBox1.Height));
    end;
end;

end.

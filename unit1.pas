unit Unit1; 

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls,  StdCtrls, ComCtrls;

type
  TByteArr = array of byte;
  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    StatusBar1: TStatusBar;
    procedure Button1Click(Sender: TObject);
  private
    { private declarations }
    function StrToByte(const Value: String): TByteArr;
  public
    { public declarations }
  end; 

var
  Form1: TForm1; 

implementation

{$R *.lfm}

{ TForm1 }
function TForm1.StrToByte(const Value: String): TByteArr;
var
    I: integer;
begin
    SetLength(Result, Length(Value));
    for I := 0 to Length(Value) - 1 do
        Result[I] :=ord(Value[I+1]);
end;
procedure TForm1.Button1Click(Sender: TObject);
   var
   s: string;
   i,c,j,z,y,k : integer;
   b: TByteArr;
   hash : string;
begin
   b := StrToByte(Edit1.Text);
        z:= 29666;
        y:= 32767;
        j:=0;
        k:=(length(b)-1);
   while j <= k do
         begin
              z := z xor (b[j] shl 8);
              if (j+1) <= k then z := z xor b[j+1]; //dla callsigns z nieparzystą liczbą znaków
              j:=j+2;
         end;
         z := (z and y);
        str(z,s);
        hash := s;
    Edit2.text := hash;
end;
end.

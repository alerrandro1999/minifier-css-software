unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, Vcl.Clipbrd;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.Button1Click(Sender: TObject);
var Result, textmemo1 : String;
begin
  textmemo1 := Memo1.Lines.Text;
  Result := StringReplace(textmemo1, #$D#$A, '', [rfReplaceAll]);
  Result := StringReplace(Result, #13#10, '', [rfReplaceAll]);
//  Result := StringReplace(Result, ' ', '', [rfReplaceAll]);

  Memo2.Lines.Clear;
  Memo2.Lines.Add(Result);

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  Clipboard.AsText := Memo2.Lines.Text;
end;

end.

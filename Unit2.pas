unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.StdCtrls, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, Vcl.Clipbrd,
  FMX.Edit;

type
  TForm2 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Button4: TButton;
    Button5: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
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

procedure TForm2.Button3Click(Sender: TObject);
var
 Arquivo: TextFile;
begin

  AssignFile(Arquivo, Edit1.Text + 'style.css');
  Rewrite(Arquivo);
  Writeln(Arquivo, Memo2.Lines.Text);
  CloseFile(Arquivo);
  ShowMessage('Arquivo salvo em' + Edit1.Text);

end;

procedure TForm2.Button4Click(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  Memo2.Lines.Clear;
end;

end.

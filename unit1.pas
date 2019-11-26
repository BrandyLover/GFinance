unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  StdCtrls, ExtCtrls, ValEdit, Grids;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    btAddReceita: TButton;
    gbRecei: TGroupBox;
    ListBox1: TListBox;
    pgGFinance: TPageControl;
    TabelRecei: TStringGrid;
    TSGeral: TTabSheet;
    TSRecei: TTabSheet;
    TSDespe: TTabSheet;
    TSTransfe: TTabSheet;
    procedure btAddReceGeralClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btAddReceGeralClick(Sender: TObject);
begin
  pgGFinance.ActivePage:= TSRecei;
end;

end.


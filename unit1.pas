unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TSGeral: TTabSheet;
    TSRecei: TTabSheet;
    TSDespe: TTabSheet;
    TSTransfe: TTabSheet;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

end.


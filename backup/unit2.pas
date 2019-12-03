unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TnewItemForm }

  TnewItemForm = class(TForm)
    btOk: TButton;
    btCancel: TButton;
    cbContas: TComboBox;
    edVal: TEdit;
    edID: TEdit;
    edData: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
  private

  public
  AddItemFlag : Boolean ;
  end;

var
  newItemForm: TnewItemForm;


implementation
uses
  Unit1;

{$R *.lfm}

{ TnewItemForm }

procedure TnewItemForm.btCancelClick(Sender: TObject);
begin
     AddItemFlag:=FALSE;
     Close;
end;

procedure TnewItemForm.btOkClick(Sender: TObject);
begin
     AddItemFlag:=TRUE;
     Close;
end;

end.


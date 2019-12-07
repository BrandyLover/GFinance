unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TnewTransfForm }

  TnewTransfForm = class(TForm)
    btCancel: TButton;
    btOk: TButton;
    cbContaEntry: TComboBox;
    cbContaExit: TComboBox;
    edData: TEdit;
    edID: TEdit;
    edVal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure btCancelClick(Sender: TObject);
  private

  public
        NewItemFlag : Boolean;
  end;

var
  newTransfForm: TnewTransfForm;

implementation

{$R *.lfm}

{ TnewTransfForm }

procedure TnewTransfForm.btCancelClick(Sender: TObject);
begin
  NewItemFlag:=FALSE;
  Close;

end;

end.


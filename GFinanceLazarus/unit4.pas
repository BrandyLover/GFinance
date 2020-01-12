unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TnewExitForm }

  TnewExitForm = class(TForm)
    btCancel: TButton;
    btOk: TButton;
    cbContas: TComboBox;
    edData: TEdit;
    edData1: TEdit;
    edData2: TEdit;
    edID: TEdit;
    edVal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public
        NewItemFlag: Boolean;
  end;

var
  newExitForm: TnewExitForm;


implementation

{$R *.lfm}

{ TnewExitForm }

procedure TnewExitForm.btOkClick(Sender: TObject);
var
  valor : Double;
  data : TDateTime;
begin
     if  NOT(TryStrToFloat(edVal.Text, valor)) then
         begin
         ShowMessage('Valor de moeda inválido');
         edVal.SetFocus;
         end
     else if  (NOT(TryStrToDate(edData.Text+'/'+edData1.Text+'/'+edData2.Text,data))) then
         begin
         ShowMessage('Valor de data inválida');
         edData.SetFocus;
         end
     else if (Length(edData2.Text) < 4) or (Length(edData2.Text) > 4) then
          begin
               ShowMessage('Valor de Ano inválido');
               edData2.SetFocus;
          end
     else if (cbContas.Text = '') then
         begin
         ShowMessage('Selecione uma conta');
         cbContas.SetFocus;
         end
     else if (edID.Text = '') then
         begin
         ShowMessage('Mensagem de identificação inválida, adicione uma mensagem');
         edID.SetFocus;
         end
     else
     begin
     NewItemFlag:=TRUE;
     Close;
     end;

end;

procedure TnewExitForm.FormActivate(Sender: TObject);
begin
  NewItemFlag:=False;
end;

procedure TnewExitForm.btCancelClick(Sender: TObject);
begin
     NewItemFlag:=FALSE;
     Close;
end;

procedure TnewExitForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
         btOkClick(Sender);
end;

end.


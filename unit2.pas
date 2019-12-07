unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TnewEntryForm }

  TnewEntryForm = class(TForm)
    btOk: TButton;
    btCancel: TButton;
    cbContas: TComboBox;
    edData1: TEdit;
    edData2: TEdit;
    edVal: TEdit;
    edID: TEdit;
    edData: TEdit;
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
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private

  public
  AddItemFlag : Boolean ;
  end;

var
  newEntryForm: TnewEntryForm;


implementation


{$R *.lfm}

{ TnewEntryForm }

procedure TnewEntryForm.btCancelClick(Sender: TObject);
begin
     AddItemFlag:=FALSE;
     Close;
end;

procedure TnewEntryForm.btOkClick(Sender: TObject);
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
     AddItemFlag:=TRUE;
     Close;
     end;
end;

procedure TnewEntryForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
     if Key = 13 then
         btOkClick(Sender);
end;

end.


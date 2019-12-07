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
    cbContaExit: TComboBox;
    cbContaEntry: TComboBox;
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
    Label9: TLabel;
    procedure btCancelClick(Sender: TObject);
    procedure btOkClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private

  public
    NewItemFlag: boolean;
  end;

var
  newTransfForm: TnewTransfForm;

implementation

{$R *.lfm}

{ TnewTransfForm }

procedure TnewTransfForm.btCancelClick(Sender: TObject);
begin
  NewItemFlag := False;
  Close;

end;

procedure TnewTransfForm.btOkClick(Sender: TObject);
var
  valor: double;
  Data: TDateTime;
begin
  if not (TryStrToFloat(edVal.Text, valor)) then
  begin
    ShowMessage('Valor de moeda inválido');
    edVal.SetFocus;
  end
  else if (not (TryStrToDate(edData.Text + '/' + edData1.Text + '/' + edData2.Text, Data)))
  then
  begin
    ShowMessage('Valor de data inválida');
    edData.SetFocus;
  end
  else if (Length(edData2.Text) < 4) or (Length(edData2.Text) > 4) then
  begin
    ShowMessage('Valor de Ano inválido');
    edData2.SetFocus;
  end
  else if (cbContaExit.Text = '') then
  begin
    ShowMessage('Selecione uma conta de saída ou adicione uma em Entradas');
    cbContaExit.SetFocus;
  end
  else if (cbContaEntry.Text = '') then
  begin
    ShowMessage('Selecione uma conta de entrada ou digite uma em caso de transferência para outro dono');
    cbContaEntry.SetFocus;
  end
  else if (edID.Text = '') then
  begin
    ShowMessage('Mensagem de identificação inválida, adicione uma mensagem');
    edID.SetFocus;
  end
  else
  begin
    NewItemFlag := True;
    Close;
  end;
end;




procedure TnewTransfForm.FormKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if Key = 13 then
    btOkClick(Sender);
end;

end.



unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  StdCtrls, ExtCtrls, ValEdit, Grids;

type

  { TMainForm }

  TMainForm = class(TForm)
    btAddReceita: TButton;
    btAddConta: TButton;
    btDelSel: TButton;
    edNewConta: TEdit;
    gbRecei: TGroupBox;
    gbConta: TGroupBox;
    lbConta: TListBox;
    pgGFinance: TPageControl;
    TabelRecei: TStringGrid;
    TSGeral: TTabSheet;
    TSRecei: TTabSheet;
    TSDespe: TTabSheet;
    TSTransfe: TTabSheet;
    procedure btAddContaClick(Sender: TObject);
    procedure btAddReceGeralClick(Sender: TObject);
    procedure btAddReceitaClick(Sender: TObject);
    procedure gbReceiClick(Sender: TObject);
    procedure pgGFinanceChange(Sender: TObject);


  private

  public

  end;

var
  MainForm: TMainForm;

implementation
uses
    Unit2;

{$R *.lfm}

{ TMainForm }

procedure TMainForm.btAddReceGeralClick(Sender: TObject);
begin
  pgGFinance.ActivePage:= TSRecei;
end;



procedure TMainForm.btAddContaClick(Sender: TObject);
begin
     lbConta.Items.Add(edNewConta.Text);
     ShowMessage('Conta Adicionada');
end;

procedure TMainForm.btAddReceitaClick(Sender: TObject);
begin

  newItemForm.cbContas.Items:=lbConta.Items;
  newItemForm.cbContas.ItemIndex:=0;
  newItemForm.cbContas.ReadOnly:=TRUE;
  newItemForm.ShowModal;
  if (newItemForm.CloseQuery) AND (newItemForm.AddItemFlag) then
     begin
          TabelRecei.InsertRowWithValues(TabelRecei.RowCount+1,[newItemForm.edData.Text,newItemForm.edID.Text,newItemForm.cbContas.Text,'R$ '+newItemForm.edVal.Text]);
     end;

end;

procedure TMainForm.gbReceiClick(Sender: TObject);
begin

end;

procedure TMainForm.pgGFinanceChange(Sender: TObject);
begin

end;





end.


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
    btAddSai: TButton;
    btAddTransf: TButton;
    btDelSel: TButton;
    edNewConta: TEdit;
    gbRecei: TGroupBox;
    gbConta: TGroupBox;
    gbSai: TGroupBox;
    gbTransf: TGroupBox;
    lbConta: TListBox;
    pgGFinance: TPageControl;
    TabelRecei: TStringGrid;
    TabelSai: TStringGrid;
    TabelTransf: TStringGrid;
    TSGeral: TTabSheet;
    TSRecei: TTabSheet;
    TSDespe: TTabSheet;
    TSTransfe: TTabSheet;
    procedure btAddContaClick(Sender: TObject);
    procedure btAddReceGeralClick(Sender: TObject);
    procedure btAddReceitaClick(Sender: TObject);
    procedure btAddTransfClick(Sender: TObject);
    procedure btDelSelClick(Sender: TObject);

    procedure pgGFinanceChange(Sender: TObject);


  private

  public

  end;

var
  MainForm: TMainForm;

implementation
uses
    Unit2,Unit3;

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
      newEntryForm.edVal.Clear;
      newEntryForm.edID.Clear;
      newEntryForm.edData.Clear;
      newEntryForm.cbContas.Items:=lbConta.Items;
      newEntryForm.cbContas.ItemIndex:=0;
      newEntryForm.cbContas.ReadOnly:=TRUE;
      newEntryForm.ShowModal;
      if (newEntryForm.CloseQuery) AND (newEntryForm.AddItemFlag) then
         begin
              TabelRecei.InsertRowWithValues(TabelRecei.RowCount,[newEntryForm.edData.Text,newEntryForm.edID.Text,newEntryForm.cbContas.Text,'R$ '+newEntryForm.edVal.Text]);
         end;

end;

procedure TMainForm.btAddTransfClick(Sender: TObject);
begin
      newTransfForm.edVal.Clear;
      newTransfForm.edID.Clear;
      newTransfForm.edData.Clear;
      newTransfForm.cbContaEntry.Items:=lbConta.Items;
      newTransfForm.cbContaEntry.ItemIndex:=0;
      newTransfForm.cbContaEntry.ReadOnly:=TRUE;
      newTransfForm.cbContaExit.Items:=lbConta.Items;
      newTransfForm.cbContaExit.ItemIndex:=0;
      newTransfForm.ShowModal;
end;

procedure TMainForm.btDelSelClick(Sender: TObject);
begin

end;



procedure TMainForm.pgGFinanceChange(Sender: TObject);
begin

end;





end.


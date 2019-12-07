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
    Label1: TLabel;
    lbSaldoConta: TLabel;
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
    procedure edNewContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Label1Click(Sender: TObject);
    procedure lbContaSelectionChange(Sender: TObject; User: boolean);

    procedure pgGFinanceChange(Sender: TObject);
    procedure TabelReceiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


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
      newEntryForm.cbContas.Style:=csDropDownList;
      newEntryForm.ShowModal;
      if (newEntryForm.CloseQuery) AND (newEntryForm.AddItemFlag)  then
         begin
              TabelRecei.InsertRowWithValues(TabelRecei.RowCount,[newEntryForm.edData.Text+'/'+newEntryForm.edData1.Text+'/'+newEntryForm.edData2.Text,newEntryForm.edID.Text,newEntryForm.cbContas.Text,'R$ '+newEntryForm.edVal.Text]);
         end;


end;

procedure TMainForm.btAddTransfClick(Sender: TObject);
begin
      newTransfForm.edVal.Clear;
      newTransfForm.edID.Clear;
      newTransfForm.edData.Clear;
      newTransfForm.cbContaEntry.Items:=lbConta.Items;
      newTransfForm.cbContaEntry.ItemIndex:=0;
      newTransfForm.cbContaEntry.Style:=csDropDownList;
      newTransfForm.cbContaExit.Items:=lbConta.Items;
      newTransfForm.cbContaExit.ItemIndex:=0;
      newTransfForm.ShowModal;
end;

procedure TMainForm.btDelSelClick(Sender: TObject);
begin
      lbConta.DeleteSelected;
end;

procedure TMainForm.edNewContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     btAddContaClick(Sender);
end;

procedure TMainForm.Label1Click(Sender: TObject);
begin

end;

procedure TMainForm.lbContaSelectionChange(Sender: TObject; User: boolean);
var
  ContaSelected : string;
begin
  ContaSelected := lbConta.GetSelectedText;

end;



procedure TMainForm.pgGFinanceChange(Sender: TObject);
begin

end;

procedure TMainForm.TabelReceiKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     btAddReceitaClick(Sender);
end;





end.


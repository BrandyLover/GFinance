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
    BtBGTransf: TButton;
    BtBGDespesa: TButton;
    BtBGEntrada: TButton;
    btBGConta: TButton;
    edNewConta: TEdit;
    gbRecei: TGroupBox;
    gbConta: TGroupBox;
    gbSai: TGroupBox;
    gbTransf: TGroupBox;
    LbSCS: TLabel;
    lbSaldoSelec: TLabel;
    lbSaldoConta: TLabel;
    lbConta: TListBox;
    LbSaldoEmConta: TListBox;
    ListBox1: TListBox;
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
    procedure btAddSaiClick(Sender: TObject);
    procedure btAddTransfClick(Sender: TObject);
    procedure btBGContaClick(Sender: TObject);
    procedure BtBGDespesaClick(Sender: TObject);
    procedure BtBGEntradaClick(Sender: TObject);
    procedure BtBGTransfClick(Sender: TObject);
    procedure btDelSelClick(Sender: TObject);
    procedure edNewContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);

    procedure lbContaSelectionChange(Sender: TObject; User: boolean);

    procedure pgGFinanceChange(Sender: TObject);
    procedure TabelReceiKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabelTransfKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private

  public

  end;

var
  MainForm: TMainForm;


implementation
uses
    Unit2,Unit3,Unit4;

{$R *.lfm}

{ TMainForm }

procedure TMainForm.btAddReceGeralClick(Sender: TObject);
begin
  pgGFinance.ActivePage:= TSRecei;
end;



procedure TMainForm.btAddContaClick(Sender: TObject);
var
  counter : integer = 0;
  k : integer;
begin
     if edNewConta.Text = '' then begin
        ShowMessage('Nome de Conta Inválido');
        edNewConta.SetFocus;
     end
     else begin
          for k:=0 to lbconta.items.count-1 do begin
              if (pos(edNewConta.Text, lbconta.items[k]) > 0) then
                 counter := 1
                 end;
          if counter = 1 then
             ShowMessage('Nome de Conta Já Existente')
          else begin
          lbConta.Items.Add(edNewConta.Text);
          ShowMessage('Conta Adicionada');
          end
          end

end;

procedure TMainForm.btAddReceitaClick(Sender: TObject);
begin
      newEntryForm.edVal.Clear;
      newEntryForm.edID.Clear;
      newEntryForm.edData.Clear;
      newEntryForm.edData1.Clear;
      newEntryForm.edData2.Clear;
      newEntryForm.cbContas.Items:=lbConta.Items;
      newEntryForm.cbContas.ItemIndex:=0;
      newEntryForm.cbContas.Style:=csDropDownList;
      newEntryForm.ShowModal;
      if (newEntryForm.CloseQuery) AND (newEntryForm.AddItemFlag)  then
         begin
              TabelRecei.InsertRowWithValues(TabelRecei.RowCount,[newEntryForm.edData.Text+'/'+newEntryForm.edData1.Text+'/'+newEntryForm.edData2.Text,newEntryForm.edID.Text,newEntryForm.cbContas.Text,'R$ '+newEntryForm.edVal.Text]);
         end;


end;

procedure TMainForm.btAddSaiClick(Sender: TObject);
begin
      newExitForm.edVal.Clear;
      newExitForm.edID.Clear;
      newExitForm.edData.Clear;
      newExitForm.edData1.Clear;
      newExitForm.edData2.Clear;
      newExitForm.cbContas.Items:=lbConta.Items;
      newExitForm.cbContas.ItemIndex:=0;
      newExitForm.cbContas.Style:=csDropDownList;
      newExitForm.ShowModal;
      if (newExitForm.CloseQuery) AND (newExitForm.NewItemFlag)  then
         begin
              TabelSai.InsertRowWithValues(TabelSai.RowCount,[newExitForm.edData.Text+'/'+newExitForm.edData1.Text+'/'+newExitForm.edData2.Text,newExitForm.edID.Text,newExitForm.cbContas.Text,'R$ '+newEntryForm.edVal.Text]);
         end;
end;

procedure TMainForm.btAddTransfClick(Sender: TObject);
begin
      newTransfForm.edVal.Clear;
      newTransfForm.edID.Clear;
      newTransfForm.edData.Clear;
      newTransfForm.edData1.Clear;
      newTransfForm.edData2.Clear;
      newTransfForm.cbContaExit.Items:=lbConta.Items;
      newTransfForm.cbContaExit.ItemIndex:=0;
      newTransfForm.cbContaExit.Style:=csDropDownList;
      newTransfForm.cbContaEntry.Items:=lbConta.Items;
      newTransfForm.cbContaEntry.ItemIndex:=0;
      newTransfForm.ShowModal;
      if (newTransfForm.CloseQuery) AND (newTransfForm.NewItemFlag) then
          TabelTransf.InsertRowWithValues(TabelTransf.RowCount,[newTransfForm.edData.Text+'/'+newTransfForm.edData1.Text+'/'+newTransfForm.edData2.Text,newTransfForm.edID.Text,newTransfForm.cbContaExit.Text,newTransfForm.cbContaEntry.Text,'R$ '+ newTransfForm.edVal.Text]);
end;

procedure TMainForm.btBGContaClick(Sender: TObject);
begin
  TSRecei.Show;
  edNewConta.SetFocus;
end;

procedure TMainForm.BtBGDespesaClick(Sender: TObject);
begin
  TSDespe.Show;
   btAddSaiClick(Sender);
end;

procedure TMainForm.BtBGEntradaClick(Sender: TObject);
begin
  TSRecei.Show;
  btAddReceitaClick(Sender);
end;

procedure TMainForm.BtBGTransfClick(Sender: TObject);
begin
  TSTransfe.Show;
  btAddTransfClick(Sender);

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



procedure TMainForm.lbContaSelectionChange(Sender: TObject; User: boolean);

begin

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

procedure TMainForm.TabelTransfKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     btAddTransfClick(Sender);
end;





end.


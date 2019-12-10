unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, Menus,
  StdCtrls, ExtCtrls, ValEdit, Grids, Buttons;

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
    gbContasBG: TGroupBox;
    ImageList1: TImageList;
    LbSCS: TLabel;
    lbSaldoSelec: TLabel;
    lbSaldoConta: TLabel;
    lbConta: TListBox;
    lbContasBG: TListBox;
    pgGFinance: TPageControl;
    TabelRecei: TStringGrid;
    TabelSai: TStringGrid;
    TabelTransf: TStringGrid;
    ToolBar1: TToolBar;
    tbNovo: TToolButton;
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
    procedure FormCloseQuery(Sender: TObject; var CanClose: boolean);
    procedure FormCreate(Sender: TObject);

    procedure lbContasBGSelectionChange(Sender: TObject; User: boolean);
    procedure tbNovoClick(Sender: TObject);

    procedure UpdateConta(Sender: TObject);
    function SaldoTableSearch(Conta: String): Real;
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
  PreviousSelec: string;


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
          UpdateConta(Sender);
          ShowMessage('Conta Adicionada');
          end;
        end;
     edNewConta.Clear;
end;

procedure TMainForm.UpdateConta(Sender : TObject);
begin
     lbContasBG.Items := lbConta.Items;
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
              TabelSai.InsertRowWithValues(TabelSai.RowCount,[newExitForm.edData.Text+'/'+newExitForm.edData1.Text+'/'+newExitForm.edData2.Text,newExitForm.edID.Text,newExitForm.cbContas.Text,'R$ '+newExitForm.edVal.Text]);
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
      UpdateConta(Sender);
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: boolean);
begin
  TabelRecei.SaveToCSVFile('TabelRecei.savearq');
  TabelSai.SaveToCSVFile('TabelSai.savearq');
  TabelTransf.SaveToCSVFile('TabelTransf.savearq');
  lbConta.Items.SaveToFile('Contas.savearq');

end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  if NOT FileExists('TabelRecei.savearq') then
     TabelRecei.SaveToCSVFile('TabelRecei.savearq')
  else
      TabelRecei.LoadFromCSVFile('TabelRecei.savearq');
  if NOT FileExists('TabelSai.savearq') then
     TabelSai.SaveToCSVFile('TabelSai.savearq')
  else
      TabelSai.LoadFromCSVFile('TabelSai.savearq');
  if NOT FileExists('TabelTransf.savearq') then
     TabelTransf.SaveToCSVFile('TabelTransf.savearq')
  else
      TabelTransf.LoadFromCSVFile('TabelTransf.savearq');
  if NOT FileExists('Contas.savearq') then
     lbConta.Items.SaveToFile('Contas.savearq')
     else
         lbConta.Items.LoadFromFile('Contas.savearq');

  UpdateConta(Sender);
end;



procedure TMainForm.lbContasBGSelectionChange(Sender: TObject; User: boolean);
var
  SaldoProcurado: Real;
begin
  if lbContasBG.ItemIndex >= 0 then
     begin
     SaldoProcurado:=SaldoTableSearch(lbContasBG.Items.Strings[lbContasBG.ItemIndex]);
     lbSaldoSelec.Caption:='R$ '+FloatToStr(SaldoProcurado);
     if SaldoProcurado < 0 then
        lbSaldoSelec.Font.Color:= clRed
     else if SaldoProcurado = 0 then
          lbSaldoSelec.Font.Color:=clBlack
        else
             lbSaldoSelec.Font.Color:=clGreen;

     end;
end;

procedure TMainForm.tbNovoClick(Sender: TObject);
begin
  if MessageDlg('Novo Arquivo de Registro','Deseja apagar os arquivos salvos e começar um novo arquivo de registro?'+sLineBreak+' AVISO: APAGA TODOS OS DADOS SALVOS!!!',mtConfirmation,[mbYes,mbNo],0) = mrYes then
     begin
     TabelRecei.Clear;
     TabelSai.Clear;
     TabelTransf.Clear;
     lbConta.Clear;
     TabelRecei.SaveToCSVFile('TabelRecei.savearq');
  TabelSai.SaveToCSVFile('TabelSai.savearq');
  TabelTransf.SaveToCSVFile('TabelTransf.savearq');
  lbConta.Items.SaveToFile('Contas.savearq');
  UpdateConta(Sender);
     end;
end;



procedure TMainForm.edNewContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then
     btAddContaClick(Sender);
end;

function TMainForm.SaldoTableSearch(Conta: String) : Real;
var
  Conter : Integer;
  AccEntry,AccExit,AccTransfEntry,AccTransfExit,Saldo : Real;

begin
  AccEntry:=0;
  AccExit:=0;
  AccTransfEntry:=0;
  AccTransfExit:=0;
  for Conter:=0 to TabelRecei.RowCount -1 do begin
                //AccEntry:=1;
                if (TabelRecei.Cells[2,Conter].Equals(Conta)) then
                   begin
                        //AccEntry:=2;
                       AccEntry:= AccEntry + StrToFloat(TabelRecei.Cells[3,Conter].Remove(0,3));
                   end;
  end;
  for Conter:=0 to TabelSai.RowCount -1 do begin
                //AccEntry:=1;
                if (TabelSai.Cells[2,Conter].Equals(Conta)) then
                   begin
                        //AccEntry:=2;
                       AccExit:= AccExit + StrToFloat(TabelSai.Cells[3,Conter].Remove(0,3));
                   end;
  end;
  for Conter:=0 to TabelTransf.RowCount -1 do begin
                //AccEntry:=1;
                if (TabelTransf.Cells[2,Conter].Equals(Conta)) then
                   begin
                        //AccEntry:=2;
                       AccTransfExit:= AccTransfExit + StrToFloat(TabelTransf.Cells[4,Conter].Remove(0,3));
                   end;
  end;
  for Conter:=0 to TabelTransf.RowCount -1 do begin
                //AccEntry:=1;
                if (TabelTransf.Cells[3,Conter].Equals(Conta)) then
                   begin
                        //AccEntry:=2;
                       AccTransfEntry:= AccTransfEntry + StrToFloat(TabelTransf.Cells[4,Conter].Remove(0,3));
                   end;
  end;
  Saldo:=AccEntry-AccExit+AccTransfEntry-AccTransfExit;
  result := Saldo;
  //ShowMessage(FloatToStr(Saldo));


  //ShowMessage(Conta+' '+FloatToStr(AccEntry)+' '+ TabelRecei.Cells[2,Conter]+' '+TabelRecei.Cells[3,Conter]);

end;

procedure TMainForm.lbContaSelectionChange(Sender: TObject; User: boolean);
var
   SaldoProcurado: Real;
begin
     if lbConta.ItemIndex >= 0 then
     begin
     lbContasBG.ItemIndex:=lbConta.ItemIndex;
     SaldoProcurado:=SaldoTableSearch(lbContasBG.Items.Strings[lbContasBG.ItemIndex]);
     lbSaldoSelec.Caption:='R$ '+FloatToStr(SaldoProcurado);
     if SaldoProcurado < 0 then
        lbSaldoSelec.Font.Color:= clRed
     else if SaldoProcurado = 0 then
          lbSaldoSelec.Font.Color:=clBlack
        else
             lbSaldoSelec.Font.Color:=clGreen;

     end;

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


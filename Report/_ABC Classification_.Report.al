report 51000 "ABC Classification"
{
    //UsageCategory = ReportsAndAnalysis;
    //ApplicationArea = All;
    Caption = 'ABC Classification';
    DefaultLayout = RDLC;
    RDLCLayout = 'ABCClassification.rdl';

    dataset
    {
        dataitem(Item;Item)
        {
            DataItemTableView = sorting("No.");

            column(No;"No.")
            {
            }
            column(Description;Description)
            {
            }
            column(ItemCategoryCode;"Item Category Code")
            {
            }
            column(ABCClassificationCapLbl;ABCClassificationCapLbl)
            {
            }
            column(FromDateCapLbl;FromDateCapLbl)
            {
            }
            column(ToDateCapLbl;ToDateCapLbl)
            {
            }
            column(CertACapLbl;CertACapLbl)
            {
            }
            column(CertBCapLbl;CertBCapLbl)
            {
            }
            column(CertCCapLbl;CertCCapLbl)
            {
            }
            column(ABCModelCapLbl;ABCModelCapLbl)
            {
            }
            column(TotalAmountCapLbl;TotalAmountCapLbl)
            {
            }
            column(ItemGroupCapLbl;ItemGroupCapLbl)
            {
            }
            column(ItemNoCapLbl;ItemNoCapLbl)
            {
            }
            column(ItemNameCapLbl;ItemNameCapLbl)
            {
            }
            column(CalculatedCapLbl;CalculatedCapLbl)
            {
            }
            column(AmountCapLbl;AmountCapLbl)
            {
            }
            column(InventoryCapLbl;InventoryCapLbl)
            {
            }
            column(QuantityCapLbl;QuantityCapLbl)
            {
            }
            column(StartDate;StartDate)
            {
            }
            column(EndDate;EndDate)
            {
            }
            column(CertA;CertA)
            {
            }
            column(CertB;CertB)
            {
            }
            column(CertC;CertC)
            {
            }
            column(ABCModel;ABCModel)
            {
            }
            column(Classified;Classified)
            {
            }
            column(TotalILEAmount;TotalILEAmount)
            {
            }
            column(TotalILEQuantity;TotalILEQuantity)
            {
            }
            column(ILEQuantity;ILEQuantity)
            {
            }
            column(ILEAmount;ILEAmount)
            {
            }
            trigger OnPreDataItem()var ILERec: Record "Item Ledger Entry";
            begin
                if ItemCategoryCode <> '' then Item.SetRange("Item Category Code", ItemCategoryCode);
                CheckDates();
                CheckClassification();
                TotalILEQuantity:=0;
                TotalILEAmount:=0;
                if ABCModel = ABCModel::Inventory then begin
                    ILERec.Reset();
                    ILERec.SetLoadFields(Quantity);
                    ILERec.SetRange("Posting Date", StartDate, EndDate);
                    if ItemCategoryCode <> '' then ILERec.SetRange("Item Category Code", ItemCategoryCode);
                    if ILERec.FindSet()then begin
                        ILERec.CalcSums(quantity);
                        TotalILEQuantity:=ILERec.Quantity;
                    end;
                end
                else if ABCModel = ABCModel::Value then begin
                        ILERec.Reset();
                        ILERec.SetLoadFields("Cost Amount (Actual)", "Cost Amount (Expected)");
                        ILERec.SetRange("Posting Date", StartDate, EndDate);
                        if ItemCategoryCode <> '' then ILERec.SetRange("Item Category Code", ItemCategoryCode);
                        ILERec.SetAutoCalcFields("Cost Amount (Actual)", "Cost Amount (Expected)");
                        if ILERec.FindSet()then repeat TotalILEAmount+=ILERec."Cost Amount (Actual)" + ILERec."Cost Amount (Expected)";
                            until ILERec.Next() = 0;
                    end;
            end;
            trigger OnAfterGetRecord()var ItemLedgerEntry: Record "Item Ledger Entry";
            begin
                ILEQuantity:=0;
                ILEAmount:=0;
                ILEQtyPercent:=0;
                if ABCModel = ABCModel::Inventory then begin
                    ItemLedgerEntry.Reset();
                    ItemLedgerEntry.SetLoadFields(quantity);
                    ItemLedgerEntry.SetRange("Item No.", Item."No.");
                    ItemLedgerEntry.SetRange("Posting Date", StartDate, EndDate);
                    if ItemCategoryCode <> '' then ItemLedgerEntry.SetRange("Item Category Code", ItemCategoryCode);
                    if ItemLedgerEntry.FindSet()then begin
                        ItemLedgerEntry.calcsums(quantity);
                        ILEQuantity:=ItemLedgerEntry.Quantity;
                        ILEQtyPercent:=ILEQuantity / TotalILEQuantity * 100;
                    end;
                    GetClassification(ILEQtyPercent, Classified);
                end
                else if ABCModel = ABCModel::Value then begin
                        ItemLedgerEntry.Reset();
                        ItemLedgerEntry.SetLoadFields("Cost Amount (Actual)", "Cost Amount (Expected)");
                        ItemLedgerEntry.SetRange("Item No.", Item."No.");
                        ItemLedgerEntry.SetRange("Posting Date", StartDate, EndDate);
                        if ItemCategoryCode <> '' then ItemLedgerEntry.SetRange("Item Category Code", ItemCategoryCode);
                        ItemLedgerEntry.SetAutoCalcFields("Cost Amount (Actual)", "Cost Amount (Expected)");
                        if ItemLedgerEntry.FindSet()then repeat ILEAmount+=ItemLedgerEntry."Cost Amount (Actual)" + ItemLedgerEntry."Cost Amount (Expected)";
                                ILEAmountPercent:=ILEAmount / TotalILEAmount * 100;
                            until ItemLedgerEntry.Next() = 0;
                        GetClassification(ILEAmountPercent, Classified);
                    end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Filters)
                {
                    field(ItemCategoryCode;ItemCategoryCode)
                    {
                        Caption = 'Item Category Code';
                        ApplicationArea = All;
                        TableRelation = "Item Category";
                    }
                    field(StartDate;StartDate)
                    {
                        Caption = 'Start Date';
                        ApplicationArea = All;
                    }
                    field(EndDate;EndDate)
                    {
                        Caption = 'End Date';
                        ApplicationArea = All;
                    }
                    field(CertA;CertA)
                    {
                        Caption = 'A: Highest';
                        ApplicationArea = All;
                    }
                    field(CertB;CertB)
                    {
                        Caption = 'B: Medium';
                        ApplicationArea = All;
                    }
                    field(CertC;CertC)
                    {
                        Caption = 'C: Lowest';
                        ApplicationArea = All;
                    }
                    field(ABCModels;ABCModel)
                    {
                        Caption = 'ABC Model';
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    var StartDate: Date;
    EndDate: Date;
    CertA: Decimal;
    CertB: Decimal;
    CertC: Decimal;
    ABCModel: Option Inventory, Value;
    ABCClassificationCapLbl: Label 'ABC classification';
    FromDateCapLbl: Label 'From Date: ';
    ToDateCapLbl: Label 'To Date: ';
    CertACapLbl: Label 'A: Highest - ';
    CertBCapLbl: Label 'B: Medium - ';
    CertCCapLbl: Label 'C: Lowest - ';
    ABCModelCapLbl: Label 'ABC Model: ';
    TotalAmountCapLbl: Label 'Total Amount: ';
    ItemGroupCapLbl: Label 'Item Group';
    ItemNoCapLbl: Label 'Item No.';
    ItemNameCapLbl: Label 'Item Name';
    CalculatedCapLbl: Label 'Calculated';
    AmountCapLbl: Label 'Amount';
    InventoryCapLbl: Label 'Inventory';
    Classified: Option A, B, C;
    ILEQuantity: Decimal;
    ILEAmount: Decimal;
    TotalILEAmount: Decimal;
    TotalILEQuantity: Decimal;
    ILEQtyPercent: Decimal;
    ILEAmountPercent: Decimal;
    QuantityCapLbl: Label 'Quantity';
    ItemCategoryCode: code[20];
    local procedure GetClassification(CalcValue: Decimal;
    var Classification: Option A, B, C)begin
        if CalcValue > CertA then Classification:=Classification::A
        else if CalcValue < (CertA + CertB)then Classification:=Classification::B
            else
                Classification:=Classification::C;
    end;
    local procedure CheckDates()begin
        if(StartDate = 0D) or (EndDate = 0D)then error('Start and End dates must be filled.');
    end;
    local procedure CheckClassification()begin
        if(CertA + CertB + CertC) <> 100 then error('The sum of ABC classification must be equal to 100.');
    end;
}

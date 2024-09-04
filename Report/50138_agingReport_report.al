report 50138 "Inventory Ageing Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Layouts/Item Ageing.rdl';
    Caption = 'Inventory Ageing Report_50138';


    dataset
    {

        dataitem("Item Ledger Entry"; "Item Ledger Entry")
        {
            RequestFilterFields = "Location Code", "Item No.";
            CalcFields = "Cost Amount (Actual)", "Cost Amount (Expected)";
            column(AvailableStockLbl; AvailableStockLbl)
            {

            }
            column(Remaining_Quantity; "Remaining Quantity")
            {

            }
            column(CompanyInformation; CompanyInformation.Picture)
            {

            }
            Column(CompanyInformationName; CompanyInformation.Name)
            {

            }
            column(CompanyInformationAddress; CompanyInformation.Address)
            {

            }
            column(TitleCaplBl; TitleCaplBl)
            {

            }
            column(Cost_Amount__Actual_; "Cost Amount (Actual)")
            {

            }
            column(Cost_Amount__Expected_; "Cost Amount (Expected)")
            {

            }
            column(StartDatecapLbl; StartDatecapLbl)
            {

            }
            column(EndDateCapLbl; EndDateCapLbl)
            {

            }
            column(StartDateGVar; Format(StartDateGVar, 0, '<Day,2>-<Month,2>-<Year4>'))
            {

            }
            column(EndDateGVar; Format(EndDateGVar, 0, '<Day,2>-<Month,2>-<Year4>'))
            {

            }
            column(BranchCodeCapLbl; BranchCodeCapLbl)
            {
            }
            column(LocationNameCapLb; LocationNameCapLb)
            {

            }
            column(ItemCodeCapLbl; ItemCodeCapLbl)
            {

            }
            column(ItemDescriptionCapLbl; ItemDescriptionCapLbl)
            {

            }
            column(UOMCapLbl; UOMCapLbl)
            {

            }
            column(ItemTypeCapLbl; ItemTypeCapLbl)
            {

            }
            column(InwardStockQtyCapLbl; InwardStockQtyCapLbl)
            {

            }
            column(StockValueCapLbl; StockValueCapLbl)
            {

            }
            column(AvarageStockValueCapLbl; AvarageStockValueCapLbl)
            { }
            column(LastInwardDateCapLbl; LastInwardDateCapLbl)
            {

            }
            column(LastOutwarddateCapLbl; LastOutwarddateCapLbl)
            {

            }
            column(StockAgeinginDaysCapLbl; StockAgeinginDaysCapLbl)
            {

            }
            column(Global_Dimension_1_Code; "Global Dimension 1 Code")
            {

            }
            column(Location_Code; "Location Code")
            {

            }
            column(Item_No_; "Item No.")
            {

            }
            column(Description; Description)
            {

            }
            column(Unit_of_Measure_Code; "Unit of Measure Code")
            {

            }
            column(Item_Category_Code; "Item Category Code")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(StockValue; CostAmount)
            {

            }
            column(Posting_Date; Format("Posting Date", 0, '<Day,2>-<Month,2>-<Year4>'))
            {

            }
            column(LastOutwardDate; Format(LastOutwardDate, 0, '<Day,2>-<Month,2>-<Year4>'))
            {

            }
            column(StockAgeinginDays; Abs(Today() - "Posting Date"))
            {

            }

            column(Remarks; Remarks)
            {

            }
            column(RemarksCapLbl; RemarksCapLbl)
            {

            }
            column(LastDirectCost; LastDirectCost)
            { }
            column(SV; SV) { }
            column(location_Name; locationName)
            { }
            column(Item_Description; ItemDescription)
            {

            }
            trigger OnPreDataItem()
            begin
                "Item Ledger Entry".Setrange("Posting Date", StartDateGVar, EndDateGVar);
                "Item Ledger Entry".SetFilter("Entry Type", '%1|%2|%3|%4', "Entry Type"::Purchase, "Entry Type"::Transfer, "Entry Type"::"Positive Adjmt.", "Entry Type"::Output);
                "Item Ledger Entry".SetFilter("Document Type", '%1|%2|%3|%4', "Document Type"::" ", "Document Type"::"Purchase Receipt", "Document Type"::"Purchase Invoice", "Document Type"::"Transfer Receipt");
                "Item Ledger Entry".SetRange(Open, true);
            end;

            trigger OnAfterGetRecord()
            var
                ItemLedgerEntry: Record "Item Ledger Entry";
                TempItemLedgerEntry: Record "Item Ledger Entry" temporary;
                LocationLrec: Record Location;
                ItemLrec: Record Item;
            begin
                Clear(locationName);
                Clear(ItemDescription);
                LocationLrec.Reset();
                LocationLrec.SetRange(Code, "Item Ledger Entry"."Location Code");
                if LocationLrec.FindSet() then
                    locationName := LocationLrec.Name;

                ItemLrec.Reset();
                ItemLrec.SetRange("No.", "Item Ledger Entry"."Item No.");
                if ItemLrec.FindSet() then
                    ItemDescription := ItemLrec.Description;

                if ItemRec.Get("Item No.") then
                    LastDirectCost := ItemRec."Last Direct Cost";

                SV := ("Cost Amount (Actual)" / Quantity) * "Remaining Quantity";


                if (Abs(Today() - "Posting Date") > 0) And (Abs(Today() - "Posting Date") <= 30) then
                    Remarks := '0-30 Days'
                else
                    if (Abs(Today() - "Posting Date") > 30) And (Abs(Today() - "Posting Date") <= 60) then
                        Remarks := '30-60 Days'
                    else
                        if (Abs(Today() - "Posting Date") > 60) And (Abs(Today() - "Posting Date") <= 90) then
                            Remarks := '60-90 Days'
                        else
                            if (Abs(Today() - "Posting Date") > 90) And (Abs(Today() - "Posting Date") <= 180) then
                                Remarks := '90-180 Days'
                            else
                                if (Abs(Today() - "Posting Date") >= 180) then
                                    Remarks := 'Above 180 Days';
                PurchageFieldsUpdate("Item Ledger Entry");
            End;

        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(StartDateGVar; StartDateGVar)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';

                    }

                    field(EndDateGVar; EndDateGVar)
                    {
                        ApplicationArea = All;
                        Caption = 'End Date';

                    }

                }

            }
        }
        trigger OnOpenPage()
        var
            myInt: Integer;
        begin
            EndDateGVar := WorkDate()
        end;
    }
    trigger OnPreReport()
    begin
        if CompanyInformation.get() then
            CompanyInformation.CalcFields(Picture);

    end;

    procedure FindAppliedEntries(ItemLedgEntry: Record "Item Ledger Entry"; var TempItemLedgerEntry: Record "Item Ledger Entry" temporary)
    var
        ItemApplnEntry: Record "Item Application Entry";
    begin
        //with ItemLedgEntry do
        if ItemLedgEntry.Positive then begin
            ItemApplnEntry.Reset();
            ItemApplnEntry.SetCurrentKey("Inbound Item Entry No.", "Outbound Item Entry No.", "Cost Application");
            ItemApplnEntry.SetRange("Inbound Item Entry No.", ItemLedgEntry."Entry No.");
            ItemApplnEntry.SetFilter("Outbound Item Entry No.", '<>%1', 0);
            ItemApplnEntry.SetRange("Cost Application", true);
            if ItemApplnEntry.Find('-') then
                repeat
                    InsertTempEntry(TempItemLedgerEntry, ItemApplnEntry."Outbound Item Entry No.", ItemApplnEntry.Quantity, ItemApplnEntry."Posting Date");
                until ItemApplnEntry.Next() = 0;
        end else begin
            ItemApplnEntry.Reset();
            ItemApplnEntry.SetCurrentKey("Outbound Item Entry No.", "Item Ledger Entry No.", "Cost Application");
            ItemApplnEntry.SetRange("Outbound Item Entry No.", ItemLedgEntry."Entry No.");
            ItemApplnEntry.SetRange("Item Ledger Entry No.", ItemLedgEntry."Entry No.");
            ItemApplnEntry.SetRange("Cost Application", true);
            if ItemApplnEntry.Find('-') then
                repeat
                    InsertTempEntry(TempItemLedgerEntry, ItemApplnEntry."Inbound Item Entry No.", -ItemApplnEntry.Quantity, ItemApplnEntry."Posting Date");
                until ItemApplnEntry.Next() = 0;
        end;
    end;

    local procedure InsertTempEntry(var TempItemLedgerEntry: Record "Item Ledger Entry" temporary; EntryNo: Integer; AppliedQty: Decimal; LastOutwardDate: Date)
    var
        ItemLedgEntry: Record "Item Ledger Entry";
        IsHandled: Boolean;
    begin
        ItemLedgEntry.Get(EntryNo);

        IsHandled := false;
        if IsHandled then
            exit;

        if AppliedQty * ItemLedgEntry.Quantity < 0 then
            exit;

        if not TempItemLedgerEntry.Get(EntryNo) then begin
            TempItemLedgerEntry.Init();
            TempItemLedgerEntry := ItemLedgEntry;
            TempItemLedgerEntry.Quantity := AppliedQty;
            TempItemLedgerEntry."Posting Date" := LastOutwardDate;
            TempItemLedgerEntry.Insert();
        end else begin
            TempItemLedgerEntry.Quantity := TempItemLedgerEntry.Quantity + AppliedQty;
            TempItemLedgerEntry."Posting Date" := LastOutwardDate;
            TempItemLedgerEntry.Modify();
        end;
    end;

    local procedure PurchageFieldsUpdate(ItemLedgerEntry: Record "Item Ledger Entry"): Date
    var
        Item: Record Item;
        ILE: Record "Item Ledger Entry";
        ILE2: Record "Item Ledger Entry";
        Application: Record "Item Application Entry";
        Application2: Record "Item Application Entry";
        TempItemLedgerEntry: Record "Item Ledger Entry" temporary;
    begin
        //  with ItemLedgerEntry do begin
        if ItemLedgerEntry.Quantity > 0 then begin
            Application.Reset();
            Application.SetRange("Inbound Item Entry No.", ItemLedgerEntry."Entry No.");
            Application.SetFilter("Item Ledger Entry No.", '<>%1', ItemLedgerEntry."Entry No.");
            if Application.FindFirst() then
                repeat
                    if ILE.get(Application."Inbound Item Entry No.") then begin
                        //  if (ILE."Entry Type" = ILE."Entry Type" in [Purchase] then begin
                        FindAppliedEntries(ItemLedgerEntry, TempItemLedgerEntry);
                        if TempItemLedgerEntry.FindSet() then
                            repeat
                                //if TempItemLedgerEntry."Entry Type" = TempItemLedgerEntry."Entry Type"::Consumption then begin
                                // RPONo := TempItemLedgerEntry."Document No.";
                                LastOutwardDate := TempItemLedgerEntry."Posting Date";
                            // ProjectCode := TempItemLedgerEntry."Global Dimension 2 Code";
                            until TempItemLedgerEntry.Next() = 0;
                    end;
                //   end;
                //end;
                until Application.Next() = 0;

        end;


    End;


    var
        CompanyInformation: Record "Company Information";
        AvailableStockLbl: Label 'Available Stock';
        TitleCaplBl: Label 'Inventory Ageing Report';
        StartDatecapLbl: Label 'Start Date';
        EndDateCapLbl: Label 'End Date';
        BranchCodeCapLbl: Label 'Branch Code';
        LocationNameCapLb: Label 'Location Name';
        ItemCodeCapLbl: Label 'Item Code';
        ItemDescriptionCapLbl: Label 'Item Description';
        UOMCapLbl: Label 'UOM';
        ItemTypeCapLbl: Label 'Item Type';
        InwardStockQtyCapLbl: Label 'Inward Stock Qty';
        StockValueCapLbl: Label 'Stock Value';
        AvarageStockValueCapLbl: Label 'Avarage Stock Value';
        LastInwardDateCapLbl: Label 'Last Inward Date';
        LastOutwarddateCapLbl: Label 'Last Outward Date';
        StockAgeinginDaysCapLbl: Label 'Stock Ageing In Days';
        RemarksCapLbl: Label 'Remarks';
        ItemLedgerEntriesRec: Record "Item Ledger Entry";
        LocationCode: Code[10];
        ItemCode: Code[20];
        StartDateGVar: Date;

        //TransPaymEntry_l: Record "LSC Trans. Payment Entry";
        EndDateGVar: Date;
        Remarks: Text;
        StockAgeinginDays: Integer;
        LastOutwardDate: Date;
        StockAgeing: Date;
        ItemLedgerEntriesRec1: Record "Item Ledger Entry";
        CostAmount: Decimal;
        ItemRec: Record Item;
        LastDirectCost: Decimal;
        SV: Decimal;
        locationName: Text[20];
        ItemDescription: Text[30];
}
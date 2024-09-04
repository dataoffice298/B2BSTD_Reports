report 50008 "Aging of Items Report"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;
    Caption = 'Item Ageing Report';

    dataset
    {
        dataitem(Item; Item)
        {
            trigger OnAfterGetRecord()
            begin
                CalcFields(Inventory);
                Clear(UnitCostRec);
                Clear(GrandTotalQty);
                Clear(ItemQuantity);
                Clear(GrandTotalvalue);
                Clear(GrandTotalvalue);
                if Item.Inventory = 0 then
                    CurrReport.Skip();
                ItemLedgerEntry.Reset();
                ItemLedgerEntry.SetCurrentKey("Posting Date");
                ItemLedgerEntry.SetRange("Location Code", locationCode);
                ItemLedgerEntry.SetFilter("Entry Type", '%1|%2|%3', ItemLedgerEntry."Entry Type"::Purchase, ItemLedgerEntry."Entry Type"::"Positive Adjmt.", ItemLedgerEntry."Entry Type"::Output);
                ItemLedgerEntry.SetFilter("Remaining Quantity", '<>%1', 0);
                ItemLedgerEntry.SetFilter("Posting Date", '<=%1', EndDate);
                ItemLedgerEntry.SetRange("Item No.", "No.");
                if not ItemLedgerEntry.FindSet() then
                    CurrReport.Skip()
                else
                    repeat
                        ItemQuantity[GetPeriodIndex(ItemLedgerEntry."Posting Date")] += ItemLedgerEntry."Remaining Quantity";
                    until ItemLedgerEntry.Next() = 0;
                GrandTotalQty := ItemQuantity[9] + ItemQuantity[8] + ItemQuantity[7] + ItemQuantity[6] + ItemQuantity[5] + ItemQuantity[4] + ItemQuantity[3];
                itemUnitcost[i] := Item."Unit Cost";
                GrandTotalvalue := ItemQuantity[9] * "Unit Cost" + ItemQuantity[8] * "Unit Cost" + ItemQuantity[7] * "Unit Cost" + ItemQuantity[6] * "Unit Cost" + ItemQuantity[5] * "Unit Cost" + ItemQuantity[4] * "Unit Cost" + ItemQuantity[3] * "Unit Cost";
                WindPa.Update(1, "No.");
                TempExcelBuffer.NewRow();
                TempExcelBuffer.AddColumn("No.", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(Description, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn("Base Unit of Measure", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(ItemQuantity[9], false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(ItemQuantity[9] * "Unit Cost", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(ItemQuantity[8], false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(ItemQuantity[8] * "Unit Cost", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(ItemQuantity[7], false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(ItemQuantity[7] * "Unit Cost", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(ItemQuantity[6], false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(ItemQuantity[6] * "Unit Cost", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(ItemQuantity[5], false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(ItemQuantity[5] * "Unit Cost", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(ItemQuantity[4], false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(ItemQuantity[4] * "Unit Cost", false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(ItemQuantity[3], false, '', false, false, false, '', TempExcelBuffer."Cell Type"::Text);
                TempExcelBuffer.AddColumn(ItemQuantity[3] * "Unit Cost", FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(GrandTotalQty, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
                TempExcelBuffer.AddColumn(GrandTotalvalue, FALSE, '', FALSE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Number);
            end;


            trigger OnPreDataItem()
            var
                PeriodLength1V: Code[10];
                PeriodLength2V: Code[10];
                PeriodLength3V: Code[10];
                PeriodLength4V: Code[10];
                PeriodLength5V: Code[10];
                PeriodLength6V: Code[10];
                PeriodLength7V: Code[10];
                txtError: Label 'The period length needs to be specified.';
                TxtError1: Label 'End Date must have a value.';
                TxtError2: Label 'start Date must have a value.';
            begin
                if StartDate = 0D then
                    Error(TxtError2);
                if EndDate = 0D then
                    Error(TxtError1);
                PeriodLength1V := Format(PeriodLength1);
                if PeriodLength1V = '' then
                    ERROR(txtError);
                PeriodLength2V := Format(PeriodLength2);
                if PeriodLength2V = '' then
                    ERROR(txtError);
                PeriodLength3V := Format(PeriodLength3);
                if PeriodLength3V = '' then
                    ERROR(txtError);
                PeriodLength4V := Format(PeriodLength4);
                if PeriodLength4V = '' then
                    Error(txtError);
                PeriodLength5V := Format(PeriodLength5);
                if PeriodLength5V = '' then
                    Error(txtError);
                PeriodLength6V := Format(PeriodLength6);
                if PeriodLength6V = '' then
                    Error(txtError);
                PeriodLength7V := Format(PeriodLength7);
                if PeriodLength7V = '' then
                    Error(txtError);
                Clear(SNo);
                MakeExcelHeaders();
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group("Date Filters")
                {
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = All;
                        Caption = 'Start Date';
                    }
                    field(EndDate; EndDate)
                    {
                        Caption = 'Ending Date';
                        ApplicationArea = all;
                    }
                    field(locationCode; locationCode)
                    {
                        ApplicationArea = All;
                        Caption = 'location Code';
                        TableRelation = Location;
                    }
                    field(PeriodLength1; PeriodLength1)
                    {
                        Caption = 'Period Length';
                    }
                    field(PeriodLength2; PeriodLength2)
                    {
                        Caption = 'Period Length';
                    }
                    field(PeriodLength3; PeriodLength3)
                    {
                        Caption = 'Period Length';
                    }
                    field(PeriodLength4; PeriodLength4)
                    {
                        Caption = 'Period Length';
                    }
                    field(PeriodLength5; PeriodLength5)
                    {
                        Caption = 'Period Length';
                    }
                    field(PeriodLength6; PeriodLength6)
                    {
                        Caption = 'Period Length';
                    }
                    field(PeriodLength7; PeriodLength7)
                    {
                        Caption = 'Period Length';
                    }
                }
            }
        }
    }

    trigger OnPreReport()
    var
        period: Text[10];
    begin

        // PeriodStartDate[10] := EndDate;
        // PeriodStartDate[9] := EndDate - 1;
        PeriodStartDate[10] := StartDate;
        PeriodEndDate[10] := EndDate;
        PeriodEndDate[9] := EndDate - 1;

        FOR i := 8 DOWNTO 2 DO BEGIN
            IF i = 8 THEN BEGIN
                EVALUATE(PeriodLength1, '30D');
                EVALUATE(PeriodLength1, '-' + FORMAT(PeriodLength1));
                PeriodEndDate[i] := CALCDATE(PeriodLength1, PeriodEndDate[i + 1]);
                Period1 := PeriodEndDate[i + 1] - PeriodEndDate[i];
            END;

            IF i = 7 THEN BEGIN
                EVALUATE(PeriodLength2, '-' + FORMAT(PeriodLength2));
                PeriodEndDate[i] := CALCDATE(PeriodLength2, PeriodEndDate[i + 1]);
                Period2 := PeriodEndDate[i + 2] - PeriodEndDate[i];
            END;

            IF i = 6 THEN BEGIN
                EVALUATE(PeriodLength3, '-' + FORMAT(PeriodLength3));
                PeriodEndDate[i] := CALCDATE(PeriodLength3, PeriodEndDate[i + 1]);
                Period3 := PeriodEndDate[i + 3] - PeriodEndDate[i];
            END;

            IF i = 5 THEN BEGIN
                EVALUATE(PeriodLength4, '-' + FORMAT(PeriodLength4));
                PeriodEndDate[i] := CALCDATE(PeriodLength4, PeriodEndDate[i + 1]);
                Period4 := PeriodEndDate[i + 4] - PeriodEndDate[i];
            END;

            IF i = 4 THEN BEGIN
                EVALUATE(PeriodLength5, '-' + FORMAT(PeriodLength5));
                PeriodEndDate[i] := CALCDATE(PeriodLength5, PeriodEndDate[i + 1]);
                Period5 := PeriodEndDate[i + 5] - PeriodEndDate[i];
            END;

            IF i = 3 THEN BEGIN
                EVALUATE(PeriodLength6, '-' + FORMAT(PeriodLength6));
                PeriodEndDate[i] := CALCDATE(PeriodLength6, PeriodEndDate[i + 1]);
                Period6 := PeriodEndDate[i + 6] - PeriodEndDate[i];
            END;

            IF i = 2 THEN BEGIN
                EVALUATE(PeriodLength7, '-' + FORMAT(PeriodLength7));
                PeriodEndDate[i] := CALCDATE(PeriodLength7, PeriodEndDate[i + 1]);
                Period7 := PeriodEndDate[i + 7] - PeriodEndDate[i];
            END;
        END;
        TempExcelBuffer.DeleteAll();
    end;

    trigger OnPostReport()
    begin
        WindPa.CLOSE();
        // TempExcelBuffer.CreateBookAndOpenExcel('', 'Aging of Items', '', COMPANYNAME, USERID);
        TempExcelBuffer.CreateNewBook('Ageing Report');
        TempExcelBuffer.WriteSheet('Ageing Report', CompanyName, UserId);
        TempExcelBuffer.CloseBook();
        TempExcelBuffer.SetFriendlyFilename('Aging Report');
        TempExcelBuffer.OpenExcel();
    end;

    local procedure GetPeriodIndex(Date: Date): Integer
    var
        i: Integer;
    begin
        for i := 1 to ArrayLen(PeriodEndDate) do begin
            if Date in [PeriodStartDate[i] .. PeriodEndDate[i]] then
                exit(i);
        end;
    end;

    var
        ItemLedgerEntry: Record "Item Ledger Entry";
        TempExcelBuffer: Record "Excel Buffer" temporary;
        LocationGrec: Record Location;
        ItemLedgerEntry2: Record "Item Ledger Entry";
        StartDate: Date;
        EndDate: Date;
        WindPa: Dialog;
        SNo: Integer;
        ValueEntry: Record "Value Entry";
        locationCode: Code[20];
        GrandTotalQty: Decimal;
        GrandTotalvalue: Decimal;
        QuantityVrec: Decimal;
        PeriodStartDate: array[11] of Date;
        PeriodEndDate: array[11] of Date;
        ItemQuantity: array[11] of Decimal;
        itemUnitcost: array[11] of Decimal;
        AgingDays: Integer;
        Location: Code[20];
        UnitCostRec: Decimal;
        i: Integer;
        PeriodLength1: DateFormula;
        PeriodLength2: DateFormula;
        PeriodLength3: DateFormula;
        PeriodLength4: DateFormula;
        PeriodLength5: DateFormula;
        PeriodLength6: DateFormula;
        PeriodLength7: DateFormula;
        Period1: Integer;
        Period2: Integer;
        Period3: Integer;
        Period4: Integer;
        Period5: Integer;
        Period6: Integer;
        Period7: Integer;


    procedure MakeExcelHeaders()
    begin
        WindPa.OPEN('Processing #1###############');
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn(CompanyName, FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Item Ageing Report', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        IF (EndDate <> 0D) THEN
            TempExcelBuffer.AddColumn('Ageing Report on ' + Format(EndDate), FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        if locationCode <> '' then
            TempExcelBuffer.AddColumn('Item Locations -' + locationCode, FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text)
        else
            TempExcelBuffer.AddColumn('Item Locations ALL', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('0-30', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('31-60', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('61-90', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('91-180', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('181-360', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('1-2 Years', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('>2 years ', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.NewRow();
        TempExcelBuffer.AddColumn('Item No.', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Item Description', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('UOM', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quantity', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Value', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quantity', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Value', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('QUANTITY', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Value', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quantity', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Value', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quantity', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Value', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quantity', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Value', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Quantity', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Value', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Total Quantity', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
        TempExcelBuffer.AddColumn('Total Value', FALSE, '', TRUE, FALSE, FALSE, '', TempExcelBuffer."Cell Type"::Text);
    end;

    var
        aging: Report "Aged Accounts Receivable";
        aging1: Report "Item Age Composition - Qty.";
}
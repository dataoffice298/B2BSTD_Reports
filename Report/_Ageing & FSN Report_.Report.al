report 51002 "Ageing & FSN Report"
{
    // version B2BVC
    DefaultLayout = RDLC;
    RDLCLayout = './Ageing & FSN Report.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem(Item;Item)
        {
            DataItemTableView = SORTING("No.")ORDER(Ascending)WHERE(Blocked=CONST(false));
            RequestFilterFields = "Item Category Code", "No.";

            column(ItemCategoryCode_Item;Item."Item Category Code")
            {
            }
            column(BaseUnitofMeasure_Item;Item."Base Unit of Measure")
            {
            }
            column(No_Item;Item."No.")
            {
            }
            column(Description_Item;Item.Description)
            {
            }
            column(Critical_Item;Item.Critical)
            {
            }
            column(HeaderText7;HeaderText[7])
            {
            }
            column(HeaderText6;HeaderText[6])
            {
            }
            column(HeaderText5;HeaderText[5])
            {
            }
            column(HeaderText4;HeaderText[4])
            {
            }
            column(HeaderText3;HeaderText[3])
            {
            }
            column(HeaderText2;HeaderText[2])
            {
            }
            column(HeaderText1;HeaderText[1])
            {
            }
            column(Quantity7;Quantity[7])
            {
            }
            column(Quantity6;Quantity[6])
            {
            }
            column(Quantity5;Quantity[5])
            {
            }
            column(Quantity4;Quantity[4])
            {
            }
            column(Quantity3;Quantity[3])
            {
            }
            column(Quantity2;Quantity[2])
            {
            }
            column(Quantity1;Quantity[1])
            {
            }
            column(Amount7;Amount[7])
            {
            }
            column(Amount6;Amount[6])
            {
            }
            column(Amount5;Amount[5])
            {
            }
            column(Amount4;Amount[4])
            {
            }
            column(Amount3;Amount[3])
            {
            }
            column(Amount2;Amount[2])
            {
            }
            column(Amount1;Amount[1])
            {
            }
            column(TotalQty;TotalQty)
            {
            }
            column(TotalAmt;TotalAmt)
            {
            }
            trigger OnAfterGetRecord();
            begin
                CLEAR(Quantity);
                CLEAR(TotalAmount);
                CLEAR(Amount);
                CLEAR(TotalQty);
                CLEAR(TotalAmt);
                ItemLedgerEntry.RESET;
                ItemLedgerEntry.SETRANGE("Item No.", Item."No.");
                ItemLedgerEntry.SETRANGE("Posting Date", PeriodStartDate[1], PeriodEndDate[1]);
                ItemLedgerEntry.SETRANGE(Open, TRUE);
                IF ItemLedgerEntry.FINDSET THEN REPEAT ItemLedgerEntry.CALCFIELDS("Cost Amount (Actual)");
                        Quantity[1]+=ItemLedgerEntry."Remaining Quantity";
                        TotalAmount:=(ItemLedgerEntry."Cost Amount (Actual)") / (ItemLedgerEntry.Quantity);
                        Amount[1]+=TotalAmount * ItemLedgerEntry."Remaining Quantity";
                    UNTIL ItemLedgerEntry.NEXT = 0;
                FOR i:=2 TO ARRAYLEN(PeriodEndDate)DO BEGIN
                    ItemLedgerEntry.RESET;
                    ItemLedgerEntry.SETRANGE("Item No.", Item."No.");
                    ItemLedgerEntry.SETRANGE(Open, TRUE);
                    IF i = 7 THEN ItemLedgerEntry.SETFILTER("Posting Date", '<%1', PeriodEndDate[i])
                    ELSE
                        ItemLedgerEntry.SETRANGE("Posting Date", PeriodStartDate[i], PeriodEndDate[i]);
                    IF ItemLedgerEntry.FINDSET THEN REPEAT ItemLedgerEntry.CALCFIELDS("Cost Amount (Actual)");
                            Quantity[i]+=ItemLedgerEntry."Remaining Quantity";
                            TotalAmount:=(ItemLedgerEntry."Cost Amount (Actual)") / (ItemLedgerEntry.Quantity);
                            Amount[i]+=TotalAmount * ItemLedgerEntry."Remaining Quantity";
                        UNTIL ItemLedgerEntry.NEXT = 0;
                    TotalQty:=Quantity[1] + Quantity[2] + Quantity[3] + Quantity[4] + Quantity[5] + Quantity[6] + Quantity[7];
                    TotalAmt:=Amount[1] + Amount[2] + Amount[3] + Amount[4] + Amount[5] + Amount[6] + Amount[7];
                END;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(General)
                {
                    field(Date;PostingDate)
                    {
                    }
                }
            }
        }
        actions
        {
        }
    }
    labels
    {
    }
    trigger OnPreReport();
    begin
        CalcDates;
    //MESSAGE('%1',PeriodStartDate[1]);
    //MESSAGE('%1',PeriodEndDate[1]);
    end;
    var Quantity: array[7]of Decimal;
    Amount: array[7]of Decimal;
    TotalAmount: Decimal;
    PeriodStartDate: array[7]of Date;
    PeriodEndDate: array[7]of Date;
    i: Integer;
    EndingDate: Date;
    HeaderText: array[7]of Text[30];
    ItemLedgerEntry: Record "Item Ledger Entry";
    TotalQty: Decimal;
    TotalAmt: Decimal;
    PostingDate: Date;
    local procedure CalcDates();
    begin
        EndingDate:=PostingDate;
        PeriodEndDate[1]:=EndingDate;
        //PeriodStartDate[1] := CALCDATE('-1M',EndingDate + 1);
        PeriodStartDate[1]:=CALCDATE('-30D', EndingDate + 1);
        FOR i:=2 TO ARRAYLEN(PeriodEndDate)DO BEGIN
            PeriodEndDate[i]:=PeriodStartDate[i - 1] - 1;
            /*CASE i OF
              2: PeriodStartDate[i] := CALCDATE('-2M',PeriodEndDate[i] + 1);
              3: PeriodStartDate[i] := CALCDATE('-3M',PeriodEndDate[i] + 1);
              4: PeriodStartDate[i] := CALCDATE('-6M',PeriodEndDate[i] + 1);
              5: PeriodStartDate[i] := CALCDATE('-24M',PeriodEndDate[i] + 1);
              6: PeriodStartDate[i] := CALCDATE('-24M',PeriodEndDate[i] + 1);
            END;*/
            CASE i OF 2: PeriodStartDate[i]:=CALCDATE('-60D', PeriodEndDate[i] + 1);
            3: PeriodStartDate[i]:=CALCDATE('-90D', PeriodEndDate[i] + 1);
            4: PeriodStartDate[i]:=CALCDATE('-185D', PeriodEndDate[i] + 1);
            5: PeriodStartDate[i]:=CALCDATE('-730D', PeriodEndDate[i] + 1);
            6: PeriodStartDate[i]:=CALCDATE('-730D', PeriodEndDate[i] + 1);
            END;
        END;
        i:=1;
        WHILE i < ARRAYLEN(PeriodEndDate)DO BEGIN
            HeaderText[i]:=STRSUBSTNO('%1 - %2 %3', EndingDate - PeriodEndDate[i] + 1, EndingDate - PeriodStartDate[i] + 1, 'days');
            i:=i + 1;
        END;
        HeaderText[i]:=STRSUBSTNO('>%1 %2', EndingDate - PeriodStartDate[i - 1] + 1, 'days');
    end;
}

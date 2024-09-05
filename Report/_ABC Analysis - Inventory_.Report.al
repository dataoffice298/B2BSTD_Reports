report 51001 "ABC Analysis - Inventory"
{
    DefaultLayout = RDLC;
    RDLCLayout = './ABC Analysis - Inventory.rdl';
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem("Value Entry";"Value Entry")
        {
            DataItemTableView = SORTING("Item No.", "Posting Date")WHERE("Item Ledger Entry Type"=filter("Negative Adjmt."|Consumption), "Inventory Posting Group"=FILTER('<>FG'));
            RequestFilterFields = "Item No.", "Posting Date", "Location Code";

            trigger OnAfterGetRecord();
            begin
                TempValueEntry.RESET;
                TempValueEntry.SETRANGE("Item No.", "Value Entry"."Item No.");
                IF TempValueEntry.FINDSET THEN CurrReport.SKIP
                ELSE
                    ValueEntry.RESET;
                ValueEntry.SETRANGE("Item No.", "Value Entry"."Item No.");
                ValueEntry.SetFilter("Item Ledger Entry Type", '%1|%2', "Item Ledger Entry Type"::"Negative Adjmt.", "Item Ledger Entry Type"::Consumption);
                IF GETFILTER("Value Entry"."Posting Date") <> '' THEN BEGIN
                    StartDate:="Value Entry".GETRANGEMIN("Posting Date");
                    EndDate:="Value Entry".GETRANGEMAX("Posting Date");
                    ValueEntry.SETRANGE("Posting Date", StartDate, EndDate);
                END;
                IF GETFILTER("Value Entry"."Location Code") <> '' THEN BEGIN
                    ValueEntry.SETRANGE("Location Code", GETFILTER("Value Entry"."Location Code"));
                END;
                //subbu 21-01-2020>>>
                //subbu 21-01-2020<<<
                ValueEntry.CALCSUMS("Cost Amount (Actual)", "Item Ledger Entry Quantity");
                TotalAmt+=ABS(ValueEntry."Cost Amount (Actual)");
                TempValueEntry.INIT;
                TempValueEntry.TRANSFERFIELDS("Value Entry");
                TempValueEntry."Item Ledger Entry Quantity":=ABS(ValueEntry."Item Ledger Entry Quantity");
                //TempValueEntry."Cost Amount (Actual)" :=ABS("Cost Amount (Expected)") + ABS("Cost Amount (Actual)") ;
                TempValueEntry."Cost Amount (Actual)":=ABS(ValueEntry."Cost Amount (Actual)");
                TempValueEntry.INSERT;
            end;
            trigger OnPreDataItem();
            begin
                TempValueEntry.DELETEALL;
            end;
        }
        dataitem("Temp Value Entry";"Temp Value Entry")
        {
            DataItemTableView = SORTING("Cost Amount (Actual)")ORDER(Descending);

            column(ItemLedgerEntryQuantity_ValueEntry;"Temp Value Entry"."Item Ledger Entry Quantity")
            {
            }
            column(CostAmountActual_ValueEntry;"Temp Value Entry"."Cost Amount (Actual)")
            {
            }
            column(TotalAmt;TotalAmt)
            {
            }
            column(ClassValue;ClassValue)
            {
            }
            dataitem(Item;Item)
            {
                DataItemLink = "No."=FIELD("Item No.");

                column(No_Item;Item."No.")
                {
                }
                column(Description_Item;Item.Description + Item."Description 2")
                {
                }
                column(BaseUnitofMeasure_Item;Item."Base Unit of Measure")
                {
                }
            }
            trigger OnAfterGetRecord();
            begin
                /*
                ItemRec.GET("Temp Value Entry"."Item No.");
                
                ItemNo:= ItemRec."No.";
                Description:=ItemRec.Description + ItemRec."Description 2";
                
                //Description:=ItemRec.Description ;
                */
                //subbu 21-01-2020>>>
                APercentage:=70;
                BPercentage:=90;
                CPercentage:=100;
                IF TotalAmt <> 0 THEN BEGIN
                    ItemPercentage:=(ABS("Cost Amount (Actual)") / TotalAmt) * 100;
                END;
                TotalPercentage+=ROUND(ItemPercentage, 1, '=');
                IF TotalPercentage <= APercentage THEN BEGIN
                    ClassValue:='A';
                END;
                IF(TotalPercentage > APercentage) AND (TotalPercentage <= BPercentage)THEN BEGIN
                    ClassValue:='B';
                END;
                IF(TotalPercentage > BPercentage) AND (TotalPercentage <= CPercentage)THEN BEGIN
                    ClassValue:='C';
                END;
            //subbu 21-01-2020<<<
            /*
                SLNo +=1;
                
                I += 1;
                J += 1;
                Z += 1;
                
                
                IF I <= Class THEN BEGIN
                  ClassValue := 'A';
                END;
                
                IF (J > Class) AND (J <= ClassOne+Class) THEN BEGIN
                  ClassValue := 'B';
                END;
                
                IF Z >  ClassOne+Class THEN BEGIN
                  ClassValue := 'C';
                END;
                */
            //TotalAmt +="Cost Amount (Actual)";
            end;
            trigger OnPreDataItem();
            begin
                SLNo:=0;
                int:=TempValueEntry1.COUNT;
                Class:=ROUND((TempValueEntry1.COUNT / 10), 1, '=');
                ClassOne:=Class * 2;
                //subbu 21-01-2020>>>
                TotalPercentage:=0;
            //subbu 21-01-2020<<<
            end;
        }
    }
    labels
    {
    }
    var ValueEntry: Record 5802;
    SLNo: Integer;
    ItemRec: Record 27;
    TotalAmt: Decimal;
    Class: Integer;
    ClassValue: Text[30];
    ClassOne: Integer;
    I: Integer;
    J: Integer;
    Z: Integer;
    TempValueEntry: Record "Temp Value Entry";

    int: Integer;
    ItemNo: Code[100];
    Description: Text[1024];
    UOM: Code[10];
    PostingDate: Date;
    LocationCode: Code[10];
    PrevItem: Code[20];
    TempValueEntry1: Record "Temp Value Entry";
    StartDate: Date;
    EndDate: Date;
    APercentage: Decimal;
    BPercentage: Decimal;
    CPercentage: Decimal;
    ItemPercentage: Decimal;
    TotalPercentage: Decimal;
}

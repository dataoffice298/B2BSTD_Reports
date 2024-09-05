table 51000 "Temp Value Entry"
{
    fields
    {
        field(1;"Entry No.";Integer)
        {
            CaptionML = ENU='Entry No.', ENN='Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2;"Item No.";Code[20])
        {
            CaptionML = ENU='Item No.', ENN='Item No.';
            DataClassification = ToBeClassified;
            TableRelation = Item;
        }
        field(3;"Posting Date";Date)
        {
            CaptionML = ENU='Posting Date', ENN='Posting Date';
            DataClassification = ToBeClassified;
        }
        field(4;"Item Ledger Entry Type";Option)
        {
            CaptionML = ENU='Item Ledger Entry Type', ENN='Item Ledger Entry Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU='Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output, ,Assembly Consumption,Assembly Output', ENN='Purchase,Sale,Positive Adjmt.,Negative Adjmt.,Transfer,Consumption,Output, ,Assembly Consumption,Assembly Output';
            OptionMembers = Purchase, Sale, "Positive Adjmt.", "Negative Adjmt.", Transfer, Consumption, Output, " ", "Assembly Consumption", "Assembly Output";
        }
        field(5;"Source No.";Code[20])
        {
            CaptionML = ENU='Source No.', ENN='Source No.';
            DataClassification = ToBeClassified;
            TableRelation = IF("Source Type"=CONST(Customer))Customer
            ELSE IF("Source Type"=CONST(Vendor))Vendor
            ELSE IF("Source Type"=CONST(Item))Item;
        }
        field(6;"Document No.";Code[20])
        {
            CaptionML = ENU='Document No.', ENN='Document No.';
            DataClassification = ToBeClassified;
        }
        field(7;Description;Text[50])
        {
            CaptionML = ENU='Description', ENN='Description';
            DataClassification = ToBeClassified;
        }
        field(8;"Location Code";Code[10])
        {
            CaptionML = ENU='Location Code', ENN='Location Code';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(9;"Inventory Posting Group";Code[10])
        {
            CaptionML = ENU='Inventory Posting Group', ENN='Inventory Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "Inventory Posting Group";
        }
        field(10;"Source Posting Group";Code[10])
        {
            CaptionML = ENU='Source Posting Group', ENN='Source Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = IF("Source Type"=CONST(Customer))"Customer Posting Group"
            ELSE IF("Source Type"=CONST(Vendor))"Vendor Posting Group"
            ELSE IF("Source Type"=CONST(Item))"Inventory Posting Group";
        }
        field(11;"Item Ledger Entry No.";Integer)
        {
            CaptionML = ENU='Item Ledger Entry No.', ENN='Item Ledger Entry No.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Ledger Entry";
        }
        field(12;"Valued Quantity";Decimal)
        {
            CaptionML = ENU='Valued Quantity', ENN='Valued Quantity';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0: 5;
        }
        field(13;"Item Ledger Entry Quantity";Decimal)
        {
            CaptionML = ENU='Item Ledger Entry Quantity', ENN='Item Ledger Entry Quantity';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0: 5;
        }
        field(14;"Invoiced Quantity";Decimal)
        {
            CaptionML = ENU='Invoiced Quantity', ENN='Invoiced Quantity';
            DataClassification = ToBeClassified;
            DecimalPlaces = 0: 5;
        }
        field(15;"Cost per Unit";Decimal)
        {
            AutoFormatType = 2;
            CaptionML = ENU='Cost per Unit', ENN='Cost per Unit';
            DataClassification = ToBeClassified;
        }
        field(17;"Sales Amount (Actual)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Sales Amount (Actual)', ENN='Sales Amount (Actual)';
            DataClassification = ToBeClassified;
        }
        field(22;"Salespers./Purch. Code";Code[20])
        {
            CaptionML = ENU='Salespers./Purch. Code', ENN='Salespers./Purch. Code';
            DataClassification = ToBeClassified;
            TableRelation = "Salesperson/Purchaser";
        }
        field(23;"Discount Amount";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Discount Amount', ENN='Discount Amount';
            DataClassification = ToBeClassified;
        }
        field(24;"User ID";Code[50])
        {
            CaptionML = ENU='User ID', ENN='User ID';
            DataClassification = ToBeClassified;
            TableRelation = User."User Name";

            //This property is currently not supported
            //TestTableRelation = false;
            trigger OnLookup();
            var UserMgt: Codeunit 418;
            begin
            //UserMgt.LookupUserID("USER ID")
            end;
        }
        field(25;"Source Code";Code[10])
        {
            CaptionML = ENU='Source Code', ENN='Source Code';
            DataClassification = ToBeClassified;
            TableRelation = "Source Code";
        }
        field(28;"Applies-to Entry";Integer)
        {
            CaptionML = ENU='Applies-to Entry', ENN='Applies-to Entry';
            DataClassification = ToBeClassified;
        }
        field(33;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            CaptionML = ENU='Global Dimension 1 Code', ENN='Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(1));
        }
        field(34;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            CaptionML = ENU='Global Dimension 2 Code', ENN='Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No."=CONST(2));
        }
        field(41;"Source Type";Option)
        {
            CaptionML = ENU='Source Type', ENN='Source Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU=' ,Customer,Vendor,Item', ENN=' ,Customer,Vendor,Item';
            OptionMembers = " ", Customer, Vendor, Item;
        }
        field(43;"Cost Amount (Actual)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Cost Amount (Actual)', ENN='Cost Amount (Actual)';
            DataClassification = ToBeClassified;
        }
        field(45;"Cost Posted to G/L";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Cost Posted to G/L', ENN='Cost Posted to G/L';
            DataClassification = ToBeClassified;
        }
        field(46;"Reason Code";Code[10])
        {
            AccessByPermission = TableData 223=R;
            CaptionML = ENU='Reason Code', ENN='Reason Code';
            DataClassification = ToBeClassified;
            TableRelation = "Reason Code";
        }
        field(47;"Drop Shipment";Boolean)
        {
            CaptionML = ENU='Drop Shipment', ENN='Drop Shipment';
            DataClassification = ToBeClassified;
        }
        field(48;"Journal Batch Name";Code[10])
        {
            CaptionML = ENU='Journal Batch Name', ENN='Journal Batch Name';
            DataClassification = ToBeClassified;
        //This property is currently not supported
        //TestTableRelation = false;
        }
        field(57;"Gen. Bus. Posting Group";Code[10])
        {
            CaptionML = ENU='Gen. Bus. Posting Group', ENN='Gen. Bus. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Business Posting Group";
        }
        field(58;"Gen. Prod. Posting Group";Code[10])
        {
            CaptionML = ENU='Gen. Prod. Posting Group', ENN='Gen. Prod. Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group";
        }
        field(60;"Document Date";Date)
        {
            CaptionML = ENU='Document Date', ENN='Document Date';
            DataClassification = ToBeClassified;
        }
        field(61;"External Document No.";Code[35])
        {
            CaptionML = ENU='External Document No.', ENN='External Document No.';
            DataClassification = ToBeClassified;
        }
        field(68;"Cost Amount (Actual) (ACY)";Decimal)
        {
            //AutoFormatExpression = GetCurrencyCode;
            AutoFormatType = 1;
            CaptionML = ENU='Cost Amount (Actual) (ACY)', ENN='Cost Amount (Actual) (ACY)';
            DataClassification = ToBeClassified;
        }
        field(70;"Cost Posted to G/L (ACY)";Decimal)
        {
            AccessByPermission = TableData 4=R;
            //AutoFormatExpression = GetCurrencyCode;
            AutoFormatType = 1;
            CaptionML = ENU='Cost Posted to G/L (ACY)', ENN='Cost Posted to G/L (ACY)';
            DataClassification = ToBeClassified;
        }
        field(72;"Cost per Unit (ACY)";Decimal)
        {
            AccessByPermission = TableData 4=R;
            //AutoFormatExpression = GetCurrencyCode;
            AutoFormatType = 2;
            CaptionML = ENU='Cost per Unit (ACY)', ENN='Cost per Unit (ACY)';
            DataClassification = ToBeClassified;
        }
        field(79;"Document Type";Option)
        {
            CaptionML = ENU='Document Type', ENN='Document Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU=' ,Sales Shipment,Sales Invoice,Sales Return Receipt,Sales Credit Memo,Purchase Receipt,Purchase Invoice,Purchase Return Shipment,Purchase Credit Memo,Transfer Shipment,Transfer Receipt,Service Shipment,Service Invoice,Service Credit Memo,Posted Assembly', ENN=' ,Sales Shipment,Sales Invoice,Sales Return Receipt,Sales Credit Memo,Purchase Receipt,Purchase Invoice,Purchase Return Shipment,Purchase Credit Memo,Transfer Shipment,Transfer Receipt,Service Shipment,Service Invoice,Service Credit Memo,Posted Assembly';
            OptionMembers = " ", "Sales Shipment", "Sales Invoice", "Sales Return Receipt", "Sales Credit Memo", "Purchase Receipt", "Purchase Invoice", "Purchase Return Shipment", "Purchase Credit Memo", "Transfer Shipment", "Transfer Receipt", "Service Shipment", "Service Invoice", "Service Credit Memo", "Posted Assembly";
        }
        field(80;"Document Line No.";Integer)
        {
            CaptionML = ENU='Document Line No.', ENN='Document Line No.';
            DataClassification = ToBeClassified;
        }
        field(90;"Order Type";Option)
        {
            CaptionML = ENU='Order Type', ENN='Order Type';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaptionML = ENU=' ,Production,Transfer,Service,Assembly', ENN=' ,Production,Transfer,Service,Assembly';
            OptionMembers = " ", Production, Transfer, Service, Assembly;
        }
        field(91;"Order No.";Code[20])
        {
            CaptionML = ENU='Order No.', ENN='Order No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(92;"Order Line No.";Integer)
        {
            CaptionML = ENU='Order Line No.', ENN='Order Line No.';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(98;"Expected Cost";Boolean)
        {
            CaptionML = ENU='Expected Cost', ENN='Expected Cost';
            DataClassification = ToBeClassified;
        }
        field(99;"Item Charge No.";Code[20])
        {
            CaptionML = ENU='Item Charge No.', ENN='Item Charge No.';
            DataClassification = ToBeClassified;
            TableRelation = "Item Charge";
        }
        field(100;"Valued By Average Cost";Boolean)
        {
            CaptionML = ENU='Valued By Average Cost', ENN='Valued By Average Cost';
            DataClassification = ToBeClassified;
        }
        field(102;"Partial Revaluation";Boolean)
        {
            CaptionML = ENU='Partial Revaluation', ENN='Partial Revaluation';
            DataClassification = ToBeClassified;
        }
        field(103;Inventoriable;Boolean)
        {
            CaptionML = ENU='Inventoriable', ENN='Inventoriable';
            DataClassification = ToBeClassified;
        }
        field(104;"Valuation Date";Date)
        {
            CaptionML = ENU='Valuation Date', ENN='Valuation Date';
            DataClassification = ToBeClassified;
        }
        field(105;"Entry Type";Option)
        {
            CaptionML = ENU='Entry Type', ENN='Entry Type';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaptionML = ENU='Direct Cost,Revaluation,Rounding,Indirect Cost,Variance', ENN='Direct Cost,Revaluation,Rounding,Indirect Cost,Variance';
            OptionMembers = "Direct Cost", Revaluation, Rounding, "Indirect Cost", Variance;
        }
        field(106;"Variance Type";Option)
        {
            CaptionML = ENU='Variance Type', ENN='Variance Type';
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaptionML = ENU=' ,Purchase,Material,Capacity,Capacity Overhead,Manufacturing Overhead,Subcontracted', ENN=' ,Purchase,Material,Capacity,Capacity Overhead,Manufacturing Overhead,Subcontracted';
            OptionMembers = " ", Purchase, Material, Capacity, "Capacity Overhead", "Manufacturing Overhead", Subcontracted;
        }
        field(148;"Purchase Amount (Actual)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Purchase Amount (Actual)', ENN='Purchase Amount (Actual)';
            DataClassification = ToBeClassified;
        }
        field(149;"Purchase Amount (Expected)";Decimal)
        {
            AccessByPermission = TableData 120=R;
            AutoFormatType = 1;
            CaptionML = ENU='Purchase Amount (Expected)', ENN='Purchase Amount (Expected)';
            DataClassification = ToBeClassified;
        }
        field(150;"Sales Amount (Expected)";Decimal)
        {
            AccessByPermission = TableData 110=R;
            AutoFormatType = 1;
            CaptionML = ENU='Sales Amount (Expected)', ENN='Sales Amount (Expected)';
            DataClassification = ToBeClassified;
        }
        field(151;"Cost Amount (Expected)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Cost Amount (Expected)', ENN='Cost Amount (Expected)';
            DataClassification = ToBeClassified;
        }
        field(152;"Cost Amount (Non-Invtbl.)";Decimal)
        {
            AccessByPermission = TableData 5800=R;
            AutoFormatType = 1;
            CaptionML = ENU='Cost Amount (Non-Invtbl.)', ENN='Cost Amount (Non-Invtbl.)';
            DataClassification = ToBeClassified;
        }
        field(156;"Cost Amount (Expected) (ACY)";Decimal)
        {
            //AutoFormatExpression = GetCurrencyCode;
            AutoFormatType = 1;
            CaptionML = ENU='Cost Amount (Expected) (ACY)', ENN='Cost Amount (Expected) (ACY)';
            DataClassification = ToBeClassified;
        }
        field(157;"Cost Amount (Non-Invtbl.)(ACY)";Decimal)
        {
            AccessByPermission = TableData 5800=R;
            //AutoFormatExpression = GetCurrencyCode;
            AutoFormatType = 1;
            CaptionML = ENU='Cost Amount (Non-Invtbl.)(ACY)', ENN='Cost Amount (Non-Invtbl.)(ACY)';
            DataClassification = ToBeClassified;
        }
        field(158;"Expected Cost Posted to G/L";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Expected Cost Posted to G/L', ENN='Expected Cost Posted to G/L';
            DataClassification = ToBeClassified;
        }
        field(159;"Exp. Cost Posted to G/L (ACY)";Decimal)
        {
            AutoFormatType = 1;
            CaptionML = ENU='Exp. Cost Posted to G/L (ACY)', ENN='Exp. Cost Posted to G/L (ACY)';
            DataClassification = ToBeClassified;
        }
        field(480;"Dimension Set ID";Integer)
        {
            CaptionML = ENU='Dimension Set ID', ENN='Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup();
            begin
                ShowDimensions;
            end;
        }
        field(1000;"Job No.";Code[20])
        {
            CaptionML = ENU='Job No.', ENN='Job No.';
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(1001;"Job Task No.";Code[20])
        {
            CaptionML = ENU='Job Task No.', ENN='Job Task No.';
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." WHERE("Job No."=FIELD("Job No."));
        }
        field(1002;"Job Ledger Entry No.";Integer)
        {
            BlankZero = true;
            CaptionML = ENU='Job Ledger Entry No.', ENN='Job Ledger Entry No.';
            DataClassification = ToBeClassified;
            TableRelation = "Job Ledger Entry"."Entry No.";
        }
        field(5402;"Variant Code";Code[10])
        {
            CaptionML = ENU='Variant Code', ENN='Variant Code';
            DataClassification = ToBeClassified;
            TableRelation = "Item Variant".Code WHERE("Item No."=FIELD("Item No."));
        }
        field(5818;Adjustment;Boolean)
        {
            CaptionML = ENU='Adjustment', ENN='Adjustment';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5819;"Average Cost Exception";Boolean)
        {
            CaptionML = ENU='Average Cost Exception', ENN='Average Cost Exception';
            DataClassification = ToBeClassified;
        }
        field(5831;"Capacity Ledger Entry No.";Integer)
        {
            CaptionML = ENU='Capacity Ledger Entry No.', ENN='Capacity Ledger Entry No.';
            DataClassification = ToBeClassified;
            TableRelation = "Capacity Ledger Entry";
        }
        field(5832;Type;Option)
        {
            CaptionML = ENU='Type', ENN='Type';
            DataClassification = ToBeClassified;
            OptionCaptionML = ENU='Work Center,Machine Center, ,Resource', ENN='Work Center,Machine Center, ,Resource';
            OptionMembers = "Work Center", "Machine Center", " ", Resource;
        }
        field(5834;"No.";Code[20])
        {
            CaptionML = ENU='No.', ENN='No.';
            DataClassification = ToBeClassified;
            TableRelation = IF(Type=CONST("Machine Center"))"Machine Center"
            ELSE IF(Type=CONST("Work Center"))"Work Center"
            ELSE IF(Type=CONST(Resource))Resource;
        }
        field(6602;"Return Reason Code";Code[10])
        {
            CaptionML = ENU='Return Reason Code', ENN='Return Reason Code';
            DataClassification = ToBeClassified;
            TableRelation = "Return Reason";
        }
        field(13702;"BED %";Decimal)
        {
            CaptionML = ENU='BED %', ENN='BED %';
            DataClassification = ToBeClassified;
        }
        field(13703;"BED Amount";Decimal)
        {
            CaptionML = ENU='BED Amount', ENN='BED Amount';
            DataClassification = ToBeClassified;
        }
        field(13704;"Other Duties %";Decimal)
        {
            CaptionML = ENU='Other Duties %', ENN='Other Duties %';
            DataClassification = ToBeClassified;
        }
        field(13705;"Other Duties Amount";Decimal)
        {
            CaptionML = ENU='Other Duties Amount', ENN='Other Duties Amount';
            DataClassification = ToBeClassified;
        }
        field(16510;"Assessable Value";Decimal)
        {
            CaptionML = ENU='Assessable Value', ENN='Assessable Value';
            DataClassification = ToBeClassified;
        }
        field(16511;"New ILE Quantity";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(Key1;"Entry No.")
        {
        }
        key(Key2;"Item Ledger Entry No.", "Entry Type")
        {
        }
        key(Key3;"Item Ledger Entry No.", "Document No.", "Document Line No.")
        {
        }
        key(Key4;"Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code")
        {
            SumIndexFields = "Invoiced Quantity", "Sales Amount (Expected)", "Sales Amount (Actual)", "Cost Amount (Expected)", "Cost Amount (Actual)", "Cost Amount (Non-Invtbl.)", "Purchase Amount (Actual)", "Expected Cost Posted to G/L", "Cost Posted to G/L", "Item Ledger Entry Quantity";
        }
        key(Key5;"Item No.", "Posting Date", "Item Ledger Entry Type", "Entry Type", "Variance Type", "Item Charge No.", "Location Code", "Variant Code", "Global Dimension 1 Code", "Global Dimension 2 Code", "Source Type", "Source No.")
        {
            SumIndexFields = "Invoiced Quantity", "Sales Amount (Expected)", "Sales Amount (Actual)", "Cost Amount (Expected)", "Cost Amount (Actual)", "Cost Amount (Non-Invtbl.)", "Purchase Amount (Actual)", "Expected Cost Posted to G/L", "Cost Posted to G/L", "Item Ledger Entry Quantity";
        }
        key(Key6;"Document No.")
        {
        }
        key(Key7;"Item No.", "Valuation Date", "Location Code", "Variant Code")
        {
            SumIndexFields = "Cost Amount (Expected)", "Cost Amount (Actual)", "Cost Amount (Expected) (ACY)", "Cost Amount (Actual) (ACY)", "Item Ledger Entry Quantity";
        }
        key(Key8;"Source Type", "Source No.", "Item No.", "Posting Date", "Entry Type", Adjustment, "Item Ledger Entry Type")
        {
            SumIndexFields = "Discount Amount", "Cost Amount (Non-Invtbl.)", "Cost Amount (Actual)", "Cost Amount (Expected)", "Sales Amount (Actual)", "Sales Amount (Expected)", "Invoiced Quantity";
        }
        key(Key9;"Item Charge No.", "Inventory Posting Group", "Item No.")
        {
        }
        key(Key10;"Capacity Ledger Entry No.", "Entry Type")
        {
            SumIndexFields = "Cost Amount (Actual)", "Cost Amount (Actual) (ACY)";
        }
        key(Key11;"Order Type", "Order No.", "Order Line No.")
        {
        }
        key(Key12;"Source Type", "Source No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Item No.", "Posting Date", "Entry Type", Adjustment)
        {
            SumIndexFields = "Discount Amount", "Cost Amount (Non-Invtbl.)", "Cost Amount (Actual)", "Cost Amount (Expected)", "Sales Amount (Actual)", "Sales Amount (Expected)", "Invoiced Quantity";
        }
        key(Key13;"Job No.", "Job Task No.", "Document No.")
        {
        }
        key(Key14;"Item Ledger Entry Type", "Posting Date", "Item No.", "Inventory Posting Group", "Dimension Set ID")
        {
            SumIndexFields = "Invoiced Quantity", "Sales Amount (Actual)", "Purchase Amount (Actual)";
        }
        key(Key15;"Item No.", "Global Dimension 1 Code", "Global Dimension 2 Code", "Source Type", "Source No.", "Item Ledger Entry Type", "Entry Type", "Posting Date")
        {
            SumIndexFields = "Sales Amount (Actual)", "Sales Amount (Expected)", "Cost Amount (Actual)", "Cost Amount (Expected)", "Cost Amount (Non-Invtbl.)", "Invoiced Quantity", "Item Ledger Entry Quantity";
        }
        key(Key16;"Item No.", "Posting Date")
        {
        }
        key(Key17;"Item Ledger Entry Type", "Location Code", "Order Type", "Order No.", "Order Line No.", "Source Type", "Source No.")
        {
            SumIndexFields = "Cost Amount (Actual)", "Cost Amount (Actual) (ACY)";
        }
        key(Key18;"Document No.", "Posting Date")
        {
        }
        key(Key19;"Item Ledger Entry No.", "Valuation Date")
        {
        }
        key(Key20;"Cost Amount (Actual)")
        {
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown;"Entry No.", "Item Ledger Entry Type", "Item Ledger Entry No.", "Item No.", "Posting Date", "Source No.", "Document No.")
        {
        }
    }
    var GLSetup: Record "General Ledger Setup";
    GLSetupRead: Boolean;
    local procedure GetCurrencyCode(): Code[10];
    begin
    end;
    procedure GetValuationDate(): Date;
    begin
    end;
    procedure AddCost(InvtAdjmtBuffer: Record "Inventory Adjustment Buffer");
    begin
    end;
    procedure SumCostsTillValuationDate(var ValueEntry: Record "Value Entry");
    var AccountingPeriod: Record "Accounting Period";
    PrevValueEntrySum: Record "Value Entry";
    Item: Record Item;
    FromDate: Date;
    ToDate: Date;
    CostCalcIsChanged: Boolean;
    QtyFactor: Decimal;
    begin
    end;
    procedure CalcItemLedgEntryCost(ItemLedgEntryNo: Integer;
    Expected: Boolean);
    var ItemLedgEntryQty: Decimal;
    CostAmtActual: Decimal;
    CostAmtActualACY: Decimal;
    CostAmtExpected: Decimal;
    CostAmtExpectedACY: Decimal;
    begin
    end;
    procedure NotInvdRevaluationExists(ItemLedgEntryNo: Integer): Boolean;
    begin
    end;
    procedure CalcQtyFactor(FromDate: Date;
    ToDate: Date)QtyFactor: Decimal;
    var ValueEntry2: Record "Value Entry";
    begin
    end;
    procedure ShowGL();
    var GLItemLedgRelation: Record "G/L - Item Ledger Relation";
    GLEntry: Record "G/L Entry";
    TempGLEntry: Record "G/L Entry" temporary;
    begin
    end;
    procedure IsAvgCostException(IsAvgCostCalcTypeItem: Boolean): Boolean;
    var ItemApplnEntry: Record "Item Application Entry";
    ItemLedgEntry: Record "Item Ledger Entry";
    TempItemLedgEntry: Record "Item Ledger Entry" temporary;
    begin
    end;
    procedure ShowDimensions();
    var DimMgt: Codeunit DimensionManagement;
    begin
        DimMgt.ShowDimensionSet("Dimension Set ID", STRSUBSTNO('%1 %2', TABLECAPTION, "Entry No."));
    end;
    procedure GetAvgToDate(ToDate: Date): Date;
    var CalendarPeriod: Record "Date";
    AvgCostAdjmtEntryPoint: Record "Avg. Cost Adjmt. Entry Point";
    begin
    end;
    procedure GetAvgFromDate(ToDate: Date;
    var AccountingPeriod: Record "Accounting Period";
    var CostCalcIsChanged: Boolean)FromDate: Date;
    var PrevAccountingPeriod: Record "Accounting Period";
    begin
    end;
    procedure FindFirstValueEntryByItemLedgerEntryNo(ItemLedgerEntryNo: Integer);
    begin
    end;
}

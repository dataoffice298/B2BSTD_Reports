report 50004 "Sales Register - itemwise"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Layouts/Sales Register - itemwisenew.rdl';
    Caption = 'Sales Register Itemwise Report';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")

        {
            // column()
            column(No_SalesInvoiceHeader; "Sales Invoice Header"."No.")
            {
            }
            column(SalespersonCode_SalesInvoiceHeader; "Sales Invoice Header"."Salesperson Code")
            {
            }
            column(SalesName; RecSalesPerson.Name)
            {
            }
            column(DocType; DocType)
            {
            }
            column(CustomerPostingGroup_SalesInvoiceHeader; "Sales Invoice Header"."Customer Posting Group")
            {
            }
            column(ShortcutDimension1Code_SalesInvoiceHeader; "Sales Invoice Header"."Shortcut Dimension 1 Code")
            {
            }
            column(ShortcutDimension2Code_SalesInvoiceHeader; "Sales Invoice Header"."Shortcut Dimension 2 Code")
            {
            }
            column(GenBusPostGroup; "Gen. Bus. Posting Group")
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(Currency_Code; "Currency Code")
            {
            }
            // column(SO_Type; "SO Type")
            // {
            // }
            column(DimName1; DimName1)
            {

            }
            column(DimName2; DimName2)
            {

            }
            column(VehicalNo; VehicalNo)
            { }
            column(LRNo; LRNo)
            { }
            column(LRDate; LRDate)
            { }
            column(TransporterName; TransporterName)
            { }
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemTableView = SORTING("Document No.", "Line No.")
                                    WHERE(Quantity = FILTER(<> 0));
                RequestFilterFields = "Posting Date", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code";

                column(Shipment_Date; "Shipment Date") { }
                // column()
                column(QuantityBase_SalesInvoiceLine; "Sales Invoice Line"."Quantity (Base)")
                {
                }
                column(ExchRate; ExchRate)
                {
                }
                column(baseamt; baseamt)
                {
                }
                column(shiptocode; VarCity)
                {
                }
                column(Report_Filters; "Sales Invoice Line".GETFILTERS)
                {
                }
                column(Type_SalesInvoiceLine; "Sales Invoice Line".Type)
                {
                }
                column(CompInfo_Name; CompInfo.Name)
                {
                }
                column(LineDiscountAmount_SalesInvoiceLine; "Sales Invoice Line"."Line Discount Amount")
                {
                }
                column(CompInfo_Address; CompInfo.Address)
                {
                }
                column(CompInfo_Address_2; CompInfo."Address 2")
                {
                }
                column(CompInfo_Phone_No; CompInfo."Phone No.")
                {
                }
                column(CompInfo_City; CompInfo.City)
                {
                }
                column(CompInfo_PostCode; CompInfo."Post Code")
                {
                }
                column(StateCode_Customer; Customerrec."State Code")
                {
                }
                column(Fromdate; "From date")
                {
                }
                column(Todate; "To Date")
                {
                }
                column(DocumentNo_SalesInvoiceLine; "Sales Invoice Line"."Document No.")
                {
                }
                column(PostingDate_SalesInvoiceHeader; "Sales Invoice Line"."Posting Date")
                {
                }
                column(SelltoCustomerNo_SalesInvoiceHeader; "Sales Invoice Line"."Sell-to Customer No.")
                {
                }
                column(HSNSACCode_SalesInvoiceLine; "Sales Invoice Line"."HSN/SAC Code")
                {
                }
                column(CustomerType; Customertype)
                {
                }
                column(CustomerName; Customerrec.Name)
                {
                }
                column(CustomerGST; Customerrec."GST Registration No.")
                {
                }
                column(CustomerPAN; Customerrec."P.A.N. No.")
                {
                }
                column(No_SalesInvoiceLine; "Sales Invoice Line"."No.")
                {
                }
                column(Description_SalesInvoiceLine; "Sales Invoice Line".Description)
                {
                }
                column(Description2_SalesInvoiceLine; "Sales Invoice Line"."Description 2")
                {
                }
                column(UnitPrice_SalesInvoiceLine; "Sales Invoice Line"."Unit Price")
                {
                }
                column(GSTBaseAmount_SalesInvoiceLine; "Sales Invoice Line".Amount)
                {
                }
                column(SubTotal; "Sales Invoice Line"."Line Amount")
                {
                }
                column(Quantity_SalesInvoiceLine; "Sales Invoice Line".Quantity)
                {
                }
                column(GSTGroupCode_SalesInvoiceLine; "Sales Invoice Line"."GST Group Code")
                {
                }
                column(UOMItem1; itemrec."Base Unit of Measure")
                {
                }
                column(ItemCategoryCode; itemrec."Item Category Code")
                {
                }
                column(InvPostingGroup; itemrec."Inventory Posting Group")
                {
                }
                column(TotalCGST; CGSTAmt)
                {
                }
                column(TotalSGST; SGSTAmt)
                {
                }
                column(TotalIGST; IGSTAmt)
                {
                }
                column(GrossAmt; GrossAmt)
                {
                }//changes amount to customer
                column(OCNo; OCNo)
                {
                }
                column(OCDate; OCDate)
                {
                }
                column(ExtDocNo; ExtDocNo)
                {
                }
                column(Shiptocode3; Shiptocode)
                {
                }
                column(UnitofMeasureCode_SalesInvoiceLine; "Sales Invoice Line"."Unit of Measure Code")
                {
                }
                column(LineDiscount_SalesInvoiceLine; "Sales Invoice Line"."Line Discount %")
                {
                }
                column(GenProdPostGroup; "Gen. Prod. Posting Group")
                {
                }


                trigger OnAfterGetRecord();
                begin
                    VarCity := '';
                    /* Rec_SalesInvHdr.RESET;
                    Rec_SalesInvHdr.SETRANGE("No.", "Sales Invoice Line"."Document No.");
                    IF Rec_SalesInvHdr.FINDSET THEN
                        VarCity := Rec_SalesInvHdr."Ship-to City"; */

                    Customerrec.RESET;
                    IF Customerrec.GET("Sales Invoice Line"."Sell-to Customer No.") THEN BEGIN
                    END;

                    itemrec.RESET;
                    IF itemrec.GET("Sales Invoice Line"."No.") THEN;

                    Clear(GrossAmt);
                    CLEAR(CGSTAmt);
                    CLEAR(SGSTAmt);
                    CLEAR(IGSTAmt);
                    detailedGSTLedgerEntryrec.RESET;
                    detailedGSTLedgerEntryrec.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
                    detailedGSTLedgerEntryrec.SetRange("No.", "Sales Invoice Line"."No.");
                    // detailedGSTLedgerEntryrec.SETRANGE("Transaction Type", detailedGSTLedgerEntryrec."Transaction Type"::Sales);
                    // detailedGSTLedgerEntryrec.SETRANGE("Document Line No.", "Sales Invoice Line"."Line No.");
                    // detailedGSTLedgerEntryrec.SETRANGE("Payment Type", detailedGSTLedgerEntryrec."Payment Type"::" ");
                    IF detailedGSTLedgerEntryrec.FINDSET THEN
                        REPEAT
                            CASE detailedGSTLedgerEntryrec."GST Component Code" OF
                                'CGST':
                                    BEGIN
                                        CGSTAmt += ABS(detailedGSTLedgerEntryrec."GST Amount");
                                    END;
                                'SGST':
                                    BEGIN
                                        SGSTAmt += ABS(detailedGSTLedgerEntryrec."GST Amount");
                                    END;
                                'IGST':
                                    BEGIN
                                        IGSTAmt += ABS(detailedGSTLedgerEntryrec."GST Amount");
                                    END;
                            END;
                        UNTIL detailedGSTLedgerEntryrec.NEXT = 0;

                    GrossAmt := CGSTAmt + IGSTAmt + SGSTAmt;

                    Rec_SalesShipmentHeader.RESET;
                    Rec_SalesShipmentHeader.SETRANGE("No.", "Sales Invoice Line"."Shipment No.");
                    IF Rec_SalesShipmentHeader.FINDFIRST THEN BEGIN
                        OCNo := Rec_SalesShipmentHeader."Order No.";
                        OCDate := Rec_SalesShipmentHeader."Order Date";
                    END;

                    Clear(baseamt);

                    baseamt := "Sales Invoice Line"."Line Amount";
                    Clear(CurrFact);
                    Clear(ExchRate);
                    Rec_SalesInvHdr.RESET;
                    Rec_SalesInvHdr.SETRANGE("No.", "Sales Invoice Line"."Document No.");
                    IF Rec_SalesInvHdr.FindFirst() THEN BEGIN
                        ExtDocNo := Rec_SalesInvHdr."External Document No.";
                        Shiptocode := Rec_SalesInvHdr."Ship-to Code";
                        VarCity := Rec_SalesInvHdr."Ship-to City";
                        CurrFact := Rec_SalesInvHdr."Currency Factor";
                    END;

                    if CurrFact <> 0 then begin
                        ExchRate := (1 / CurrFact);
                        baseamt := baseamt * ExchRate;
                        // CGSTAmt := (CGSTAmt * ExchRate);
                        // SGSTAmt := (SGSTAmt * ExchRate);
                        // IGSTAmt := (IGSTAmt * ExchRate);
                        // GrossAmt := (GrossAmt * ExchRate);
                    end;
                    GrossAmt += baseamt;

                    Clear(DimName1);
                    Clear(DimName2);
                    DimVal.Reset();
                    DimVal.SetRange(Code, "Shortcut Dimension 1 Code");
                    if DimVal.FindFirst() then begin
                        DimName1 := DimVal.Name;
                    end;

                    DimVal.Reset();
                    DimVal.SetRange(Code, "Shortcut Dimension 2 Code");
                    if DimVal.FindFirst() then begin
                        DimName2 := DimVal.Name;
                    end;

                end;

                trigger OnPreDataItem();
                begin
                    //i := 1;
                    //CLEAR(TempDocNo);
                end;
            }

            trigger OnAfterGetRecord();
            begin
                RecSalesPerson.RESET;
                IF RecSalesPerson.GET("Sales Invoice Header"."Salesperson Code") THEN;
                SalesHeader.reset;
                SalesHeader.SetRange("No.", "Sales Invoice Header"."Order No.");
                if SalesHeader.FindFirst then begin
                    VehicalNo := SalesHeader."Vehicle No.";
                    LRNo := SalesHeader."LR/RR No.";
                    LRDate := SalesHeader."LR/RR Date";
                    If ShippingAgent.Get(SalesHeader."Shipping Agent Code") then
                        TransporterName := ShippingAgent.Name;

                end;

            end;

            trigger OnPreDataItem();
            begin
                DocType := 'Invoice';
            end;
        }
        dataitem("Sales Cr.Memo Line"; "Sales Cr.Memo Line")
        {
            DataItemTableView = SORTING("Document No.", "Line No.")
                                WHERE(Quantity = FILTER(<> 0));
            RequestFilterFields = "Posting Date", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code";
            column(QuantityBase_SalesCrMemoLine; "Sales Cr.Memo Line"."Quantity (Base)")
            {
            }
            column(baseamt1; baseamt1)
            {
            }
            column(ExchRate1; ExchRate1)
            {
            }
            column(shiptocode1; VarCity)
            {
            }
            column(SelltoCustomerNo_SalesCrMemoLine; "Sales Cr.Memo Line"."Sell-to Customer No.")
            {
            }
            column(DocumentNo_SalesCrMemoLine; "Sales Cr.Memo Line"."Document No.")
            {
            }
            column(PostingDate_SalesCrMemoLine; "Sales Cr.Memo Line"."Posting Date")
            {
            }
            column(No_SalesCrMemoLine; "Sales Cr.Memo Line"."No.")
            {
            }
            column(Description_SalesCrMemoLine; "Sales Cr.Memo Line".Description)
            {
            }
            column(Description2_SalesCrMemoLine; "Sales Cr.Memo Line"."Description 2")
            {
            }
            column(LineDiscountAmount_SalesCrMemoLine; "Sales Cr.Memo Line"."Line Discount Amount")
            {
            }
            column(Quantity_SalesCrMemoLine; "Sales Cr.Memo Line".Quantity)
            {
            }
            column(UnitPrice_SalesCrMemoLine; "Sales Cr.Memo Line"."Unit Price")
            {
            }
            column(GSTBaseAmount_SalesCrMemoLine; "Sales Cr.Memo Line".Amount)
            {
            }
            column(HSNSACCode_SalesCrMemoLine; "Sales Cr.Memo Line"."HSN/SAC Code")
            {
            }
            column(GSTGroupCode_SalesCrMemoLine; "Sales Cr.Memo Line"."GST Group Code")
            {
            }
            column(subtotal1; "Sales Cr.Memo Line"."Line Amount")
            {
            }
            column(Customertype1; Customertype1)
            {
            }
            column(CustomerName1; Customerrec.Name)
            {
            }
            column(CustomerGSTNo1; Customerrec."GST Registration No.")
            {
            }
            column(CustomerPANNo1; Customerrec."P.A.N. No.")
            {
            }
            column(UOMItem2; itemrec."Base Unit of Measure")
            {
            }
            column(ItemCategoryCode1; itemrec."Item Category Code")
            {
            }
            column(InvPostingGroup1; itemrec."Inventory Posting Group")
            {
            }
            column(GrossAmt1; GrossAmt1)
            {
            }
            column(TotalCGST1; CGSTAmt1)
            {
            }
            column(TotalSGST1; SGSTAmt1)
            {
            }
            column(TotalIGST1; IGSTAmt1)
            {
            }
            column(StateCode_SalesCreditMemo; Rec_Cust.State)
            {
            }
            column(LineDiscount_SalesCrMemoLine; "Sales Cr.Memo Line"."Line Discount %")
            {
            }
            column(UnitofMeasureCode_SalesCrMemoLine; "Sales Cr.Memo Line"."Unit of Measure Code")
            {
            }
            column(DocType1; DocType)
            {
            }
            column(GenProdPostGroup1; "Gen. Prod. Posting Group")
            {
            }

            dataitem("Sales Cr.Memo Header"; "Sales Cr.Memo Header")
            {
                DataItemLink = "No." = FIELD("Document No.");
                column(Externaldocno; "Sales Cr.Memo Header"."External Document No.")
                {
                }
                column(shipcode; "Sales Cr.Memo Header"."Ship-to Code")
                {
                }
                column(SalespersonCode_SalesCrMemoHeader; "Sales Cr.Memo Header"."Salesperson Code")
                {
                }
                column(Salesname2; RecSalesPerson1.Name)
                {
                }
                column(CustomerPostingGroup_SalesCrMemoHeader; "Sales Cr.Memo Header"."Customer Posting Group")
                {
                }
                column(ShortcutDimension1Code_SalesCrMemoHeader; "Sales Cr.Memo Header"."Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_SalesCrMemoHeader; "Sales Cr.Memo Header"."Shortcut Dimension 2 Code")
                {
                }
                column(GenBusPostGroup1; "Gen. Bus. Posting Group")
                {

                }
                column(Location_Code1; "Location Code")
                {
                }
                column(Currency_Code1; "Currency Code")
                {
                }
                // column(SO_Type1; "SO Type")
                // {
                // }
                column(DimName11; DimName11)
                {

                }
                column(DimName22; DimName22)
                {

                }
                trigger OnAfterGetRecord();
                begin
                    /*RecSalesPerson.RESET;
                    IF RecSalesPerson.GET("Sales Invoice Header"."Salesperson Code") THEN;*/

                end;
            }

            trigger OnAfterGetRecord();
            begin
                VarCity1 := '';
                Rec_Cust.RESET;
                Rec_Cust.SETRANGE("No.", "Sales Cr.Memo Line"."Document No.");
                IF Rec_Cust.FINDSET THEN
                    VarCity1 := Rec_Cust."Ship-to City";


                IF Rec_Cust.GET("Sales Cr.Memo Line"."Sell-to Customer No.") THEN;

                Customerrec.RESET;
                IF Customerrec.GET("Sales Cr.Memo Line"."Sell-to Customer No.") THEN BEGIN
                END;

                Clear(Grossamt1);
                CLEAR(CGSTAmt1);
                CLEAR(SGSTAmt1);
                CLEAR(IGSTAmt1);
                DETGSTLEdEntry.RESET;
                DETGSTLEdEntry.SETRANGE("Document No.", "Sales Cr.Memo Line"."Document No.");
                DETGSTLEdEntry.SETRANGE("Transaction Type", DETGSTLEdEntry."Transaction Type"::Sales);
                DETGSTLEdEntry.SETRANGE("Document Line No.", "Sales Cr.Memo Line"."Line No.");
                DETGSTLEdEntry.SETRANGE("Payment Type", DETGSTLEdEntry."Payment Type"::" ");
                IF DETGSTLEdEntry.FINDSET THEN
                    REPEAT
                        CASE DETGSTLEdEntry."GST Component Code" OF
                            'CGST':
                                BEGIN
                                    CGSTAmt1 := ABS(DETGSTLEdEntry."GST Amount");
                                END;
                            'SGST':
                                BEGIN
                                    SGSTAmt1 := ABS(DETGSTLEdEntry."GST Amount");
                                END;
                            'IGST':
                                BEGIN
                                    IGSTAmt1 := ABS(DETGSTLEdEntry."GST Amount");
                                END;
                        END;
                    UNTIL DETGSTLEdEntry.NEXT = 0;

                Grossamt1 := CGSTAmt1 + SGSTAmt1 + IGSTAmt1;

                itemrec.RESET;
                IF itemrec.GET("Sales Cr.Memo Line"."No.") THEN;

                Clear(CurrFact1);
                Clear(ExchRate1);
                Rec_SalesCredHdr.Reset();
                Rec_SalesCredHdr.SetRange("No.", "Sales Cr.Memo Line"."Document No.");
                if Rec_SalesCredHdr.FindFirst() then begin
                    CurrFact1 := Rec_SalesCredHdr."Currency Factor";
                end;

                if CurrFact1 <> 0 then begin
                    ExchRate1 := (1 / CurrFact1);
                    // CGSTAmt1 := (CGSTAmt1 * ExchRate1);
                    // SGSTAmt1 := (SGSTAmt1 * ExchRate1);
                    // IGSTAmt1 := (IGSTAmt1 * ExchRate1);
                    baseamt1 := baseamt1 * ExchRate1;
                    // Grossamt1 := (Grossamt1 * ExchRate1);
                end;
                Grossamt1 += baseamt1;
                Clear(DimName11);
                Clear(DimName22);
                DimVal.Reset();
                DimVal.SetRange(Code, "Shortcut Dimension 1 Code");
                if DimVal.FindFirst() then begin
                    DimName11 := DimVal.Name;
                end;

                DimVal.Reset();
                DimVal.SetRange(Code, "Shortcut Dimension 2 Code");
                if DimVal.FindFirst() then begin
                    DimName22 := DimVal.Name;
                end;

            end;

            trigger OnPreDataItem();
            begin
                DocType := 'CreditMemo';
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(content)
            {
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
        IF CompInfo.GET() THEN;
        CompInfo.CalcFields(CompInfo.Picture);
        "From date" := "Sales Invoice Line".GETRANGEMIN("Sales Invoice Line"."Posting Date");
        "To Date" := "Sales Invoice Line".GETRANGEMAX("Sales Invoice Line"."Posting Date");

    end;

    var
        Rec_SalesInvHdr: Record "Sales Invoice Header";
        Rec_SalesCredHdr: Record "Sales Cr.Memo Header";
        var_shiptoaddress: Record "Ship-to Address";
        DimVal: Record "Dimension Value";
        DimName1: Text[100];
        DimName2: Text[100];
        DimName11: Text[100];
        DimName22: Text[100];
        VarCity: Text;
        VarCity1: Text;
        CompInfo: Record "Company Information";
        "From date": Date;
        "To Date": Date;
        PageConst: Label 'Page';
        TotalFor: Label '"Total for "';
        Text000: Label 'Period: %1';
        Text001: Label 'Sales Register';
        Text002: Label 'Data';
        Text003: Label 'Debit';
        Text004: Label 'Credit';
        Text005: Label 'Company Name';
        Text006: Label 'Report No.';
        Text007: Label 'Report Name';
        Text008: Label 'User ID';
        Text009: Label 'Date';
        Text010: Label 'G/L Filter';
        Text011: Label 'Period Filter';
        Text012: Label 'Today';
        Text013: Label 'Posting Date';
        CGSTAmt: Decimal;
        SGSTAmt: Decimal;
        IGSTAmt: Decimal;
        Customerrec: Record Customer;
        Customertype: Text[20];
        salesinvline: Record "Sales Invoice Line";
        detailedGSTLedgerEntryrec: Record "Detailed GST Ledger Entry";
        Rec_SalesShipmentHeader: Record "Sales Shipment Header";
        Customertype1: Text[20];
        salescrmemolinerec: Record "Sales Cr.Memo Line";
        qty1: Decimal;
        qty: Decimal;
        PFAmt1: Decimal;
        FreAmt1: Decimal;
        InsuranceAmt1: Decimal;
        ChargesAmt1: Decimal;
        Grossamt1: Decimal;
        GrossAmt: Decimal;
        baseamt1: Decimal;
        baseamt: Decimal;
        CGSTAmt1: Decimal;
        SGSTAmt1: Decimal;
        IGSTAmt1: Decimal;
        itemrec: Record Item;
        //  PstedStrOrdLineDet: Record "13798";
        OCNo: Code[20];
        OCDate: Date;
        webmodel: Code[200];
        webarm: Code[200];
        webseries: Code[200];
        webmech: Code[200];
        webbase: Code[200];
        webcategory: Code[200];
        webmodel1: Code[200];
        webarm1: Code[200];
        webseries1: Code[200];
        webmech1: Code[200];
        webbase1: Code[200];
        webcategory1: Code[200];
        PFAmt: Decimal;
        FreAmt: Decimal;
        InsuranceAmt: Decimal;
        ChargesAmt: Decimal;
        Rec_Cust: Record 114;//abs
        ExtDocNo: Code[50];
        Shiptocode: Code[30];
        RecSalesPerson: Record "Salesperson/Purchaser";
        RecSalesPerson1: Record "Salesperson/Purchaser";
        DocType: Text;
        DETGSTLEdEntry: Record "Detailed GST Ledger Entry";
        CurrFact: Decimal;
        ExchRate: Decimal;
        CurrFact1: Decimal;
        ExchRate1: Decimal;
        SalesHeader: Record "Sales Header";
        VehicalNo: Code[20];
        LRNo: Code[20];
        LRDate: Date;
        ShippingAgent: Record "Shipping Agent";
        TransporterName: Text[50];

}


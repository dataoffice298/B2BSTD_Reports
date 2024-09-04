report 50003 "Purchase Register Invoicewise"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Layouts/Purch Reg Invoice Wise.rdl';

    Caption = 'Purchase Register Invoicewise Report';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "Posting Date", "No.";


            column(CompInf_Name; Rec_CompInf.Name)
            {
            }
            column(CompInf_Address; Rec_CompInf.Address)
            {
            }
            column(CompInf_Adress2; Rec_CompInf."Address 2")
            {
            }
            column(CompInf_City; Rec_CompInf.City)
            {
            }
            column(CompInf_PostCode; Rec_CompInf."Post Code")
            {
            }
            column(No_; "No.")
            {
            }
            column(Posting_Date; "Posting Date")
            {
            }
            column(Vendor_No_; "Buy-from Vendor No.")
            {
            }
            column(Vendor_Name; "Buy-from Vendor Name")
            {
            }
            column(Vendor_Invoice_No_; "Vendor Invoice No.")
            {
            }
            column(Location_Code; "Location Code")
            {
            }
            column(VendorCity; "Buy-from City")
            {
            }
            column(Vendor_Posting_Group; "Vendor Posting Group")
            {
            }
            column(GstRegNo; Rec_Vendor."GST Registration No.")
            {
            }
            column(StateCode; Rec_Vendor."State Code")
            {
            }
            column(PAN; Rec_Vendor."P.A.N. No.")
            {
            }
            column(Gen__Bus__Posting_Group; "Gen. Bus. Posting Group")
            {
            }
            column(Dimension_Code1; "Shortcut Dimension 1 Code")
            {
            }
            column(Dimension_Code2; "Shortcut Dimension 2 Code")
            {
            }
            column(Var_SubTotal; Var_SubTotal)
            {
            }
            column(Var_GSTPerText; Var_GSTPerText)
            {
            }
            column(Var_GSTPer; Var_GSTPer)
            {
            }
            column(Var_CGSTAmt; Var_CGSTAmt)
            {
            }
            column(Var_IGSTAmt; Var_IGSTAmt)
            {
            }
            column(Var_SGSTAmt; Var_SGSTAmt)
            {
            }
            column(Var_Total; Var_Total)
            {
            }
            column(Var_TotalGSTAmt; Var_TotalGSTAmt)
            {
            }
            column(Var_SL; Var_SL)
            {
            }
            column(Order_No; Order_No)
            {
            }
            column(Order_Date; Order_Date)
            {
            }
            column(Receipt_Date; Receipt_Date)
            {
            }
            column(Receipt_No; Receipt_No)
            {
            }
            column(Order_No__New; "Order No.")
            {

            }
            column(Order_Date_New; "Order Date")
            {

            }
            // column(PO_Type; "PO Type")
            // {
            // }
            column(Currency_Code; "Currency Code")
            {
            }
            column(baseamt; baseamt)
            {
            }
            column(ExchRate; ExchRate)
            {
            }
            column(DimName1; DimName1)
            {
            }
            column(DimName2; DimName2)
            {
            }
            column(VarBaseAmtDoc; VarBaseAmtDoc)
            {

            }
            column(VarBaseAmtLCY; VarBaseAmtLCY)
            {

            }
            column(VarChargeitem_; VarChargeitem_) { }
            column(VarCustomDtyinsurchrg; VarCustomDtyinsurchrg_) { }
            column(GstAssebleVal_; GstAssebleVal_) { }
            column(var_AIRFREIGHT_; var_AIRFREIGHT_) { }
            column(Var_Insurance_; Var_Insurance_) { }
            column(Var_inwardTransport_; Var_inwardTransport_) { }
            column(Var_PackCharg_; Var_PackCharg_) { }
            column(Var_CNF_; Var_CNF_) { }
            column(Var_OceanFreight_; Var_OceanFreight_) { }
            column(Document_Date; "Document Date") { }
            column(Var_TDS_Amount; Var_TDS_Amount) { }
            column(var_Netamount_; var_Netamount_) { }
            column(Applied_Invoice_No; "Applied Invoice No") { }
            column(packingchargerindoc; packingchargerindoc) { }

            trigger OnPreDataItem()
            begin
                Var_SL := 0;
                Rec_CompInf.Reset();
                // if Rec_CompInf.get() then;
            end;

            trigger OnAfterGetRecord()
            var
                RecPurchinvhdr, RecPurchinvhdr2 : Record "Purch. Inv. Header";
                RecPIL, RecPIL2 : Record "Purch. Inv. Line";
            begin
                Clear(var_AIRFREIGHT_);
                Clear(Var_CNF_);
                Clear(Var_PackCharg_);
                Clear(Var_inwardTransport_);
                Clear(Var_OceanFreight_);
                Clear(Var_Insurance_);
                Clear(VarChargeitem_);
                Clear(Var_SubTotal);
                Clear(VarCustomDtyinsurchrg_);
                Clear(GstAssebleVal_);
                Clear(Var_TotalGSTAmt);
                Clear(VarBaseAmtDoc);
                Clear(VarBaseAmtLCY);
                Clear(baseAmtdocForItem);
                Clear(packingchargerindoc);
                Rec_PurchInvLine.Reset();
                Rec_PurchInvLine.SetRange("Document No.", "No.");
                Rec_PurchInvLine.SetFilter(Type, '%1|%2', Rec_PurchInvLine.Type::Item, Rec_PurchInvLine.Type::"G/L Account");
                Rec_PurchInvLine.SetFilter("No.", '<>%1', '460532');
                if Rec_PurchInvLine.FindSet() then
                    repeat
                        baseAmtdocForItem += Rec_PurchInvLine."Line Amount";
                        VarCustomDtyinsurchrg_ += Rec_PurchInvLine."Custom Duty Amount";

                        VarBaseAmtLCY += Rec_PurchInvLine."Line Amount";
                    until Rec_PurchInvLine.Next() = 0;
                //if "Currency Code" <> '' then begin


                RecPIL2.Reset();
                RecPIL2.SetRange("Document No.", "Purch. Inv. Header"."No.");
                if RecPIL2.FindSet() then
                    repeat
                        GstAssebleVal_ += RecPIL2."GST Assessable Value";
                    until RecPIL2.Next() = 0;
                RecPIL.Reset();
                RecPIL.SetRange("Document No.", "Purch. Inv. Header"."No.");
                RecPIL.SetRange(Type, RecPIL.Type::"Charge (Item)");
                if RecPIL.FindSet() then
                    repeat

                        // if RecPIL."No." = 'PACKINGCHG' then begin
                        if "Purch. Inv. Header"."Currency Code" <> '' then
                            Var_PackCharg_ += RecPIL."Line Amount" * (1 / "Purch. Inv. Header"."Currency Factor")
                        else
                            Var_PackCharg_ += RecPIL."Line Amount";
                    // end;
                    // if RecPIL."No." = 'AIRFREIGHT' then begin
                    //     if "Purch. Inv. Header"."Currency Code" <> '' then
                    //         var_AIRFREIGHT_ += RecPIL."Line Amount" * (1 / "Purch. Inv. Header"."Currency Factor")
                    //     else
                    //         var_AIRFREIGHT_ += RecPIL."Line Amount";
                    // end;
                    // if RecPIL."No." = 'INSURANCE' then begin
                    //     if "Purch. Inv. Header"."Currency Code" <> '' then
                    //         Var_Insurance_ += RecPIL."Line Amount" * (1 / "Purch. Inv. Header"."Currency Factor")
                    //     else
                    //         Var_Insurance_ += RecPIL."Line Amount";
                    // end;
                    // if RecPIL."No." = 'CNF' then begin
                    //     if "Purch. Inv. Header"."Currency Code" <> '' then
                    //         Var_CNF_ += RecPIL."Line Amount" * (1 / "Purch. Inv. Header"."Currency Factor")
                    //     else
                    //         Var_CNF_ += RecPIL."Line Amount";
                    // end;
                    // if RecPIL."No." = 'OCCEANFRGHT' then begin
                    //     if "Purch. Inv. Header"."Currency Code" <> '' then
                    //         Var_OceanFreight_ += RecPIL."Line Amount" * (1 / "Purch. Inv. Header"."Currency Factor")
                    //     else
                    //         Var_OceanFreight_ += RecPIL."Line Amount";
                    // end;
                    // if RecPIL."No." = 'INWTRNSP' then begin
                    //     if "Purch. Inv. Header"."Currency Code" <> '' then
                    //         Var_inwardTransport_ += RecPIL."Line Amount" * (1 / "Purch. Inv. Header"."Currency Factor")
                    //     else
                    //         Var_inwardTransport_ += RecPIL."Line Amount";
                    // end;
                    until RecPIL.Next() = 0;
                // end;

                RecPurchInvLine2.Reset();
                RecPurchInvLine2.SetRange("Document No.", "No.");
                RecPurchInvLine2.SetRange(Type, RecPurchInvLine2.Type::Item);
                if RecPurchInvLine2.FindSet() then
                    repeat
                        if RecPurchInvLine2.Type = RecPurchInvLine2.Type::Item then begin
                            if RecPurchInvLine2."Receipt No." = '' then CurrReport.Skip();
                        end;
                    until RecPurchInvLine2.Next() = 0;


                Var_SL += 1;
                Clear(Order_Date);
                Clear(Receipt_Date);
                Clear(Order_No);
                Clear(Receipt_No);
                Rec_PurchInvLine.Reset();
                Rec_PurchInvLine.SetRange("Document No.", "Purch. Inv. Header"."No.");
                if Rec_PurchInvLine.FindFirst() then begin
                    Purch_RcptHdr.Reset();
                    Purch_RcptHdr.SetRange("No.", Rec_PurchInvLine."Receipt No.");
                    if Purch_RcptHdr.FindFirst() then begin
                        Receipt_Date := Purch_RcptHdr."Posting Date";
                        Order_Date := Purch_RcptHdr."Order Date";
                        Order_No := Purch_RcptHdr."Order No.";
                        Receipt_No := Purch_RcptHdr."No.";
                    end;
                end;
                Rec_Vendor.Reset();
                if Rec_Vendor.Get("Purch. Inv. Header"."Buy-from Vendor No.") then;
                Clear(Var_CGSTAmt);
                Clear(Var_GSTPer);
                Clear(Var_GSTPerText);
                Clear(Var_IGSTAmt);
                Clear(Var_SGSTAmt);
                Clear(Var_Total);
                Clear(VarBaseAmtLCY1);
                Clear(VarBaseAmtLCY2);
                Clear(VarBaseAmtLCY3);
                RecDetailGstLedgerEntry.Reset();
                RecDetailGstLedgerEntry.SetRange("Document No.", "No.");
                // RecDetailGstLedgerEntry.Setfilter(Type, '%1|%2', RecDetailGstLedgerEntry.Type::Item, RecDetailGstLedgerEntry.Type::"G/L Account");
                if RecDetailGstLedgerEntry.FindSet() then
                    repeat

                        CASE RecDetailGstLedgerEntry."GST Component Code" OF
                            'CGST':
                                BEGIN
                                    Var_CGSTAmt += ABS(RecDetailGstLedgerEntry."GST Amount");
                                    VarBaseAmtLCY1 := ABS(RecDetailGstLedgerEntry."GST Base Amount");
                                    Var_GSTPer := RecDetailGstLedgerEntry."GST %" * 2;
                                END;
                            'SGST':
                                BEGIN
                                    Var_SGSTAmt += ABS(RecDetailGstLedgerEntry."GST Amount");
                                    // VarBaseAmtLCY2 := ABS(RecDetailGstLedgerEntry."GST Base Amount");
                                END;
                            'IGST':
                                BEGIN
                                    Var_IGSTAmt += ABS(RecDetailGstLedgerEntry."GST Amount");
                                    VarBaseAmtLCY3 := ABS(RecDetailGstLedgerEntry."GST Base Amount");
                                    Var_GSTPer := RecDetailGstLedgerEntry."GST %";
                                END;
                        end;
                        CurrFact := RecDetailGstLedgerEntry."Currency Factor";
                    until RecDetailGstLedgerEntry.next = 0;
                Clear(VarBaseAmtDoc);
                VarBaseAmtDoc := baseAmtdocForItem;
                Var_TotalGSTAmt := Var_CGSTAmt + Var_SGSTAmt + Var_IGSTAmt;

                // RecPurchInvLine2.reset();
                // RecPurchInvLine2.setRange("Document No.", "Purch. Inv. Header"."No.");
                // RecPurchInvLine2.SetFilter(Type, '%1', RecPurchInvLine2.Type::"Charge (Item)");
                // if RecPurchInvLine2.FindSet() then
                //     repeat
                //         RecPurchinvhdr.Reset();
                //         if RecPurchinvhdr.Get(RecPurchInvLine2."Document No.") then
                //             if RecPurchinvhdr."Currency Code" <> '' then
                //                 VarChargeitem_ += RecPurchInvLine2."Line Amount" * (1 / RecPurchinvhdr."Currency Factor")
                //             else
                //                 VarChargeitem_ += RecPurchInvLine2."Line Amount";

                //     until RecPurchInvLine2.Next() = 0;

                //2nd
                RecPurchInvLine2.reset();
                RecPurchInvLine2.setRange("Document No.", "Purch. Inv. Header"."No.");
                RecPurchInvLine2.SetFilter(Type, '%1', RecPurchInvLine2.Type::"Charge (Item)");
                if RecPurchInvLine2.FindSet() then
                    repeat
                        //if RecPurchInvLine2."No." = 'PACKINGCHG' then begin
                        RecPurchinvhdr.Reset();
                        if RecPurchinvhdr.Get(RecPurchInvLine2."Document No.") then
                            if RecPurchinvhdr."Currency Code" <> '' then
                                packingchargerindoc += RecPurchInvLine2."Line Amount"
                            else
                                packingchargerindoc += RecPurchInvLine2."Line Amount";
                    //VarBaseAmtLCY += packingchargerindoc;
                    // end;
                    until RecPurchInvLine2.Next() = 0;
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
                Clear(ExchRate);
                CurrFact := "Purch. Inv. Header"."Currency Factor";
                Clear(Var_TDS_Amount);
                Rec_Tds_Entry.Reset();
                Rec_Tds_Entry.SetRange("Document No.", "Purch. Inv. Header"."No.");
                if Rec_Tds_Entry.FindSet() then
                    repeat

                        Var_TDS_Amount += Rec_Tds_Entry."TDS Amount";
                    until Rec_Tds_Entry.Next() = 0;

                if CurrFact <> 0 then begin
                    ExchRate := (1 / CurrFact);
                    VarBaseAmtLCY := VarBaseAmtLCY * ExchRate;
                    VarCustomDtyinsurchrg_ := VarCustomDtyinsurchrg_ * ExchRate;
                    GstAssebleVal_ := GstAssebleVal_ * ExchRate;
                end
                else begin
                    // VarBaseAmtLCY := VarBaseAmtLCY;
                    VarCustomDtyinsurchrg_ := VarCustomDtyinsurchrg_;
                    GstAssebleVal_ := GstAssebleVal_;
                end;




                if "Purch. Inv. Header"."Currency Code" <> '' then begin
                    VarBaseAmtLCY := VarBaseAmtLCY;
                    GstAssebleVal_ := (GstAssebleVal_ + VarCustomDtyinsurchrg_);
                    Var_Total += VarBaseAmtLCY + Var_TotalGSTAmt + VarCustomDtyinsurchrg_ + var_AIRFREIGHT_ + Var_CNF_ + Var_Insurance_ + Var_PackCharg_
                                + Var_OceanFreight_ + Var_inwardTransport_ //+ ;

                end
                else begin
                    // if VarChargeitem_ <> 0 then begin
                    //     VarBaseAmtLCY := VarChargeitem_;
                    // end
                    // else begin
                    //     VarBaseAmtLCY := VarBaseAmtLCY + VarChargeitem_;
                    // end;
                    GstAssebleVal_ := VarBaseAmtLCY;
                    Var_Total += VarBaseAmtLCY + Var_TotalGSTAmt + VarCustomDtyinsurchrg_ + var_AIRFREIGHT_ + Var_CNF_ + Var_Insurance_
                                + Var_OceanFreight_ + Var_inwardTransport_ + Var_PackCharg_ //+ ;

                    // GstAssebleVal_ := GstAssebleVal_;
                end;
                // Var_Total += VarBaseAmtLCY + Var_TotalGSTAmt + VarCustomDtyinsurchrg_ + var_AIRFREIGHT_ + Var_CNF_ + Var_Insurance_ + Var_PackCharg_
                //                 + Var_OceanFreight_ + Var_inwardTransport_;
                // Var_Total += VarBaseAmtLCY + Var_TotalGSTAmt + VarCustomDtyinsurchrg_ + Var_PackCharg_;
                var_Netamount_ := Abs(Var_Total - Var_TDS_Amount);

                Clear("Applied Invoice No");
                RecValueEntri.Reset();
                RecValueEntri.SetRange("Document No.", "Purch. Inv. Header"."No.");
                if RecValueEntri.FindFirst() then begin
                    RecValueEntri2.Reset();
                    RecValueEntri2.SetRange("Item Ledger Entry No.", RecValueEntri."Item Ledger Entry No.");
                    RecValueEntri2.SetRange(RecValueEntri2."Document Type", RecValueEntri2."Document Type"::"Purchase Invoice");
                    RecValueEntri2.SetRange("Item Charge No.", '');
                    if RecValueEntri2.FindFirst() then begin
                        if RecValueEntri2."Document No." <> "Purch. Inv. Header"."No." then
                            "Applied Invoice No" := RecValueEntri2."Document No."
                        else
                            "Applied Invoice No" := '';
                    end;
                end;
                if ExchRate <> 0 then
                    VarBaseAmtLCY := (packingchargerindoc + VarBaseAmtDoc) * ExchRate
                else
                    VarBaseAmtLCY := packingchargerindoc + VarBaseAmtDoc
                // if "Purch. Inv. Header"."Currency Code" = '' then
                //     GstAssebleVal_ := VarBaseAmtLCY
                // else
                //     GstAssebleVal_ := (GstAssebleVal_ + VarCustomDtyinsurchrg_);
            end;
        }
        dataitem("Purch. Cr. Memo Hdr.";
        "Purch. Cr. Memo Hdr.")
        {
            RequestFilterFields = "Posting Date", "No.";
            column(No_1; "No.")
            { }
            column(Posting_Date1; "Posting Date")
            {
            }
            column(Vendor_No_1; "Buy-from Vendor No.")
            {
            }
            column(Vendor_Name1; "Buy-from Vendor Name")
            {
            }
            /*  column(Vendor_Invoice_No_1;)
             {
             } */
            column(Location_Code1; "Location Code")
            {
            }
            column(VendorCity1; "Buy-from City")
            {
            }
            column(Vendor_Posting_Group1; "Vendor Posting Group")
            {
            }
            column(GstRegNo1; Rec_Vendor."GST Registration No.")
            {
            }
            column(StateCode1; Rec_Vendor."State Code")
            {
            }
            column(PAN1; Rec_Vendor."P.A.N. No.")
            {
            }
            column(Gen__Bus__Posting_Group1; "Gen. Bus. Posting Group")
            {
            }
            column(Dimension_Code11; "Shortcut Dimension 1 Code")
            {
            }
            column(Dimension_Code21; "Shortcut Dimension 2 Code")
            {
            }
            column(Var_SubTotal1; Var_SubTotal1)
            {
            }
            column(Var_GSTPerText1; Var_GSTPerText1)
            {
            }
            column(Var_GSTPer1; Var_GSTPer1)
            {
            }
            column(Var_CGSTAmt1; Var_CGSTAmt1)
            {
            }
            column(Var_IGSTAmt1; Var_IGSTAmt1)
            {
            }
            column(Var_SGSTAmt1; Var_SGSTAmt1)
            {
            }
            column(Var_Total1; Var_Total1)
            {
            }
            column(Var_TotalGSTAmt1; Var_TotalGSTAmt1)
            {
            }
            column(Var_SL1; Var_SL1)
            {
            }
            column(Order_No1; Order_No1)
            {
            }
            column(Order_Date1; Order_Date1)
            {
            }
            column(Receipt_Date1; Receipt_Date1)
            {
            }
            column(Receipt_No1; Receipt_No1)
            {
            }
            // column(PO_Type1; "PO Type")
            // {
            // }
            column(Currency_Code1; "Currency Code")
            {
            }
            column(ExchRate1; ExchRate1)
            {
            }
            column(baseamt1; baseamt1)
            {
            }
            column(DimName11; DimName11)
            {
            }
            column(DimName22; DimName22)
            {
            }

            trigger OnPreDataItem()
            begin
                Var_SL1 := 0;
            end;

            trigger OnAfterGetRecord()
            begin

                Var_SL1 += 1;

                Clear(Order_Date1);
                Clear(Receipt_Date1);
                Clear(Order_No1);
                Clear(Receipt_No1);

                Rec_PurchCredMemoLine.Reset();
                Rec_PurchCredMemoLine.SetRange("Document No.", "Purch. Cr. Memo Hdr."."No.");
                if Rec_PurchCredMemoLine.FindFirst() then begin
                    // Order_Date1 := Rec_PurchCredMemoLine."Order Date";
                    Order_No1 := Rec_PurchCredMemoLine."Order No.";
                    Rec_ReturnShip.Reset();
                    Rec_ReturnShip.SetRange("No.", Rec_PurchCredMemoLine."Return Shipment No.");
                    if Rec_ReturnShip.FindFirst() then begin
                        Receipt_Date1 := Rec_ReturnShip."Posting Date";
                        Receipt_No1 := Rec_ReturnShip."No.";
                    end;
                end;

                Rec_Vendor.Reset();
                if Rec_Vendor.Get("Purch. Cr. Memo Hdr."."Buy-from Vendor No.") then;
                Clear(CurrFact1);
                Clear(Var_CGSTAmt1);
                Clear(Var_GSTPer1);
                Clear(Var_GSTPerText1);
                Clear(Var_IGSTAmt1);
                Clear(Var_SGSTAmt1);
                Clear(Var_Total1);
                Clear(Var_TotalGSTAmt1);
                Clear(Var_SubTotal1);
                Clear(baseamtdoc1);
                Clear(CurrFact1);
                Clear(baseamt1);
                Clear(var_baseamtCM1);
                Clear(var_baseamtCM2);
                Clear(var_baseamtCM3);
                RecDetailGstLedgerEntry.Reset();
                RecDetailGstLedgerEntry.SetRange("Document No.", "No.");
                if RecDetailGstLedgerEntry.FindSet() then
                    repeat

                        CASE RecDetailGstLedgerEntry."GST Component Code" OF
                            'CGST':
                                BEGIN
                                    Var_CGSTAmt1 := ABS(RecDetailGstLedgerEntry."GST Amount");
                                    var_baseamtCM1 := abs(RecDetailGstLedgerEntry."GST Base Amount");//shyam
                                    Var_GSTPer1 := RecDetailGstLedgerEntry."GST %" * 2;//shyam
                                END;
                            'SGST':
                                BEGIN
                                    Var_SGSTAmt1 := ABS(RecDetailGstLedgerEntry."GST Amount");
                                    // var_baseamtCM2 := abs(RecDetailGstLedgerEntry."GST Base Amount")//shyam

                                END;
                            'IGST':
                                BEGIN
                                    Var_IGSTAmt1 := ABS(RecDetailGstLedgerEntry."GST Amount");
                                    var_baseamtCM3 := abs(RecDetailGstLedgerEntry."GST Base Amount");//shyam
                                    Var_GSTPer1 := RecDetailGstLedgerEntry."GST %";//shyam

                                END;
                        end;
                        CurrFact1 := RecDetailGstLedgerEntry."Currency Factor";//shyam
                    until RecDetailGstLedgerEntry.next = 0;
                Var_TotalGSTAmt1 := Var_CGSTAmt1 + Var_SGSTAmt1 + Var_IGSTAmt1;
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
                Clear(ExchRate1);
                Rec_PurchCredMemoLine.Reset();
                Rec_PurchCredMemoLine.SetRange("Document No.", "Purch. Cr. Memo Hdr."."No.");
                if Rec_PurchCredMemoLine.FindSet() then
                    repeat
                        Var_SubTotal1 += Rec_PurchCredMemoLine."Line Amount";
                        baseamt1 += Rec_PurchCredMemoLine."Line Amount";
                    until Rec_PurchCredMemoLine.Next() = 0;
                if CurrFact1 <> 0 then begin
                    ExchRate1 := (1 / CurrFact1);
                    // baseamtdoc1 := baseamt1 * CurrFact1;
                    baseamt1 := baseamt1 * ExchRate1;
                end;
                Var_Total1 := baseamt1 + Var_TotalGSTAmt1;
            end;
        }
    }

    requestpage
    {
        SaveValues = true;
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    /*  field(Name; SourceExpression)
                     {
                         ApplicationArea = All;    
                     } */
                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }


    var
        myInt: Integer;
        Var_Tds_Per: Decimal;
        Purch_RcptHdr: Record "Purch. Rcpt. Header";
        Rec_PurchInvLine: Record "Purch. Inv. Line";
        Receipt_Date: Date;
        Order_Date: Date;
        Receipt_No: Code[20];
        Num: code[20];
        Order_No: Code[20];
        Rec_Vendor: Record Vendor;
        Var_GSTPerText: Text[50];
        Var_GSTPer: Decimal;
        Rec_Loc: Record Location;
        Var_CGSTAmt: Decimal;
        Var_SGSTAmt: Decimal;
        Var_IGSTAmt: Decimal;
        Var_TotalGSTAmt: Decimal;
        Var_Total: Decimal;
        Rec_CompInf: Record "Company Information";
        Rec_Vend: Record Vendor;
        Var_SubTotal: Decimal;
        Var_SL: Integer;
        Var_SubTotal1: Decimal;
        Var_SL1: Integer;
        Var_CGSTAmt1: Decimal;
        Var_SGSTAmt1: Decimal;
        Var_IGSTAmt1: Decimal;
        Var_TotalGSTAmt1: Decimal;
        Var_Total1: Decimal;
        Var_GSTPerText1: Text[50];
        Var_GSTPer1: Decimal;
        Receipt_Date1: Date;
        packingchargerindoc: Decimal;
        Order_Date1: Date;
        Receipt_No1: Code[20];
        Order_No1: Code[20];
        "Applied Invoice No": Code[20];
        RecValueEntri, RecValueEntri2 : Record "Value Entry";
        Rec_PCML: Record "Purch. Cr. Memo Line";
        Rec_ReturnShip: Record "Return Shipment Header";
        Rec_PurchCredMemoLine: Record "Purch. Cr. Memo Line";
        LineDisc: Decimal;
        LineDisc1: Decimal;
        CurrFact: Decimal;
        ExchRate: Decimal;
        CurrFact1: Decimal;
        ExchRate1: Decimal;
        DimVal: Record "Dimension Value";
        DimName1: Text[100];
        DimName2: Text[100];
        DimName11: Text[100];
        DimName22: Text[100];
        Rec_PurchInvHdr2: Record "Purch. Inv. Header";
        Rec_PurchCredHdr: Record "Purch. Cr. Memo Hdr.";
        baseamt: Decimal;
        baseamt1: Decimal;
        RecDetailGstLedgerEntry: Record "Detailed GST Ledger Entry";

        VarBaseAmtLCY1: Decimal;
        VarBaseAmtLCY2: Decimal;
        VarBaseAmtLCY3: Decimal;
        VarBaseAmtLCY: Decimal;
        VarBaseAmtDoc: Decimal;
        VarChargeitem_: Decimal;
        VarCustomDtyinsurchrg_: Decimal;
        RecPurchInvLine2: Record "Purch. Inv. Line";
        GstAssebleVal_: Decimal;
        Rec_ItemLedgEntry_: Record "Item Ledger Entry";
        Rec_PostPurChaseRepLine_: Record "Purch. Rcpt. Line";
        Rec_ValueEnt_: Record "Value Entry";
        Var_PackCharg_: Decimal;
        Var_CNF_: Decimal;
        var_AIRFREIGHT_: Decimal;
        Var_Insurance_: Decimal;
        Var_inwardTransport_: Decimal;
        Var_OceanFreight_: Decimal;
        var_baseamtCM1: Decimal;
        var_baseamtCM2: Decimal;
        var_baseamtCM3: Decimal;
        baseamtdoc1: Decimal;
        Rec_ItemLedEnt: Record "Item Ledger Entry";
        Rec_PurinvRecep_: Record "Purch. Rcpt. Line";
        var_Item_EntryNo_: Integer;
        Rec_Tds_Entry: Record "TDS Entry";
        Var_TDS_Amount: Decimal;
        var_Netamount_: Decimal;
        baseAmtdocForItem: Decimal;
        baseamtdocForGL: Decimal;
    /* GenProdPostingGroup:Text[100];
    ItemCategoryCode:Code[50];
    InventoryPostingGroup:Text[100];
    GenProdPostingGroup1:Text[100];
    ItemCategoryCode1:Code[50];
    InventoryPostingGroup1:Text[100]; */

}

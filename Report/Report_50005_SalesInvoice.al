report 50005 SalesInvoice
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Layouts/SalesInvoice.rdl';
    Caption = 'SalesInvoice';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Sell-to Customer No.";
            column(QR_Code; "Sales Invoice Header"."QR Code")
            {

            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(CopyText; CopyText)
                    {

                    }

                    column(IRN_Hash; "Sales Invoice Header"."IRN Hash")
                    {

                    }
                    column(OutputNo; OutputNo)
                    {

                    }
                    column(BillGst; BillGst)
                    {
                    }
                    column(BillPan; BillPan)
                    {
                    }
                    // column(VarUATNo; VarUATNo)
                    // {

                    // }

                    column(No_; "Sales Invoice Header"."No.")
                    {

                    }
                    column(SO_No_; "Sales Invoice Header"."Order No.")
                    {

                    }
                    column(Posting_Date; "Sales Invoice Header"."Posting Date")
                    {

                    }
                    column(Pic; Rec_CompanyInfo.Picture)
                    {

                    }
                    column(Name; Rec_CompanyInfo.Name)
                    {

                    }
                    column(Address; Rec_CompanyInfo.Address)
                    {

                    }
                    column(Address2; Rec_CompanyInfo."Address 2")
                    {

                    }
                    column(City; Rec_CompanyInfo.City)
                    {

                    }
                    column(Postcode; Rec_CompanyInfo."Post Code")
                    {

                    }
                    column(Web; Rec_CompanyInfo."Home Page")
                    {

                    }
                    column(Email; Rec_CompanyInfo."E-Mail")
                    {

                    }
                    column(GSTN; Rec_CompanyInfo."GST Registration No.")
                    {

                    }
                    column(Pan; Rec_CompanyInfo."P.A.N. No.")
                    {

                    }
                    column(Lut_No; Var_Lut_No)
                    {

                    }
                    column(Lut_Date; Var_Lut_ValidityDate)
                    {

                    }
                    // column(CIN; Rec_CompanyInfo.CIN)
                    // {

                    // }
                    // column(AuthorizedSign; Rec_CompanyInfo."Authorized Signature")
                    // {

                    // }
                    column(Rec_CompanyInfo_LUTNo; LUTNo)
                    {

                    }
                    column(C_Email; Var_CustEmail)
                    {

                    }
                    column(C_PhNo; Var_CustPhoneNo)
                    {

                    }
                    column(Order_No_; "Sales Invoice Header"."External Document No.")
                    {

                    }
                    column(Order_Date; "Sales Invoice Header"."Order Date")
                    {

                    }
                    column(Var_Name; Var_Name)
                    {

                    }
                    column(Var_Addr1; Var_Addr1)
                    {

                    }
                    column(Var_Addr2; Var_Addr2)
                    {

                    }
                    column(Var_PostCode; Var_PostCode)
                    {

                    }
                    column(Var_City; Var_City)
                    {

                    }
                    column(Var_GSTN; Var_GSTN)
                    {

                    }
                    column(Var_StateName; Var_StateName)
                    {

                    }
                    column(Var_StateCode; Var_StateCode)
                    {

                    }
                    column(BName; "Sales Invoice Header"."Bill-to Name")
                    {

                    }
                    column(BAddr; "Sales Invoice Header"."Bill-to Address")
                    {

                    }
                    column(BAddr2; "Sales Invoice Header"."Bill-to Address 2")
                    {

                    }
                    column(BCity; "Sales Invoice Header"."Bill-to City")
                    {

                    }
                    column(BPostCode; "Sales Invoice Header"."Bill-to Post Code")
                    {

                    }
                    column(BPhoneNo; "Sales Invoice Header"."Bill-to Contact No.")
                    {

                    }

                    column(SName; Var_ShipName)
                    {

                    }
                    column(SAddr; Var_ShipAddr1)
                    {

                    }
                    column(SAddr2; Var_ShipAddr2)
                    {

                    }
                    column(SCity; Var_ShipCity)
                    {

                    }
                    column(SPostCode; Var_ShipPostCode)
                    {

                    }
                    column(SPhone_No_; Var_ShipPhoneNo)
                    {

                    }

                    column(ShipGst; Var_ShipGSTN)
                    {

                    }
                    column(var_SStateName; var_ShipStateName)
                    {

                    }
                    column(Var_SStatecode; Var_ShipStatecode)
                    {

                    }
                    column(BkAccno; var_BankAccno)
                    {

                    }
                    column(BkName; var_BankName)
                    {

                    }
                    column(BkIFSC; var_BankIFSC)
                    {

                    }
                    column(BkBranch; var_BankBranch)
                    {

                    }
                    column(Var_BStatecode; Var_BillStatecode)
                    {

                    }
                    column(var_BStateName; var_BillStateName)
                    {

                    }
                    column(Var_DOS; "Sales Invoice Header"."Shipment Date")
                    {

                    }
                    column(Var_CustPanNo; Var_CustPanNo)
                    {

                    }
                    column(Var_custGstRegNo; Var_custGstRegNo)
                    {

                    }
                    column(SEmail; Var_ShipEmail)
                    {

                    }
                    column(CompLutNoLbl; CompLutNoLbl) { }
                    column(ValidityLbl; ValidityLbl) { }
                    column(SEZ_DecLbl; SEZ_DecLbl) { }
                    column(NoteLbl; NoteLbl) { }
                    column(Comp_Lut_No; Comp_Lut_No) { }
                    column(Note; Note) { }
                    column(CompWeiss; CompWeiss) { }
                    column(ValidDate; ValidDate) { }
                    column(SEZ_Dec; SEZ_Dec) { }
                    column(LUT_NUm; LUT_No) { }
                    column(LUT_Validity; LUT_Validity) { }

                    column(Comp_Lut_ValidityDate; Comp_Lut_ValidityDate) { }
                    dataitem("Sales Invoice Line"; "Sales Invoice Line")
                    {
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemLink = "Document No." = FIELD("No.");
                        //DataItemTableView = SORTING("Document No.", "Line No.");
                        DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Type = FILTER(Item | "G/L Account" | "Fixed Asset" | "Charge (Item)"), "No." = filter(<> '302196'));
                        column(ItemNo; "No.")
                        {

                        }
                        column(Description; Description)
                        {

                        }
                        column(Description_2; "Description 2")
                        {

                        }
                        column(HSN_SAC_Code; "HSN/SAC Code")
                        {

                        }
                        column(Unit_of_Measure_Code; "Unit of Measure Code")
                        {

                        }
                        column(Unit_Price; "Unit Price")
                        {

                        }
                        column(Line_Amount; "Line Amount")
                        {

                        }
                        column(Line_Disc; "Line Discount %")
                        {

                        }
                        column(Quantity; Quantity)
                        {

                        }
                        column(DiscAmt; "Line Discount Amount")
                        {

                        }
                        column(Sl; Sl)
                        {

                        }
                        column(Var_ItmRevDesc; Var_ItmRevDesc)
                        {

                        }
                        column(Var_SerialNo; Var_SerialNo)
                        {

                        }
                        column(Var_SO; Var_SO)
                        {

                        }
                        //Var_GSTPer
                        column(Var_GSTPer1; Var_GSTPer1)
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
                        column(Var_TotalGSTAmt; Var_TotalGSTAmt)
                        {
                        }
                        column(Var_GrandTotal; Var_GrandTotal)
                        {
                        }
                        column(AmtInWords; AmtInWords[1] + ' ' + AmtInWords[2])
                        {
                        }
                        column(Var_asseableValue; Var_asseableValue)
                        {
                        }
                        column(Var_GrandTotal1; Var_GrandTotal1)
                        {
                        }
                        column(Decimals; Decimals)
                        {
                        }
                        column(Cc; Var_CurrencyForAmt)
                        {
                        }
                        column(Var_Terms; Var_Terms)
                        {

                        }

                        trigger OnPreDataItem()
                        begin
                            Sl := 0;
                            Var_Emptylines := 15;
                        end;

                        trigger OnAfterGetRecord()//Sales line
                        begin

                            Sl := Sl + 1;
                            Var_Emptylines -= 1;

                            Clear(Var_SerialNo);
                            Clear(Var_ItmRevDesc);

                            Clear(Var_SO);
                            Rec_SalesShip.Reset();
                            Rec_SalesShip.SetRange("Document No.", "Sales Invoice Line"."Shipment No.");
                            if Rec_SalesShip.FindFirst() then begin
                                Var_SO := Rec_SalesShip."Order No.";
                                Rec_ILE.Reset();
                                Rec_ILE.SetRange("Document No.", Rec_SalesShip."Document No.");
                                Rec_ILE.SetRange("Item No.", Rec_SalesShip."No.");
                                if Rec_ILE.FindSet() then
                                    repeat
                                        Var_SerialNo += Rec_ILE."Serial No." + ' , ';
                                    until Rec_ILE.Next() = 0;
                            end;

                            Rec_Item.Reset;
                            IF Rec_Item.Get("Sales Invoice Line"."No.") THEN;
                            // Var_RevisionNo := FORMAT(Rec_Item.RevisionNew);

                            Var_ItmRevDesc := Format("No.") + ' - ' + Description + '-';

                            Clear(Var_Terms);
                            Rec_SL.Reset();
                            Rec_SL.SetRange("Document No.", "Sales Invoice Line"."Document No.");
                            Rec_SL.SetRange(Type, Rec_SL.Type::" ");
                            Rec_SL.SetFilter("No.", '<>%1', '302196');
                            if Rec_SL.FindSet() then
                                repeat
                                    Variable[1] := 10;
                                    Var_Terms += Rec_SL.Description + '.' + Variable;
                                until Rec_SL.Next() = 0;


                            Clear(Var_GSTPer1);
                            Clear(GstPer1);
                            DetailedGstLedgEntry.RESET;
                            DetailedGstLedgEntry.SETRANGE("Document No.", "Sales Invoice Line"."Document No.");
                            DetailedGstLedgEntry.SETRANGE("Document Line No.", "Sales Invoice Line"."Line No.");
                            IF DetailedGstLedgEntry.FINDSET THEN
                                REPEAT
                                    CASE DetailedGstLedgEntry."GST Component Code" OF
                                        'cgst':
                                            BEGIN
                                                GstPer1 := DetailedGstLedgEntry."GST %";
                                                Var_GSTPer1 := GstPer1 * 2;
                                            END;
                                        'Sgst':
                                            BEGIN
                                                GstPer1 := DetailedGstLedgEntry."GST %";
                                                Var_GSTPer1 := GstPer1 * 2;
                                            END;
                                        'IGST':
                                            BEGIN
                                                Var_GSTPer1 := DetailedGstLedgEntry."GST %";
                                            END;
                                    END;

                                UNTIL DetailedGstLedgEntry.NEXT = 0;


                        End;
                    }//sl
                    dataitem(Integer; Integer)
                    {
                        column(Var_Emptylines; Var_Emptylines)
                        {

                        }
                        trigger OnPreDataItem()

                        begin
                            SETRANGE(Number, 1, Var_Emptylines);
                        end;
                    }
                    /*  //terms and description
                    dataitem("Sales Invoice Line1"; "Sales Invoice Line")
                    {
                        DataItemLinkReference = "Sales Invoice Header";
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemTableView = SORTING("Document No.", "Line No.") WHERE(Type = FILTER(' '));

                        column(SIL1No_; "No.")
                        {
                        }
                        column(SIL1Description; Description)
                        {
                        }
                    } */
                }
                trigger OnPreDataItem()
                begin
                    NoOfLoops := ABS(NoOfCopies);// +  1;
                    IF NoOfLoops <= 0 THEN
                        NoOfLoops := 1;
                    CopyText := '';
                    SETRANGE(Number, 1, 1);
                    OutputNo := 1;
                end;

                trigger OnAfterGetRecord()
                begin
                    IF Number = 1 THEN
                        CopyText := 'ORIGINAL FOR RECIPIENT';
                    IF Number = 2 THEN
                        CopyText := 'DUPLICATE FOR TRANSPORTER';
                    IF Number = 3 THEN
                        CopyText := 'TRIPLICATE FOR SUPPLIER';
                    IF Number > 3 THEN
                        CopyText := 'Extra Copy';
                    OutputNo += 1;
                end;
            }
            trigger OnPreDataItem()//sales header
            begin
                Rec_CompanyInfo.Get();
                Rec_CompanyInfo.CalcFields(Picture);
                // Rec_CompanyInfo.CalcFields("Authorized Signature");

            end;

            trigger OnAfterGetRecord()//sales header 1275
            begin

                Rec_Loc.Reset;
                Rec_Loc.SETRANGE(Code, "Location Code");
                if Rec_Loc.FINDFIRST() then begin
                    Var_Name := Rec_Loc."Name";
                    Var_Addr1 := Rec_Loc.Address;
                    Var_Addr2 := Rec_Loc."Address 2";
                    //VarUATNo := Rec_Loc."UAT Number";
                    Var_City := Rec_Loc.City;
                    Var_PostCode := Rec_Loc."Post Code";
                    Var_GSTN := Rec_Loc."GST Registration No.";
                    Rec_State.Reset();
                    IF Rec_State.GET(Rec_Loc."State Code") THEN BEGIN
                        Var_StateCode := Rec_State."State Code (GST Reg. No.)";
                        Var_StateName := Rec_State.Description;
                    END;
                end;
                Rec_Cust.RESET;
                if Rec_Cust.GET("Sell-to Customer No.") then;

                RecCustomer.Reset();
                if RecCustomer.get("Bill-to Customer No.") then;
                BillGst := RecCustomer."GST Registration No.";
                BillPan := RecCustomer."P.A.N. No.";

                // If Rec_Cust.FindFirst() then begin
                //Var_CustPanNo := Rec_Cust."P.A.N. No.";
                Var_custGstRegNoShip := Rec_Cust."GST Registration No.";
                Var_CustEmail := Rec_Cust."E-Mail";
                Var_CustPhoneNo := Rec_Cust."Phone No.";
                //end; 
                Clear(Var_Lut_No);
                Clear(Var_Lut_ValidityDate);
                Clear(Comp_Lut_No);
                Clear(Comp_Lut_ValidityDate);
                IF (("GST Customer Type" = "GST Customer Type"::"SEZ Development") OR ("GST Customer Type" = "GST Customer Type"::"SEZ Unit")) THEN BEGIN
                    Var_Lut_No := Rec_Cust."LUT No.";
                    Var_Lut_ValidityDate := rec_cust."LUT Validity Date";
                    Comp_Lut_No := Rec_CompanyInfo."LUT No";
                    Comp_Lut_ValidityDate := Rec_CompanyInfo."Vaildty Date";
                    CompWeiss := CompLutNoLbl;
                    ValidDate := ValidityLbl;
                    SEZ_Dec := SEZ_DecLbl;
                    LUT_No := LUT_NoLbl;
                    LUT_Validity := LUT_ValidityLbl;
                    Note := NoteLbl;
                end;


                Rec_BankAcc.Reset;
                Rec_BankAcc.setrange("No.", Rec_CompanyInfo."Bank Acct For SI Dom.");
                IF Rec_BankAcc.FindFirst() then begin
                    var_BankAccno := Rec_BankAcc."Bank Account No.";
                    var_BankName := Rec_BankAcc.Name;
                    var_BankIFSC := Rec_BankAcc."Transit No.";
                    var_BankBranch := Rec_BankAcc."Bank Branch No."; //+ ',' + Rec_BankAcc."Bank Branch Name";
                end;
                If "Ship-to Code" <> '' Then begin
                    Rec_ShipAddr.Reset();
                    Rec_State.Reset();
                    Rec_ShipAddr.SetRange(Code, "Sales Invoice Header"."Ship-to Code");
                    Rec_ShipAddr.SetRange("Customer No.", "Sales Invoice Header"."Sell-to Customer No.");
                    If Rec_ShipAddr.FindFirst() Then Begin
                        Var_ShipName := Rec_ShipAddr.Name;
                        Var_ShipAddr1 := Rec_ShipAddr.Address;
                        Var_ShipAddr2 := Rec_ShipAddr."Address 2";
                        Var_ShipPostCode := Rec_ShipAddr."Post Code";
                        Var_ShipCity := Rec_ShipAddr.City;
                        Var_ShipGSTN := Rec_ShipAddr."GST Registration No.";
                        Var_ShipPhoneNo := Rec_ShipAddr."Phone No.";
                        Var_ShipEmail := Rec_ShipAddr."E-Mail";
                        Rec_State.SetRange(Code, Rec_ShipAddr.State);
                        If Rec_State.FindFirst() Then Begin
                            Var_ShipStatecode := Rec_State.Code;
                            var_ShipStateName := Rec_State.Description;
                        END;
                    End;

                end else begin
                    /*  Var_ShipName := "Bill-to Name";
                   Var_ShipAddr1 := "Bill-to Address";
                   Var_ShipAddr2 := "Bill-to Address 2";
                   Var_ShipPostCode := "Bill-to Post Code";
                   Var_ShipCity := "Bill-to City";
                   Var_ShipGSTN := Var_custGstRegNoShip;
                   Var_ShipPhoneNo := Rec_Cust."Phone No.";
                   Var_ShipEmail := Rec_Cust."E-Mail";
                   Rec_State.Reset();
                   IF Rec_State.GET("Sales Invoice Header"."GST Bill-to State Code") THEN BEGIN
                       Var_ShipStatecode := Rec_State."State Code (GST Reg. No.)";
                       var_ShipStateName := Rec_State.Description;
                   END; */
                    //ADDED ON 20-03-23
                    Var_ShipName := "Sell-to Customer Name";
                    Var_ShipAddr1 := "Sell-to Address";
                    Var_ShipAddr2 := "Sell-to Address 2";
                    Var_ShipPostCode := "Sell-to Post Code";
                    Var_ShipCity := "Sell-to City";
                    Var_ShipGSTN := Var_custGstRegNoShip;
                    Var_ShipPhoneNo := Rec_Cust."Phone No.";
                    Var_ShipEmail := Rec_Cust."E-Mail";
                    Rec_State.Reset();
                    IF Rec_State.GET("Sales Invoice Header".State) THEN BEGIN
                        Var_ShipStatecode := Rec_State."State Code (GST Reg. No.)";
                        var_ShipStateName := Rec_State.Description;
                    END;
                end;

                Rec_State.Reset();
                IF Rec_State.GET("Sales Invoice Header"."GST Bill-to State Code") THEN BEGIN
                    Var_BillStatecode := Rec_State."State Code (GST Reg. No.)";
                    var_BillStateName := Rec_State.Description;

                END;

                /* Clear(Var_GSTPerText1);
                Clear(Var_GSTPer1); */

                /*   Var_GSTPerText1 := format("Sales Invoice Line"."GST Group Code");
                  Var_GSTPerText1 := Var_GSTPerText1.Replace('GOODS', '');
                  Var_GSTPerText1 := Var_GSTPerText1.Replace('SERVICE', '');
                  Var_GSTPerText1 := Var_GSTPerText1.Replace('R', '');

                  IF (Var_GSTPerText1 <> '') THEN
                      Evaluate(Var_GSTPer1, Var_GSTPerText1); */
                //Revision No    
                /* Rec_Item.Reset;
                Clear(Var_RevisionNo);
                IF Rec_Item.Get("Sales Invoice Line"."No.") THEN
                    Var_RevisionNo := FORMAT(Rec_Item.RevisionNew);

                IF "Sales Invoice Line".Type = Type::Item then
                    Var_ItmRevDesc := Format("No.") + ' - ' + Var_RevisionNo + ' - ' + "Sales Invoice Line".Description + ' ' + "Sales Invoice Line"."Description 2"
                else
                    Var_ItmRevDesc := Format("No.") + ' - ' + "Sales Invoice Line".Description + ' ' + "Sales Invoice Line"."Description 2";
 */
                //IGST,CGST,SGST,Subtotal,TTvalue,grandtotal,Amtinwords
                Clear(Var_GSTPer);
                Clear(Var_GSTPerText);
                Clear(Var_IGSTAmt);
                Clear(Var_CGSTAmt);
                Clear(Var_IGSTAmt);
                Rec_SIL.Reset;
                Rec_SIL.SetRange("Document No.", "Sales Invoice Header"."No.");
                Rec_SIL.SetFILTER(Type, '%1|%2|%3|%4', Type::Item, Type::"Fixed Asset", Type::"G/L Account", Type::"Charge (Item)");
                Rec_SIL.SetFilter("No.", '<>%1', '302196');
                IF Rec_SIL.FINDSET THEN
                    repeat

                        Var_asseableValue += Rec_SIL."Line Amount";
                        Var_GSTPerText := format(Rec_SIL."GST Group Code");
                        Var_GSTPerText := Var_GSTPerText.Replace('GOODS', '');
                        Var_GSTPerText := Var_GSTPerText.Replace('SERVICE', '');
                        Var_GSTPerText := Var_GSTPerText.Replace('R', '');

                        IF (Var_GSTPerText <> '') THEN
                            Evaluate(Var_GSTPer, Var_GSTPerText);

                        Rec_Loc.RESET;
                        if Rec_Loc.GET(Rec_SIL."Location Code") then;
                        Rec_Cust.Reset;
                        if Rec_Cust.GET("Sell-to Customer No.") then;
                        Var_CustPanNo := Rec_Cust."P.A.N. No.";
                        Var_custGstRegNo := Rec_Cust."GST Registration No.";

                    /*    if Rec_SIL.Exempted = false then begin
                           IF (Var_GSTPerText <> '') THEN BEGIN
                               Evaluate(Var_GSTPer, Var_GSTPerText);

                               IF (Rec_Cust."State Code" = Rec_Loc."State Code") THEN begin
                                   Var_CGSTAmt += (Rec_SIL."Line Amount" * (Var_GSTPer / 2)) / 100;
                                   Var_SGSTAmt += (Rec_SIL."Line Amount" * (Var_GSTPer / 2)) / 100;
                               end ELSE begin
                                   Var_IGSTAmt += (Rec_SIL."Line Amount" * (Var_GSTPer)) / 100;
                               end;
                               Var_TotalGSTAmt := Var_CGSTAmt + Var_SGSTAmt + Var_IGSTAmt;
                           END;
                       end; */

                    /*  Var_GrandTotal1 := Var_asseableValue + Var_TotalGSTAmt;
                     Var_GrandTotal := Round(Var_GrandTotal1, 1, '=');
                     Decimals := Var_GrandTotal - Var_GrandTotal1; */
                    UNTIL Rec_SIL.Next = 0;


                DetailedGstLedgEntry.RESET;
                DetailedGstLedgEntry.SETRANGE("Document No.", "Sales Invoice Header"."No.");
                IF DetailedGstLedgEntry.FINDSET THEN
                    REPEAT
                        CASE DetailedGstLedgEntry."GST Component Code" OF
                            'cgst':
                                BEGIN
                                    IF DetailedGstLedgEntry."Currency Code" <> '' THEN
                                        Var_CGSTAmt += ROUND(ABS(DetailedGstLedgEntry."GST Amount") * (DetailedGstLedgEntry."Currency Factor"))
                                    ELSE
                                        Var_CGSTAmt += ROUND(ABS(DetailedGstLedgEntry."GST Amount"));
                                END;
                            'Sgst':
                                BEGIN
                                    IF DetailedGstLedgEntry."Currency Code" <> '' THEN
                                        Var_SGSTAmt += ROUND(ABS(DetailedGstLedgEntry."GST Amount") * (DetailedGstLedgEntry."Currency Factor"))
                                    ELSE
                                        Var_SGSTAmt += ROUND(ABS(DetailedGstLedgEntry."GST Amount"));
                                END;
                            'IGST':
                                BEGIN
                                    IF DetailedGstLedgEntry."Currency Code" <> '' THEN
                                        Var_IGSTAmt += ROUND(ABS(DetailedGstLedgEntry."GST Amount") * (DetailedGstLedgEntry."Currency Factor"))
                                    ELSE
                                        Var_IGSTAmt += ROUND(ABS(DetailedGstLedgEntry."GST Amount"));
                                END;
                        END;
                        Var_TotalGSTAmt := Var_CGSTAmt + Var_SGSTAmt + Var_IGSTAmt;
                    UNTIL DetailedGstLedgEntry.NEXT = 0;



                Var_GrandTotal1 := Var_asseableValue + Var_TotalGSTAmt;
                Var_GrandTotal := Round(Var_GrandTotal1, 1, '=');//Round(Var_GrandTotal1, 1, '=');
                // Decimals := Var_GrandTotal - Var_GrandTotal1;
                Rec_SALLINE.Reset();
                Rec_SALLINE.SetRange("Document No.", "No.");
                Rec_SALLINE.SetFilter("No.", '=%1', '302196');
                if Rec_SALLINE.FindSet() then begin
                    Decimals := Decimals + Rec_SALLINE."Line Amount";
                end;



                Clear(Var_CurrencyForAmt);
                If "Sales Invoice Header"."Currency Code" = '' then
                    Var_CurrencyForAmt := 'INR'
                else
                    Var_CurrencyForAmt := "Sales Invoice Header"."Currency Code";

                Currency.reset;
                IF currency.GET("Sales Invoice Header"."Currency Code") THEN;


                if StrLen(Format(Decimals)) < StrLen(Format(Currency."Amount Rounding Precision")) then
                    if Decimals = 0 then
                        CheckAmountText := Format(Var_GrandTotal, 0, 0) +
                          CopyStr(Format(0.01), 2, 1) +
                          PadStr('', StrLen(Format(Currency."Amount Rounding Precision")) - 2, '0')
                    else
                        CheckAmountText := Format(Var_GrandTotal, 0, 0) +
                          PadStr('', StrLen(Format(Currency."Amount Rounding Precision")) - StrLen(Format(Decimals)), '0')
                else
                    CheckAmountText := Format(Var_GrandTotal, 0, 0);

                NumToWord.InitTextVariable;
                NumToWord.FormatNoText(AmtInWords, Var_GrandTotal, "Sales Invoice Header"."Currency Code");

                if "GST Customer Type" in ["GST Customer Type"::"SEZ Unit", "GST Customer Type"::"SEZ Development"] then
                    LUTNo := 'LUT No. : ' + Rec_CompanyInfo."LUT No";

            End;


        }//sh
    }//ds


    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    /*  field(NoOfCopies; NoOfCopies)
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

    Var
        Rec_CompanyInfo: record "Company Information";

        Rec_Loc: Record Location;
        VarUATNo: Text[50];
        Rec_State: Record State;
        Rec_SIL: record "Sales Invoice Line";
        DetailedGstLedgEntry: Record "Detailed GST Ledger Entry";
        Rec_Cust: Record Customer;
        Rec_BankAcc: Record "Bank Account";
        Rec_SSH: Record "Sales Shipment Header";
        Var_Dos: date;
        Var_Lut_No, Comp_Lut_No : Text[50];
        Var_Lut_ValidityDate, Comp_Lut_ValidityDate : Date;
        var_BankName: Text[100];
        var_BankAccno: Text[30];
        var_BankIFSC: Text[30];
        var_BankBranch: Text[100];
        Var_Name: text[50];
        Var_Addr1: Text[150];
        Var_Addr2: Text[150];
        Var_PostCode: Text[20];
        Var_City: Text[30];
        Var_GSTN: Code[20];
        Var_StateName: Text[20];
        Var_StateCode: Code[20];
        Sl: Integer;
        Rec_TaxRate: record "Tax Rate";
        Var_TaxRatePage: Page "Tax Rates";
        Var_CGSTPer: Decimal;
        Var_IGSTPer: Decimal;

        Var_SGSTPer: Decimal;
        Var_CGSTAmt: Decimal;
        Var_IGSTAmt: Decimal;

        CheckAmountText: Text[30];
        Var_IGSTAmt1: Decimal;
        Var_GrandTotal: Decimal;
        Var_GrandTotal1: Decimal;
        Var_frieghtAmt: Decimal;
        Var_TotalTaxableVal: Decimal;

        NumToWord: Codeunit "Global Functions B2B";
        AmtInWords: array[2] of text[250];
        Var_TotalGSTAmt: Decimal;
        Var_SGSTAmt: Decimal;
        Var_GSTPer: Integer;
        Var_GSTPerText, Note : Text;
        Var_GSTPer1: Integer;
        GstPer1: Integer;
        Var_GSTPerText1: Text;
        Var_GSTPerText2: Text;
        Var_GSTPerText3: Text;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        OutputNo: Integer;
        FormatDocument: Codeunit "Format Document";
        Rec_SALLINE: Record "Sales Invoice Line";

        Var_StateNo: Code[20];
        Var_asseableValue: Decimal;
        Var_StateDes: Text[20];
        Var_StateNo1: Code[20];
        Var_StateDes1: Text[20];
        Var_BillStatecode: Code[10];
        var_BillStateName: text[30];
        Var_ShipStatecode: Code[10];
        var_ShipStateName: text[30];

        Var_NameBill: Text[30];
        Var_PhoneNo: Text[30];
        Rec_ShipmentMethod: Record "Shipment Method";
        Var_ShipmentDesc: Text[50];
        Rec_SIL1: Record "Sales Invoice Line";
        Rec_Item: Record Item;
        Var_RevisionNo: Text;
        Rec_Contact: Record Contact;
        Var_Email: Text[80];
        Var_Contact: Text[30];
        Var_CustPanNo: Code[20];
        Decimals: decimal;
        Var_CustEmail: Text[80];
        Var_CustPhoneNo: Text[30];
        Var_custGstRegNo: Code[20];
        Var_custGstRegNoShip: Code[20];
        Var_TermsDesc: Text[100];
        Var_TermsNo: Text[50];
        Var_CurrencyForAmt: Code[20];
        Var_ShipName: text[200];
        Var_ShipAddr1: Text[150];
        Var_ShipAddr2: Text[150];
        Var_ShipPostCode: Text[20];
        Var_ShipCity: Text[30];
        Var_ShipGSTN: Code[20];
        Var_ShipPhoneNo: Text[20];
        Var_ShipEmail: text[80];
        Rec_ShipAddr: Record "Ship-to Address";
        Currency: Record Currency;
        Var_ItmRevDesc: Text[150];
        Rec_ILE: Record "Item Ledger Entry";
        Var_SerialNo: Text;
        Rec_ValueEntry: Record "Value Entry";
        Rec_SalesShip: Record "Sales Shipment Line";
        Var_SO: Code[20];
        Var_Terms: Text;

        Rec_SL: Record "Sales Invoice Line";
        Variable: Text[30];

        Var_Emptylines: Integer;
        RecCustomer: Record Customer;
        BillGst: Text;
        BillPan: Text;
        LUTNo: Text;
        CompanyAddress: Text;
        CompanyAddress2: Text;
        CompanyCity: Text;
        CompanyPostcode: Text;
        CompWeiss, ValidDate, SEZ_Dec, LUT_Validity, LUT_No : Text;
        LUT_NoLbl: Label 'LUT No.:';
        LUT_ValidityLbl: Label 'LUT Validity :';
        CompLutNoLbl: Label 'Weiss LUT No.:';
        ValidityLbl: Label 'Validity :';
        SEZ_DecLbl: Label 'SEZ Declaration :';
        NoteLbl: Label 'Supply meant for export for supplyto SEZ Unit SEZ developer of authorised operations under letter of  undertaking without payment of integrated tax.';


}
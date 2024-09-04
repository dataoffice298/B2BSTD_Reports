report 60001 "Vendor Summary Ageing New1"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report\Layouts\VendorSummaryAgeingNew.rdl';
    UseRequestPage = true;
    ApplicationArea = all;
    UsageCategory = ReportsAndAnalysis;

    dataset
    {
        dataitem(Vendor; Vendor)
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Global Dimension 1 Filter", "Vendor Posting Group";
            column(STRSUBSTNO_Text001_FORMAT_StartDate__; STRSUBSTNO(Text001, FORMAT(StartDate)))
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(FORMAT_TODAY_0_4_; FORMAT(TODAY, 0, 4))
            {
            }
            column(CurrReport_PAGENO; CurrReport.PAGENO)
            {
            }
            column(USERID; USERID)
            {
            }
            column(Vendor_TABLECAPTION__________Cust1Filter; Vendor.TABLECAPTION + ': ' + Cust1Filter)
            {
            }
            column(PeriodStartDate_9_; PeriodStartDate[9])
            {
            }
            column(PeriodStartDate_8_; PeriodStartDate[8])
            {
            }
            column(PeriodStartDate_7_; PeriodStartDate[7])
            {
            }
            column(PeriodStartDate_6_; PeriodStartDate[6])
            {
            }
            column(PeriodStartDate_5_; PeriodStartDate[5])
            {
            }
            column(PeriodStartDate_4_; PeriodStartDate[4])
            {
            }
            column(PeriodStartDate_3_; PeriodStartDate[3])
            {
            }
            column(PeriodStartDate_2_; PeriodStartDate[2])
            {
            }
            column(PeriodStartDate_9____1; PeriodStartDate[9] - 1)
            {
            }
            column(PeriodStartDate_8____1; PeriodStartDate[8] - 1)
            {
            }
            column(PeriodStartDate_7____1; PeriodStartDate[7] - 1)
            {
            }
            column(PeriodStartDate_6____1; PeriodStartDate[6] - 1)
            {
            }
            column(PeriodStartDate_5____1; PeriodStartDate[5] - 1)
            {
            }
            column(PeriodStartDate_4____1; PeriodStartDate[4] - 1)
            {
            }
            column(PeriodStartDate_3____1; PeriodStartDate[3] - 1)
            {
            }
            column(Before_______FORMAT_Period_____days_; 'Before...' + FORMAT(Period) + 'days')
            {
            }
            column(V0__________FORMAT_ABS_Period1______days_; '0' + '-' + FORMAT(ABS(Period1)) + 'days')
            {
            }
            column(FORMAT_ABS_Period1___1__________FORMAT_ABS_Period2______days_; FORMAT(ABS(Period1) + 1) + '-' + FORMAT(ABS(Period2)) + 'days')
            {
            }
            column(FORMAT_ABS_Period2___1__________FORMAT_ABS_Period3______days_; FORMAT(ABS(Period2) + 1) + '-' + FORMAT(ABS(Period3)) + 'days')
            {
            }
            column(FORMAT_ABS_Period3___1__________FORMAT_ABS_Period4______days_; FORMAT(ABS(Period3) + 1) + '-' + FORMAT(ABS(Period4)) + 'days')
            {
            }
            column(FORMAT_ABS_Period4__1__________FORMAT_ABS_Period5______days_; FORMAT(ABS(Period4) + 1) + '-' + FORMAT(ABS(Period5)) + 'days')
            {
            }
            column(FORMAT_ABS_Period5___1__________FORMAT_ABS_Period6______days_; FORMAT(ABS(Period5) + 1) + '-' + FORMAT(ABS(Period6)) + 'days')
            {
            }
            column(FORMAT_ABS_Period6___1__________FORMAT_ABS_Period7______days_; FORMAT(ABS(Period6) + 1) + '-' + FORMAT(ABS(Period7)) + 'days')
            {
            }
            column(After_______FORMAT_ABS_Period7______days_; 'After...' + FORMAT(ABS(Period7)) + 'days')
            {
            }
            column(CustBalanceDueLCY_9_; CustBalanceDueLCY[9])
            {
            }
            column(CustBalanceDueLCY_8_; CustBalanceDueLCY[8])
            {
            }
            column(CustBalanceDueLCY_7_; CustBalanceDueLCY[7])
            {
            }
            column(CustBalanceDueLCY_6_; CustBalanceDueLCY[6])
            {
            }
            column(CustBalanceDueLCY_5_; CustBalanceDueLCY[5])
            {
            }
            column(CustBalanceDueLCY_4_; CustBalanceDueLCY[4])
            {
            }
            column(CustBalanceDueLCY_3_; CustBalanceDueLCY[3])
            {
            }
            column(CustBalanceDueLCY_2_; CustBalanceDueLCY[2])
            {
            }
            column(CustBalanceDueLCY_1_; CustBalanceDueLCY[1])
            {
            }
            column(TotalCustBalanceLCY; TotalCustBalanceLCY)
            {
            }
            column(Vendor__No__; "No.")
            {
            }
            column(Vendor_Name; Name)
            {
            }
            column(CustBalanceDueLCY_9__Control1102154018; CustBalanceDueLCY[9])
            {
            }
            column(CustBalanceDueLCY_8__Control1102154023; CustBalanceDueLCY[8])
            {
            }
            column(CustBalanceDueLCY_7__Control1102154024; CustBalanceDueLCY[7])
            {
            }
            column(CustBalanceDueLCY_6__Control1102154025; CustBalanceDueLCY[6])
            {
            }
            column(CustBalanceDueLCY_5__Control1102154026; CustBalanceDueLCY[5])
            {
            }
            column(CustBalanceDueLCY_4__Control1102154027; CustBalanceDueLCY[4])
            {
            }
            column(CustBalanceDueLCY_3__Control1102154028; CustBalanceDueLCY[3])
            {
            }
            column(CustBalanceDueLCY_2__Control1102154029; CustBalanceDueLCY[2])
            {
            }
            column(CustBalanceDueLCY_1__Control1102154030; CustBalanceDueLCY[1])
            {
            }
            column(LineTotalCustBalance; LineTotalCustBalance)
            {
            }
            column(CustBalanceDueLCY_9__Control1102154046; CustBalanceDueLCY[9])
            {
            }
            column(CustBalanceDueLCY_8__Control1102154047; CustBalanceDueLCY[8])
            {
            }
            column(CustBalanceDueLCY_7__Control1102154048; CustBalanceDueLCY[7])
            {
            }
            column(CustBalanceDueLCY_6__Control1102154049; CustBalanceDueLCY[6])
            {
            }
            column(CustBalanceDueLCY_5__Control1102154050; CustBalanceDueLCY[5])
            {
            }
            column(CustBalanceDueLCY_4__Control1102154051; CustBalanceDueLCY[4])
            {
            }
            column(CustBalanceDueLCY_3__Control1102154052; CustBalanceDueLCY[3])
            {
            }
            column(CustBalanceDueLCY_2__Control1102154053; CustBalanceDueLCY[2])
            {
            }
            column(CustBalanceDueLCY_1__Control1102154054; CustBalanceDueLCY[1])
            {
            }
            column(TotalCustBalanceLCY_Control1102154055; TotalCustBalanceLCY)
            {
            }
            column(CustBalanceDueLCY_9__Control1102154058; CustBalanceDueLCY[9])
            {
            }
            column(CustBalanceDueLCY_8__Control1102154059; CustBalanceDueLCY[8])
            {
            }
            column(CustBalanceDueLCY_7__Control1102154060; CustBalanceDueLCY[7])
            {
            }
            column(CustBalanceDueLCY_6__Control1102154061; CustBalanceDueLCY[6])
            {
            }
            column(CustBalanceDueLCY_5__Control1102154062; CustBalanceDueLCY[5])
            {
            }
            column(CustBalanceDueLCY_4__Control1102154063; CustBalanceDueLCY[4])
            {
            }
            column(CustBalanceDueLCY_3__Control1102154064; CustBalanceDueLCY[3])
            {
            }
            column(CustBalanceDueLCY_2__Control1102154065; CustBalanceDueLCY[2])
            {
            }
            column(CustBalanceDueLCY_1__Control1102154066; CustBalanceDueLCY[1])
            {
            }
            column(TotalCustBalanceLCY_Control1102154067; TotalCustBalanceLCY)
            {
            }
            column(Vendor___Summary_AgeingCaption; Vendor___Summary_AgeingCaptionLbl)
            {
            }
            column(All_amounts_are_in_LcyCaption; All_amounts_are_in_LcyCaptionLbl)
            {
            }
            column(Page_No_Caption; Page_No_CaptionLbl)
            {
            }
            column(No_Caption; No_CaptionLbl)
            {
            }
            column(NameCaption; NameCaptionLbl)
            {
            }
            column(Balance_DueCaption; Balance_DueCaptionLbl)
            {
            }
            column(EmptyStringCaption; EmptyStringCaptionLbl)
            {
            }
            column(Total_BalanceCaption; Total_BalanceCaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154019; EmptyStringCaption_Control1102154019Lbl)
            {
            }
            column(Continued______________Caption; Continued______________CaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154021; EmptyStringCaption_Control1102154021Lbl)
            {
            }
            column(Continued___________________Caption; Continued___________________CaptionLbl)
            {
            }
            column(EmptyStringCaption_Control1102154020; EmptyStringCaption_Control1102154020Lbl)
            {
            }
            column(TotalCaption; TotalCaptionLbl)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CLEAR(LineTotalCustBalance);
                PrintCust := FALSE;
                FOR i := 1 TO 8 DO BEGIN
                    //DIM
                    IF Cust1Filter <> '' THEN
                        VendorLedgEntry.SETFILTER(VendorLedgEntry."Global Dimension 1 Code", Cust1Filter);
                    //DIM

                    IF DocumentDate THEN BEGIN
                        VendorLedgEntry.SETCURRENTKEY("Vendor No.", "Global Dimension 1 Code", "Document Date", Open);
                        VendorLedgEntry.SETRANGE("Vendor No.", "No.");
                        VendorLedgEntry.SETFILTER("Global Dimension 1 Code", Cust1Filter);
                        VendorLedgEntry.SETRANGE("Document Date", PeriodStartDate[i], PeriodStartDate[i + 1] - 1);
                        VendorLedgEntry.SETRANGE(Open, TRUE);
                        IF VendorLedgEntry.FINDFIRST THEN
                            REPEAT
                                //DtldCustLedgEntry.SETCURRENTKEY("Customer No.","Document Date","Initial Entry Global Dim. 1");
                                DtldVendorLedgEntry.SETRANGE("Vendor No.", VendorLedgEntry."Vendor No.");
                                DtldVendorLedgEntry.SETRANGE(DtldVendorLedgEntry."Vendor Ledger Entry No.", VendorLedgEntry."Entry No.");
                                DtldVendorLedgEntry.SETFILTER("Posting Date", '<=%1', StartDate);
                                IF DtldVendorLedgEntry.FINDFIRST THEN
                                    REPEAT
                                        CustBalanceDueLCY[i] += DtldVendorLedgEntry."Amount (LCY)";
                                    UNTIL DtldVendorLedgEntry.NEXT = 0;

                                /*CustLedgEntry.CALCFIELDS("Remaining Amt. (LCY)");
                                  CustBalanceDueLCY[i] += CustLedgEntry."Remaining Amt. (LCY)";*/

                                IF CustBalanceDueLCY[i] <> 0 THEN
                                    PrintCust := TRUE;
                            UNTIL VendorLedgEntry.NEXT = 0;
                        Vendor.CALCFIELDS("Balance (LCY)");
                        CustBalanceDueLCY1[i] := Vendor."Balance (LCY)";
                        LineTotalCustBalance := LineTotalCustBalance + CustBalanceDueLCY[i];
                    END;

                    IF PostingDate THEN BEGIN
                        VendorLedgEntry.SETCURRENTKEY("Vendor No.", "Global Dimension 1 Code", "Posting Date", Open);
                        VendorLedgEntry.SETRANGE("Vendor No.", "No.");
                        VendorLedgEntry.SETFILTER("Global Dimension 1 Code", Cust1Filter);
                        VendorLedgEntry.SETRANGE(Open, TRUE);
                        VendorLedgEntry.SETRANGE("Posting Date", PeriodStartDate[i], PeriodStartDate[i + 1] - 1);
                        IF VendorLedgEntry.FINDFIRST THEN
                            REPEAT
                                DtldVendorLedgEntry.SETCURRENTKEY("Vendor No.", "Posting Date", "Initial Entry Global Dim. 1");
                                DtldVendorLedgEntry.SETRANGE("Vendor No.", VendorLedgEntry."Vendor No.");
                                DtldVendorLedgEntry.SETRANGE(DtldVendorLedgEntry."Vendor Ledger Entry No.", VendorLedgEntry."Entry No.");
                                DtldVendorLedgEntry.SETFILTER("Posting Date", '<=%1', StartDate);
                                IF DtldVendorLedgEntry.FINDFIRST THEN
                                    REPEAT
                                        CustBalanceDueLCY[i] += DtldVendorLedgEntry."Amount (LCY)";
                                    UNTIL DtldVendorLedgEntry.NEXT = 0;

                                IF CustBalanceDueLCY[i] <> 0 THEN
                                    PrintCust := TRUE;
                            UNTIL VendorLedgEntry.NEXT = 0;

                        Vendor.CALCFIELDS("Balance (LCY)");
                        CustBalanceDueLCY1[i] := Vendor."Balance (LCY)";
                        LineTotalCustBalance := LineTotalCustBalance + CustBalanceDueLCY[i];
                    END;

                    IF DueDate THEN BEGIN
                        VendorLedgEntry.SETCURRENTKEY("Vendor No.", "Global Dimension 1 Code", "Due Date", Open);
                        VendorLedgEntry.SETRANGE("Vendor No.", "No.");
                        VendorLedgEntry.SETFILTER("Global Dimension 1 Code", Cust1Filter);
                        VendorLedgEntry.SETRANGE("Due Date", PeriodStartDate[i], PeriodStartDate[i + 1] - 1);
                        VendorLedgEntry.SETRANGE(Open, TRUE);
                        IF VendorLedgEntry.FINDFIRST THEN
                            REPEAT
                                DtldVendorLedgEntry.SETCURRENTKEY("Vendor No.", "Initial Entry Due Date", "Initial Entry Global Dim. 1");
                                DtldVendorLedgEntry.SETRANGE("Vendor No.", VendorLedgEntry."Vendor No.");
                                DtldVendorLedgEntry.SETRANGE(DtldVendorLedgEntry."Vendor Ledger Entry No.", VendorLedgEntry."Entry No.");
                                DtldVendorLedgEntry.SETFILTER("Posting Date", '<=%1', StartDate);
                                IF DtldVendorLedgEntry.FINDFIRST THEN
                                    REPEAT
                                        CustBalanceDueLCY[i] += DtldVendorLedgEntry."Amount (LCY)";
                                    UNTIL DtldVendorLedgEntry.NEXT = 0;

                                IF CustBalanceDueLCY[i] <> 0 THEN
                                    PrintCust := TRUE;
                            UNTIL VendorLedgEntry.NEXT = 0;
                        Vendor.CALCFIELDS("Balance (LCY)");
                        CustBalanceDueLCY1[i] := Vendor."Balance (LCY)";
                        LineTotalCustBalance := LineTotalCustBalance + CustBalanceDueLCY[i];
                    END;
                END;


                TotalCustBalanceLCY := TotalCustBalanceLCY + LineTotalCustBalance;

                IF (LineTotalCustBalance = 0) THEN
                    CurrReport.SKIP;

                IF NOT PrintCust THEN
                    CurrReport.SKIP;

            end;

            trigger OnPreDataItem()
            var
                Error1: TextConst ENN = 'The start date must be provided.';
                txtError: TextConst ENN = 'The period length needs to be specified.';
                PeriodLength1V: Code[10];
                PeriodLength2V: Code[10];
                PeriodLength3V: Code[10];
                PeriodLength4V: Code[10];
                PeriodLength5V: Code[10];
                PeriodLength6V: Code[10];
                PeriodLength7V: Code[10];
            begin
                if StartDate = 0D then
                    Error(Error1);
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
                IF (DocumentDate AND DueDate) THEN
                    ERROR('SELECT ONLY ONE DATE');

                IF (DocumentDate AND PostingDate) THEN
                    ERROR('SELECT ONLY ONE DATE');

                IF (PostingDate AND DueDate) THEN
                    ERROR('SELECT ONLY ONE DATE');


                //SETRANGE(Customer."Global Dimension 1 Code");
                //CurrReport.CREATETOTALS(CustBalanceDueLCY, TotalCustBalanceLCY, CustBalanceDueLCY1);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    Caption = 'Options';
                    field(StartDate; StartDate)
                    {
                        Caption = 'Report Date';
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
                    field(PostingDate; PostingDate)
                    {
                        Caption = 'Posting Date';
                    }
                    field(DocumentDate; DocumentDate)
                    {
                        Caption = 'Document Date';
                    }
                    field(DueDate; DueDate)
                    {
                        Caption = 'Due Date';
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

    trigger OnPreReport()
    begin
        CustFilter := Vendor.GETFILTERS;
        Cust1Filter := Vendor.GETFILTER(Vendor."Global Dimension 1 Filter");
        PeriodStartDate[10] := StartDate;
        PeriodStartDate[9] := StartDate + 1;
        PeriodStartDate[11] := DMY2Date(31, 12, 9999);

        FOR i := 8 DOWNTO 2 DO BEGIN

            IF i = 8 THEN BEGIN
                EVALUATE(PeriodLength1, '-' + FORMAT(PeriodLength1));
                PeriodStartDate[i] := CALCDATE(PeriodLength1, PeriodStartDate[i + 1]);
                Period1 := PeriodStartDate[i + 1] - PeriodStartDate[i];
            END;
            IF i = 7 THEN BEGIN
                EVALUATE(PeriodLength2, '-' + FORMAT(PeriodLength2));
                PeriodStartDate[i] := CALCDATE(PeriodLength2, PeriodStartDate[i + 1]);
                Period2 := PeriodStartDate[i + 2] - PeriodStartDate[i];
            END;
            IF i = 6 THEN BEGIN
                EVALUATE(PeriodLength3, '-' + FORMAT(PeriodLength3));
                PeriodStartDate[i] := CALCDATE(PeriodLength3, PeriodStartDate[i + 1]);
                Period3 := PeriodStartDate[i + 3] - PeriodStartDate[i];
            END;
            IF i = 5 THEN BEGIN
                EVALUATE(PeriodLength4, '-' + FORMAT(PeriodLength4));
                PeriodStartDate[i] := CALCDATE(PeriodLength4, PeriodStartDate[i + 1]);
                Period4 := PeriodStartDate[i + 4] - PeriodStartDate[i];
            END;

            IF i = 4 THEN BEGIN
                EVALUATE(PeriodLength5, '-' + FORMAT(PeriodLength5));
                PeriodStartDate[i] := CALCDATE(PeriodLength5, PeriodStartDate[i + 1]);
                Period5 := PeriodStartDate[i + 5] - PeriodStartDate[i];
            END;

            IF i = 3 THEN BEGIN
                EVALUATE(PeriodLength6, '-' + FORMAT(PeriodLength6));
                PeriodStartDate[i] := CALCDATE(PeriodLength6, PeriodStartDate[i + 1]);
                Period6 := PeriodStartDate[i + 6] - PeriodStartDate[i];
            END;

            IF i = 2 THEN BEGIN
                EVALUATE(PeriodLength7, '-' + FORMAT(PeriodLength7));
                PeriodStartDate[i] := CALCDATE(PeriodLength7, PeriodStartDate[i + 1]);
                Period7 := PeriodStartDate[i + 7] - PeriodStartDate[i];
            END;

        END;
    end;

    var
        VendorLedgEntry: Record "Vendor Ledger Entry";
        StartDate: Date;
        CustFilter: Text[250];
        PeriodStartDate: array[11] of Date;
        CustBalanceDueLCY: array[9] of Decimal;
        PrintCust: Boolean;
        i: Integer;
        TempExcelBuffer: Record "Excel Buffer" temporary;
        ColumnNo: Integer;
        RowNo: Integer;
        PrintToExcel: Boolean;
        Period1: Integer;
        Period2: Integer;
        Period3: Integer;
        Period4: Integer;
        Period5: Integer;
        Period6: Integer;
        Period7: Integer;
        PeriodLength1: DateFormula;
        PeriodLength2: DateFormula;
        PeriodLength3: DateFormula;
        PeriodLength4: DateFormula;
        PeriodLength5: DateFormula;
        PeriodLength6: DateFormula;
        PeriodLength7: DateFormula;
        Period: Integer;
        DateVar: Date;
        LineTotalCustBalance: Decimal;
        TotalCustBalanceLCY: Decimal;
        Cust1Filter: Text[30];
        CustBalanceDueLCY1: array[9] of Decimal;
        PostingDate: Boolean;
        DocumentDate: Boolean;
        DueDate: Boolean;
        DtldVendorLedgEntry: Record "Detailed Vendor Ledg. Entry";
        CustName: Text[50];
        Text001: Label 'As of %1';
        Vendor___Summary_AgeingCaptionLbl: Label 'Vendor - Summary Ageing';
        All_amounts_are_in_LcyCaptionLbl: Label 'All amounts are in Lcy';
        Page_No_CaptionLbl: Label 'Page No.';
        No_CaptionLbl: Label 'No.';
        NameCaptionLbl: Label 'Name';
        Balance_DueCaptionLbl: Label 'Balance Due';
        EmptyStringCaptionLbl: Label '=''''<>     ....................................................................................................................................................................................................................................................................................................';
        Total_BalanceCaptionLbl: Label 'Total Balance';
        EmptyStringCaption_Control1102154019Lbl: Label ' ....................................................................................................................................................................................................................................................................................................';
        Continued______________CaptionLbl: Label 'Continued..............';
        EmptyStringCaption_Control1102154021Lbl: Label ' ....................................................................................................................................................................................................................................................................................................';
        Continued___________________CaptionLbl: Label 'Continued...................';
        EmptyStringCaption_Control1102154020Lbl: Label ' ....................................................................................................................................................................................................................................................................................................';
        TotalCaptionLbl: Label 'Total';
}


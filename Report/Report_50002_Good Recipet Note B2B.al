report 50002 "GOODS Recipet Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Layouts/Goods Recipt Note.rdl';
    Caption = 'Goods Recipet Report';
    PreviewMode = PrintLayout;
    ApplicationArea = All;
    UsageCategory = ReportsAndAnalysis;
    dataset
    {
        dataitem("Purch. Rcpt. Header"; "Purch. Rcpt. Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Buy-from Vendor No.", "No. Printed";
            RequestFilterHeading = 'Posted Purchase Receipt';
            column(No_PurchRcptHeader; "No.")
            {
            }
            column(Posting_Date_PurchRcptHeader; "Posting Date")
            {

            }
            column(VendorGrec_name; VendorGrec.Name)
            { }
            column(VendorGrec_Add; VendorGrec.Address)
            { }
            column(VendorGrec_Add2; VendorGrec."Address 2")
            { }
            column(VendorGrec_City; VendorGrec.City)
            { }
            column(StateGRec; StateGRec.Description)
            { }
            column(StateGRec_Code; StateGRec.Code)
            { }
            column(Order_Date_PurchRcptHeader; "Order Date")
            {

            }
            column(Order_No_PurchRcptHeader; "Order No.")
            {

            }
            column(DocDateCaption; DocDateCaptionLbl)
            {
            }
            column(PageCaption; PageCaptionLbl)
            {
            }
            column(DescCaption; DescCaptionLbl)
            {
            }
            column(QtyCaption; QtyCaptionLbl)
            {
            }
            column(UOMCaption; UOMCaptionLbl)
            {
            }
            column(PaytoVenNoCaption; PaytoVenNoCaptionLbl)
            {
            }
            column(EmailCaption; EmailCaptionLbl)
            {
            }
            //B2BSKon03-01-2023
            column(GRNnoCapLbl; GRNnoCapLbl)
            {

            }
            column(PoNumCapLbl; PoNumCapLbl)
            {

            }
            column(GINCapLbl; GINCapLbl)
            {

            }
            column(DcCapLbl; DcCapLbl)
            {

            }
            column(GRNDateLbl; GRNDateLbl)
            {

            }
            column(PODAtCapLbl; PODAtCapLbl)
            {

            }
            column(GINdateCapLbl; GINdateCapLbl)
            {

            }
            column(DCdatCapLbl; DCdatCapLbl)
            {

            }
            column(SupplierCapLbl; SupplierCapLbl)
            {

            }
            column(SlNoCapLbl; SlNoCapLbl)
            {

            }
            column(CodeCapLbl; CodeCapLbl)
            {

            }
            column(ProductNamCapLbl; ProductNamCapLbl)
            {

            }
            column(UomCapLbl; UomCapLbl)
            {

            }
            column(QtyRecivCapLbl; QtyRecivCapLbl)
            {

            }
            column(QtyAcceptedLbl; QtyAcceptedLbl)
            {

            }
            column(QtyRejecCapLbl; QtyRejecCapLbl)
            {

            }
            column(ExcessShCapLbl; ExcessShCapLbl)
            {

            }
            column(PrepareCapLbl; PrepareCapLbl)
            {

            }
            column(StoreKeCapLbl; StoreKeCapLbl)
            {

            }
            column(InspectedBYCapLbl; InspectedBYCapLbl)
            {

            }
            column(ExecutiCapLbl; ExecutiCapLbl)
            {

            }
            column(HODCapLbl; HODCapLbl)
            {

            }
            column(Heading1CapLbl; Heading1CapLbl)
            {

            }
            //B2BSKon03-01-2023
            column(BuyFromContactPhoneNoLbl; BuyFromContactPhoneNoLbl)
            {
            }
            column(BuyFromContactMobilePhoneNoLbl; BuyFromContactMobilePhoneNoLbl)
            {
            }
            column(BuyFromContactEmailLbl; BuyFromContactEmailLbl)
            {
            }
            column(PayToContactPhoneNoLbl; PayToContactPhoneNoLbl)
            {
            }
            column(PayToContactMobilePhoneNoLbl; PayToContactMobilePhoneNoLbl)
            {
            }
            column(PayToContactEmailLbl; PayToContactEmailLbl)
            {
            }
            column(BuyFromContactPhoneNo; BuyFromContact."Phone No.")
            {
            }
            column(BuyFromContactMobilePhoneNo; BuyFromContact."Mobile Phone No.")
            {
            }
            column(BuyFromContactEmail; BuyFromContact."E-Mail")
            {
            }
            column(PayToContactPhoneNo; PayToContact."Phone No.")
            {
            }
            column(PayToContactMobilePhoneNo; PayToContact."Mobile Phone No.")
            {
            }
            column(PayToContactEmail; PayToContact."E-Mail")
            {
            }
            dataitem(CopyLoop; "Integer")
            {
                DataItemTableView = SORTING(Number);
                dataitem(PageLoop; "Integer")
                {
                    DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                    column(PurchRcptCopyText; StrSubstNo(Text002, CopyText))
                    {
                    }
                    column(ShipToAddr1; ShipToAddr[1])
                    {
                    }
                    column(CompanyAddr1; CompanyAddr[1])
                    {
                    }
                    column(ShipToAddr2; ShipToAddr[2])
                    {
                    }
                    column(CompanyAddr2; CompanyAddr[2])
                    {
                    }
                    column(ShipToAddr3; ShipToAddr[3])
                    {
                    }
                    column(CompanyAddr3; CompanyAddr[3])
                    {
                    }
                    column(ShipToAddr4; ShipToAddr[4])
                    {
                    }
                    column(CompanyAddr4; CompanyAddr[4])
                    {
                    }
                    column(ShipToAddr5; ShipToAddr[5])
                    {
                    }
                    column(CompanyInfoPhoneNo; CompanyInfo."Phone No.")
                    {
                    }
                    column(ShipToAddr6; ShipToAddr[6])
                    {
                    }
                    column(CompanyInfoHomePage; CompanyInfo."Home Page")
                    {
                    }
                    column(CompanyInfo_Picture; CompanyInfo.Picture)
                    {

                    }
                    column(CompanyInfoEmail; CompanyInfo."E-Mail")
                    {
                    }
                    column(CompanyInfoVATRegNo; CompanyInfo."VAT Registration No.")
                    {
                    }
                    column(CompanyInfoGiroNo; CompanyInfo."Giro No.")
                    {
                    }
                    column(CompanyInfoBankName; CompanyInfo."Bank Name")
                    {
                    }
                    column(CompanyInfoBankAccNo; CompanyInfo."Bank Account No.")
                    {
                    }
                    column(CompanyInfo_name; CompanyInfo.Name)
                    { }
                    column(DocDate_PurchRcptHeader; Format("Purch. Rcpt. Header"."Document Date", 0, 4))
                    {
                    }
                    column(PurchaserText; PurchaserText)
                    {
                    }
                    column(SalesPurchPersonName; SalesPurchPerson.Name)
                    {
                    }
                    column(No1_PurchRcptHeader; "Purch. Rcpt. Header"."No.")
                    {
                    }
                    column(ReferenceText; ReferenceText)
                    {
                    }
                    column(YourRef_PurchRcptHeader; "Purch. Rcpt. Header"."Your Reference")
                    {
                    }
                    column(ShipToAddr7; ShipToAddr[7])
                    {
                    }
                    column(ShipToAddr8; ShipToAddr[8])
                    {
                    }
                    column(CompanyAddr5; CompanyAddr[5])
                    {
                    }
                    column(CompanyAddr6; CompanyAddr[6])
                    {
                    }
                    column(OutputNo; OutputNo)
                    {
                    }
                    column(PhoneNoCaption; PhoneNoCaptionLbl)
                    {
                    }
                    column(HomePageCaption; HomePageCaptionLbl)
                    {
                    }
                    column(VATRegNoCaption; VATRegNoCaptionLbl)
                    {
                    }
                    column(GiroNoCaption; GiroNoCaptionLbl)
                    {
                    }
                    column(BankNameCaption; BankNameCaptionLbl)
                    {
                    }
                    column(AccNoCaption; AccNoCaptionLbl)
                    {
                    }
                    column(ShipmentNoCaption; ShipmentNoCaptionLbl)
                    {
                    }
                    dataitem(DimensionLoop1; "Integer")
                    {
                        DataItemLinkReference = "Purch. Rcpt. Header";
                        DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                        column(DimText; DimText)
                        {
                        }
                        column(HeaderDimCaption; HeaderDimCaptionLbl)
                        {
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if Number = 1 then begin
                                if not DimSetEntry1.FindSet() then
                                    CurrReport.Break();
                            end else
                                if not Continue then
                                    CurrReport.Break();

                            Clear(DimText);
                            Continue := false;
                            repeat
                                OldDimText := DimText;
                                if DimText = '' then
                                    DimText := StrSubstNo('%1 - %2', DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code")
                                else
                                    DimText :=
                                      StrSubstNo(
                                        '%1; %2 - %3', DimText,
                                        DimSetEntry1."Dimension Code", DimSetEntry1."Dimension Value Code");
                                if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                    DimText := OldDimText;
                                    Continue := true;
                                    exit;
                                end;
                            until DimSetEntry1.Next() = 0;
                        end;

                        trigger OnPreDataItem()
                        begin
                            if not ShowInternalInfo then
                                CurrReport.Break();
                        end;
                    }
                    dataitem("Purch. Rcpt. Line"; "Purch. Rcpt. Line")
                    {
                        DataItemLink = "Document No." = FIELD("No.");
                        DataItemLinkReference = "Purch. Rcpt. Header";
                        DataItemTableView = SORTING("Document No.", "Line No.");
                        column(ShowInternalInfo; ShowInternalInfo)
                        {
                        }
                        column(Type_PurchRcptLine; Format(Type, 0, 2))
                        {
                        }
                        column(Desc_PurchRcptLine; Description)
                        {
                            IncludeCaption = false;
                        }
                        column(Qty_PurchRcptLine; Quantity)
                        {
                            IncludeCaption = false;
                        }
                        column(UOM_PurchRcptLine; "Unit of Measure")
                        {
                            IncludeCaption = false;
                        }
                        column(No_PurchRcptLine; "No.")
                        {
                        }
                        column(DocNo_PurchRcptLine; "Document No.")
                        {
                        }
                        column(LineNo_PurchRcptLine; "Line No.")
                        {
                            IncludeCaption = false;
                        }
                        /* column(Quantity_Accepted_B2B; "Quantity Accepted B2B")
                         {

                         }
                         column(Quantity_Rejected_B2B; "Quantity Rejected B2B")
                         {

                         }*/

                        column(No_PurchRcptLineCaption; FieldCaption("No."))
                        {
                        }
                        dataitem(DimensionLoop2; "Integer")
                        {
                            DataItemTableView = SORTING(Number) WHERE(Number = FILTER(1 ..));
                            column(DimText1; DimText)
                            {
                            }
                            column(LineDimCaption; LineDimCaptionLbl)
                            {
                            }

                            trigger OnAfterGetRecord()
                            begin
                                if Number = 1 then begin
                                    if not DimSetEntry2.FindSet() then
                                        CurrReport.Break();
                                end else
                                    if not Continue then
                                        CurrReport.Break();

                                Clear(DimText);
                                Continue := false;
                                repeat
                                    OldDimText := DimText;
                                    if DimText = '' then
                                        DimText := StrSubstNo('%1 - %2', DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code")
                                    else
                                        DimText :=
                                          StrSubstNo(
                                            '%1; %2 - %3', DimText,
                                            DimSetEntry2."Dimension Code", DimSetEntry2."Dimension Value Code");
                                    if StrLen(DimText) > MaxStrLen(OldDimText) then begin
                                        DimText := OldDimText;
                                        Continue := true;
                                        exit;
                                    end;
                                until DimSetEntry2.Next() = 0;
                            end;

                            trigger OnPreDataItem()
                            begin
                                if not ShowInternalInfo then
                                    CurrReport.Break();
                            end;
                        }

                        trigger OnAfterGetRecord()
                        begin
                            if (not ShowCorrectionLines) and Correction then
                                CurrReport.Skip();

                            DimSetEntry2.SetRange("Dimension Set ID", "Dimension Set ID");
                        end;

                        trigger OnPreDataItem()
                        begin
                            MoreLines := Find('+');
                            while MoreLines and (Description = '') and ("No." = '') and (Quantity = 0) do
                                MoreLines := Next(-1) <> 0;
                            if not MoreLines then
                                CurrReport.Break();
                            SetRange("Line No.", 0, "Line No.");
                        end;
                    }
                    dataitem(Total; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(BuyfromVenNo_PurchRcptHeader; "Purch. Rcpt. Header"."Buy-from Vendor No.")
                        {
                        }
                        column(BuyfromVenNo_PurchRcptHeaderCaption; "Purch. Rcpt. Header".FieldCaption("Buy-from Vendor No."))
                        {
                        }

                        trigger OnPreDataItem()
                        begin
                            if "Purch. Rcpt. Header"."Buy-from Vendor No." = "Purch. Rcpt. Header"."Pay-to Vendor No." then
                                CurrReport.Break();
                        end;
                    }
                    dataitem(Total2; "Integer")
                    {
                        DataItemTableView = SORTING(Number) WHERE(Number = CONST(1));
                        column(PaytoVenNo_PurchRcptHeader; "Purch. Rcpt. Header"."Pay-to Vendor No.")
                        {
                        }
                        column(VendAddr1; VendAddr[1])
                        {
                        }
                        column(VendAddr2; VendAddr[2])
                        {
                        }
                        column(VendAddr3; VendAddr[3])
                        {
                        }
                        column(VendAddr4; VendAddr[4])
                        {
                        }
                        column(VendAddr5; VendAddr[5])
                        {
                        }
                        column(VendAddr6; VendAddr[6])
                        {
                        }
                        column(VendAddr7; VendAddr[7])
                        {
                        }
                        column(VendAddr8; VendAddr[8])
                        {
                        }
                        column(PaytoAddrCaption; PaytoAddrCaptionLbl)
                        {
                        }
                        column(PaytoVenNo_PurchRcptHeaderCaption; "Purch. Rcpt. Header".FieldCaption("Pay-to Vendor No."))
                        {
                        }
                    }
                    dataitem("Posted Gate Entry Header"; "Posted Gate Entry Header")
                    {
                        column(Gate_Entry_No_PostedGate_EntryHeader; "Gate Entry No.")
                        {

                        }
                        column(Posting_Date; "Posting Date")
                        {

                        }
                        dataitem("Posted Gate Entry Line"; "Posted Gate Entry Line")
                        {
                            DataItemLink = "Gate Entry No." = field("No.");
                            column(Challan_No_PostedGate_EntryLine; "Challan No.")
                            {

                            }
                            column(Challan_Date; "Challan Date")
                            {

                            }
                        }
                    }
                }

                trigger OnAfterGetRecord()
                begin
                    if Number > 1 then begin
                        CopyText := FormatDocument.GetCOPYText;
                        OutputNo += 1;
                    end;
                end;

                trigger OnPostDataItem()
                begin
                    if not IsReportInPreviewMode then
                        CODEUNIT.Run(CODEUNIT::"Purch.Rcpt.-Printed", "Purch. Rcpt. Header");
                end;

                trigger OnPreDataItem()
                begin
                    OutputNo := 1;

                    NoOfLoops := Abs(NoOfCopies) + 1;
                    CopyText := '';
                    SetRange(Number, 1, NoOfLoops);
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CurrReport.Language := LanguageCu.GetLanguageIdOrDefault("Language Code");

                FormatAddressFields("Purch. Rcpt. Header");
                FormatDocumentFields("Purch. Rcpt. Header");
                if BuyFromContact.Get("Buy-from Contact No.") then;
                if PayToContact.Get("Pay-to Contact No.") then;

                DimSetEntry1.SetRange("Dimension Set ID", "Dimension Set ID");
                if VendorGrec.get("Purch. Rcpt. Header"."Buy-from Vendor No.") then;
                if StateGRec.get(VendorGrec."State Code") then;

            end;

            trigger OnPostDataItem()
            begin
                OnAfterPostDataItem("Purch. Rcpt. Header");
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
                group(Options)
                {
                    Caption = 'Options';
                    field(NoOfCopies; NoOfCopies)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'No. of Copies';
                        ToolTip = 'Specifies how many copies of the document to print.';
                    }
                    field(ShowInternalInfo; ShowInternalInfo)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Internal Information';
                        ToolTip = 'Specifies if you want the printed report to show information that is only for internal use.';
                    }
                    field(LogInteraction; LogInteraction)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Log Interaction';
                        Enabled = LogInteractionEnable;
                        ToolTip = 'Specifies if you want the program to log this interaction.';
                    }
                    field(ShowCorrectionLines; ShowCorrectionLines)
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Show Correction Lines';
                        ToolTip = 'Specifies if the correction lines of an undoing of quantity posting will be shown on the report.';
                    }
                }
            }
        }

        actions
        {
        }

        trigger OnInit()
        begin
            LogInteractionEnable := true;
        end;

        trigger OnOpenPage()
        begin
            InitLogInteraction;
            LogInteractionEnable := LogInteraction;
        end;
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);

        OnAfterInitReport;
    end;

    trigger OnPostReport()
    begin
        if LogInteraction and not IsReportInPreviewMode then
            if "Purch. Rcpt. Header".FindSet() then
                repeat
                    SegManagement.LogDocument(
                      15, "Purch. Rcpt. Header"."No.", 0, 0, DATABASE::Vendor, "Purch. Rcpt. Header"."Buy-from Vendor No.",
                      "Purch. Rcpt. Header"."Purchaser Code",
                      '', "Purch. Rcpt. Header"."Posting Description", '');
                until "Purch. Rcpt. Header".Next() = 0;
    end;

    trigger OnPreReport()
    begin
        if not CurrReport.UseRequestPage then
            InitLogInteraction;
    end;

    var
        Text002: Label 'Purchase - Receipt %1', Comment = '%1 = Document No.';

        VendorGrec: Record Vendor;
        StateGRec: Record State;
        CompanyInfo: Record "Company Information";
        SalesPurchPerson: Record "Salesperson/Purchaser";
        DimSetEntry1: Record "Dimension Set Entry";
        DimSetEntry2: Record "Dimension Set Entry";
        RespCenter: Record "Responsibility Center";
        BuyFromContact: Record Contact;
        PayToContact: Record Contact;
        LanguageCu: Codeunit Language;
        FormatAddr: Codeunit "Format Address";
        FormatDocument: Codeunit "Format Document";
        SegManagement: Codeunit SegManagement;
        VendAddr: array[8] of Text[100];
        ShipToAddr: array[8] of Text[100];
        CompanyAddr: array[8] of Text[100];
        PurchaserText: Text[30];
        ReferenceText: Text[80];
        MoreLines: Boolean;
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[75];
        ShowInternalInfo: Boolean;
        Continue: Boolean;
        LogInteraction: Boolean;
        ShowCorrectionLines: Boolean;
        OutputNo: Integer;

        LogInteractionEnable: Boolean;
        PhoneNoCaptionLbl: Label 'Phone No.';
        HomePageCaptionLbl: Label 'Home Page';
        VATRegNoCaptionLbl: Label 'VAT Registration No.';
        GiroNoCaptionLbl: Label 'Giro No.';
        BankNameCaptionLbl: Label 'Bank';
        AccNoCaptionLbl: Label 'Account No.';
        ShipmentNoCaptionLbl: Label 'Shipment No.';
        HeaderDimCaptionLbl: Label 'Header Dimensions';
        LineDimCaptionLbl: Label 'Line Dimensions';
        PaytoAddrCaptionLbl: Label 'Pay-to Address';
        DocDateCaptionLbl: Label 'Document Date';
        PageCaptionLbl: Label 'Page';
        DescCaptionLbl: Label 'Description';
        QtyCaptionLbl: Label 'Quantity';
        UOMCaptionLbl: Label 'Unit Of Measure';
        PaytoVenNoCaptionLbl: Label 'Pay-to Vendor No.';
        EmailCaptionLbl: Label 'Email';
        BuyFromContactPhoneNoLbl: Label 'Buy-from Contact Phone No.';
        BuyFromContactMobilePhoneNoLbl: Label 'Buy-from Contact Mobile Phone No.';
        BuyFromContactEmailLbl: Label 'Buy-from Contact E-Mail';
        PayToContactPhoneNoLbl: Label 'Pay-to Contact Phone No.';
        PayToContactMobilePhoneNoLbl: Label 'Pay-to Contact Mobile Phone No.';
        PayToContactEmailLbl: Label 'Pay-to Contact E-Mail';
        SlNoCapLbl: Label 'Sl No.';
        CodeCapLbl: Label 'Code';
        ProductNamCapLbl: Label 'Product Name';
        UomCapLbl: Label 'UOM';
        QtyRecivCapLbl: Label 'Qty Recd';
        QtyAcceptedLbl: Label 'Qty Accpted';
        QtyRejecCapLbl: Label 'Qty Rejected';
        ExcessShCapLbl: Label 'Short/Excess';
        GRNnoCapLbl: Label 'GRN No';//
        PoNumCapLbl: Label 'PO Number';
        GINCapLbl: Label 'GIN No.';
        DcCapLbl: Label 'D C No.';
        GRNDateLbl: Label 'GRN Date';
        PODAtCapLbl: Label 'P.O.Date';
        GINdateCapLbl: Label 'GIN Date';
        DCdatCapLbl: Label 'DC Date';
        Heading1CapLbl: Label 'GOODS RECEIPT NOTE';
        PrepareCapLbl: Label 'Prepared By';
        StoreKeCapLbl: Label 'Store Keeper';
        InspectedBYCapLbl: Label 'Inspected / Approved By';
        ExecutiCapLbl: Label 'Executive Stores';
        HODCapLbl: Label 'HOD Commercial';
        SupplierCapLbl: Label 'Supplier';


    procedure InitializeRequest(NewNoOfCopies: Integer; NewShowInternalInfo: Boolean; NewLogInteraction: Boolean; NewShowCorrectionLines: Boolean)
    begin
        NoOfCopies := NewNoOfCopies;
        ShowInternalInfo := NewShowInternalInfo;
        LogInteraction := NewLogInteraction;
        ShowCorrectionLines := NewShowCorrectionLines;
    end;

    local procedure InitLogInteraction()
    begin
        LogInteraction := SegManagement.FindInteractTmplCode(15) <> '';
    end;

    local procedure IsReportInPreviewMode(): Boolean
    var
        MailManagement: Codeunit "Mail Management";
    begin
        exit(CurrReport.Preview or MailManagement.IsHandlingGetEmailBody);
    end;

    local procedure FormatAddressFields(var PurchRcptHeader: Record "Purch. Rcpt. Header")
    begin
        FormatAddr.GetCompanyAddr(PurchRcptHeader."Responsibility Center", RespCenter, CompanyInfo, CompanyAddr);
        FormatAddr.PurchRcptShipTo(ShipToAddr, PurchRcptHeader);
        FormatAddr.PurchRcptPayTo(VendAddr, PurchRcptHeader);
    end;

    local procedure FormatDocumentFields(PurchRcptHeader: Record "Purch. Rcpt. Header")
    begin
        FormatDocument.SetPurchaser(SalesPurchPerson, PurchRcptHeader."Purchaser Code", PurchaserText);

        ReferenceText := FormatDocument.SetText(PurchRcptHeader."Your Reference" <> '', PurchRcptHeader.FieldCaption("Your Reference"));
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterInitReport()
    begin
    end;

    [IntegrationEvent(TRUE, false)]
    local procedure OnAfterPostDataItem(var PurchRcptHeader: Record "Purch. Rcpt. Header")
    begin
    end;
}


report 50007 "Material Issues B2B"
{
    // version B2BLIFT1.00.00

    DefaultLayout = RDLC;
    RDLCLayout = 'Report/Layouts/Material Issues.rdl';
    Caption = 'Material Issues';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("Transfer Receipt Header"; "Transfer Receipt Header")
        {
            DataItemTableView = SORTING("No.");
            RequestFilterFields = "No.", "Transfer-from Code", "Transfer-to Code";
            column(CompInfo_Picture; CompInfo.Picture)
            { }
            column(CompInfo_Name; CompInfo.Name)
            { }
            column(CompInfo_Address; CompInfo.Address)
            { }
            column(CompInfo_Address2; CompInfo."Address 2")
            { }
            column(CompInfo_City; CompInfo.City)
            { }
            column(Transfer_from_Code; "Transfer-from Code")
            {

            }
            column(Transfer_to_Code; "Transfer-to Code")
            {

            }
            column(TransferFromLbl; TransferFromLbl)
            {

            }
            column(MaterialIssueLbl; MaterialIssueLbl)
            {

            }
            column(TransferToLbl; TransferToLbl)
            {

            }
            column(TransferOrderLbl; TransferOrderLbl)
            {

            }
            column(CompInfo_PostCode; CompInfo."Post Code")
            { }
            column(Slnolbl; Slnolbl)
            { }
            column(itemnolbl; itemnolbl)
            { }
            column(descriptionlbl; descriptionlbl)
            { }
            column(Unitofmeasurelbl; Unitofmeasurelbl)
            { }
            column(Quantitylbl; Quantitylbl)
            { }
            column(BatchNolbl; BatchNolbl)
            { }
            column(BatchQtylbl; BatchQtylbl)
            { }
            column(MfgDatelbl; MfgDatelbl)
            { }
            column(ExpDatelbl; ExpDatelbl)
            { }
            column(QtytoRecevelbl; QtytoRecevelbl)
            { }
            dataitem("Transfer Receipt Line"; "Transfer Receipt Line")
            {
                DataItemLink = "Document No." = FIELD("No.");
                DataItemLinkReference = "Transfer Receipt Header";
                DataItemTableView = SORTING("Document No.", "Line No.");
                column(Item_No_; "Item No.")
                { }
                column(Description; Description)
                { }
                column(Quantity; Quantity)
                { }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                { }
            }
            trigger OnPreDataItem();
            begin
                CompInfo.GET();
                CompInfo.CALCFIELDS(CompInfo.Picture);
            end;
        }
    }
    trigger OnPreReport();
    begin
        "SL No" := 0;
    end;

    local procedure MaterialIssueFrom(VAR AddrArray: ARRAY[8] OF Text[50]; VAR TransferReceiptHeader: Record "Transfer Receipt Header")
    begin
        FormatAddr.FormatAddr(
  AddrArray, TransferReceiptHeader."Transfer-from Name", TransferReceiptHeader."Transfer-from Name 2", '', TransferReceiptHeader."Transfer-from Address", TransferReceiptHeader."Transfer-from Address 2",
  TransferReceiptHeader."Transfer-from City", TransferReceiptHeader."Transfer-from Post Code", TransferReceiptHeader."Transfer-from County", TransferReceiptHeader."Trsf.-from Country/Region Code");
    end;//LIFTUPG

    local procedure MaterialIssueTo(VAR AddrArray: ARRAY[8] OF Text[50]; VAR TransferReceiptHeader: Record "Transfer Receipt Header")
    begin
        FormatAddr.FormatAddr(
  AddrArray, TransferReceiptHeader."Transfer-to Name", TransferReceiptHeader."Transfer-to Name 2", '', TransferReceiptHeader."Transfer-to Address", TransferReceiptHeader."Transfer-to Address 2",
  TransferReceiptHeader."Transfer-to City", TransferReceiptHeader."Transfer-to Post Code", TransferReceiptHeader."Transfer-to County", TransferReceiptHeader."Trsf.-to Country/Region Code");
    end;//LIFTUPG

    var
        CompInfo: Record "Company Information";
        FormatAddr: Codeunit "Format Address";
        TransferFromAddr: array[8] of Text[50];
        TransferToAddr: array[8] of Text[50];
        NoOfCopies: Integer;
        NoOfLoops: Integer;
        CopyText: Text[30];
        DimText: Text[120];
        OldDimText: Text[120];//liftupg changed from 75
        ShowInternalInfo: Boolean;
        Continue: Boolean;

        TrackingCount: Integer;

        "SL No": Integer;
        Slnolbl: Label 'Sl No.';
        itemnolbl: Label 'Item No.';
        descriptionlbl: Label 'Description';
        Unitofmeasurelbl: Label 'Unit of measure';
        Quantitylbl: Label 'Quantity';
        BatchNolbl: Label 'Batch No.';
        BatchQtylbl: Label 'Batch Qty.';
        MfgDatelbl: Label 'Mfg Date';
        ExpDatelbl: Label 'Exp. Date';
        QtytoRecevelbl: Label 'Qty to Receive';
        MaterialIssueLbl: Label 'Material Issue Report';
        TransferOrderLbl: Label '[Transfer Order]';
        TransferFromLbl: Label 'Transfer From';
        TransferToLbl: Label 'Transfer To';
}


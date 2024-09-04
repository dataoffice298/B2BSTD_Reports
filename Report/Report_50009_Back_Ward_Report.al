report 50009 "Back Order Report"
{
    ApplicationArea = All;
    Caption = 'Back Order Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report\Layouts\BackWard Report.rdl';

    dataset
    {
        dataitem(copy; Integer)
        {
            MaxIteration = 1;
            ObsoleteState = Pending;

            column(CompanyInformation_Name; CompanyInformation.Name)
            {
            }
            column(CompanyInformation_Address; CompanyInformation.Address)
            {
            }
            column(CompanyInformation_Address2; CompanyInformation."Address 2")
            {
            }
            column(CompanyInformation_City; CompanyInformation.City)
            {
            }
            column(CompanyInformation_Postcode; CompanyInformation."Post Code")
            {
            }
            column(CompanyInformation_CRCode; CompanyInformation."Country/Region Code")
            {
            }
            column(CompanyInformation_Pic; CompanyInformation.Picture)
            {
            }
            column(Var_OrderType; OrderType)
            {
            }
            column(Var_Vendor_Cust; Vendor_Cust)
            {
            }
            column(PurchaseSaleTxt; PurchaseSaleTxt)
            { }
            column(PreparedByLbl; PreparedByLbl)
            {

            }
            column(PreparedByTxt; PreparedByTxt)
            {

            }
            column(CreatedByDate; CreatedByDate)
            {

            }
            column(Var_ItemCodeLbl; ItemCodeLbl)
            {
            }
            column(Var_ItemDescriptionLbl; ItemDescriptionLbl)
            {
            }
            column(Var_OrderDateLbl; OrderDateLbl)
            {
            }
            column(Var_ExpectedDeliveryDateLbl; ExpectedDeliveryDateLbl)
            {
            }
            column(Var_QuantityOrderedLbl; QuantityOrderedLbl)
            {
            }
            column(Var_QuantityDeliveredLbl; QuantityDeliveredLbl)
            {
            }
            column(Var_QuantityBackOrderedLbl; QuantityBackOrderedLbl)
            {
            }
            column(Var_DaysOverDueLbl; DaysOverDueLbl)
            {
            }
            column(Var_TotalValuesLbl; TotalValuesLbl)
            {
            }
            column(CreatedByLbl; CreatedByLbl) { }
            column(Var_BackOrderReportLbl; BackOrderReportLbl)
            {
            }

            dataitem("Purchase Line"; "Purchase Line")
            {
                column(Var_Document_No_; "Document No.")
                {
                }
                column(Var_Buy_from_Vendor_No_; "Buy-from Vendor No.")
                {
                }
                column(Var_No_; "No.")
                {
                }
                column(Var_Description; Description)
                {
                }
                column(Var_OrderDate; "Order Date")
                {
                }
                column(Var_Expected_Receipt_Date; "Expected Receipt Date")
                {
                }
                column(Var_Quantity; Quantity)
                {
                }
                column(Var_Quantity_Received; "Quantity Received")
                {
                }
                column(Var_QuantityBackOrdered; QuantityBackOrdered)
                {
                }
                column(Var_DaysOverDue; DaysOverDue)
                {
                }
                column(Var_TotalValue; TotalValue)
                {
                }
                column(Var_PO; PO)
                {
                }
                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    Clear(QuantityBackOrdered);
                    Clear(DaysOverDue);
                    Clear(TotalValue);
                    QuantityBackOrdered := "Purchase Line".Quantity - "Purchase Line"."Quantity Received";
                    DaysOverDue := Var_StartDate - "Purchase Line"."Expected Receipt Date";
                    TotalValue := "Purchase Line"."Line Amount";
                end;

                trigger OnPreDataItem()
                begin
                    if Var_TransType = Var_TransType::"Sales order" then
                        CurrReport.Skip()
                    else
                        if Var_Item <> '' then
                            "Purchase Line".SetRange("No.", Var_Item);
                    "Purchase Line".SetRange("Document Type", "Document Type"::Order);
                    "Purchase Line".SetFilter("Expected Receipt Date", '..%1', Var_StartDate);
                    "Purchase Line".SetFilter("Qty. to Receive", '<>%1', 0);
                    if Var_TransType = Var_TransType::"Purchase Order" then
                        PO := true
                    else
                        PO := false;
                end;
            }
            dataitem("Sales Line"; "Sales Line")
            {
                column(Document_No_; "Document No.")
                {
                }
                column(Sell_to_Customer_No_; "Sell-to Customer No.")
                {
                }
                column(No_; "No.")
                {
                }
                column(Description; Description)
                {
                }
                column(SO; SO)
                {
                }
                column(OrderDate; OrderDate)
                {
                }
                column(RequestedDeliveryDate; "Requested Delivery Date")
                {
                }
                column(Quantity; Quantity)
                {
                }
                column(Quantity_Invoiced; "Quantity Invoiced")
                {
                }
                column(QuantityReversed; QuantityReversed)
                {
                }
                column(DaysOverDueOrder; DaysOverDueOrder)
                {
                }
                column(Line_Amount; "Line Amount")
                {
                }
                trigger OnAfterGetRecord()
                var
                    SalesHeader: Record "Sales Header";
                begin

                    Clear(OrderDate);
                    Clear(QuantityReversed);
                    Clear(DaysOverDueOrder);
                    if SalesHeader.Get("Sales Line"."Document Type", "Document No.") then begin
                        if SalesHeader."Requested Delivery Date" = 0D then
                            CurrReport.Skip();
                        OrderDate := SalesHeader."Order Date";
                    end;
                    QuantityReversed := "Sales Line".Quantity - "Sales Line"."Quantity Invoiced";
                    DaysOverDueOrder := Var_StartDate - "Requested Delivery Date";
                end;

                trigger OnPreDataItem()
                begin
                    if Var_TransType = Var_TransType::"Purchase Order" then
                        CurrReport.Skip()
                    else
                        if Var_Item <> '' then
                            "Sales Line".SetRange("No.", Var_Item);
                    "Sales Line".SetRange("Document Type", "Document Type"::Order);
                    "Sales Line".SetFilter("Requested Delivery Date", '..%1', Var_StartDate);
                    "Sales Line".SetFilter("Qty. to Ship", '<>%1', 0);
                    if Var_TransType = Var_TransType::"Sales order" then
                        SO := true
                    else
                        SO := false;
                end;

            }
            trigger OnPreDataItem()
            begin
                PreparedByTxt := UserId;
                CompanyInformation.Get();
                CompanyInformation.CalcFields(Picture);
                if Var_TransType = Var_TransType::"Purchase Order" then begin
                    OrderType := PurchaseOrderLbl;
                    Vendor_Cust := VendorLbl;
                    PurchaseSaleTxt := PurchaseLbl;
                end
                else begin
                    OrderType := SalesOrderLbl;
                    Vendor_Cust := CustomerLbl;
                    PurchaseSaleTxt := SalesLbl;
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(TransType; Var_TransType)
                    {
                        Caption = 'Transcation Type';
                        OptionCaption = 'Purchase Order,Sales Order';
                        ToolTip = 'Specifies if you want the Transcation Type field.';
                        ApplicationArea = All;
                    }
                    field(StartDate; Var_StartDate)
                    {
                        Caption = 'Start Date';
                        ToolTip = 'Specifies if you want the Date field.';
                        ApplicationArea = All;
                    }
                    field(Item; Var_Item)
                    {
                        Caption = 'Item';
                        ToolTip = 'Specifies if you want the Item Type field.';
                        TableRelation = Item."No.";
                        ApplicationArea = All;
                    }
                }
            }
        }

        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    begin
        CreatedByDate := Var_StartDate;


    end;

    var
        CompanyInformation: Record "Company Information";
        Var_Item: Code[20];
        OrderDate: Date;
        Var_StartDate: Date;
        OrderType, Vendor_Cust : Text;
        PurchaseSaleTxt: Text;
        QuantityBackOrdered: Decimal;
        DaysOverDue: Integer;
        DaysOverDueOrder: Integer;
        TotalValue: Decimal;
        QuantityReversed: Decimal;
        PO, SO : Boolean;
        Var_TransType: Option "Purchase Order","Sales order";
        SalesOrderLbl: Label 'Sales Order No.', Comment = '%1';
        PurchaseOrderLbl: Label 'Purchase Order No.', Comment = '%1';
        VendorLbl: Label 'Vendor No.', Comment = '%1';
        CustomerLbl: Label 'Customer No.', Comment = '%1';
        ItemCodeLbl: Label 'Item No.', Comment = '%1';
        ItemDescriptionLbl: Label 'Item Description', Comment = '%1';
        OrderDateLbl: Label 'Order Date', Comment = '%1';
        ExpectedDeliveryDateLbl: Label 'Expected Delivery Date', Comment = '%1';
        QuantityOrderedLbl: Label 'Quantity Ordered', Comment = ' %1';
        QuantityDeliveredLbl: Label 'Quantity Delivered', Comment = '%1';
        QuantityBackOrderedLbl: Label 'Quantity Back Ordered', Comment = '%1';
        DaysOverDueLbl: Label 'Days OverDue', Comment = '%1';
        TotalValuesLbl: Label 'Total Values', Comment = '%1';
        BackOrderReportLbl: Label 'Back Order Report', Comment = '%1';
        PreparedByLbl: label 'Prepared By', comment = '%1';
        PreparedByTxt: Text;
        PurchaseLbl: Label 'Purchase';
        SalesLbl: Label 'Sales';
        CreatedByLbl: Label 'Created Date';
        CreatedByDate: Date;

}

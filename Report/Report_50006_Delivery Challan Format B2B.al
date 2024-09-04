report 50006 "Posted Sales Shipment B2B"
{
    ApplicationArea = All;
    Caption = 'Posted Sales Shipment B2B';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'Report/Layouts/PostedSalesShipmentB2B.rdl';
    UseRequestPage = true;

    dataset
    {

        dataitem(SalesShipmentHeader; "Sales Shipment Header")
        {
            RequestFilterFields = "No.";
            column(No_; "No.")
            { }
            column(Bill_to_Address; "Bill-to Address")
            { }
            column(Sell_to_Phone_No_; "Sell-to Phone No.")
            { }
            column(CustomerNo; CustomerNo)
            { }
            column(Sell_to_E_Mail; "Sell-to E-Mail")
            { }
            column(CompanyNameLbl; CompanyNameLbl)
            { }
            column(AddressLbl; AddressLbl)
            { }
            column(PhoneNoLbl; PhoneNoLbl)
            {

            }
            column(EmailLbl; EmailLbl)
            {

            }
            column(GSTINLbl; GSTINLbl)
            {

            }
            column(DeliveryChallanForLbl; DeliveryChallanForLbl)
            {

            }
            column(ShippingToLbl; ShippingToLbl)
            {

            }
            column(CustomerNameLbl; CustomerNameLbl)
            {

            }
            column(ChallanNoLbl; ChallanNoLbl)
            {

            }
            column(DeliverytimeLbl; DeliverytimeLbl)
            {

            }
            column(SlNoLbl; SlNoLbl)
            {

            }
            column(ItemNameLbl; ItemNameLbl)
            {

            }
            column(HSNSACCodeLbl; HSNSACCodeLbl)
            {

            }
            column(QuantityLbl; QuantityLbl)
            {

            }
            column(UnitLbl; UnitLbl)
            {

            }
            column(TotalLbl; TotalLbl)
            {

            }
            column(TermsandconditionsLbl; TermsandconditionsLbl)
            {

            }
            column(CompanyName1Lbl; CompanyName1Lbl)
            {

            }
            column(Ship_to_Customer; "Ship-to Customer")
            {

            }
            column(Sell_to_AddressPosted; "Sell-to Address")
            {

            }
            column(Ship_to_Contact; "Ship-to Contact")
            {

            }
            column(ShiptocustomerEmail; customer."E-Mail")
            {

            }
            column(customerGSTIN; customer."GST Registration No.")
            {

            }
            column(customerName; customer.Name)
            {

            }
            column(customerAddress; customer.Address)
            {

            }
            column(customerPhoneNo; customer."Phone No.")
            {

            }
            column(customerEmail; customer."E-Mail")
            {

            }
            column(company; company.Name)
            {

            }
            column(DateLbl; DateLbl)
            {

            }
            column(Location_GST_Reg__No_; "Location GST Reg. No.")
            { }
            column(Ship_to_Name; "Ship-to Name")
            { }
            column(AuthorisedSignatureLbl; AuthorisedSignatureLbl)
            { }
            column(companyPicture; company.Picture)
            { }
            column(companyName; company.Name)
            { }
            column(companyAddress; company.Address)
            { }
            column(Sell_to_Customer_Name; "Sell-to Customer Name")
            { }
            column(companyEMail; company."E-Mail")
            { }
            column(companyGSTRegistrationNo; company."GST Registration No.")
            { }
            column(companyPhoneNo; company."Phone No.")
            { }
            column(Requested_Delivery_Date; "Requested Delivery Date")
            { }
            column(Posting_Date; "Posting Date")
            { }
            column(Sell_to_Address_2; "Sell-to Address 2")
            { }
            column(Ship_to_Address_2; "Ship-to Address 2")
            { }
            column(AddressLbl2; AddressLbl2)
            { }
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Description; Description)
                {

                }
                column(HSN_SAC_Code; "HSN/SAC Code")
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Quantity__Base_; "Quantity (Base)")
                {

                }
                column(Unit_of_Measure_Code; "Unit of Measure Code")
                {

                }
            }
            trigger OnAfterGetRecord()
            var

            begin
                if customer.get(SalesShipmentHeader."Sell-to Customer No.") then;
                CustomerNo := customer."Phone No.";
            end;
        }

    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        company.get();
        company.CalcFields(Picture);
    end;

    var
        CustomerNo: Code[20];
        customer: Record Customer;
        company: Record "Company Information";
        CompanyNameLbl: Label 'Delivery Challan';
        srno: Integer;
        AddressLbl: Label 'Address';
        AddressLbl2: Label 'Address - 2';
        PhoneNoLbl: Label 'Phone No.';
        EmailLbl: Label 'Email';
        GSTINLbl: Label 'GST IN';
        DeliveryChallanForLbl: Label 'Delivery Challan For:';
        ShippingToLbl: Label 'Shipping To:';
        CustomerNameLbl: Label 'Customer Name:';
        ChallanNoLbl: Label 'Challan No.:';
        DeliverytimeLbl: Label 'Delivery time:';
        SlNoLbl: Label 'Sl No.';
        ItemNameLbl: Label 'Item Name';
        HSNSACCodeLbl: Label 'HSN/SAC Code';
        QuantityLbl: Label 'Quantity';
        UnitLbl: Label 'Unit of Measure';
        TotalLbl: Label 'Total';
        TermsandconditionsLbl: Label 'Terms and conditions:';
        CompanyName1Lbl: Label 'Company Name';
        DateLbl: Label 'Date';
        AuthorisedSignatureLbl: Label 'Authorised Signature';
}

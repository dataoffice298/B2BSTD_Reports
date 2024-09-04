pageextension 50052 PostedSalesInvoiceExt extends "Posted Sales Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Update Document")
        {
            action(PrintInvoice)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;                
                trigger OnAction()
                var
                    SalesInvoiceHeader: Record "Sales Invoice Header";
                begin
                    SalesInvoiceHeader.Reset();
                    SalesInvoiceHeader.SetRange("No.", Rec."No.");
                    if SalesInvoiceHeader.FindFirst() then
                        Report.RunModal(Report::SalesInvoice, true, true, SalesInvoiceHeader);
                end;
            }
        }
    }

    var
        myInt: Integer;
}
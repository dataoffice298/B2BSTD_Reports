pageextension 50051 PurchRectHeaderExt extends "Posted Purchase Receipt"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("&Print")
        {
            action(PrintReciept)
            {
                ApplicationArea = all;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                //RunObject = report "Purchase Order GST Viz";
                //RunPageLink=where
                trigger OnAction()
                var
                    PurchRectHeader: Record "Purch. Rcpt. Header";
                begin
                    PurchRectHeader.Reset();
                    PurchRectHeader.SetRange("No.", Rec."No.");
                    if PurchRectHeader.FindFirst() then
                        Report.RunModal(Report::"GOODS Recipet Report", true, true, PurchRectHeader);
                end;
            }
        }
    }

    var
        myInt: Integer;
}
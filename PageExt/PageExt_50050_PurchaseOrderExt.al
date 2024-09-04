pageextension 50050 PurchaseOrderExt extends "Purchase Order"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(AttachAsPDF)
        {
            action(PrintOrder)
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
                    PurchHeader: Record "Purchase Header";
                begin
                    PurchHeader.Reset();
                    PurchHeader.SetRange("No.", Rec."No.");
                    if PurchHeader.FindFirst() then
                        Report.RunModal(Report::"Purchase Order GST Viz", true, true, PurchHeader);
                end;
            }
        }
    }

    var
        myInt: Integer;
}
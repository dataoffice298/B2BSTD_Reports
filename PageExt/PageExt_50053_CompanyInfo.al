pageextension 50053 CompanyInfoExt extends "Company Information"
{
    layout
    {
        addafter("Company Status")
        {

            field("LUT No"; Rec."LUT No")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the LUT No field.', Comment = '%';
            }
            field("Created DateTime"; Rec."Created DateTime")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Created DateTime field.', Comment = '%';
            }
            field("Bank Acct For SI Dom."; Rec."Bank Acct For SI Dom.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Bank Acct For SI Dom. field.', Comment = '%';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}
tableextension 50001 Customer_Ext extends Customer
{
    fields
    {
        field(50000; "LUT No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "LUT Validity Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}
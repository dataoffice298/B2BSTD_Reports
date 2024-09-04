tableextension 50000 CompanyInfo extends "Company Information"
{
    fields
    {
        field(50000; "LUT No"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(50001; "Vaildty Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50002; "Bank Acct For SI Dom."; Text[50])
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
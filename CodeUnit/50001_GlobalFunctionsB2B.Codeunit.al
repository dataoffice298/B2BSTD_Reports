codeunit 50001 "Global Functions B2B"
{
    var
        CheckManagement: Codeunit 367;
        CheckToAddr: array[8] of Text[150];
        OnesText: array[20] of Text[30];
        TensText: array[10] of Text[30];
        ExponentText: array[5] of Text[30];
        Text026: Label 'Zero';
        Text027: Label 'Hundred';
        Text028: Label 'And';
        Text029: Label '%1 results in a written number that is too long.';
        Text032: Label 'One';
        Text033: Label 'Two';
        Text034: Label 'Three';
        Text035: Label 'Four';
        Text036: Label 'Five';
        Text037: Label 'Six';
        Text038: Label 'Seven';
        Text039: Label 'Eight';
        Text040: Label 'Nine';
        Text041: Label 'Ten';
        Text042: Label 'Eleven';
        Text043: Label 'Twelve';
        Text044: Label 'Thirteen';
        Text045: Label 'Fourteen';
        Text046: Label 'Fifteen';
        Text047: Label 'Sixteen';
        Text048: Label 'Seventeen';
        Text049: Label 'Eighteen';
        Text050: Label 'Nineteen';
        Text051: Label 'Twenty';
        Text052: Label 'Thirty';
        Text053: Label 'Forty';
        Text054: Label 'Fifty';
        Text055: Label 'Sixty';
        Text056: Label 'Seventy';
        Text057: Label 'Eighty';
        Text058: Label 'Ninety';
        Text059: Label 'Thousand';
        Text060: Label 'Million';
        Text061: Label 'Billion';
        ZeroLbl: Label 'Zero';
        HundreadLbl: Label 'Hundred';
        AndLbl: Label 'and';
        exceededStringErr: Label '%1 results in a written number that is too long.', Comment = '%1= AddText';
        OneLbl: Label 'One';
        TwoLbl: Label 'Two';
        ThreeLbl: Label 'Three';
        FourLbl: Label 'Four';
        FiveLbl: Label 'Five';
        SixLbl: Label 'Six';
        SevenLbl: Label 'Seven';
        EightLbl: Label 'Eight';
        NineLbl: Label 'Nine';
        TenLbl: Label 'Ten';
        ElevenLbl: Label 'Eleven';
        TwelveLbl: Label 'Twelve';
        ThirteenLbl: Label 'Thirteen';
        FourteenLbl: Label 'Fourteen';
        FifteenLbl: Label 'Fifteen';
        SixteenLbl: Label 'Sixteen';
        SeventeenLbl: Label 'Seventeen';
        EighteenLbl: Label 'Eighteen';
        NinteenLbl: Label 'Nineteen';
        TwentyLbl: Label 'Twenty';
        ThirtyLbl: Label 'Thirty';
        FortyLbl: Label 'Forty';
        FiftyLbl: Label 'Fifty';
        SixtyLbl: Label 'Sixty';
        SeventyLbl: Label 'Seventy';
        EightyLbl: Label 'Eighty';
        NinetyLbl: Label 'Ninety';
        ThousandLbl: Label 'Thousand';
        LakhLbl: Label 'Lakh';
        CroreLbl: Label 'Crore';


    procedure InitTextVariable()
    begin
        OnesText[1] := Text032;
        OnesText[2] := Text033;
        OnesText[3] := Text034;
        OnesText[4] := Text035;
        OnesText[5] := Text036;
        OnesText[6] := Text037;
        OnesText[7] := Text038;
        OnesText[8] := Text039;
        OnesText[9] := Text040;
        OnesText[10] := Text041;
        OnesText[11] := Text042;
        OnesText[12] := Text043;
        OnesText[13] := Text044;
        OnesText[14] := Text045;
        OnesText[15] := Text046;
        OnesText[16] := Text047;
        OnesText[17] := Text048;
        OnesText[18] := Text049;
        OnesText[19] := Text050;

        TensText[1] := '';
        TensText[2] := Text051;
        TensText[3] := Text052;
        TensText[4] := Text053;
        TensText[5] := Text054;
        TensText[6] := Text055;
        TensText[7] := Text056;
        TensText[8] := Text057;
        TensText[9] := Text058;

        ExponentText[1] := '';
        ExponentText[2] := Text059;
        ExponentText[3] := Text060;
        ExponentText[4] := Text061;
    end;

    procedure FormatNoText(var NoText: array[2] of Text[60]; No: Decimal; CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        DecimalPosition: Decimal;
        OnesDec: Integer;
        TensDec: Integer;
        GenLedSetup: Record "General Ledger Setup";
        CurrDescription: Text;
        Currency: Record "Currency";
        CurrencyDesc: Text[100];
    begin
        CLEAR(NoText);
        NoTextIndex := 1;
        NoText[1] := '';

        IF No < 1 THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026)
        ELSE BEGIN
            FOR Exponent := 4 DOWNTO 1 DO BEGIN
                PrintExponent := FALSE;
                Ones := No DIV POWER(1000, Exponent - 1);
                Hundreds := Ones DIV 100;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                IF Hundreds > 0 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                    if (Tens >= 2) or ((Tens * 10 + Ones) > 0) then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);
                END;
                IF Tens >= 2 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    IF Ones > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                END ELSE
                    IF (Tens * 10 + Ones) > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                IF PrintExponent AND (Exponent > 1) THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);

                No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(1000, Exponent - 1);
                if (Exponent = 2) and ((Tens * 10 + Ones) > 0) and (No > 0) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, '');
            END;
        END;

        AddToNoText(NoText, NoTextIndex, PrintExponent, '');

        TensDec := (No * 100) DIV 10;
        OnesDec := Round((No * 100) MOD 10, 1);

        if Currency.Get(CurrencyCode) then
            CurrencyDesc := Currency.Description;

        IF No = 0 THEN
            if CurrencyCode = '' then
                AddToNoText(NoText, NoTextIndex, PrintExponent, 'Rupees Only ')
            else
                AddToNoText(NoText, NoTextIndex, PrintExponent, CurrencyDesc + 's Only')
        ELSE BEGIN
            if CurrencyCode <> '' then
                AddToNoText(NoText, NoTextIndex, PrintExponent, 'Dollars ' + Text028)
            else
                AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);
            IF TensDec >= 2 THEN BEGIN
                AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec]);
                IF OnesDec > 0 THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[OnesDec]);
            END ELSE
                IF (TensDec * 10 + OnesDec) > 0 THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + OnesDec]);
            if CurrencyCode = 'USD' then
                AddToNoText(NoText, NoTextIndex, PrintExponent, 'Cents Only')
            else
                AddToNoText(NoText, NoTextIndex, PrintExponent, 'Paise Only');
        END;
    end;

    local procedure AddToNoText(var NoText: array[2] of Text[80]; var NoTextIndex: Integer; var PrintExponent: Boolean; AddText: Text[30])
    begin
        PrintExponent := TRUE;

        WHILE STRLEN(NoText[NoTextIndex] + ' ' + AddText) > MAXSTRLEN(NoText[1]) DO BEGIN
            NoTextIndex := NoTextIndex + 1;
            IF NoTextIndex > ARRAYLEN(NoText) THEN
                ERROR(Text029, AddText);
        END;
        NoText[NoTextIndex] := DELCHR(NoText[NoTextIndex] + ' ' + AddText, '<');
    end;

    procedure InitTextVariableWithoutCurrency()
    begin
        OnesText[1] := OneLbl;
        OnesText[2] := TwoLbl;
        OnesText[3] := ThreeLbl;
        OnesText[4] := FourLbl;
        OnesText[5] := FiveLbl;
        OnesText[6] := SixLbl;
        OnesText[7] := SevenLbl;
        OnesText[8] := EightLbl;
        OnesText[9] := NineLbl;
        OnesText[10] := TenLbl;
        OnesText[11] := ElevenLbl;
        OnesText[12] := TwelveLbl;
        OnesText[13] := ThirteenLbl;
        OnesText[14] := FourteenLbl;
        OnesText[15] := FifteenLbl;
        OnesText[16] := SixteenLbl;
        OnesText[17] := SeventeenLbl;
        OnesText[18] := EighteenLbl;
        OnesText[19] := NinteenLbl;
        TensText[1] := '';
        TensText[2] := TwentyLbl;
        TensText[3] := ThirtyLbl;
        TensText[4] := FortyLbl;
        TensText[5] := FiftyLbl;
        TensText[6] := SixtyLbl;
        TensText[7] := SeventyLbl;
        TensText[8] := EightyLbl;
        TensText[9] := NinetyLbl;
        ExponentText[1] := '';
        ExponentText[2] := ThousandLbl;
        ExponentText[3] := LakhLbl;
        ExponentText[4] := CroreLbl;
    end;

    procedure FormatNoTextWithoutCurrency(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        CurrRec: Record Currency;
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        TensDec: Integer;
        OnesDec: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := '';

        if No < 1 then
            AddToNoText(NoText, NoTextIndex, PrintExponent, ZeroLbl)
        else
            for Exponent := 4 DOWNTO 1 do begin
                PrintExponent := false;
                if No > 99999 then begin
                    Ones := No DIV (Power(100, Exponent - 1) * 10);
                    Hundreds := 0;
                end else begin
                    Ones := No DIV Power(1000, Exponent - 1);
                    Hundreds := Ones DIV 100;
                end;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Round(Ones MOD 10, 1);
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, HundreadLbl);
                end;
                if Tens >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    if Ones > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                end else
                    if (Tens * 10 + Ones) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                if PrintExponent and (Exponent > 1) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                if No > 99999 then
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(100, Exponent - 1) * 10
                else
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
            end;

        if CurrencyCode <> '' then begin
            CurrRec.Get(CurrencyCode);
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ');
        end else
            AddToNoText(NoText, NoTextIndex, PrintExponent, 'Rupees');

        AddToNoText(NoText, NoTextIndex, PrintExponent, AndLbl);

        TensDec := ((No * 100) MOD 100) DIV 10;
        OnesDec := Round((No * 100) MOD 10, 1);
        if TensDec >= 2 then begin
            AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec]);
            if OnesDec > 0 then
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[OnesDec]);
        end else
            if (TensDec * 10 + OnesDec) > 0 then
                AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + OnesDec])
            else
                AddToNoText(NoText, NoTextIndex, PrintExponent, ZeroLbl);
        if (CurrencyCode <> '') then
            AddToNoText(NoText, NoTextIndex, PrintExponent, ' ' + ' Only')
        else
            AddToNoText(NoText, NoTextIndex, PrintExponent, 'Paise Only');
    end;

    procedure FormatNoTextWithoutCurrencyInvoice(var NoText: array[2] of Text[80]; No: Decimal; CurrencyCode: Code[10])
    var
        CurrRec: Record Currency;
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        TensDec: Integer;
        OnesDec: Integer;
    begin
        Clear(NoText);
        NoTextIndex := 1;
        NoText[1] := 'Indian Rupees ';

        if No < 1 then
            AddToNoText(NoText, NoTextIndex, PrintExponent, ZeroLbl)
        else
            for Exponent := 4 DOWNTO 1 do begin
                PrintExponent := false;
                if No > 99999 then begin
                    Ones := No DIV (Power(100, Exponent - 1) * 10);
                    Hundreds := 0;
                end else begin
                    Ones := No DIV Power(1000, Exponent - 1);
                    Hundreds := Ones DIV 100;
                end;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Round(Ones MOD 10, 1);
                if Hundreds > 0 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, HundreadLbl);
                end;
                if Tens >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    if Ones > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                end else
                    if (Tens * 10 + Ones) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                if PrintExponent and (Exponent > 1) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);
                if No > 99999 then
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(100, Exponent - 1) * 10
                else
                    No := No - (Hundreds * 100 + Tens * 10 + Ones) * Power(1000, Exponent - 1);
            end;

        //AddToNoText(NoText, NoTextIndex, PrintExponent, 'Rupees ' + AndLbl);

        TensDec := ((No * 100) MOD 100) DIV 10;
        OnesDec := Round((No * 100) MOD 10, 1);

        IF No = 0 THEN
            if CurrencyCode = '' then
                AddToNoText(NoText, NoTextIndex, PrintExponent, 'Rupees Only ')
            else
                AddToNoText(NoText, NoTextIndex, PrintExponent, 'Dollars Only')
        ELSE BEGIN
            IF No <> 0 THEN begin
                if CurrencyCode <> '' then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, 'Dollars ' + Text028)
                else
                    AddToNoText(NoText, NoTextIndex, PrintExponent, 'Rupees ' + AndLbl);
                if TensDec >= 2 then begin
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec]);
                    if OnesDec > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[OnesDec]);
                end else
                    if (TensDec * 10 + OnesDec) > 0 then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + OnesDec]);
                if CurrencyCode = 'USD' then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, 'Cents Only')
                else
                    AddToNoText(NoText, NoTextIndex, PrintExponent, 'Paise Only');
            End;
        end;
    end;

    procedure FormatNoTextInvoice(var NoText: array[2] of Text[60]; No: Decimal; CurrencyCode: Code[10])
    var
        PrintExponent: Boolean;
        Ones: Integer;
        Tens: Integer;
        Hundreds: Integer;
        Exponent: Integer;
        NoTextIndex: Integer;
        DecimalPosition: Decimal;
        OnesDec: Integer;
        TensDec: Integer;
        GenLedSetup: Record "General Ledger Setup";
        CurrDescription: Text;
        Currency: Record "Currency";
        CurrencyDesc: Text[100];
        CurrDesForCode: Text[50];
    begin
        CLEAR(NoText);
        NoTextIndex := 1;

        if Currency.get(CurrencyCode) then begin
            NoText[1] := Currency.Description + 's';
            CurrDesForCode := CopyStr(NoText[1], StrPos(NoText[1], ' ') + 1, StrLen(NoText[1]));
        end;

        IF No < 1 THEN
            AddToNoText(NoText, NoTextIndex, PrintExponent, Text026)
        ELSE BEGIN
            FOR Exponent := 4 DOWNTO 1 DO BEGIN
                PrintExponent := FALSE;
                Ones := No DIV POWER(1000, Exponent - 1);
                Hundreds := Ones DIV 100;
                Tens := (Ones MOD 100) DIV 10;
                Ones := Ones MOD 10;
                IF Hundreds > 0 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Hundreds]);
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text027);
                    if (Tens >= 2) or ((Tens * 10 + Ones) > 0) then
                        AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);
                END;
                IF Tens >= 2 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[Tens]);
                    IF Ones > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Ones]);
                END ELSE
                    IF (Tens * 10 + Ones) > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[Tens * 10 + Ones]);
                IF PrintExponent AND (Exponent > 1) THEN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, ExponentText[Exponent]);

                No := No - (Hundreds * 100 + Tens * 10 + Ones) * POWER(1000, Exponent - 1);
                if (Exponent = 2) and ((Tens * 10 + Ones) > 0) and (No > 0) then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, '');
            END;
        END;
        TensDec := (No * 100) DIV 10;
        OnesDec := Round((No * 100) MOD 10, 1);

        if Currency.Get(CurrencyCode) then
            CurrencyDesc := Currency.Description;

        IF No = 0 THEN
            if CurrencyCode = '' then
                AddToNoText(NoText, NoTextIndex, PrintExponent, 'Rupees Only ')
            else
                AddToNoText(NoText, NoTextIndex, PrintExponent, CurrDesForCode + ' Only')
        ELSE BEGIN
            IF No <> 0 THEN begin
                if CurrencyCode <> '' then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, CurrDesForCode + ' ' + Text028)
                else
                    AddToNoText(NoText, NoTextIndex, PrintExponent, Text028);
                IF TensDec >= 2 THEN BEGIN
                    AddToNoText(NoText, NoTextIndex, PrintExponent, TensText[TensDec]);
                    IF OnesDec > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[OnesDec]);
                END ELSE
                    IF (TensDec * 10 + OnesDec) > 0 THEN
                        AddToNoText(NoText, NoTextIndex, PrintExponent, OnesText[TensDec * 10 + OnesDec]);
                if CurrencyCode = 'USD' then
                    AddToNoText(NoText, NoTextIndex, PrintExponent, 'Cents Only')
                else
                    AddToNoText(NoText, NoTextIndex, PrintExponent, 'Paise Only');
            END;
        end;
    end;
}
report 50108 "Production Scheduler Report"

{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'Report\Layouts\ProductionSchedulerReport.rdl';
    Caption = 'Production Scheduler Report';

    dataset
    {
        dataitem(ProductionOrder; "Production Order")
        {
            DataItemTableView = where(Status = const(Released));
            column(No_; "No.")
            {

            }
            column(Source_No_; "Source No.")
            {

            }
            column(Quantity; Quantity)
            {

            }
            column(OrderNoCap; OrderNoCap)
            { }
            column(ItemNameCap; ItemNameCap)
            { }
            column(QuantityCap; QuantityCap)
            { }
            column(OperationNameCap; OperationNameCap)
            { }
            column(OperationNoCap; OperationNoCap)
            { }
            column(StartDateCap; StartDateCap)
            { }
            column(EndDateCap; EndDateCap)
            { }
            column(CapacityCap; CapacityCap)
            { }
            column(LoadCap; LoadCap)
            { }
            column(AvailabiltyAfterOrdersCap; AvailabiltyAfterOrdersCap)
            { }
            column(startingDate; startingDate)
            { }
            column(DescriptionGvar; DescriptionGvar)
            { }
            column(HeadingCap; HeadingCap)
            { }
            column(CompanyinfoGRec_Pic; CompanyinfoGRec.Picture)
            { }
            column(CompanyinfoGRec_Name; CompanyinfoGRec.Name)
            { }
            column(CompanyinfoGRec_Address; CompanyinfoGRec.Address)
            { }
            column(CompanyinfoGRec_Address_2; CompanyinfoGRec."Address 2")
            { }
            column(CompanyinfoGRec_City; CompanyinfoGRec.City)
            { }
            column(CompanyinfoGRec_PostCode; CompanyinfoGRec."Post Code")
            { }

            dataitem("Prod. Order Line"; "Prod. Order Line")
            {
                DataItemLink = "Prod. Order No." = field("No.");


                dataitem(ProdOrderRoutingLine; "Prod. Order Routing Line")
                {
                    DataItemLink = "Routing No." = field("Routing No."), "Routing Reference No." = field("Routing Reference No."), "Prod. Order No." = field("Prod. Order No.");
                    column(Starting_Date; "Starting Date")
                    { }
                    column(Ending_Date; "Ending Date")
                    {

                    }
                    column(Description; Description)
                    { }
                    column(Routing_No; "No.")
                    {

                    }
                    column(Setup_Time; "Setup Time")
                    {

                    }
                    column(Run_Time; "Run Time")
                    { }
                    column(LoadGvar; LoadGvar)
                    { }
                    column(CapacityGvar; CapacityGvar)
                    { }
                    column(AvailabilityGvar; AvailabilityGvar)
                    { }

                    trigger OnAfterGetRecord()
                    begin

                        CalendarEntryGrec.Reset();
                        CalendarEntryGrec.SetRange("No.", ProdOrderRoutingLine."No.");
                        CalendarEntryGrec.SetRange("Capacity Type", ProdOrderRoutingLine.Type);
                        CalendarEntryGrec.setrange(date, ProdOrderRoutingLine."Starting Date");
                        if CalendarEntryGrec.FindSet() then
                            CapacityGvar := CalendarEntryGrec."Capacity (Total)";
                        AvailabilityGvar := ProdOrderRoutingLine."Run Time" + ProdOrderRoutingLine."Setup Time";
                        LoadGvar := Round((AvailabilityGvar / CapacityGvar) * 100);

                    end;

                }
            }
            trigger OnPreDataItem()
            begin
                CompanyinfoGRec.get();
                CompanyinfoGRec.CalcFields(Picture);
            end;
        }
    }


    var
        OrderNo: Code[20];
        OrderNoCap: label 'Order No.';
        ItemNameCap: label 'Item Name';
        QuantityCap: label 'Quantity';
        OperationNoCap: label 'Operation No.';
        OperationNameCap: label 'Operation Name';
        StartDateCap: label 'Start Date';
        EndDateCap: label 'End Date';
        CapacityCap: label 'Capacity';
        LoadCap: label 'Load %';
        AvailabiltyAfterOrdersCap: label 'Allocated Quantity';
        ProdOrderRoutingLineGvar: Record "Prod. Order Routing Line";
        startingDate: Date;
        DescriptionGvar: Text[100];
        ProdOrderCapaciNeed: Record "Prod. Order Capacity Need";
        CalendarEntryGrec: record "Calendar Entry";
        CapacityGvar: Decimal;
        AvailabilityGvar: decimal;
        LoadGvar: Decimal;
        HeadingCap: label 'Production Scheduler Report';
        CompanyinfoGRec: record "Company Information";

}
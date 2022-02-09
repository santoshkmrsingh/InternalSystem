codeunit 51000 CodeExtention
{
    trigger OnRun()
    begin

    end;


    [EventSubscriber(ObjectType::Codeunit, CodeUnit::"ServContractManagement", 'OnLookupServItemNoOnBeforeFilterByCustomerNo', '', true, true)]
    local procedure OnLookupServItemNoOnBeforeFilterByCustomerNo(var ServItem: Record "Service Item"; var ServiceContractLine: Record "Service Contract Line"; var IsHandled: Boolean)
    begin
        //set IsHandled to true so that the filter on customer no is not applied
        IsHandled := true;
    end;

    [EventSubscriber(ObjectType::Table, 5964, 'OnValidateServiceItemNoOnBeforeCheckSameCustomer', '', true, true)]
    local procedure OnValidateServiceItemNoOnBeforeCheckSameCustomer(ServItem: Record "Service Item"; var ServContractHeader: Record "Service Contract Header"; var IsHandled: Boolean)
    begin
        //ensure the the service item is not validated for the same customer as selected on the header
        IsHandled := true;
    end;

}
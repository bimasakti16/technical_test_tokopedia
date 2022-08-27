*** Settings ***
Library    Collections
Library    RequestsLibrary
Library    DateTime

*** Variables ***
${base_url}=    http://private-84097e-tokopediatest.apiary-mock.com/

*** Keywords ***
Process Order
    [Documentation]    Keyword ini berfungsi sebagai proses untuk Request ke API Process Order
    [Arguments]    ${uri}    ${order_id}    ${order_description}    ${order_status}    ${last_updated_timestamp}    ${special_order}
    Create Session    session    ${base_url}
    ${body_request}=    Create Dictionary    order_id=${order_id}    order_description=${order_description}    order_status=${order_status}    last_updated_timestamp=${last_updated_timestamp}    special_order=${special_order}
    ${header_request}=    Create Dictionary    Content-Type=application/json
    ${response}=    POST On Session    session    ${uri}    json=${body_request}    headers=${header_request}
    
    [Return]    ${response}

Get Current Unixtime
    [Documentation]    Keyword ini berfungsi sebagai proses untuk mendapatkan value unixtime saat ini
    ${current_date}=    Get Current Date
    ${current_unixtime}=    Convert Date    ${current_date}    epoch
    ${current_unixtime}=    Evaluate    ${current_unixtime} * 1000
    ${current_unixtime}=    Convert To Integer    ${current_unixtime}
    ${str_current_unixtime}=    Convert To String    ${current_unixtime}
    [Return]    ${str_current_unixtime}

Check Response Last Update Timestamp
    [Documentation]    Keyword ini berfungsi sebagai proses untuk validasi response "last_updated_timestamp" telah terupdate dibandingkan dengan value "last_updated_timestamp" ketika request API
    [Arguments]    ${request_timestamp}    ${response_timestamp}

    IF    ${response_timestamp} > ${request_timestamp}
        ${result}=    Set Variable    true
    ELSE
        ${result}=    Set Variable    false
    END

    [Return]    ${result}
*** Settings ***
# Documentation     This .robot file is a suite
Resource          ../Resources/keywords.resource
Library           DateTime
Library           JSONLibrary

*** Variables ***
${exist_order_id}=    0000001
${order_desc}=    Order Description
${order_status}=    New
${special_order}=    true

${url_valid_order_id}=    /processOrder    #dummy API, akan di hit untuk menghasilkan response valid process order
${url_exist_order_id}=    /processOrderA    #dummy API, akan di hit untuk menghasilkan response order id telah digunakan
${url_empty_order_id}=    /processOrderB    #dummy API, akan di hit untuk menghasilkan response invalid parameter, ketika required parameter kosong


*** Test Cases ***
Process Order with New Order ID
    [Documentation]    Test case untuk validasi API Proses Order ketika menggunakan data yang valid. 

    ${current_unixtime}=    Get Current Unixtime
    ${new_order_id}=    Catenate    Order.${current_unixtime}
    
    ${response}=    Process Order    ${url_valid_order_id}    ${new_order_id}    ${order_desc}    ${order_status}    ${current_unixtime}    ${special_order}
    ${str_response}=    Convert To String    ${response.content}
    ${the data}=    Evaluate    json.loads('''${str_response}''')    json

    ${resp_msg_status}=    Convert To String    ${the data['status']}
    ${resp_order_status}=    Convert To String    ${the data['data']['order_status']}
    ${resp_last_updated_timestamp}=    Convert To Number    ${the data['data']['last_updated_timestamp']}
    ${compare_updated_timestamp}=    Check Response Last Update Timestamp    ${current_unixtime}    ${resp_last_updated_timestamp}

    Should Be Equal As Integers    201    ${response.status_code}
    Should Be Equal    OK    ${resp_msg_status}
    Should Not Be Equal    ${order_status}    ${resp_order_status}
    Should Be Equal    true      ${compare_updated_timestamp}  
    
Process Order with Exist Order ID
    [Documentation]    Test case untuk validasi API Proses Order ketika menggunakan Order ID yang telah digunakan. Dengan catatan Order ID merupakan data yang unique

    ${current_unixtime}=    Get Current Unixtime
    
    ${response}=    Process Order    ${url_exist_order_id}    ${exist_order_id}    ${order_desc}    ${order_status}    ${current_unixtime}    ${special_order}
    ${str_response}=    Convert To String    ${response.content}
    ${the data}=    Evaluate    json.loads('''${str_response}''')    json

    ${resp_msg_status}=    Convert To String    ${the data['status']}
    ${resp_msg_error}=    Convert To String    ${the data['error_message']}

    Should Be Equal As Integers    200    ${response.status_code}
    Should Be Equal    Failed    ${resp_msg_status}
    Should Be Equal    Order ID has been used    ${resp_msg_error}
    
Process Order with Empty Order ID
    [Documentation]    Test case untuk validasi API Proses Order ketika parameter wajib dikosongkan. Catatan : Parameter yang diwajibkan di testing ini adalah order_id

    ${current_unixtime}=    Get Current Unixtime
    ${empty_order_id}=    Set Variable
    
    ${response}=    Process Order    ${url_empty_order_id}    ${empty_order_id}    ${order_desc}    ${order_status}    ${current_unixtime}    ${special_order}
    ${str_response}=    Convert To String    ${response.content}
    ${the data}=    Evaluate    json.loads('''${str_response}''')    json

    ${resp_msg_status}=    Convert To String    ${the data['status']}
    ${resp_msg_error}=    Convert To String    ${the data['error_message']}

    Should Be Equal As Integers    200    ${response.status_code}
    Should Be Equal    Failed    ${resp_msg_status}
    Should Be Equal    Invalid Parameters    ${resp_msg_error}
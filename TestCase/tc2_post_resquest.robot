*** Settings ***

Documentation    Suite description
Library     RequestsLibrary
Library     Collections



*** Variables ***
${base_url}     http://restapi.demoqa.com/customer



*** Test Cases ***
put_customer_resgistration
    create session      mysession       ${base_url}
    ${body}=     create dictionary        FirstName=vini2   LastName=pinho2  UserName=testeuser2    Password=david12342  Email=david1234652@gmail.com
    ${header}=       create dictionary   Content-Type=application/json
    ${response}=     post request    mysession       /register       data=${body}        headers=${header}
    log to console      ${response.status_code}
    log to console      ${response.content}

    # Validation
    ${res_body}=    convert to string   ${response.content}
    should contain      ${res_body}     OPERATION_SUCCESS
    should contain      ${res_body}     Operation completed successfully

    ${status_code}      convert to string   ${response.status_code}
    should be equal     ${status_code}      201


*** Settings ***

Documentation    Suite description
Library     RequestsLibrary
Library     Collections
Library     JSONLibrary


*** Variables ***

${basic_url}       http://dummy.restapiexample.com



*** Test Cases ***
Post_create_employee
    create session      mysession       ${basic_url}
    ${body}            create dictionary       name=Vinicius Miranda de Pinho      salary=100.000       age=42
    ${header}          create dictionary       Content-Type=application/json        User-Agent=Firefox
    ${response}        post request      mysession    /api/v1/create        data=${body}       headers=${header}
    log to console     ${response.status_code}
    log to console     ${response.json()}

    # Validacao das mensagens
    ${response_body}       convert to string       ${response.content}
    should contain          ${response_body}=       success
    ${status_code}          convert to string       ${response.status_code}
    should be equal         ${status_code}          200
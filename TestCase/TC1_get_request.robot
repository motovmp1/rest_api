*** Settings ***

Library     SeleniumLibrary
Library     RequestsLibrary
Library    Collections

*** Variables ***

${base_url}         http://restapi.demoqa.com
${city}         Delhi


*** Test Cases ***


get_weatherInfo
    create session      newsession      ${base_url}
    ${response} =       get request     newsession      /utilities/weather/city/${city}

    log to console      ${response.status_code}
    log to console      ${response.content}
    log to console      ${response.headers}

get_code_200
     create session      newsession      ${base_url}
    ${response} =       get request     newsession      /utilities/weather/city/${city}
    ${status_code}=     convert to string   ${response.status_code}
    should be equal     ${status_code}      200

get_city_body
    create session      newsession      ${base_url}
    ${response} =       get request     newsession      /utilities/weather/city/${city}
    ${check_city_body}=  convert to string    ${response.content}
    should contain     ${check_city_body}      Delhi

get_headers_info
     create session      newsession      ${base_url}
    ${response} =       get request     newsession      /utilities/weather/city/${city}
    ${contentTypeValue}        get from dictionary        ${response.headers}     Content-Type
    should be equal     ${contentTypeValue}     application/json



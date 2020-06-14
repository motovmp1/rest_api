*** Settings ***
Documentation    Suite description
Library     JSONLibrary
Library     os
Library     Collections
Library     RequestsLibrary



*** Variables ***

${base_url}     https://restcountries.eu/
${relative_url}     /rest/v2/alpha/IN


*** Test Cases ***
get_countryinfo
    create session  mysession       ${base_url}
    ${response_get}     get request     mysession       ${relative_url}
    ${country_name}        to json       ${response_get.content}

    # single data validation
    ${country_get_from_lis}     get value from json     ${country_name}     $.name
    log to console      ${country_get_from_lis[0]}
    should be equal      ${country_get_from_lis[0]}    India

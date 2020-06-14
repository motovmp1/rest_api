*** Settings ***
Documentation    Suite description
Library     JSONLibrary
Library     os
Library     Collections





*** Test Cases ***
Testcase_1
    ${json_obj}     load json from file    ./data.json
    ${name_value}                get value from json      ${json_obj}     $.phoneNumbers[1].number

    log to console      ${name_value[0]}
    should be equal      ${name_value[0]}       0123-4567-8910

     ${street_value}                get value from json      ${json_obj}     $.address.streetAddress

    log to console      ${street_value[0]}
    should be equal      ${street_value[0]}     naist street



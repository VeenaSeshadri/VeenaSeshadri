*** Settings ***

Library     RequestsLibrary
Library    Collections
*** Variables ***

${base_url}     https://simple-books-api.glitch.me
${name}     The Russian

*** Test Cases ***

Get_BookInfo
    create session  mysession1   ${base_url}
    ${response}=    GET On Session    mysession1   /books
    #log to console  ${response.status_code}
    #log to console  ${response.content}
    #log to console  ${response.headers}

    #validation
    ${status_code}=     convert to string    ${response.status_code}
    should be equal    ${status_code}   200

    ${type}=    convert to string   ${response.content}
    should contain   ${type}    non-fiction

    ${ContentTypeValue}=    get from dictionary    ${response.headers}     Content-Type
    should be equal    ${ContentTypeValue}      application/json; charset=utf-8

testing
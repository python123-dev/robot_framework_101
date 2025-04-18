*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}         https://www.saucedemo.com/
${USERNAME}    standard_user
${PASSWORD}    secret_sauce

*** Test Cases ***
Successful Login Test
    Open SauceDemo Website
    Enter Valid Credentials
    Submit Login Form
    Verify Successful Login
    Close Browser

*** Keywords ***
Open SauceDemo Website
    Open Browser    ${URL}    chrome
    Maximize Browser Window

Enter Valid Credentials
    Input Text    id:user-name    ${USERNAME}
    Input Text    id:password     ${PASSWORD}

Submit Login Form
    Click Button    id:login-button

Verify Successful Login
    Wait Until Page Contains Element    xpath://span[text()="Products"]    timeout=5s
    Page Should Contain    Products

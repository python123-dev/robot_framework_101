*** Settings ***
Documentation    To Validate a login form
Library    SeleniumLibrary
Test Setup    Open the browser with saucedemo
Test Teardown    Close Browser
Resource    resource.robot


*** Test Cases ***
Validate Unsuccessful Login

    Fill the login Form
    wait until it checks and display error message
    #verify error message is correct

*** Keywords ***


Fill the login Form
    Input Text        user-name    ${user_name}
    Input Password    password     ${invalid_password}
    Click Button      login-button


wait until it checks and display error message
    Wait Until Element is Visible    xpath://*[@id="login_button_container"]/div/form/div[3]/h3

verify error message is correct
    ${result}    Get Text    xpath://*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${result}    Epic sadface: Username and password do not match any user in this service


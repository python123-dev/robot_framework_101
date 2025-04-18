*** Settings ***
Documentation    To Validate a login form
Library    SeleniumLibrary
Library    OperatingSystem
Library    XML


*** Test Cases ***
Validate Unsuccessful Login
    Open the browser with saucedemo
    Fill the login Form
    wait until it checks and display error message
    #verify error message is correct

*** Keywords ***
Open the browser with saucedemo
    Open Browser     https://www.saucedemo.com/    chrome    options=add_experimental_option("detach",${True})

Fill the login Form
    Input Text        user-name    standard_user
    Input Password    password     secret_sauce123
    Click Button      login-button  


wait until it checks and display error message
    Wait Until Element is Visible    xpath://*[@id="login_button_container"]/div/form/div[3]/h3  

verify error message is correct
    ${result}    Get Text    xpath://*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${result}    Epic sadface: Username and password do not match any user in this service
             
*** Settings ***
Library           SeleniumLibrary
Suite Setup       Open Browser To Login Page
Suite Teardown    Close Browser
Variables         variables.robot

*** Variables ***
${URL}               https://www.saucedemo.com/
${BROWSER}           chrome
${user_name}         standard_user
${valid_password}    secret_sauce

*** Test Cases ***
Validate Cards Display in Shopping Page
    Fill The Login Form    ${user_name}    ${valid_password}
    Wait Till An Element Is Visible    xpath://*[@id="shopping_cart_container"]/a
    Verify Card Titles In The Shop Page

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    0.5s

Fill The Login Form
    [Arguments]    ${username}    ${password}
    Input Text    id:user-name    ${username}
    Input Text    id:password     ${password}
    Click Button  id:login-button

Wait Till An Element Is Visible
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator}    timeout=10s

Verify Card Titles In The Shop Page
    ${expectedlist}=    Create List
    ...    Sauce Labs Backpack
    ...    Sauce Labs Bike Light
    ...    Sauce Labs Bolt T-Shirt
    ...    Sauce Labs Fleece Jacket
    ...    Sauce Labs Onesie
    ...    Test.allTheThings() T-Shirt (Red)
    ${elements}=        Get WebElements    css:.inventory_item_name
    FOR    ${element}    IN    @{elements}
        ${text}=    Get Text    ${element}
        Should Contain        ${expectedlist}    ${text}
        Log    Validated Card Title: ${text}
    END


*** Settings ***
Documentation    To Validate a login form
Library    SeleniumLibrary
Test Setup    Open the browser with saucedemo
Test Teardown    Close Browser
Resource    resource.robot


*** Test Cases ***
#Validate Unsuccessful Login
#
#    Fill the login Form    ${user_name}    ${invalid_password}
#    wait until it checks and display error message
#    verify error message is correct
    
Validte Cards Display in shopping page
    Fill The Login Form    ${user_name}    ${valid_password}
    wait till a element is visible    xpath://*[@id="shopping_cart_container"]/a
#    Verify Card titles in the shop page

*** Keywords ***


Fill the login Form
    [Arguments]    ${username}    ${password}
    Input Text        user-name         ${username}
    Input Password       password       ${password}
    Click Button       login-button
    
wait till a element is visible 
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}


wait until it checks and display error message
    Wait Until Element is Visible    xpath://*[@id="login_button_container"]/div/form/div[3]/h3

verify error message is correct
    ${result}    Get Text    xpath://*[@id="login_button_container"]/div/form/div[3]/h3
    Should Be Equal As Strings    ${result}    Epic sadface: Username and password do not match any user in this service


#Verify Card titles in the shop page
#    #create a list
#    @{expectedlist}=    Create List    Sauce Labs Backpack    Sauce Labs Bike Light
#    #get webelements will return a list
#    Sleep    3
#    ${elements}=     Get Webelements     css:.inventory_item_name
#    Sleep    2
#    FOR  ${element}  IN  ${elements}
#        #Log    ${element.text}
#        ${text}=    Get Text    ${element}
#        Log    ${text}
#
#    END
    

    
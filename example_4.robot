*** Settings ***
Library    BuiltIn
Library    Collections
*** Test Cases ***
Add And Remove Items In List
    @{fruits}=    Create List    Apple    Banana
    Log    Original list: ${fruits}

    # Add items
    Append To List    ${fruits}    Mango
    Append To List    ${fruits}    Grapes
    Log    After adding: ${fruits}

    # Remove item
    Remove From List    ${fruits}    1
    Log    After removing index 1 (Banana): ${fruits}

Check Fruit Availability
    ${my_fruit}=    Set Variable    Banana
    @{fruits}=    Create List    Apple    Banana    Mango

    Run Keyword If    '${my_fruit}' in ${fruits}    Log    ${my_fruit} is available
    #Run Keyword Unless    '${my_fruit}' in ${fruits}    Log    ${my_fruit} is NOT available


Filter List Items Starting With A
    @{fruits}=    Create List    Apple    Banana    Apricot    Mango
    @{filtered}=    Create List

    FOR    ${fruit}    IN    @{fruits}
        Run Keyword If    '${fruit}'[0] == 'A'    Append To List    ${filtered}    ${fruit}
    END

    Log    Fruits starting with A: ${filtered}



Count Elements Without Get Length
    @{mylist}=    Create List    Apple    Banana    Mango    Orange

    ${count}=    Set Variable    0
    FOR    ${item}    IN    @{mylist}
        ${count}=    Evaluate    ${count} + 1
    END

    Log    Total elements in list: ${count}




*** Test Cases ***
Check Variable Types
    ${number}=    Set Variable    123
    ${text}=      Set Variable    Hello
    ${list}=      Create List     1    2    3
    ${dict}=      Create Dictionary    name=John    age=30

    ${number_type}=    Evaluate    type(${number}).__name__
    ${text_type}=      Evaluate    type('${text}').__name__
    ${list_type}=      Evaluate    type(${list}).__name__
    ${dict_type}=      Evaluate    type(${dict}).__name__

    Log    Number type: ${number_type}
    Log    Text type: ${text_type}
    Log    List type: ${list_type}
    Log    Dict type: ${dict_type}

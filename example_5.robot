*** Test Cases ***
Count Characters In String
    ${text}=    Set Variable    HelloWorld
    ${count}=   Set Variable    0

    FOR    ${char}    IN    ${text}
        ${count}=    Evaluate    ${count} + 1
    END

    Log    Total characters: ${count}


#Count Vowels In String
#    ${text}=    Set Variable    Hello Robot Framework
#    ${vowels}=    Create List    a    e    i    o    u
#    ${count}=     Set Variable    0
#
#    FOR    ${char}    IN    {text}
#        ${lower}=    Evaluate    '${char}'.lower()
#        Run Keyword If    '${lower}' in ${vowels}    Set Variable    ${count}=    ${count} + 1
#    END
#
#    Log    Total vowels: ${count}


#Reverse A String
#    ${text}=    Set Variable    HelloWorld
#    ${reversed}=    Set Variable    ${EMPTY}
#
#    FOR    ${char}    IN    ${text}
#        ${reversed}=    Set Variable    ${char}${reversed}
#    END
#
#    Log    Reversed string: ${reversed}


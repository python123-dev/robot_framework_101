*** Settings ***
Library    SSHLibrary

*** Variables ***
${HOST}    test.rebex.net
${USERNAME}    demo
${PASSWORD}    password

*** Test Cases ***
Connect And Run Command
    Open Connection    ${HOST}
    Login    ${USERNAME}    ${PASSWORD}
    ${output}=    Execute Command    ls
    Log    ${output}
    Close Connection

*** Settings ***
Library    SSHLibrary

*** Variables ***
${HOST}       test.rebex.net
${PORT}       22
${USERNAME}   demo
${PASSWORD}   password

*** Test Cases ***
Connect And Run Command
    Open Connection    ${HOST}    port=${PORT}
    Set Client Configuration    timeout=30s
    Login    ${USERNAME}    ${PASSWORD}
    ${output}=    Execute Command    ls
    Log    ${output}
    Close Connection

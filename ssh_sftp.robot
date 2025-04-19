*** Settings ***
Library           SSHLibrary

*** Variables ***
${HOST}           test.rebex.net
${USERNAME}       demo
${PASSWORD}       password
${LOCAL_FILE}     sample.txt
${REMOTE_PATH}    sample.txt

*** Test Cases ***
Upload File To Server
    Open Connection    ${HOST}
    Login              ${USERNAME}    ${PASSWORD}
    Put File           ${LOCAL_FILE}    ${REMOTE_PATH}
    Close Connection


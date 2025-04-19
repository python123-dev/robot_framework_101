*** Settings ***
Library           SSHLibrary

*** Variables ***
${HOST}           test.rebex.net
${USERNAME}       demo
${PASSWORD}       password
${REMOTE_FILE}    /readme.txt
${LOCAL_PATH}     downloaded_readme.txt

*** Test Cases ***
Download File From Server
    Open Connection    ${HOST}
    Login              ${USERNAME}    ${PASSWORD}
    Get File           ${REMOTE_FILE}    ${LOCAL_PATH}
    Close Connection


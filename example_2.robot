*** Settings ***
Library    OperatingSystem

*** Test Cases ***
Check File Exists
    [Documentation]    Verify file presence
    File Should Exist    myfile.txt

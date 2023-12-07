*** Settings ***
Documentation       Check the status of a URL
Metadata            Author    Jonathan

Library             RW.Core
Library             MyKeywords.checkers

Suite Setup         Suite Initialization


*** Tasks ***
Check URL
    ${msg}=    MyKeywords.checkers.Check Url    ${MY_URL}    1
    RW.Core.Add Pre To Report    ${msg}


*** Keywords ***
Suite Initialization
    ${MY_URL}=    RW.Core.Import User Variable    MY_URL
    ...    type=string
    ...    description=A simple input variable
    ...    pattern=\w*
    ...    example=my special input
    ...    default=https://www.runwhen.com
    Set Suite Variable    ${MY_URL}    ${MY_URL}

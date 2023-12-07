*** Settings ***
Documentation       Check the status of a URL
Metadata            Author    Jonathan

Library             RW.Core
Library             MyKeywords.checkers

Suite Setup         Suite Initialization


*** Tasks ***
Check URL
    ${passed}=    MyKeywords.checkers.Check Url    ${MY_URL}    1
    IF    "${passed}" == "True"
        RW.Core.Add Pre To Report    The URL is healthy and responsive.
    ELSE
        RW.Core.Add Pre To Report    The URL is unhealthy and/or had a delayed response.
    END
    RW.Core.Add Pre To Report    URL passed: ${passed}


*** Keywords ***
Suite Initialization
    ${MY_URL}=    RW.Core.Import User Variable    MY_URL
    ...    type=string
    ...    description=The URL to check.
    ...    pattern=\w*
    ...    example=https://www.runwhen.com
    ...    default=https://www.runwhen.com
    Set Suite Variable    ${MY_URL}    ${MY_URL}

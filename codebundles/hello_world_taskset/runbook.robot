*** Settings ***
Metadata          Author    My Name
Documentation     This is a hello world codebundle!
Force Tags    Hello    World    Test
Library    RW.Core
Suite Setup       Suite Initialization

*** Keywords ***
Suite Initialization
    ${MY_INPUT}=    RW.Core.Import User Variable    MY_INPUT
    ...    type=string
    ...    description=A simple input variable
    ...    pattern=\w*
    ...    example=my special input
    ...    default=default input value
    Set Suite Variable    ${MY_INPUT}    ${MY_INPUT}

*** Tasks ***
Hello world
    ${msg}=    Set Variable    The configured input is: ${MY_INPUT}
    RW.Core.Add Pre To Report    ${msg}



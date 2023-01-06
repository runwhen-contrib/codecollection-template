*** Settings ***
Metadata          Author    My Name
Documentation     This is a hello world codebundle!
Force Tags    Message    Hello    World    Test
Library    RW.Core
Library    MyKeywords.HelloWorld

*** Tasks ***
Hello World
    ${msg}=    MyKeywords.HelloWorld.get_msg
    Log    ${msg}
    RW.Core.Push Metric    1
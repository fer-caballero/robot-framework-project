*** Settings ***
Documentation            This is my first automation project with robot framework
Library                  SeleniumLibrary

*** Variables ***


*** Test Cases ***
The user should be able to login on CRM
    [Documentation]      Basic test case to automate a login process
    [Tags]               Test1    Smoke
    log                  Test Case start here!
    open browser         https://automationplayground.com/crm    chrome
    sleep                3s
    close browser
    
*** Keywords ***

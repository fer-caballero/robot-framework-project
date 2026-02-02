*** Settings ***
Documentation    This is my first automation project with robot framework
Library          SeleniumLibrary

*** Variables ***
${email}       test@gmail.com
${password}    pass123
*** Test Cases ***
The user should be able to login on CRM
    [Documentation]    Basic test case to automate a login process
    [Tags]             Test1    Smoke
    log                Test Case start here!
    # Open the chrome browser and start with Maximized window
    open browser       https://automationplayground.com/crm    chrome     options=add_argument("--start-maximized")

    # Homepage
    Page Should Contain    Customers Are Priority One!
    Click Link             id=SignIn

    # Start Login Process
    Page Should Contain          Login
    Element Should Be Visible    id=email-id
    Element Should Be Visible    id=password
    Input Text                   id=email-id    ${email}
    Input Text                   id=password    ${password}
    Click Button                 id=submit-id
    Page Should Contain          Our Happy Customers
    log                          Login Success
    sleep                        3s
    close browser

    
*** Keywords ***

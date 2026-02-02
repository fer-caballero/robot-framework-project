*** Settings ***
Documentation    This is my first automation project with robot framework
Library          SeleniumLibrary
Library          BuiltIn
Resource         ../Resources/PO/HomePage.robot
Resource         ../Resources/PO/LoginPage.robot
Resource         ../Resources/PO/CustomersPage.robot

*** Variables ***

*** Test Cases ***
The user should be able to login on CRM
    [Documentation]    Basic test case to automate a login process
    [Tags]             Test1    Smoke
    log                Test Case start here!
    # Open the chrome browser and start with Maximized window
    open browser       https://automationplayground.com/crm    chrome     options=add_argument("--start-maximized")

    # Homepage
    Page Should Contain    ${HOME_MAIN_HEADER}
    Click Sign In Button

    # Start Login Process
    Login to sandbox CRM

    Wait Until Element Is Visible    ${CUSTOMERS_TITLE}
    Page Should Contain              ${CUSTOMERS_HEADER}

    log                              Login Success
    sleep                            2s
    close browser

The user should be able to add a new customer to the list
    [Documentation]    Automation of the add new customer to the list
    [Tags]             Test2    add-customer
    # Open the chrome browser and start with Maximized window
    open browser       https://automationplayground.com/crm    chrome     options=add_argument("--start-maximized")

    # Homepage
    Page Should Contain    Customers Are Priority One!
    Click Link             id=SignIn

    # Start Login Process
    Page Should Contain              Login
    Element Should Be Visible        id=email-id
    Element Should Be Visible        id=password
    Input Text                       id=email-id    ${email}
    Input Text                       id=password    ${password}
    Click Button                     id=submit-id
    Wait Until Element Is Visible    css=h2
    Page Should Contain              Our Happy Customers
    log                              Login Success
    # Add new customer
    Click Element                    id=new-customer
    Input Text                       id=EmailAddress    test@123.com
    Input Text                       id=FirstName       Fer
    Input Text                       id=LastName        Caballero
    Input Text                       id=City            Corrientes
    Select From List By Label        id=StateOrRegion   Florida
    Click Element                    xpath=//input[@type='radio' and @value='male']
    #Click Element                    value=promos-yes
    Click Button                     xpath=//button[@type='submit']
    Element Should Be Visible        id=Success
    #tear down
    sleep                            3s
    close browser
*** Keywords ***
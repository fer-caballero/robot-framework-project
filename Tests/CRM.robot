*** Settings ***
Documentation    This is my first automation project with robot framework
Library          SeleniumLibrary
Library          BuiltIn
Resource         ../Resources/PO/HomePage.robot
Resource         ../Resources/PO/LoginPage.robot
Resource         ../Resources/PO/CustomersPage.robot

# Estos se ejecutan antes y después de CADA caso de prueba
Test Setup       Begin Web Test
Test Teardown    End Web Test

*** Variables ***
${URL}           https://automationplayground.com/crm
${BROWSER}        chrome

*** Keywords ***
Begin Web Test
    Open Browser                 ${URL}    ${BROWSER}    options=add_argument("--start-maximized")
    Log                          Browser is open test starts

End Web Test
    Log                          Browser is closed test ends
    Close Browser

*** Test Cases ***
The user should be able to login on CRM
    [Documentation]    Basic test case to automate a login process
    [Tags]             t1    smoke
    # Homepage
    Given Page Should Contain    ${HOME_MAIN_HEADER}
    When Click Sign In Button
    # Start Login Process
    And Verify login
    And Enter email
    And Enter Password
    And Click Login Button
    And Wait Until Element Is Visible    ${CUSTOMERS_TITLE}
    Then Page Should Contain              ${CUSTOMERS_HEADER}
    Log                              Login Success

The user should be able to add a new customer to the list
    [Documentation]    Automation of the add new customer to the list
    [Tags]             t2    add-customer
    Given Page Should Contain    ${HOME_MAIN_HEADER}
    And Click Sign In Button
    And User logged in
    And Verify if user is on customer service page

    # Add new customer
    And Click on new customer button
    Input Text                       id=EmailAddress    test@123.com
    Input Text                       id=FirstName       Fer
    Input Text                       id=LastName        Caballero
    Input Text                       id=City            Corrientes
    Select From List By Label        id=StateOrRegion   Florida
    Click Element                    xpath=//input[@type='radio' and @value='male']
    #Click Element                    value=promos-yes
    Click Button                     xpath=//button[@type='submit']
    Wait Until Element Is Visible    id=Success
    #tear down
    sleep                            2s
    close browser
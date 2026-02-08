*** Settings ***
Documentation    Data Driven Testing example for CRM Login
Library          SeleniumLibrary
Resource         ../Resources/PO/HomePage.robot
Resource         ../Resources/PO/LoginPage.robot
Resource         ../Resources/PO/CustomersPage.robot
Resource         ../Resources/PO/CustomerForm.robot

Test Setup       Begin Web Test
Test Teardown    End Web Test

*** Variables ***
${URL}               https://automationplayground.com/crm
${BROWSER}           chrome
${user_email}        fer@test.com    
${user_password}     123


*** Keywords ***
Begin Web Test
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--start-maximized")

End Web Test
    IF    '${TEST STATUS}' == 'FAIL'
        Log    Message: Test Fail    level=ERROR
    ELSE
        Log    test end good    level=INFO
    END
    Close Browser


*** Test Cases ***

The user should be able to add a new customer to the list
    [Documentation]    Automation of the add new customer to the list
    [Tags]             t2    add-customer
    Given Page Should Contain    ${HOME_MAIN_HEADER}
    And Click Sign In Button
    And User logged in           ${user_email}    ${user_password}
    And Verify if user is on customer service page
    And Click on new customer button
    When Complete and Submit Customer Form
    Then Verify Customer is Added


*** Settings ***
Documentation    Data Driven Testing example for CRM Login
Library          SeleniumLibrary
Resource         ../Resources/PO/HomePage.robot
Resource         ../Resources/PO/LoginPage.robot
Resource         ../Resources/PO/CustomersPage.robot

Test Setup       Begin Web Test
Test Teardown    End Web Test
Test Template    Login Scenarios

*** Variables ***
${URL}           https://automationplayground.com/crm
${BROWSER}       chrome

*** Test Cases ***             USER EMAIL                PASSWORD
Login with valid User          admin@pato.com            password123
Login with Invalid User        user2test.com             wrongpass



*** Keywords ***
Login Scenarios
    [Arguments]    ${email}    ${password}
    Given Page Should Contain    ${HOME_MAIN_HEADER}
    When Click Sign In Button
    And Verify login
    And Enter email    ${email}
    And Enter Password    ${password}
    And Click Login Button
    And Verify if user is on customer service page



Begin Web Test
    Open Browser    ${URL}    ${BROWSER}    options=add_argument("--start-maximized")

End Web Test
    IF    '${TEST STATUS}' == 'FAIL'
        Log    Message: Test Fail    level=ERROR
    ELSE
        Log    test end good    level=INFO
    END
    Close Browser


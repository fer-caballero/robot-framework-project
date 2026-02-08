*** Settings ***
Library          SeleniumLibrary
Documentation    Customers List View

*** Variables ***
${CUSTOMERS_HEADER}    Our Happy Customers
${CUSTOMERS_TITLE}     css:h2

*** Keywords ***
Verify if user is on customer service page
    Wait Until Element Is Visible    ${CUSTOMERS_TITLE}
    Page Should Contain              ${CUSTOMERS_HEADER}

Click on new customer button
    Click Element                    id=new-customer
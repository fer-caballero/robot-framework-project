*** Settings ***
Library          SeleniumLibrary
Documentation    Login Page Object Model

*** Variables ***
${email}                       test@gmail.com
${password}                    pass123
${LOGIN_EMAIL_TEXTBOX}         id:email-id
${LOGIN_PASSWORD_TEXTBOX}      id:password
${LOGIN_BUTTON}                id:submit-id

*** Keywords ***
Login to sandbox CRM
    Page Should Contain              Login
    Element Should Be Visible        ${LOGIN_EMAIL_TEXTBOX} 
    Element Should Be Visible        ${LOGIN_PASSWORD_TEXTBOX}
    Input Text                       ${LOGIN_EMAIL_TEXTBOX}         ${email}
    Input Text                       ${LOGIN_PASSWORD_TEXTBOX}      ${password}
    Click Button                     ${LOGIN_BUTTON}
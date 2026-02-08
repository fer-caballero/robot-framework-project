*** Settings ***
Library          SeleniumLibrary
Documentation    Login Page Object Model

*** Variables ***
# Estos actúan como valores por defecto si no se pasan argumentos
${DEFAULT_EMAIL}               test@gmail.com
${DEFAULT_PASSWORD}            pass123
${LOGIN_EMAIL_TEXTBOX}         id:email-id
${LOGIN_PASSWORD_TEXTBOX}      id:password
${LOGIN_BUTTON}                id:submit-id

*** Keywords ***

Enter email
    [Arguments]                      ${user_email}=${DEFAULT_EMAIL}
    Element Should Be Visible        ${LOGIN_EMAIL_TEXTBOX}
    Input Text                       ${LOGIN_EMAIL_TEXTBOX}         ${user_email}

Enter password
    [Arguments]                      ${user_password}=${DEFAULT_PASSWORD}
    Element Should Be Visible        ${LOGIN_PASSWORD_TEXTBOX}
    Input Text                       ${LOGIN_PASSWORD_TEXTBOX}      ${user_password}

Click login button
    Click Button                     ${LOGIN_BUTTON}

Verify login
    Page Should Contain              Login

User logged in
    [Arguments]                      ${user_email}    ${user_password}
    # Este keyword agrupa todo el proceso de login
    Enter email                      ${user_email}
    Enter password                   ${user_password}
    Click login button
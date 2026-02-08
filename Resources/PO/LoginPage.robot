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

Enter email
    Element Should Be Visible        ${LOGIN_EMAIL_TEXTBOX} 
    Element Should Be Visible        ${LOGIN_PASSWORD_TEXTBOX}

Enter password
    Input Text                       ${LOGIN_EMAIL_TEXTBOX}         ${email}
    Input Text                       ${LOGIN_PASSWORD_TEXTBOX}      ${password}

Click login button
    Click Button                     ${LOGIN_BUTTON}

Verify login
    Page Should Contain              Login

User logged in
    Page Should Contain              Login
    Element Should Be Visible        ${LOGIN_EMAIL_TEXTBOX}
    Element Should Be Visible        ${LOGIN_PASSWORD_TEXTBOX}
    Input Text                       ${LOGIN_EMAIL_TEXTBOX}         ${email}
    Input Text                       ${LOGIN_PASSWORD_TEXTBOX}      ${password}
    Click Button                     ${LOGIN_BUTTON}



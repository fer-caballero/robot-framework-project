*** Settings ***
Library          SeleniumLibrary
Documentation    Home Page Object Model to click the sing in anchor

*** Variables ***
${HOME_MAIN_HEADER}    Customers Are Priority One!
${HOME_SIGN_IN}        id:SignIn

*** Keywords ***
Click Sign In Button
    [Documentation]    go to login page
    Click Link         ${HOME_SIGN_IN}
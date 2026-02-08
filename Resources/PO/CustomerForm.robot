*** Settings ***
Library          SeleniumLibrary
Documentation    Add Customer Form

*** Variables ***

*** Keywords ***
Complete and Submit Customer Form
    Input Text                       id=EmailAddress    test@123.com
    Input Text                       id=FirstName       Fer
    Input Text                       id=LastName        Caballero
    Input Text                       id=City            Corrientes
    Select From List By Label        id=StateOrRegion   Florida
    Click Element                    xpath=//input[@type='radio' and @value='male']
    #Click Element                    value=promos-yes
    Click Button                     xpath=//button[@type='submit']

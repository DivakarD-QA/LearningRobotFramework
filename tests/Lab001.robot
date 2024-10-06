*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Variables ***
${UserNameField}        id=username
${PasswordField}        id=password
${SignInBtn}        id=signInBtn
${InvalidMsg}        css=.alert-danger

*** Keywords ***

Open the Browser
    Create Webdriver    Chrome    C:\Users\DIVAKAR D\Downloads\chromedriver-win64
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login Form
    Input Text    ${UserNameField}    AdminUser
    Input Password    ${PasswordField}    Admin@123
    Click Element    ${SignInBtn}
    
Verify the error message shown for invalid credentials
    Wait Until Element Is Visible    ${InvalidMsg}
    ${InvalidCredMsg}    Get Text    ${InvalidMsg}
    Should Be Equal As Strings    ${InvalidCredMsg}    Incorrect username/password.
    
    Element Text Should Be    ${InvalidMsg}    Incorrect username/password.

*** Test Cases ***

Validate invalid Login
    Open the Browser
    Fill the login Form
    Verify the error message shown for invalid credentials



*** Settings ***
Documentation    Contains page object and keywords of landing page
Library    SeleniumLibrary


*** Variables ***
${InvalidMsg}        css=.alert-danger
${UserNameField}        id=username
${PasswordField}        id=password
${SignInBtn}        id=signInBtn

${LandingPage}        css=.nav-link
${ItemList}        css:.card-title

*** Keywords ***
Fill the login Form
    [Arguments]    ${UserName}    ${Password}

    Input Text    ${UserNameField}    ${UserName}
    Input Password    ${PasswordField}    ${Password}
    Click Element    ${SignInBtn}

Wait until the element is located in the screen

    Wait Until Element Is Visible    ${InvalidMsg}

Verify the error message shown for invalid credentials

    ${InvalidCredMsg}    Get Text    ${InvalidMsg}
    Should Be Equal As Strings    ${InvalidCredMsg}    Incorrect username/password.
    Element Text Should Be    ${InvalidMsg}    Incorrect username/password.

Enter Username and Password

    [Arguments]    ${UserName}    ${Password}
    Input Text    ${UserNameField}    ${UserName}
    Input Password    ${PasswordField}    ${Password}
    Click Element    xpath=//*[@value="user"]
    Wait Until Element Is Visible    okayBtn
    Click Button    okayBtn
    Select From List By Value    //select[@class="form-control"]    teach
    Select Checkbox    terms
    Checkbox Should Be Selected    terms
    Unselect Checkbox    terms
    Checkbox Should Not Be Selected    terms
*** Settings ***
Library    SeleniumLibrary
Test Setup    Open the Browser
Test Template    Validate invalid Login
Test Teardown    Close Browser
Library    DataDriver    file=Resources/data.csv    encoding=utf_8    dialect=unix
Resource    ../Resources/GenericLib/Generic.robot
Library    Collections

*** Variables ***
${UserNameField}        id=username
${PasswordField}        id=password
${SignInBtn}        id=signInBtn
${InvalidMsg}        css=.alert-danger

*** Keywords ***

Validate invalid Login
    [Arguments]    ${username}    ${password}
#    Open Browser    ${URL}    Chrome
    Fill the login Form    ${username}    ${password}
    Wait until the element is located in the screen    ${InvalidMsg}
    Verify the error message shown for invalid credentials

Fill the login Form
    [Arguments]    ${username}    ${password}
    
    Input Text    ${UserNameField}     ${username}
    Input Password    ${PasswordField}     ${password}
    Click Element    ${SignInBtn}

Verify the error message shown for invalid credentials
   
    ${InvalidCredMsg}    Get Text    ${InvalidMsg}
    Should Be Equal As Strings    ${InvalidCredMsg}    Incorrect username/password.
    Element Text Should Be    ${InvalidMsg}    Incorrect username/password.

Wait until the element is located in the screen
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

#Enter Username and Password
#
#    [Arguments]    ${UserName}    ${Password}
#    Input Text    ${UserNameField}    ${UserName}
#    Input Password    ${PasswordField}    ${Password}
#    Click Element    xpath=//*[@value="user"]
#    Wait Until Element Is Visible    okayBtn
#    Click Button    okayBtn
#    Select From List By Value    //select[@class="form-control"]    teach
#    Select Checkbox    terms
#    Checkbox Should Be Selected    terms
#    Unselect Checkbox    terms
#    Checkbox Should Not Be Selected    terms

*** Test Cases ***
Login with user ${username} and password ${password}    Default    UserData




    
    
    



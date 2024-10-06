*** Settings ***
Library    SeleniumLibrary
Test Setup    Open the Browser and URL
#Test Teardown    Close Browser
Resource    ../Resources/GenericLib/Generic.robot
Resource    ../Resources/PageRobot/CheckoutPage.robot
Library    ../Resources/CustomLibrary/shop.py
Library    Collections

*** Variables ***
${UserNameField}        id=username
${PasswordField}        id=password
${SignInBtn}        id=signInBtn
${InvalidMsg}        css=.alert-danger
${LandingPage}        css=.nav-link
${ItemList}        css:.card-title
@{MultipleItem}    Nokia Edge    Samsung Note 8
${CountryName}     India

*** Keywords ***

Fill the login Form
    [Arguments]    ${UserName}    ${Password}
    
    Input Text    ${UserNameField}    ${UserName}
    Input Password    ${PasswordField}    ${Password}
    Click Element    ${SignInBtn}

Verify the error message shown for invalid credentials
   
    ${InvalidCredMsg}    Get Text    ${InvalidMsg}
    Should Be Equal As Strings    ${InvalidCredMsg}    Incorrect username/password.
    Element Text Should Be    ${InvalidMsg}    Incorrect username/password.

Wait until the element is located in the screen
    [Arguments]    ${element}
    Wait Until Element Is Visible    ${element}

Verify the items present in the shop page
    @{ExpectedItemList}    Create List    iphone X    Samsung Note 8    Nokia Edge    Blackberry
    ${elementList}=    Get Webelements     ${ItemList}
    @{ActualItemList}    Create List    
    FOR    ${elements}    IN     @{elementList}
        Log To Console        ${elements.text}
        Append To List    ${ActualItemList}    ${elements.text}
    END    

    Lists Should Be Equal    ${ExpectedItemList}    ${ActualItemList}

Select the item
    [Arguments]    ${product}
    
    ${elementList}=    Get Webelements     ${ItemList}
    ${index}    Set Variable    1    
    FOR    ${elements}    IN     @{elementList}
       Exit For Loop If    '${elements.text}' == '${product}'
       ${index}     Evaluate    ${index} + 1
       
    END

    Click Element    (//*[@class="btn btn-info"])[${index}]
    Sleep    5s

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

*** Test Cases ***

Validate invalid Login
    [Tags]    SMOKE    REGRESSION
    Fill the login Form    ${ValidUserName}    ${InvalidPassword}
    Wait until the element is located in the screen    ${InvalidMsg}
    Verify the error message shown for invalid credentials

Validate the successfully login and verify the shop page
    [Tags]    REGRESSION     ENDTOEND
    Fill The Login Form    ${ValidUserName}    ${ValidPassword}
    Wait Until The Element Is Located In The Screen    ${LandingPage}
    Verify the items present in the shop page
    Hello World
    Select multiple item and checkout    ${MultipleItem}
    Verify the items present in checkout screen and proceed    ${MultipleItem}
    Select the country and proceed the purchase    ${CountryName}


Validate the login page with all options

    Enter Username and Password    ${ValidUserName}    ${ValidPassword}



    
    
    



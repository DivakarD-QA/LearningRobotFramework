*** Settings ***
Library    SeleniumLibrary
Test Setup    Open the Browser
#Test Teardown    Close Browser
Resource    ../Resources/GenericLib/Generic.robot
Resource    ../Resources/PageRobot/LandingPage.robot
Library    Collections

*** Variables ***


*** Keywords ***






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



*** Test Cases ***

Validate invalid Login
    LandingPage.Fill the login Form    ${ValidUserName}    ${InvalidPassword}
    LandingPage.Wait until the element is located in the screen
    Verify the error message shown for invalid credentials

Validate the successfully login and verify the shop page

    [Tags]    NEW
    Fill The Login Form    ${ValidUserName}    ${ValidPassword}
    Wait Until The Element Is Located In The Screen    ${LandingPage}
    Verify the items present in the shop page
    Select the item    iphone X

Validate the login page with all options
    [Tags]    SMOKE
    Enter Username and Password    ${ValidUserName}    ${ValidPassword}



    
    
    



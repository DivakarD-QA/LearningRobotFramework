*** Settings ***
Library    SeleniumLibrary
Test Setup    Open the Browser
Test Teardown    Close Browser
Resource    ../Resources/GenericLib/Generic.robot
Library    Collections
Library    String

*** Variables ***
${UserNameField}        id=username
${PasswordField}        id=password
${SignInBtn}        id=signInBtn
${Link}        //a[@class="blinkingText"]
${ChildLanding}        //h1[text()="Documents request"]
${Paragraph}        //p[@class="im-para red"]


*** Keywords ***
Click on the link
    Click Element    ${Link}
    Sleep    3s

Verify that user can navigate to child window
    Switch Window    NEW
    Title Should Be    RS Academy
    Wait Until Element Is Visible    ${ChildLanding}
    Element Text Should Be    ${ChildLanding}    DOCUMENTS REQUEST

Extract the email Id from the text
    ${para}    Get Text    ${Paragraph}
    @{para_1}    Split String    ${para}    at
    ${text_1}    Get From List    ${para_1}    1
    Log To Console    ${text_1}
    
    @{para_2}    Split String    ${text_1}
    Log    ${para_2}
    ${email}    Get From List    ${PARA_2}    0
    Log To Console    ${email}
    Set Global Variable     ${email}

Enter the Email ID in the username field
    Switch Window    MAIN
    Wait Until Element Is Visible    ${UserNameField}
    Title Should Be    LoginPage Practise | Rahul Shetty Academy
    Input Text    ${UserNameField}    ${email}

*** Test Cases ***

Validate that user can switch between child window
    [Tags]    SMOKE
#    Open Browser    ${URL}    Chrome
    Click on the link
    Verify that user can navigate to child window
    Extract the email Id from the text
    Enter the Email ID in the username field
    
Split
    @{s1}    Split String    ORDER ID #2154    ID #
    Log To Console    ${s1}
    ${ID}    Get From List    ${s1}    1 
    Log To Console    ${ID}



    
    
    



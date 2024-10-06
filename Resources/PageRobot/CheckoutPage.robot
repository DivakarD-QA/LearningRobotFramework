*** Settings ***
Documentation    Contains page object and keywords of checkout page
Library    SeleniumLibrary
Library    Collections


*** Variables ***
${HomeText}        //a[text()="ProtoCommerce Home"]
#//a[normalize-space()='Nokia Edge']
${CheckOutBtn}        css:.btn.btn-success
${checkItem}        css:.media-heading
${ChooseText}        //label[@for='country']
${CountryField}        country
${Agree}        //label[@for='checkbox2']
${PurchaceBtn}        //input[@value='Purchase']
${SuccessText}        xpath=//*[contains(text(), 'Success!')]

*** Keywords ***
Verify the items present in checkout screen and proceed
    [Arguments]    ${MultipleItem}
    Wait Until Element Is Visible    ${HomeText}
    ${FirstElement}    Get From List    ${MultipleItem}    0
    ${SecondElement}    Get From List    ${MultipleItem}    1

    Page Should Contain Element    //a[normalize-space()='${FirstElement}']
    Page Should Contain Element    //a[normalize-space()='${SecondElement}']


    Click Button    ${CheckOutBtn}

Select the country and proceed the purchase
    [Arguments]    ${CountryName}
    Wait Until Element Is Visible    ${ChooseText}
    Click Element    ${CountryField}
    Clear Element Text    ${CountryField}
    Input Text    ${CountryField}    ${CountryName}
    Sleep    2s
    Wait Until Element Is Visible    //a[normalize-space()='${CountryName}']
    Click Link    //a[normalize-space()='${CountryName}']
    Click Element    ${Agree}
    Click Element    ${PurchaceBtn}
    Sleep    3s
    Wait Until Element Is Visible    ${SuccessText}
    Page Should Contain Element        ${SuccessText}


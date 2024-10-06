*** Settings ***
Documentation    A resource file with reusable variables and keywords
Library    SeleniumLibrary

Resource    ../tests/Lab005_CSV.robot
Resource    ../tests/Lab002_FOR.robot
Resource    ../tests/Lab003_Window_Split.robot
Resource    ../tests/Lab004_Paramaterization.robot

*** Variables ***
${URL}        https://rahulshettyacademy.com/loginpagePractise/
${ValidUserName}        rahulshettyacademy
${ValidPassword}        learning
${InvalidPassword}        Admin@123
${browser_name}        Chrome

*** Keywords ***
Open the Browser
#    Create Webdriver    Chrome    C:\Users\DIVAKAR D\Downloads\chromedriver-win64
#    Maximize Browser Window
#    Go To    ${URL}
    
    Open Browser    ${URL}    Chrome
    Maximize Browser Window

Open the Browser and URL
#    [Arguments]    ${browser_name}
    Open Browser    ${URL}    ${browser_name}
    Maximize Browser Window
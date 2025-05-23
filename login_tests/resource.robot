*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}         localhost:7272
${BROWSER}        Firefox
${DELAY}          0
${VALID USER}     demo
${VALID PASSWORD}    mode
${LOGIN URL}      http://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open
    Sleep    2s

Login Page Should Be Open
    Title Should Be    Login Page
    Sleep    2s

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open
    Sleep    2s

Input Username
    [Arguments]    ${username}
    Input Text    username_field    ${username}
    Sleep    2s

Input Password
    [Arguments]    ${password}
    Input Text    password_field    ${password}
    Sleep    2s

Submit Credentials
    Click Button    login_button
    Sleep    2s

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    Welcome Page
    Sleep    2s

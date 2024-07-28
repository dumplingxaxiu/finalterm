*** Settings ***
Library           SeleniumLibrary
Library           String

*** Variables ***
${BROWSER}        Chrome
${URL}            https://automationteststore.com/
${USERNAME}       chemchem
${PASSWORD}       123Bon567
${WRONG_USERNAME}    wrongusername
${WRONG_PASSWORD}    wrongpassword
${EMPTY_USERNAME}    ${EMPTY}
${EMPTY_PASSWORD}    ${EMPTY}
${ERROR_MESSAGE}    Error: Incorrect login or password provided

*** Test Cases ***
Module2_1
    [Documentation]    Login And Logout Test With "Login or register"
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    5s
    Mouse Over    xpath=//*[@id="main_menu_top"]/li[2]/a/span
    Click Element    xpath=//*[@id="main_menu_top"]/li[2]/ul/li[2]/a/span
    Wait Until Element Is Visible    xpath=//*[@id="customer_menu_top"]/li/a
    Close Browser

Module2_2
    [Documentation]    Login And Logout Test With "Login in Account"
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
    Mouse Over    xpath=//*[@id="main_menu_top"]/li[2]/a/span
    Click Element    xpath=//*[@id="main_menu_top"]/li[2]/ul/li[1]/a/span
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    5s
    Mouse Over    xpath=//*[@id="main_menu_top"]/li[2]/a/span
    Click Element    xpath=//*[@id="main_menu_top"]/li[2]/ul/li[2]/a/span
    Wait Until Element Is Visible    xpath=//*[@id="customer_menu_top"]/li/a
    Close Browser

Module2_3
    [Documentation]    Wrong Login Name And Right Password
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${WRONG_USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    ${page_text}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${page_text}    ${ERROR_MESSAGE}
    Close Browser

Module2_4
    [Documentation]    Right Login Name And Wrong Password
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${WRONG_PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    ${page_text}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${page_text}    ${ERROR_MESSAGE}
    Close Browser

Module2_5
    [Documentation]    Wrong Login Name And Wrong Password
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${WRONG_USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${WRONG_PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    ${page_text}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${page_text}    ${ERROR_MESSAGE}
    Close Browser

Module2_6
    [Documentation]    Empty Username And Password
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${EMPTY_USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${EMPTY_PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    ${page_text}=    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div[1]
    Should Contain    ${page_text}    ${ERROR_MESSAGE}
    Close Browser

*** Settings ***
Library           SeleniumLibrary
Library           OperatingSystem
Library           BuiltIn

*** Variables ***
${BROWSER}        Chrome
${URL}            https://automationteststore.com/index.php?rt=account/logout
${Expected_Facebook_URL}    https://www.facebook.com/login.php
${Expected_Twitter_URL}    https://twitter.com
${Expected_Linkedin_URL}    https://uk.linkedin.com/
${WAIT_TIME}      5s

*** Test Cases ***
Module10_1
    [Documentation]    Test ClickFacebookLink
    Open Browser    ${URL}    ${BROWSER}
    Click Facebook Link
    ${current_url}    Get Location
    ${is_facebook_login_page}    Run Keyword And Return Status    Should Contain    ${current_url}    facebook.com/login.php
    Run Keyword If    ${is_facebook_login_page}    Log    "Clicked Facebook link successfully"
    ...    ELSE    Log    "Failed to click Facebook link"
    Sleep    ${WAIT_TIME}
    Close Browser

Module10_2
    [Documentation]    Test ClickTwitterLink
    Open Browser    ${URL}    ${BROWSER}
    Click Twitter Link
    ${current_url}    Get Location
    ${is_twitter_login_page}    Run Keyword And Return Status    Should Contain    ${current_url}    https://twitter.com
    Run Keyword If    ${is_twitter_login_page}    Log    "Clicked Twitter link successfully"
    ...    ELSE    Log    "Failed to click Twitter link"
    Sleep    ${WAIT_TIME}
    Close Browser

Module10_3
    [Documentation]    Test ClickLinkedinLink
    Open Browser    ${URL}    ${BROWSER}
    Click Linkedin Link
    ${current_url}    Get Location
    ${is_linkedin_login_page}    Run Keyword And Return Status    Should Contain    ${current_url}    https://uk.linkedin.com/
    Run Keyword If    ${is_linkedin_login_page}    Log    "Clicked Linkedin link successfully"
    ...    ELSE    Log    "Failed to click Linkedin link"
    Sleep    ${WAIT_TIME}
    Close Browser

*** Keywords ***
Click Facebook Link
    Click Element    xpath=/html/body/div/header/div[2]/div/div[4]/div/div/a[1]

Click Twitter Link
    Click Element    xpath=/html/body/div/header/div[2]/div/div[4]/div/div/a[2]

Click Linkedin Link
    Click Element    xpath=/html/body/div/header/div[2]/div/div[4]/div/div/a[3]

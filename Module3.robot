*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${browser}        fire fox
${Register_Login}    xpath=//*[@id="customer_menu_top"]/li/a
${Forgot_Password}    xpath=//*[@id="loginFrm"]/fieldset/a[1]
${Forgot_Login}    xpath=//*[@id="loginFrm"]/fieldset/a[2]
${Login_Name}     xpath=//*[@id="forgottenFrm_loginname"]
${Email}          xpath=//*[@id="forgottenFrm_email"]
${Lastname}       xpath=//*[@id="forgottenFrm_lastname"]
${Button_Continue}    xpath=//*[@id="forgottenFrm"]/div[2]/div/button
${Alert}          xpath=//*[@id="maincontainer"]/div/div/div/div[1]

*** Test Cases ***
Module3_1
    [Documentation]    Forgot password successfully
    Open Forgot Password
    Right Login Name
    Right Email
    Successfully_message

Module3_2
    [Documentation]    Forgot password failed with empty login name
    Open Forgot Password
    Right Email
    Empty_loginname_message

Module3_3
    [Documentation]    Forgot password failed with empty email
    Open Forgot Password
    Right Login Name
    Empty_email_message

Module3_4
    [Documentation]    Forgot password failed with empty login name and email
    Open Forgot Password
    Empty_email_message

Module3_5
    [Documentation]    Forgot password failed with wrong login name
    Open Forgot Password
    Wrong Login Name
    Right Email
    Failed_message

Module3_6
    [Documentation]    Forgot password failed with wrong email
    Open Forgot Password
    Right Login Name
    Wrong Email
    Failed_message

Module3_7
    [Documentation]    Forgot password failed with wrong login name and email
    Open Forgot Password
    Wrong Login Name
    Wrong Email
    Failed_message

Module3_8
    [Documentation]    Forgot login successfully
    Open Forgot Login
    Right Last Name
    Right Email
    Successfully_message

Module3_9
    [Documentation]    Forgot login failed with empty last name
    Open Forgot Login
    Right Email
    Empty_loginname_message

Module3_10
    [Documentation]    Forgot login failed with empty email
    Open Forgot Login
    Right Last Name
    Empty_email_message

Module3_11
    [Documentation]    Forgot login failed with empty last name and email
    Open Forgot Login
    Empty_email_message

Module3_12
    [Documentation]    Forgot login failed with wrong last name
    Open Forgot Login
    Wrong Last Name
    Right Email
    Failed_message

Module3_13
    [Documentation]    Forgot login failed with wrong email
    Open Forgot Login
    Right Last Name
    Wrong Email
    Failed_message

Module3_14
    [Documentation]    Forgot login failed with wrong login name and email
    Open Forgot Login
    Wrong Last Name
    Wrong Email
    Failed_message

*** Keywords ***
Open Forgot Password
    Open Browser    ${URL}    ${browser}
    Click Element    ${Register_Login}
    Click Element    ${Forgot_Password}

Open Forgot Login
    Open Browser    ${URL}    ${browser}
    Click Element    ${Register_Login}
    Click Element    ${Forgot_Login}

Right Login Name
    Input Text    ${Login_Name}    chemchem

Wrong Login Name
    Input Text    ${Login_Name}    rjvebvnebgrb

Right Last Name
    Input Text    ${Lastname}    Thai

Wrong Last Name
    Input Text    ${Lastname}    Tran

Right Email
    Input Text    ${Email}    new_email@example.com

Wrong Email
    Input Text    ${Email}    dfvbwvnwrkjrvbekjv@gmail.com

Successfully_message
    Click Element    ${Button_Continue}
    ${text}    Get Text    ${Alert}
    Page Should Contain    ${text}    Success: Password reset link has been sent to your e-mail address.

Empty_loginname_message
    Click Element    ${Button_Continue}
    ${text}    Get Text    ${Alert}
    Page Should Contain    ${text}    Error: The Login name was not provided or not found in our records, please try again!

Empty_email_message
    Click Element    ${Button_Continue}
    ${text}    Get Text    ${Alert}
    Page Should Contain    ${text}    Error: The Email address was not provided or not found in our records, please try again!

Failed_message
    Click Element    ${Button_Continue}
    ${text}    Get Text    ${Alert}
    Page Should Contain    ${text}    Error: No records found matching information your provided, please check your information and try again!

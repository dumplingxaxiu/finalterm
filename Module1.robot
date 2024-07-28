*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${browser}        fire fox
${URL}            https://automationteststore.com/
${Login_or_Register}    xpath=//*[@id="customernav"]
${Register}       xpath=//*[@id="accountFrm"]
${Button_Continue}    xpath=//html/body/div/div[2]/div/div/div/div/div[1]/div/form/fieldset/button
${Button_Register}    xpath=//*[@id="AccountFrm"]/div[5]/div/div/button
${FirstName}      xpath=//*[@id="AccountFrm_firstname"]
${LastName}       xpath=//*[@id="AccountFrm_lastname"]
${Email}          xpath=//*[@id="AccountFrm_email"]
${Telephone}      xpath=//*[@id="AccountFrm_telephone"]
${Fax}            xpath=//*[@id="AccountFrm_fax"]
${Company}        xpath=//*[@id="AccountFrm_company"]
${Address1}       xpath=//*[@id="AccountFrm_address_1"]
${Address2}       xpath=//*[@id="AccountFrm_address_2"]
${City}           xpath=//*[@id="AccountFrm_city"]
${Region}         xpath=//*[@id="AccountFrm_zone_id"]
${ZipCode}        xpath=//*[@id="AccountFrm_postcode"]
${Country}        xpath=//*[@id="AccountFrm_country_id"]
${LoginName}      xpath=//*[@id="AccountFrm_loginname"]
${Password}       xpath=//*[@id="AccountFrm_password"]
${Confirm_Password}    xpath=//*[@id="AccountFrm_confirm"]
${Subscribe_Yes}    xpath=//*[@id="AccountFrm"]/div[4]/fieldset/div/div/label[1]
${Subscribe_No}    xpath=//*[@id="AccountFrm"]/div[4]/fieldset/div/div/label[2]
${Agree_Privacy}    xpath=//*[@id="AccountFrm_agree"]
${Register_Success}    xpath=//*[@id="maincontainer"]/div/div[1]/div/div/section/p[2]
${Register_Failed}    xpath=//*[@class='alert alert-error alert-danger']

*** Test Cases ***
Module1_1
    [Documentation]    Register successfully with subscribe
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user1fv4@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user1fv4
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Success}
    Element Text Should Be    ${Register_Success}    Congratulations! Your new account has been successfully created!

Module1_2
    [Documentation]    Register successfully with No Subscribe
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user2fv4@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user2fv4
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_No}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Success}
    Element Text Should Be    ${Register_Success}    Congratulations! Your new account has been successfully created!
    Close Browser

Module1_3
    [Documentation]    Register successfully without telephone
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user3fv4@gmail.com
    Input Text    ${Fax}    53754
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user3fv4 
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Success}
    Element Text Should Be    ${Register_Success}    Congratulations! Your new account has been successfully created!

Module1_4
    [Documentation]    Register successfully with empty fax
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user4fv4@gmail.com
    Input Text    ${Telephone}    0539573
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user4fv4
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Success}
    Element Text Should Be    ${Register_Success}    Congratulations! Your new account has been successfully created!

Module1_5
    [Documentation]    Register successfully with empty company
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user5fv4@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user5fv4
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Success}
    Element Text Should Be    ${Register_Success}    Congratulations! Your new account has been successfully created!

Module1_6
    [Documentation]    Register successfully with empty address 2
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user6fv4@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user6fv4
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Success}
    Element Text Should Be    ${Register_Success}    Congratulations! Your new account has been successfully created!

Module1_7
    [Documentation]    Register failed with empty firstname
    open register
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user7@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user7
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nFirst Name must be between 1 and 32 characters!

Module1_8
    [Documentation]    Register failed with empty lastname
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${Email}    email_user8@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user8
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nLast Name must be between 1 and 32 characters!

Module1_9
    [Documentation]    Register failed with empty email
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user9
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nEmail Address does not appear to be valid!

Module1_10
    [Documentation]    Register failed with empty address 1
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user10@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user10
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nAddress 1 must be between 3 and 128 characters!

Module1_11
    [Documentation]    Register failed with empty city
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user11@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user11
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nCity must be between 3 and 128 characters!

Module1_12
    [Documentation]    Register failed with empty zipcode
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user12@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${LoginName}    email_user12
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nZip/postal code must be between 3 and 10 characters!

Module1_13
    [Documentation]    Register failed with empty login name
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user13@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nLogin name must be alphanumeric only and between 5 and 64 characters!

Module1_14
    [Documentation]    Register failed with empty password
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user14@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user14
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nPassword must be between 4 and 20 characters!

Module1_15
    [Documentation]    Register failed with empty confirm password
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user15@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user15
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nPassword confirmation does not match password!

Module1_16
    [Documentation]    Register failed with email has already existed
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user1@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user16v2
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nError: E-Mail Address is already registered!

Module1_17
    [Documentation]    Register failed with login name has already existed
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user17v2@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user1
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nThis login name is not available. Try different login name!

Module1_18
    [Documentation]    Register failed with password does not match with confirm password
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user18v2@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user18v2
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passwordwrong
    Click Element    ${Subscribe_Yes}
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nPassword confirmation does not match password!

Module1_19
    [Documentation]    Register without subscribe
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user19v2@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user19v2
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Agree_Privacy}
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}

Module1_20
    [Documentation]    Register without agree privacy
    open register
    Input Text    ${FirstName}    firtsnameright
    Input Text    ${LastName}    lastnameright
    Input Text    ${Email}    email_user20v2@gmail.com
    Input Text    ${Telephone}    0343475634
    Input Text    ${Fax}    1234
    Input Text    ${Company}    None
    Input Text    ${Address1}    District 7
    Input Text    ${Address2}    None
    Input Text    ${City}    Ho Chi Minh City
    Input Text    ${ZipCode}    1234
    Input Text    ${LoginName}    email_user20v2
    Select From List By Value    ${Country}    222
    Select From List By Value    ${Region}    3513
    Input Text    ${Password}    passworduser
    Input Text    ${Confirm_Password}    passworduser
    Click Element    ${Subscribe_Yes}
    Execute Javascript    window.scrollTo(0,1000)
    Press Keys    ${Button_Register}    \\13
    Wait Until Page Contains Element    ${Register_Failed}
    Element Text Should Be    ${Register_Failed}    ×\nError: You must agree to the Privacy Policy!

*** Keywords ***
open register
    Open Browser    ${URL}    ${browser}
    Click Element    ${Login_or_Register}
    Click Element    ${Register}
    Click Element    ${Button_Continue}

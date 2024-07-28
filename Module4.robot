*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        fire fox
${URL}            https://automationteststore.com/index.php?rt=account/login
${USERNAME}       chemchem
${PASSWORD}       123Bon567
${NEW_EMAIL}      new_email@example.com
${FIRST_NAME}     Bao
${LAST_NAME}      Thai
${TELEPHONE}      123456789
${FAX}            987654321
${EMPTY}          \
${NEW_PASSWORD}    123Bon567
${WRONG_PASSWORD}    wrong_old_password
${CONFIRM_PASSWORD}    confirm_password_123
${COMPANY}        TDT University
${ADDRESS1}       19 Nguyen Huu Tho
${ADDRESS2}       1911 Nguyen Thi Thap
${CITY}           Ho Chi Minh City
${ZIP}            1234456
${COUNTRY}        Viet Nam
${REGION1}        Kent
${REGION2}        Ho Chi Minh City
${DEFAULT_ADDRESS}    yes    # Chọn mặc định hoặc không mặc định

*** Test Cases ***
Module4_1
    [Documentation]    Edit Account Details: Successfully
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Fill Edit Account Form
    Save Changes
    Verify Successfully Message
    Close Browser

Module4_2
    [Documentation]    Test case to verify account details are not empty
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Fill Edit Account Form With Empty Fields
    Save Changes
    Verify Error Message
    Close Browser

Module4_3
    [Documentation]    Test case to change password successfully
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Go To Change Password Page
    Fill Change Password Form
    Save Changes Password
    Verify Successfully Message
    Close Browser

Module4_4
    [Documentation]    Test case to verify error message when old password is wrong
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Go To Change Password Page
    Fill Change Password With Wrong Old Password
    Save Changes Password
    Verify Error Message
    Close Browser

Module4_5
    [Documentation]    Test case to verify error message when old password is wrong
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Go To Change Password Page
    Fill Change Password With New password != confirm new password
    Save Changes Password
    Verify Error Message
    Close Browser

Module4_6
    [Documentation]    Test case to edit address book successfully
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Go To Address Book Page
    Edit Address    ${DEFAULT_ADDRESS}
    Save Changes Edit Address
    Verify Successfully Message
    Close Browser

Module4_7
    [Documentation]    Test case to edit address book: Missing field data
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Go To Address Book Page
    Edit Address: Missing field data    ${DEFAULT_ADDRESS}
    Save Changes Edit Address
    Verify Error Message
    Close Browser

Module4_8
    [Documentation]    Test case to add a new address book successfully
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Go To Address Book Page
    Add New Address
    Save New Address
    Verify Successfully Message
    Close Browser

Module4_9
    [Documentation]    Test case to add a new address book field: missing data
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Go To Address Book Page
    Add New Address: Missing Field Data
    Save New Address
    Verify Error Message
    Close Browser

Module4_10
    [Documentation]    Verify that product is displayed in wish list page
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Go To Wish List Page
    Verify That Product Is Displayed

Module4_10.1
    [Documentation]    Remove a product in wish list
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Go To Wish List Page
    Click Element    xpath=//*[@id="maincontainer"]/div/div[1]/div/div/div/table/tbody/tr[2]/td[6]/a[2]/i
    Verify That Product Is Not Displayed

Module4_10.2
    [Documentation]    Add a product to wish list after view product
    ${url}    Set Variable    https://automationteststore.com/index.php?rt=product/product&product_id=52
    Open Browser    ${url}    ${BROWSER}
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Log In
    Go Back
    Go Back
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/a[2]
    Execute Javascript    window.scrollTo(0,1)
    Mouse Over    xpath=//*[@id="customer_menu_top"]/li/a/div
    Click Element    xpath=//*[@id="customer_menu_top"]/li/ul/li[2]/a
    Verify that product is displayed

Module4_10.3
    [Documentation]    Remove a product from wish list after adding
    ${url}    Set Variable    https://automationteststore.com/index.php?rt=product/product&product_id=52
    Open Browser    ${url}    ${BROWSER}
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Log In
    Go Back
    Go Back
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/a[1]
    Execute Javascript    window.scrollTo(0,1)
    Mouse Over    xpath=//*[@id="customer_menu_top"]/li/a/div
    Click Element    xpath=//*[@id="customer_menu_top"]/li/ul/li[2]/a
    Verify that product is not displayed

Module4_10.4
    [Documentation]    Add a product in wish list to cart
    ${url}    Set Variable    https://automationteststore.com/index.php?rt=product/product&product_id=53
    Open Browser    ${url}    ${BROWSER}
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Log In
    Go Back
    Go Back
    Click Element    xpath=//*[@id="product"]/fieldset/div[6]/a[2]
    Execute Javascript    window.scrollTo(0,1)
    Mouse Over    xpath=//*[@id="customer_menu_top"]/li/a/div
    Click Element    xpath=//*[@id="customer_menu_top"]/li/ul/li[2]/a
    Click Element    xpath=//*[@id="maincontainer"]/div/div[1]/div/div/div/table/tbody/tr[2]/td[6]/a[1]/i

Module4_11
    [Documentation]    Verify that My Order page is displayed when user click Order History button
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Go to Order History Page
    Verify that my order page is display

Module4_12
    [Documentation]    Verify that My Order page is displayed when user click Order History button
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Go to Transaction History
    Verify that My Transactions page is display

*** Keywords ***
Add New Address: Missing Field Data
    [Documentation]    Fills the form to add a new address
    Click Link    xpath://a[@class='btn btn-orange pull-right']
    Input Text    xpath://*[@id="AddressFrm_firstname"]    ${FIRST_NAME}
    Input Text    xpath://*[@id="AddressFrm_lastname"]    ${EMPTY}
    Input Text    xpath://*[@id="AddressFrm_company"]    ${COMPANY}
    Input Text    xpath://*[@id="AddressFrm_address_1"]    ${ADDRESS1}
    Input Text    xpath://*[@id="AddressFrm_address_2"]    ${ADDRESS2}
    Input Text    xpath://*[@id="AddressFrm_city"]    ${CITY}
    #Select From List By Label    xpath://*[@id="AddressFrm_zone_id"]    Ho Chi Minh City
    Input Text    xpath://*[@id="AddressFrm_postcode"]    ${ZIP}
    Click Element    xpath://*[@id="AddressFrm"]/div/fieldset/div[10]/div/label[2]

Go to Transaction History
    [Documentation]    Navigates to the order history page
    Click Link    xpath://ul[@class='nav-dash']//a[@data-original-title='Transaction history']

Go to Order History Page
    [Documentation]    Navigates to the order history page
    Click Link    xpath://ul[@class='nav-dash']//a[@data-original-title='Order history']

Go To Wish List Page
    [Documentation]    Navigates to the wish list page
    Click Link    xpath://*[@id="maincontainer"]/div/div[1]/div/ul/li[4]/a

Add New Address
    [Documentation]    Fills the form to add a new address
    Click Link    xpath://a[@class='btn btn-orange pull-right']
    Input Text    xpath://*[@id="AddressFrm_firstname"]    ${FIRST_NAME}
    Input Text    xpath://*[@id="AddressFrm_lastname"]    ${LAST_NAME}
    Input Text    xpath://*[@id="AddressFrm_company"]    ${COMPANY}
    Input Text    xpath://*[@id="AddressFrm_address_1"]    ${ADDRESS1}
    Input Text    xpath://*[@id="AddressFrm_address_2"]    ${ADDRESS2}
    Input Text    xpath://*[@id="AddressFrm_city"]    ${CITY}
    Select From List By Label    xpath://*[@id="AddressFrm_zone_id"]    ${REGION1}
    Input Text    xpath://*[@id="AddressFrm_postcode"]    ${ZIP}
    Click Element    xpath://*[@id="AddressFrm"]/div/fieldset/div[10]/div/label[2]

Save New Address
    [Documentation]    Saves the newly added address
    Click Button    xpath://*[@id="AddressFrm"]/div/fieldset/div[11]/div/button

Save Changes Edit Address
    [Documentation]    Saves the changes made to the address
    Click Button    xpath://*[@id="AddressFrm"]/div/fieldset/div[11]/div/button

Edit Address: Missing field data
    [Arguments]    ${is_default}
    Click Button    xpath:(//button[@title="Edit"])[1]
    Input Text    xpath://*[@id="AddressFrm_firstname"]    \    ${FIRST_NAME}
    Input Text    xpath://*[@id="AddressFrm_lastname"]    \    ${EMPTY}
    Input Text    xpath://*[@id="AddressFrm_company"]    \    ${COMPANY}
    Input Text    xpath://*[@id="AddressFrm_address_1"]    \    ${ADDRESS1}
    Input Text    xpath://*[@id="AddressFrm_address_2"]    \    ${ADDRESS2}
    Input Text    xpath://*[@id="AddressFrm_city"]    \    ${CITY}
    Select From List By Label    xpath://*[@id="AddressFrm_zone_id"]    ${REGION1}
    Input Text    xpath://*[@id="AddressFrm_postcode"]    ${ZIP}
    Select From List By Label    xpath://*[@id="AddressFrm_country_id"]    ${COUNTRY}
    #Click Element    xpath://*[@id="AddressFrm"]/div/fieldset/div[10]/div/label[1] # Chọn địa chỉ mặc định
    #Run Keyword If    '${is_default}' == 'yes'    Click Element    xpath://*[@id="AddressFrm_default1"]    # Lựa chọn mặc định hoặc không mặc định

Edit Address
    [Arguments]    ${is_default}
    Click Button    xpath:/html/body/div/div[2]/div/div[1]/div/div/div[1]/table/tbody/tr/td[2]/button
    Input Text    xpath://*[@id="AddressFrm_firstname"]    ${FIRST_NAME}
    Input Text    xpath://*[@id="AddressFrm_lastname"]    ${LAST_NAME}
    Input Text    xpath://*[@id="AddressFrm_company"]    ${COMPANY}
    Input Text    xpath://*[@id="AddressFrm_address_1"]    ${ADDRESS1}
    Input Text    xpath://*[@id="AddressFrm_address_2"]    ${ADDRESS2}
    Input Text    xpath://*[@id="AddressFrm_city"]    ${CITY}
    Select From List By Label    xpath://*[@id="AddressFrm_zone_id"]    ${REGION1}
    Input Text    xpath://*[@id="AddressFrm_postcode"]    ${ZIP}
    Select From List By Label    xpath://*[@id="AddressFrm_country_id"]    ${COUNTRY}
    #Click Element    xpath://*[@id="AddressFrm"]/div/fieldset/div[10]/div/label[1] # Chọn địa chỉ mặc định
    #Run Keyword If    '${is_default}' == 'yes'    Click Element    xpath://*[@id="AddressFrm_default1"]    # Lựa chọn mặc định hoặc không mặc định

Go To Address Book Page
    [Documentation]    Navigates to the address book page
    Click Link    xpath://*[@id="maincontainer"]/div/div[1]/div/ul/li[3]/a

Fill Change Password With New password != confirm new password
    [Documentation]    Fills the change password form with new password
    Input Text    xpath://*[@id="PasswordFrm_current_password"]    ${WRONG_PASSWORD}
    Input Text    xpath://*[@id="PasswordFrm_password"]    ${NEW_PASSWORD}
    Input Text    xpath://*[@id="PasswordFrm_confirm"]    ${CONFIRM_PASSWORD}

Fill Change Password With Wrong Old Password
    [Documentation]    Fills the change password form with new password
    Input Text    xpath://*[@id="PasswordFrm_current_password"]    ${WRONG_PASSWORD}
    Input Text    xpath://*[@id="PasswordFrm_password"]    ${NEW_PASSWORD}
    Input Text    xpath://*[@id="PasswordFrm_confirm"]    ${NEW_PASSWORD}

Fill Change Password Form
    [Documentation]    Fills the change password form with new password
    Input Text    xpath://*[@id="PasswordFrm_current_password"]    ${PASSWORD}
    Input Text    xpath://*[@id="PasswordFrm_password"]    ${NEW_PASSWORD}
    Input Text    xpath://*[@id="PasswordFrm_confirm"]    ${NEW_PASSWORD}

Save Changes Password
    [Documentation]    Saves the changes made to the password
    Click Button    xpath://*[@id="PasswordFrm"]/div[2]/div/button

Go To Change Password Page
    [Documentation]    Navigates to the change password page
    Click Link    xpath://*[@id="maincontainer"]/div/div[1]/div/ul/li[2]/a

Log In
    Input Text    xpath://*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath://*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath://*[@id="loginFrm"]/fieldset/button

Fill Edit Account Form
    Click Link    xpath://*[@id="maincontainer"]/div/div[1]/div/ul/li[1]/a
    Input Text    xpath://*[@id="AccountFrm_firstname"]    ${FIRST_NAME}
    Input Text    xpath://*[@id="AccountFrm_lastname"]    ${LAST_NAME}
    Input Text    xpath://*[@id="AccountFrm_telephone"]    ${TELEPHONE}
    Input Text    xpath://*[@id="AccountFrm_fax"]    ${FAX}
    Input Text    xpath://*[@id="AccountFrm_email"]    ${NEW_EMAIL}

Save Changes
    Click Button    xpath://*[@id="AccountFrm"]/div[2]/div/button

Verify Successfully Message
    Wait Until Element Is Visible    xpath://*[@id="maincontainer"]/div/div[1]/div/div[1]

Fill Edit Account Form With Empty Fields
    [Documentation]    Fills the edit account form with some fields empty
    Click Link    xpath://*[@id="maincontainer"]/div/div[1]/div/ul/li[1]/a
    Input Text    xpath://*[@id="AccountFrm_firstname"]    ${FIRST_NAME}
    Input Text    xpath://*[@id="AccountFrm_lastname"]    ${LAST_NAME}
    Input Text    xpath://*[@id="AccountFrm_telephone"]    ${TELEPHONE}
    Input Text    xpath://*[@id="AccountFrm_fax"]    ${EMPTY}
    Input Text    xpath://*[@id="AccountFrm_email"]    ${NEW_EMAIL}

Verify Error Message
    [Documentation]    Verifies that error message is displayed
    Wait Until Element Is Visible    xpath://*[@id="maincontainer"]/div/div[1]/div/div[1]    timeout=10s

Verify that product is displayed
    [Documentation]    Verify that product is displayed
    Element Should Be Visible    xpath=//table//tr[contains(@class,'wishlist')]

Verify that product is not displayed
    [Documentation]    Verify that product is not displayed
    Element Should Not Be Visible    xpath=//*[@class='wishlist']

Verify that my order page is display
    [Documentation]    Verify that my order page is display
    Element Should Be Visible    xpath://span[@class='maintext' and contains(text(),'My Order History')]

Verify that My Transactions page is display
    [Documentation]    Verify that my order page is display
    Element Should Be Visible    xpath://span[@class='maintext' and contains(text(),'My Transactions')]

Click "Automation Test Store" logo
    [Documentation]    Click "Automation Test Store" logo
    Scroll Element Into View    xpath://img[@title='Automation Test Store']
    Click Element    xpath://img[@title='Automation Test Store']

Product name is displayed
    [Documentation]    Product name is displayed
    Element Should Be Visible    xpath://a[@class='prdocutname']

Product image is displayed
    [Documentation]    Produc image is displayed
    Element Should Be Visible    xpath://div[@class='thumbnail']//img[contains(@src,'//automationteststore.com/image/thumbnails/18')]

"Sale" tag is displayed
    [Documentation]    "Sale" tag is displayed
    Element Should Be Visible    xpath://div[@class='thumbnail']//span[@class='sale']

Add to cart icon is displayed
    [Documentation]    "Add to cart" icon is displayed
    Element Should Be Visible    xpath://i[@class='fa fa-cart-plus fa-fw']

Out of stock icon is displayed
    [Documentation]    "Out of stock" icon is displayed
    Element Should Be Visible    xpath://span[.='Out of Stock']

View link is displayed
    [Documentation]    View link is displayed
    Mouse Over    xpath:(//div[@class='thumbnail']//img[contains(@src,'//automationteststore.com/image/thumbnails/18')])[1]
    Element Should Be Visible    xpath://a[@class='details']

Write view link is displayed
    [Documentation]    Write view link is displayed
    Mouse Over    xpath:(//div[@class='thumbnail']//img[contains(@src,'//automationteststore.com/image/thumbnails/18')])[1]
    Element Should Be Visible    xpath://a[@class='compare']

Click product item
    [Documentation]    Write view link is displayed
    Click Element    xpath:(//div[@class='fixed_wrapper']//a[text()='Skinsheen Bronzer Stick'])[1]

Click product item "Out of Stock"
    [Documentation]    Write view link is displayed "Out of Stock"
    Click Element    xpath:(//div[@class='fixed_wrapper']//a[text()='BeneFit Girl Meets Pearl'])[1]

Verify that product information is displayed at view product page
    [Documentation]    verify that product information is displayed at view product page
    Element Should Be Visible    xpath://span[.='Skinsheen Bronzer Stick']

Verify that product price is displayed at view product page
    [Documentation]    verify that product price is displayed at view product page
    Element Should Be Visible    xpath://div[@class='productfilneprice']

Add to cart button is displayed
    [Documentation]    verify that product price is displayed at view product page
    Element Should Be Visible    xpath://ul[@class='productpagecart']

Out of Stock button is displayed
    [Documentation]    Out of Stock button is displayed
    Element Should Be Visible    xpath://span[@class='nostock']

Description tab is displayed
    [Documentation]    Description tab is displayed
    Element Should Be Visible    xpath://a[@href='#description']

Review tab is displayed
    [Documentation]    Review tab is displayed
    Element Should Be Visible    xpath://a[@href='#review']

Tag tab is displayed
    [Documentation]    Tag tab is displayed
    Element Should Be Visible    xpath://a[@href='#producttag']

Click Add to cart button
    [Documentation]    verify that product price is displayed at view product page
    Click Element    xpath://ul[@class='productpagecart']

Shoping cart page is displayed
    [Documentation]    Shoping cart page is displayed
    Element Should Be Visible    xpath://span[.=' Shopping Cart']

Click review tab
    [Documentation]    Click review tab
    Scroll Element Into View    xpath://a[@href='#review']
    Click Element    xpath://a[@href='#review']

Click Submit button
    [Documentation]    Click review tab
    Scroll Element Into View    xpath://button[@id='review_submit']
    Click Element    xpath://button[@id='review_submit']

Alert message is displayed
    [Documentation]    Alert message is displayed
    Wait Until Element Is Visible    xpath://div[@class='alert alert-error alert-danger']
    Element Should Be Visible    xpath://div[@class='alert alert-error alert-danger']

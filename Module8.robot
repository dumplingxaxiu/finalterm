*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Chrome
${URL}            https://automationteststore.com/index.php?rt=account/login
${USERNAME}       chemchem
${PASSWORD}       123Bon567
${product}        https://automationteststore.com/index.php?rt=product/product&path=68&product_id=116
${browser_firefox}    fire fox
${yourname}       kobietnua

*** Test Cases ***
Module8_1
    [Documentation]    Verify that product information include product name and image name
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Click "Automation Test Store" logo
    Product image is displayed
    Product name is displayed

Module8_2
    [Documentation]    Verify that product information include product name and image name
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Click "Automation Test Store" logo
    "Sale" tag is displayed

Module8_3
    [Documentation]    Verify that prduct state [Add to cart] and [Out of stock]
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Click "Automation Test Store" logo
    Add to cart icon is displayed
    Out of stock icon is displayed

Module8_4
    [Documentation]    Verify that "view" and "write view" button is displayed in the product item
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Click "Automation Test Store" logo
    View link is displayed
    Write view link is displayed

Module8_5
    [Documentation]    verify that product information is displayed at view product page
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Click "Automation Test Store" logo
    Click product item
    Verify that product information is displayed at view product page
    Verify that product price is displayed at view product page

Module8_6
    [Documentation]    verify that product information is displayed at view product page
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Click "Automation Test Store" logo
    Click product item
    Add to cart button is displayed

Module8_7
    [Documentation]    verify that product information is displayed at view product page
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Click "Automation Test Store" logo
    Click product item "Out of Stock"
    Out of Stock button is displayed

Module8_8
    [Documentation]    verify that product information is displayed at view product page
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Click "Automation Test Store" logo
    Click product item
    Description tab is displayed
    Review tab is displayed
    Tag tab is displayed

Module8_9
    [Documentation]    User can add to cart in the view product page
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Click "Automation Test Store" logo
    Click product item
    Click Add to cart button
    Shoping cart page is displayed

Module8_10
    [Documentation]    User can add to cart in the view product page
    Open Browser    ${URL}    ${BROWSER}
    Log In
    Click "Automation Test Store" logo
    Click product item
    Click review tab
    Click Submit button
    Alert message is displayed

Module8_11
    [Documentation]    Write Review Product False
    Open Browser    ${product}    firefox
    Execute JavaScript    window.scrollTo(0,600)
    Click Element    xpath=//*[@id="myTab"]/li[2]/a
    Click Element    xpath=//*[@id="rating5"]
    Input Text    xpath=//*[@id="name"]    ${yourname}
    Input Text    xpath=//*[@id="text"]    good product !!!!
    Click Element    xpath=//*[@id="review_submit"]/i
    Wait Until Page Contains Element    xpath=//*[@id="review"]/div[3]/button

Module8_12
    [Documentation]    Pop Up Print Product
    Open Browser    ${product}    firefox
    Execute Javascript    window.scrollTo(0,500)
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//*[@class='fa fa-print fa-fw']    10s
    Click Element    xpath=//*[@class='fa fa-print fa-fw']
    Sleep    5s

*** Keywords ***
Log In
    Input Text    xpath://*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath://*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath://*[@id="loginFrm"]/fieldset/button

Verify Successfully Message
    Wait Until Element Is Visible    xpath://*[@id="maincontainer"]/div/div[1]/div/div[1]

Verify Error Message
    [Documentation]    Verifies that error message is displayed
    Wait Until Element Is Visible    xpath://*[@id="maincontainer"]/div/div[1]/div/div[1]    timeout=10s

Verify that product is displayed
    [Documentation]    Verify that product is displayed
    Element Should Be Visible    xpath://table//tr[contains(@class,'wishlist')]

Verify that product is not displayed
    [Documentation]    Verify that product is not displayed
    Element Should Not Be Visible    xpath://table//tr[contains(@class,'wishlist')]

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

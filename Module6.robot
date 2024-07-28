*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${URL}            https://automationteststore.com/
${browser}        fire fox
${login_or_register}    xpath=//*[@id="customer_menu_top"]/li/a
${login_name}     xpath=//*[@id="loginFrm_loginname"]
${password}       xpath=//*[@id="loginFrm_password"]
${Login_Button}    xpath=//*[@id="loginFrm"]/fieldset/button
${Apparels_Assesories_Button}    xpath=//*[@id="categorymenu"]/nav/ul/li[2]
${product_name_list}    xpath=//div[@class='col-md-8']
${list}           xpath=//*[@id="list"]
${grid}           xpath=//*[@id="grid"]
${thumbnail_grid}    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]
${thumbnail_list}    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]
${Shoes_Button}    xpath=//*[@id="categorymenu"]/nav/ul/li[2]/div/ul[1]/li[1]
${T-shirt_Button}    xpath=//*[@id="categorymenu"]/nav/ul/li[2]/div/ul[1]/li[2]
${Makeup}         xpath=//*[@id="categorymenu"]/nav/ul/li[3]
${Cheeks}         xpath=//*[@id="maincontainer"]/div/div/div/div/ul/li[1]/a
${Eyes}           xpath=//*[@id="maincontainer"]/div/div/div/div/ul/li[2]/a
${Face}           xpath=//*[@id="maincontainer"]/div/div/div/div/ul/li[3]/a
${Lips}           xpath=//*[@id="maincontainer"]/div/div/div/div/ul/li[4]/a
${Nails}          xpath=//*[@id="maincontainer"]/div/div/div/div/ul/li[5]/a
${Value_Sets}     xpath=//*[@id="maincontainer"]/div/div/div/div/ul/li[6]/a
${list}           xpath=//*[@id="list"]
${Benefit}        xpath=//*[@id="description"]/ul/li[3]/a/img

*** Test Cases ***
Module6_1
    [Documentation]    Check Products In Apparels & Assesories
    Log in web
    Click Element    ${Apparels_Assesories_Button}
    Click Element    ${list}
    Wait Until Element Is Visible    ${thumbnail_list}
    Count Number Of Products In Category

Module6_2
    [Documentation]    Check products in Shoes category
    Log in web
    Mouse Over    ${Apparels_Assesories_Button}
    Click Element    ${Shoes_Button}
    Count Number Of Products In Category

Module6_3
    [Documentation]    Check product in T-shirt category
    Log in web
    Mouse Over    ${Apparels_Assesories_Button}
    Click Element    ${T-shirt_Button}
    Count Number Of Products In Category

Module6_4
    [Documentation]    Check product in Makeup category
    Log in web
    Click Element    ${Makeup}
    Count Number Of Products In Category

Module6_5
    [Documentation]    Check product in Cheeks category
    Log in web
    Click Element    ${Makeup}
    Click Element    ${Cheeks}
    Count Number Of Products In Category

Module6_6
    [Documentation]    Check product in Eyes category
    Log in web
    Click Element    ${Makeup}
    Click Element    ${Eyes}
    Count Number Of Products In Category

Module6_7
    [Documentation]    Check product in Face category
    Log in web
    Click Element    ${Makeup}
    Click Element    ${Face}
    Count Number Of Products In Category

Module6_8
    [Documentation]    Check product in Lips category
    Log in web
    Click Element    ${Makeup}
    Click Element    ${Lips}
    Count Number Of Products In Category

Module6_9
    [Documentation]    Check product in Nails category
    Log in web
    Click Element    ${Makeup}
    Click Element    ${Nails}
    Count Number Of Products In Category

Module6_10
    [Documentation]    Check product in Value Sets category
    Log in web
    Click Element    ${Makeup}
    Click Element    ${Value_Sets}
    Count Number Of Products In Category

Module6_11
    [Documentation]    Check product in Skincare category
    Log in web
    ${Skincare}    Set Variable    xpath=//*[@id="categorymenu"]/nav/ul/li[4]/a
    Click Element    ${Skincare}
    Count Number Of Products In Category

Module6_12
    Log in web
    ${Fragrance}    Set Variable    xpath=//*[@id="categorymenu"]/nav/ul/li[5]/a
    Count Number Of Products In Category

Module6_13
    [Documentation]    Check product in Men category
    Log in web
    ${Men}    Set Variable    xpath=//*[@id="categorymenu"]/nav/ul/li[6]/a
    Click Element    ${Men}
    Count Number Of Products In Category

Module6_14
    [Documentation]    Check product in Hair Care category
    Log in web
    ${Hair_Care}    Set Variable    xpath=//*[@id="categorymenu"]/nav/ul/li[7]/a
    Click Element    ${Hair_Care}
    Count Number Of Products In Category

Module6_15
    [Documentation]    Check product in Books category
    Log in web
    ${Books}    Set Variable    xpath=//*[@id="categorymenu"]/nav/ul/li[8]/a
    Click Element    ${Books}
    Count Number Of Products In Category

Module6_16
    [Documentation]    View Benefit Brand
    Open Brand-Scrolling
    ${brand}    Set Variable    xpath=//*[@id="brandcarousal"]/li[1]/div[1]/a/img
    Click Element    ${brand}
    Click Element    ${list}
    ${product_list}    Get Webelements    xpath=//div[@class='col-md-4']
    ${length}    Get Length    ${product_list}
    FOR    ${index}    IN RANGE    1    ${length+1}
    Click Element    ${list}
    ${product}    Get WebElement    xpath=(//div[@class='col-md-4'])[${index}]
    Execute Javascript    window.scrollTo(0,300)
    Click Element    ${product}
    ${img_element}    Set Variable    xpath=//*[@id="description"]/ul/li[3]/a//img
    ${img}    Get Element Attribute    ${img_element}    src
    Should Be Equal As Strings    ${img}    https://automationteststore.com/image/thumbnails/18/71/mf_benefit_logo_black_jpg-100117-57x57.jpg
    Go Back
    END

Module6_17
    [Documentation]    View Pantene Brand
    Open Brand-Scrolling
    ${brand}    Set Variable    xpath=//*[@id="brandcarousal"]/li[2]/div[1]/a/img
    Click Element    ${brand}
    Click Element    ${list}
    ${product_list}    Get Webelements    xpath=//div[@class='col-md-4']
    ${length}    Get Length    ${product_list}
    FOR    ${index}    IN RANGE    1    ${length+1}
    Click Element    ${list}
    ${product}    Get WebElement    xpath=(//div[@class='col-md-4'])[${index}]
    Execute Javascript    window.scrollTo(0,300)
    Click Element    ${product}
    ${img_element}    Set Variable    xpath=//*[@id="description"]/ul//img
    ${img}    Get Element Attribute    ${img_element}    src
    Should Be Equal As Strings    ${img}    https://automationteststore.com/image/thumbnails/18/71/mf_pantene_logo_jpg-100120-57x57.jpg
    Go Back
    END

Module6_18
    [Documentation]    View MAC Brand
    Open Brand-Scrolling
    ${brand}    Set Variable    xpath=//*[@id="brandcarousal"]/li[3]/div[1]/a/img
    Click Element    ${brand}
    Click Element    ${list}
    ${product_list}    Get Webelements    xpath=//div[@class='col-md-4']
    ${length}    Get Length    ${product_list}
    FOR    ${index}    IN RANGE    1    ${length+1}
    Click Element    ${list}
    ${product}    Get WebElement    xpath=(//div[@class='col-md-4'])[${index}]
    Execute Javascript    window.scrollTo(0,300)
    Click Element    ${product}
    Execute Javascript    window.scrollTo(0,500)
    ${img_element}    Set Variable    xpath=//*[@id="description"]/ul//img
    ${img}    Get Element Attribute    ${img_element}    src
    Should Be Equal As Strings    ${img}    https://automationteststore.com/image/thumbnails/18/71/mf_mac_logo_jpg-100118-57x57.jpg
    Go Back
    END

Module6_19
    [Documentation]    View Lancome Brand
    Open Brand-Scrolling
    ${brand}    Set Variable    xpath=//*[@id="brandcarousal"]/li[4]/div[1]/a/img
    Click Element    ${brand}
    Click Element    ${list}
    ${product_list}    Get Webelements    xpath=//div[@class='col-md-4']
    ${length}    Get Length    ${product_list}
    FOR    ${index}    IN RANGE    1    ${length+1}
    Click Element    ${list}
    ${product}    Get WebElement    xpath=(//div[@class='col-md-4'])[${index}]
    Execute Javascript    window.scrollTo(0,300)
    Click Element    ${product}
    Execute Javascript    window.scrollTo(0,300)
    ${img_element}    Set Variable    xpath=//*[@id="description"]/ul//img
    ${img}    Get Element Attribute    ${img_element}    src
    Should Be Equal As Strings    ${img}    https://automationteststore.com/image/thumbnails/18/71/mf_lancome_logo_gif-100119-57x57.gif
    Go Back
    END

Module6_20
    Open Brand-Scrolling
    [Documentation]    View Gucci Brand
    ${brand}    Set Variable    xpath=//*[@id="brandcarousal"]/li[5]/div[1]/a/img
    Click Element    ${brand}
    Click Element    ${list}
    ${product_list}    Get Webelements    xpath=//div[@class='col-md-4']
    ${length}    Get Length    ${product_list}
    FOR    ${index}    IN RANGE    1    ${length+1}
    Click Element    ${list}
    ${product}    Get WebElement    xpath=(//div[@class='col-md-4'])[${index}]
    Execute Javascript    window.scrollTo(0,300)
    Click Element    ${product}
    ${img_element}    Set Variable    xpath=//*[@id="description"]/ul//img
    ${img}    Get Element Attribute    ${img_element}    src
    Should Be Equal As Strings    ${img}    https://automationteststore.com/image/thumbnails/18/73/demo_mf_gucci_jpg-100153-57x57.jpg
    Go Back
    END

Module6_21
    [Documentation]    View Armani Brand
    Open Brand-Scrolling
    ${brand}    Set Variable    xpath=//*[@id="brandcarousal"]/li[6]/div[1]/a/img
    Click Element    ${brand}
    Click Element    ${list}
    ${product_list}    Get Webelements    xpath=//div[@class='col-md-4']
    ${length}    Get Length    ${product_list}
    FOR    ${index}    IN RANGE    1    ${length+1}
    Click Element    ${list}
    ${product}    Get WebElement    xpath=(//div[@class='col-md-4'])[${index}]
    Execute Javascript    window.scrollTo(0,300)
    Click Element    ${product}
    ${img_element}    Set Variable    xpath=//*[@id="description"]/ul//img
    ${img}    Get Element Attribute    ${img_element}    src
    Should Be Equal As Strings    ${img}    https://automationteststore.com/image/thumbnails/18/71/mf_armani_logo_gif-100122-57x57.gif
    Go Back
    END

Module6_22
    [Documentation]    View Dove Brand
    Open Brand-Scrolling
    ${brand}    Set Variable    xpath=//*[@id="brandcarousal"]/li[7]/div[1]/a/img
    Click Element    ${brand}
    Click Element    ${list}
    ${product_list}    Get Webelements    xpath=//div[@class='col-md-4']
    ${length}    Get Length    ${product_list}
    FOR    ${index}    IN RANGE    1    ${length+1}
    Click Element    ${list}
    ${product}    Get WebElement    xpath=(//div[@class='col-md-4'])[${index}]
    Execute Javascript    window.scrollTo(0,300)
    Click Element    ${product}
    ${img_element}    Set Variable    xpath=//*[@id="description"]/ul//img
    ${img}    Get Element Attribute    ${img_element}    src
    Should Be Equal As Strings    ${img}    https://automationteststore.com/image/thumbnails/18/71/mf_dove_logo_jpg-100121-57x57.jpg
    Go Back
    END

Module6_23
    [Documentation]    View Calvin Klein Brand
    Open Brand-Scrolling
    ${brand}    Set Variable    xpath=//*[@id="brandcarousal"]/li[8]/div[1]/a/img
    Click Element    ${brand}
    Click Element    ${list}
    ${product_list}    Get Webelements    xpath=//div[@class='col-md-4']
    ${length}    Get Length    ${product_list}
    FOR    ${index}    IN RANGE    1    ${length+1}
    Click Element    ${list}
    ${product}    Get WebElement    xpath=(//div[@class='col-md-4'])[${index}]
    Execute Javascript    window.scrollTo(0,300)
    Click Element    ${product}
    ${img_element}    Set Variable    xpath=//*[@id="description"]/ul//img
    ${img}    Get Element Attribute    ${img_element}    src
    Should Be Equal As Strings    ${img}    https://automationteststore.com/image/thumbnails/18/71/mf_calvin_klein_jpg-100116-57x57.jpg
    Go Back
    END

Module6_24
    [Documentation]    View Bvlgari Brand
    Open Brand-Scrolling
    ${brand}    Set Variable    xpath=//*[@id="brandcarousal"]/li[9]/div[1]/a/img
    Click Element    ${brand}
    Click Element    ${list}
    ${product_list}    Get Webelements    xpath=//div[@class='col-md-4']
    ${length}    Get Length    ${product_list}
    FOR    ${index}    IN RANGE    1    ${length+1}
    Click Element    ${list}
    ${product}    Get WebElement    xpath=(//div[@class='col-md-4'])[${index}]
    Execute Javascript    window.scrollTo(0,300)
    Click Element    ${product}
    ${img_element}    Set Variable    xpath=//*[@id="description"]/ul//img
    ${img}    Get Element Attribute    ${img_element}    src
    Should Be Equal As Strings    ${img}    https://automationteststore.com/image/thumbnails/18/71/mf_Bvlgari_jpg-100115-57x57.jpg
    Go Back
    END

Module6_25
    [Documentation]    View Sephora Brand
    Open Brand-Scrolling
    ${brand}    Set Variable    xpath=//*[@id="brandcarousal"]/li[10]/div[1]/a/img
    Click Element    ${brand}
    Click Element    ${list}
    ${product_list}    Get Webelements    xpath=//div[@class='col-md-4']
    ${length}    Get Length    ${product_list}
    FOR    ${index}    IN RANGE    1    ${length+1}
    Click Element    ${list}
    ${product}    Get WebElement    xpath=(//div[@class='col-md-4'])[${index}]
    Execute Javascript    window.scrollTo(0,300)
    Click Element    ${product}
    ${img_element}    Set Variable    xpath=//*[@id="description"]/ul//img
    ${img}    Get Element Attribute    ${img_element}    src
    Should Be Equal As Strings    ${img}    https://automationteststore.com/image/thumbnails/18/71/mf_sephora_ba_logo_black_jpg-100114-57x57.jpg
    Go Back
    END

*** Keywords ***
Log in web
    Open Browser    ${URL}    ${browser}
    Click Element    ${login_or_register}
    Input Text    ${login_name}    chemchem
    Input Text    ${password}    123Bon567
    Click Element    ${Login_Button}

Count Number Of Products In Category
    [Documentation]    Check number of products in shoes category
    ${product_name}    Get WebElements    ${product_name_list}
    ${product_num}    Get Length    ${product_name}
    Run Keyword If    ${product_num} >0    Log    Num of product list: ${product_num}

Open Brand-Scrolling
    Open Browser    ${URL}    ${browser}
    Execute JavaScript    window.scrollTo(0,2500)

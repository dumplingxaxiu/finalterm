*** Settings ***
Library           SeleniumLibrary
Library           Collections

*** Variables ***
${BROWSER}        fire fox
${URL}            https://automationteststore.com/index.php?rt=product/category&path=68_69

*** Test Cases ***
Module7_1
    [Documentation]    Test to verify sorting products by name from A to Z.
    Open Browser    ${URL}    ${BROWSER}
    Select From List By Index    xpath=//*[@id="sort"]    1
    ${product_names}    Get Product Names
    ${sorted_product_names}    Set Variable    ${product_names}
    ${sorted_product_names}    Sort List    ${sorted_product_names}
    Lists Should Be Equal    ${product_names}    ${sorted_product_names}
    Close Browser

Module7_2
    [Documentation]    Test to verify sorting products by name from A to Z.
    Open Browser    ${URL}    ${BROWSER}
    Select From List By Index    xpath=//*[@id="sort"]    2
    ${product_names}    Get Product Names
    ${sorted_product_names}    Set Variable    ${product_names}
    ${sorted_product_names}    Sort List    ${sorted_product_names}
    Lists Should Be Equal    ${product_names}    ${sorted_product_names}
    Close Browser

Module7_3
    [Documentation]    Test to verify sorting products by price from low to high.
    Open Browser    ${URL}    ${BROWSER}
    Select From List By Index    xpath=//*[@id="sort"]    3
    ${product_prices}    Get Product Prices
    ${sorted_product_prices}    Set Variable    ${product_prices}
    ${sorted_product_prices}    Sort List    ${sorted_product_prices}
    Lists Should Be Equal    ${product_prices}    ${sorted_product_prices}
    Close Browser

Module7_4
    [Documentation]    Test to verify sorting products by price from high to low.
    Open Browser    ${URL}    ${BROWSER}
    Select From List By Index    xpath=//*[@id="sort"]    4
    ${product_prices}    Get Product Prices
    ${sorted_product_prices}    Set Variable    ${product_prices}
    ${sorted_product_prices}    Sort List    ${sorted_product_prices}
    Lists Should Be Equal    ${product_prices}    ${sorted_product_prices}
    Close Browser

Module7_5
    [Documentation]    Test to verify sorting products by rating highest.
    Open Browser    ${URL}    ${BROWSER}
    Select From List By Index    xpath=//*[@id="sort"]    5
    ${product_ratings}    Get Product Ratings
    ${sorted_product_ratings}    Set Variable    ${product_ratings}
    ${sorted_product_ratings}    Sort List By Rating    ${sorted_product_ratings}
    Lists Should Be Equal    ${product_ratings}    ${sorted_product_ratings}
    Close Browser

Module7_6
    [Documentation]    Test to verify sorting products by rating lowest.
    Open Browser    ${URL}    ${BROWSER}
    Select From List By Index    xpath=//*[@id="sort"]    6
    ${product_ratings}    Get Product Ratings
    ${sorted_product_ratings}    Set Variable    ${product_ratings}
    ${sorted_product_ratings}    Sort List By Rating    ${sorted_product_ratings}
    Lists Should Be Equal    ${product_ratings}    ${sorted_product_ratings}
    Close Browser

Module7_7
    [Documentation]    Test to verify sorting products by date from old to new.
    Open Browser    ${URL}    ${BROWSER}
    Select From List By Index    xpath=//*[@id="sort"]    0
    ${product_dates}    Get Product Dates
    ${sorted_product_dates}    Sort List By Date Old To New    ${product_dates}
    Log    ${sorted_product_dates}
    Close Browser

Module7_8
    [Documentation]    Test to verify sorting products by date from new to old.
    Open Browser    ${URL}    ${BROWSER}
    Select From List By Index    xpath=//*[@id="sort"]    7
    ${product_dates}    Get Product Dates
    ${sorted_product_dates}    Sort List By Date New To Old    ${product_dates}
    Log    ${sorted_product_dates}
    Close Browser

Module7_9
    [Documentation]    Searching product "Creme Precieuse Nuit 50ml"
    ${url}    Set Variable    https://automationteststore.com/
    Open Browser    ${url}    ${BROWSER}
    Input Text    xpath=//*[@id="filter_keyword"]    Creme Precieuse Nuit 50ml
    Click Element    xpath=//*[@id="search_form"]/div/div/i
    ${name product}    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div/h1/span
    Should Be Equal    ${name product}    Creme Precieuse Nuit 50ml

Module7_10
    [Documentation]    Searching keyword "ạnernbjwngjenbjdmwlkenfrelbnwfnewgn"
    ${url}    Set Variable    https://automationteststore.com/
    Open Browser    ${url}    ${BROWSER}
    Input Text    xpath=//*[@id="filter_keyword"]    ạnernbjwngjenbjdmwlkenfrelbnwfnewgn
    Click Element    xpath=//*[@id="search_form"]/div/div/i
    Page Should Contain Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]

Module7_11
    [Documentation]    Searching empty keyword
    ${url}    Set Variable    https://automationteststore.com/
    Open Browser    ${url}    ${BROWSER}
    Click Element    xpath=//*[@id="search_form"]/div/div/i
    Page Should Contain Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]

*** Keywords ***
Get Product Names
    ${product_elements}    Get WebElements    xpath=//div[@class='fixed_wrapper']//div[contains(@class, 'prdocutname')]
    ${product_names}    Create List
    FOR    ${product_element}    IN    @{product_elements}
        ${product_name}    Get Text    ${product_element}
        Append To List    ${product_names}    ${product_name}
    END
    [Return]    ${product_names}

Get Product Prices
    ${product_elements}    Get WebElements    xpath=//div[@class='fixed_wrapper']//span[contains(@class, 'pricetag')]
    ${product_prices}    Create List
    FOR    ${product_element}    IN    @{product_elements}
        ${product_price}    Get Text    ${product_element}
        Append To List    ${product_prices}    ${product_price}
    END
    [Return]    ${product_prices}

Sort List
    [Arguments]    ${list}
    ${sorted_list}    Evaluate    sorted($list)
    [Return]    ${sorted_list}

Get Product Ratings
    ${product_elements}    Get WebElements    xpath=//div[@class='fixed_wrapper']//div[contains(@class, 'starrating')]
    ${product_ratings}    Create List
    FOR    ${product_element}    IN    @{product_elements}
        ${product_rating}    Get Text    ${product_element}
        Append To List    ${product_ratings}    ${product_rating}
    END
    [Return]    ${product_ratings}

Sort List By Rating
    [Arguments]    ${list}
    ${sorted_list}    Evaluate    sorted($list, key=lambda x: float(x.split()[0]), reverse=True)
    [Return]    ${sorted_list}

Get Product Dates
    ${product_elements}    Get WebElements    xpath=//div[@class='fixed_wrapper']//span[@class='date']
    ${product_dates}    Create List
    FOR    ${product_element}    IN    @{product_elements}
        ${product_date}    Get Text    ${product_element}
        Append To List    ${product_dates}    ${product_date}
    END
    [Return]    ${product_dates}

Sort List By Date Old To New
    [Arguments]    ${dates}
    ${sorted_dates}    Evaluate    sorted($dates, key=lambda x: datetime.strptime(x, '%m/%d/%Y'))
    [Return]    ${sorted_dates}

Sort List By Date New To Old
    [Arguments]    ${dates}
    ${sorted_dates}    Evaluate    sorted($dates, key=lambda x: datetime.strptime(x, '%m/%d/%Y'), reverse=True)
    [Return]    ${sorted_dates}

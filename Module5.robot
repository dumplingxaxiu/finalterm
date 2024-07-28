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
${HOVER_ELEMENT_XPATH}    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/a/span

*** Test Cases ***
Module 5_1
    [Documentation]    Currency conversion from dolla to euro
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[1]/a
    Wait Until Page Contains Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    # Lấy giá trị số tiền trước và sau khi chọn sản phẩm, chuyển đổi kiểu dữ liệu.
    ${old_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_special_1772"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_latest_1770"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/div[3]/a/i
    ${new_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_amount_int}    Set Variable    ${old_amount.replace("$", "").replace(",", "")}
    ${new_amount_int}    Set Variable    ${new_amount.replace("$", "").replace(",", "")}
    ${price_difference}    Evaluate    "{:.1f}".format(float(${new_amount_int}) - float(${old_amount_int}))
    ${price_text_1_featured}    Get Text    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div/div
    ${price_text_3_featured}    Get Text    xpath=//*[@id="block_frame_special_1772"]/div/div[1]/div[2]/div[3]/div[2]/div[1]
    ${price_text_1_LastedProduct}    Get Text    xpath=//*[@id="block_frame_latest_1770"]/div/div[1]/div[2]/div[3]/div/div
    ${price_text_2_LastedProduct}    Get Text    xpath=//*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/div[3]/div[2]/div[1]
    ${price_value_1_featured}    Set Variable    ${price_text_1_featured.replace("$", "").replace(",", "")}
    ${price_value_3_featured}    Set Variable    ${price_text_3_featured.replace("$", "").replace(",", "")}
    ${price_value_1_LastedProduct}    Set Variable    ${price_text_1_LastedProduct.replace("$", "").replace(",", "")}
    ${price_value_2_LastedProduct}    Set Variable    ${price_text_2_LastedProduct.replace("$", "").replace(",", "")}
    ${price_value_1_featured_float}    Set Variable    ${price_value_1_featured.strip()}
    ${price_value_3_featured_float}    Set Variable    ${price_value_3_featured.strip()}
    ${price_value_1_LastedProduct_float}    Set Variable    ${price_value_1_LastedProduct.strip()}
    ${price_value_2_LastedProduct_float}    Set Variable    ${price_value_2_LastedProduct.strip()}
    ${total_price_amount}    Evaluate    ${price_value_1_featured_float} + ${price_value_3_featured_float} + ${price_value_1_LastedProduct_float} + ${price_value_2_LastedProduct_float}
    Should Be Equal As Numbers    ${price_difference}    ${total_price_amount}
    #chuyển đổi tiền qua euro
    Mouse Over    ${HOVER_ELEMENT_XPATH}
    ${dropdown_option_xpath}    Set Variable    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[1]/a
    Click Element    ${dropdown_option_xpath}
    ${new_amount_euro}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${new_amount_euro_float}    Set Variable    ${new_amount_euro.replace("€", "").replace(",", "")}
    ${exchange_rate}    Evaluate    ${new_amount_int} / ${new_amount_euro_float}
    ${check_rate}    Evaluate    ${new_amount_euro_float} * ${exchange_rate}
    Should Be Equal As Numbers    ${new_amount_int}    ${check_rate}

Module 5_2
    [Documentation]    Currency conversion from dolla to pound
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[1]/a
    Wait Until Page Contains Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    # Lấy giá trị số tiền trước và sau khi chọn sản phẩm, chuyển đổi kiểu dữ liệu.
    ${old_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_special_1772"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_latest_1770"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/div[3]/a/i
    ${new_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_amount_int}    Set Variable    ${old_amount.replace("$", "").replace(",", "")}
    ${new_amount_int}    Set Variable    ${new_amount.replace("$", "").replace(",", "")}
    ${price_difference}    Evaluate    "{:.1f}".format(float(${new_amount_int}) - float(${old_amount_int}))
    ${price_text_1_featured}    Get Text    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div/div
    ${price_text_3_featured}    Get Text    xpath=//*[@id="block_frame_special_1772"]/div/div[1]/div[2]/div[3]/div[2]/div[1]
    ${price_text_1_LastedProduct}    Get Text    xpath=//*[@id="block_frame_latest_1770"]/div/div[1]/div[2]/div[3]/div/div
    ${price_text_2_LastedProduct}    Get Text    xpath=//*[@id="block_frame_latest_1770"]/div/div[2]/div[2]/div[3]/div[2]/div[1]
    ${price_value_1_featured}    Set Variable    ${price_text_1_featured.replace("$", "").replace(",", "")}
    ${price_value_3_featured}    Set Variable    ${price_text_3_featured.replace("$", "").replace(",", "")}
    ${price_value_1_LastedProduct}    Set Variable    ${price_text_1_LastedProduct.replace("$", "").replace(",", "")}
    ${price_value_2_LastedProduct}    Set Variable    ${price_text_2_LastedProduct.replace("$", "").replace(",", "")}
    ${price_value_1_featured_float}    Set Variable    ${price_value_1_featured.strip()}
    ${price_value_3_featured_float}    Set Variable    ${price_value_3_featured.strip()}
    ${price_value_1_LastedProduct_float}    Set Variable    ${price_value_1_LastedProduct.strip()}
    ${price_value_2_LastedProduct_float}    Set Variable    ${price_value_2_LastedProduct.strip()}
    ${total_price_amount}    Evaluate    ${price_value_1_featured_float} + ${price_value_3_featured_float} + ${price_value_1_LastedProduct_float} + ${price_value_2_LastedProduct_float}
    Should Be Equal As Numbers    ${price_difference}    ${total_price_amount}
    #chuyển đổi tiền qua euro
    Mouse Over    ${HOVER_ELEMENT_XPATH}
    ${dropdown_option_xpath}    Set Variable    xpath=/html/body/div/header/div[2]/div/div[2]/ul/li/ul/li[2]/a
    Click Element    ${dropdown_option_xpath}
    ${new_amount_euro}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${new_amount_euro_float}    Set Variable    ${new_amount_euro.replace("£", "").replace(",", "")}
    ${exchange_rate}    Evaluate    ${new_amount_int} / ${new_amount_euro_float}
    ${check_rate}    Evaluate    ${new_amount_euro_float} * ${exchange_rate}
    Should Be Equal As Numbers    ${new_amount_int}    ${check_rate}

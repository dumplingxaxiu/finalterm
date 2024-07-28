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
Module 9_1
    [Documentation]    home - Test Add To Cart Product 1 From Featured - 1 Special
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
    ${old_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${old_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_special_1772"]/div/div[1]/div[2]/div[3]/a/i
    ${new_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_amount_int}    Set Variable    ${old_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${new_amount_int}    Set Variable    ${new_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${price_difference}    Evaluate    "{:.1f}".format((float(${new_amount_int}) - float(${old_amount_int})) / 100.0)
    ${price_text_1_featured}    Get Text    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/div/div
    ${price_text_3_featured}    Get Text    xpath=//*[@id="block_frame_special_1772"]/div/div[1]/div[2]/div[3]/div[2]/div[1]
    ${price_value_1_featured}    Set Variable    ${price_text_1_featured.replace("$", "").replace(",", "")}
    ${price_value_3_featured}    Set Variable    ${price_text_3_featured.replace("$", "").replace(",", "")}
    ${price_value_1_featured_float}    Set Variable    ${price_value_1_featured.strip()}
    ${price_value_3_featured_float}    Set Variable    ${price_value_3_featured.strip()}
    ${total_price_amount}    Evaluate    ${price_value_1_featured_float} + ${price_value_3_featured_float}
    Should Be Equal As Numbers    ${price_difference}    ${total_price_amount}
    # Lấy số lượng trong giỏ hàng trước và sau khi chọn sản phẩm, thực hiện so sánh
    ${new_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${quantity_difference}    Evaluate    ${new_quantity} - ${old_quantity}
    Should Be Equal As Numbers    ${quantity_difference}    2
    Close Browser

Module 9_2
    [Documentation]    home - Test Add To Cart Product 3 From Featured - Minimun quantity is 2
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[1]/a
    Wait Until Page Contains Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    ${old_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[3]/div[2]/div[3]/a/i
    ${new_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_amount_int}    Set Variable    ${old_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${new_amount_int}    Set Variable    ${new_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${price_difference}    Evaluate    "{:.1f}".format((float(${new_amount_int}) - float(${old_amount_int})) / 100.0)
    ${price_text}    Get Text    xpath=//*[@id="block_frame_featured_1769"]/div/div[3]/div[2]/div[3]/div[2]/div
    ${price_value}    Set Variable    ${price_text.replace("$", "").replace(",", "")}
    ${price_value_float}    Set Variable    ${price_value.strip()}
    ${double_price_value_float}    Evaluate    ${price_value_float} * 2
    Should Be Equal As Numbers    ${price_difference}    ${double_price_value_float}
    # Lấy số lượng trong giỏ hàng trước và sau khi chọn sản phẩm, thực hiện so sánh
    ${new_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${quantity_difference}    Evaluate    ${new_quantity} - ${old_quantity}
    Should Be Equal As Numbers    ${quantity_difference}    2
    Close Browser

Module 9_3
    [Documentation]    home - Test Add To Cart Product 4 From Featured - choose propertie
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[1]/a
    Wait Until Page Contains Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[4]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[4]/div[2]/div[3]/a/i
    Wait Until Page Contains Element    xpath=//*[@id="option318"]
    Select From List By Label    xpath=//*[@id="option318"]    Natural Golden
    Input Text    xpath=//*[@id="product_quantity"]    2
    ${price_text}    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div/div[1]/div/div
    ${old_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Click Element    xpath=//*[@id="product"]/fieldset/div[5]/ul/li/a
    ${new_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_amount_int}    Set Variable    ${old_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${new_amount_int}    Set Variable    ${new_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${price_difference}    Evaluate    "{:.1f}".format((float(${new_amount_int}) - float(${old_amount_int})) / 100.0)
    ${price_value}    Set Variable    ${price_text.replace("$", "").replace(",", "")}
    ${price_value_float}    Set Variable    ${price_value.strip()}
    ${double_price_value_float}    Evaluate    ${price_value_float} * 2
    Should Be Equal As Numbers    ${price_difference}    ${double_price_value_float}
    # Lấy số lượng trong giỏ hàng trước và sau khi chọn sản phẩm, thực hiện so sánh
    ${new_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${quantity_difference}    Evaluate    ${new_quantity} - ${old_quantity}
    Should Be Equal As Numbers    ${quantity_difference}    2
    Close Browser

Module 9_4
    [Documentation]    home - Test Add To Cart Product 1 From BestSeller
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[1]/a
    Wait Until Page Contains Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[4]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_bestsellers_1771"]/div/div[1]/div[2]/div[3]/a/i
    Wait Until Page Contains Element    xpath=//*[@id="product_quantity"]
    Input Text    xpath=//*[@id="product_quantity"]    2
    ${price_text}    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div/div[1]/div/div
    ${old_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Click Element    xpath=//*[@id="product"]/fieldset/div[6]/ul/li/a
    ${new_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_amount_int}    Set Variable    ${old_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${new_amount_int}    Set Variable    ${new_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${price_difference}    Evaluate    "{:.1f}".format((float(${new_amount_int}) - float(${old_amount_int})) / 100.0)
    ${price_value}    Set Variable    ${price_text.replace("$", "").replace(",", "")}
    ${price_value_float}    Set Variable    ${price_value.strip()}
    ${double_price_value_float}    Evaluate    ${price_value_float} * 2
    Should Be Equal As Numbers    ${price_difference}    ${double_price_value_float}
    # Lấy số lượng trong giỏ hàng trước và sau khi chọn sản phẩm, thực hiện so sánh
    ${new_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${quantity_difference}    Evaluate    ${new_quantity} - ${old_quantity}
    Should Be Equal As Numbers    ${quantity_difference}    2
    Close Browser

Module 9_5
    [Documentation]    APPAREL & ACCESSORIES - Test Add To Cart Product 1 - shoes
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[2]/a
    Wait Until Page Contains Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]/div[1]/div[2]/div[3]/a/i
    Wait Until Page Contains Element    xpath=//*[@id="option345"]
    Click Element    xpath=//*[@id="option344748"]
    Select From List By Label    xpath=//*[@id="option345"]    red
    Input Text    xpath=//*[@id="product_quantity"]    2
    ${price_text}    Get Text    xpath=//*[@id="product_details"]/div/div[2]/div/div/div[1]/div/div
    ${old_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Click Element    xpath=//*[@id="product"]/fieldset/div[6]/ul/li/a
    ${new_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_amount_int}    Set Variable    ${old_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${new_amount_int}    Set Variable    ${new_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${price_difference}    Evaluate    "{:.1f}".format((float(${new_amount_int}) - float(${old_amount_int})) / 100.0)
    ${price_value}    Set Variable    ${price_text.replace("$", "").replace(",", "")}
    ${price_value_float}    Set Variable    ${price_value.strip()}
    ${double_price_value_float}    Evaluate    ${price_value_float} * 2
    Should Be Equal As Numbers    ${price_difference}    ${double_price_value_float}
    # Lấy số lượng trong giỏ hàng trước và sau khi chọn sản phẩm, thực hiện so sánh
    ${new_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${quantity_difference}    Evaluate    ${new_quantity} - ${old_quantity}
    Should Be Equal As Numbers    ${quantity_difference}    2
    Close Browser

Module 9_6
    [Documentation]    APPAREL & ACCESSORIES - Test Add To Cart Product 1 - shoes - No choose propertie
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[2]/a
    Wait Until Page Contains Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]/div[1]/div[2]/div[3]/a/i
    Wait Until Page Contains Element    xpath=//*[@id="option345"]
    Click Element    xpath=//*[@id="product"]/fieldset/div[6]/ul/li/a
    Wait Until Element Contains    xpath=//*[@id="maincontainer"]/div/div[2]/div/div[1]/strong    UK size: Please select all required options!
    Close Browser

Module 9_8
    [Documentation]    MAKEUP - Test Add To Cart Product Mascara
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    #Click \ MAKEUP
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[3]/a
    #Click sản phẩm
    Wait Until Page Contains Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[1]/div[2]/div[3]/a/i
    #Sau khi click thêm vào giỏ hàng
    Wait Until Page Contains Element    xpath=//*[@id="ContactUsFrm_first_name"]
    Input Text    xpath=//*[@id="ContactUsFrm_first_name"]    Tuan
    Input Text    xpath=//*[@id="ContactUsFrm_email"]    Tuan@gmail.com
    Input Text    xpath=//*[@id="ContactUsFrm_enquiry"]    I don't have enquire
    Click Element    xpath=//*[@id="ContactUsFrm"]/div[2]/div[2]/button
    Sleep    3s
    Wait Until Element Contains    xpath=//*[@id="maincontainer"]/div/div/div/div/section/p[2]    Your enquiry has been successfully sent to the store owner!
    Close Browser

Module 9_10
    [Documentation]    FRAGRANCE - Test Add To Cart Product 1
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    #Click FRAGRANCE
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[5]/a
    Wait Until Page Contains Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[1]/div[2]/div[3]/a/i
    # Lấy giá trị số tiền trước và sau khi chọn sản phẩm, chuyển đổi kiểu dữ liệu.
    ${old_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${old_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[1]/div[2]/div[3]/a/i
    ${new_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_amount_int}    Set Variable    ${old_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${new_amount_int}    Set Variable    ${new_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${price_difference}    Evaluate    "{:.1f}".format((float(${new_amount_int}) - float(${old_amount_int})) / 100.0)
    ${price_text}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[1]/div[2]/div[3]/div[2]/div
    ${price_value}    Set Variable    ${price_text.replace("$", "").replace(",", "")}
    ${price_value_float}    Set Variable    ${price_value.strip()}
    Should Be Equal As Numbers    ${price_difference}    ${price_value_float}
    # Lấy số lượng trong giỏ hàng trước và sau khi chọn sản phẩm, thực hiện so sánh
    ${new_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${quantity_difference}    Evaluate    ${new_quantity} - ${old_quantity}
    Should Be Equal As Numbers    ${quantity_difference}    1
    Close Browser

Module 9_11
    [Documentation]    MEN - Test Add To Cart Product 3
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    #Click \ MEN
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[6]/a
    Wait Until Page Contains Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]/div[1]/div[2]/div[3]/a/i
    # Lấy giá trị số tiền trước và sau khi chọn sản phẩm, chuyển đổi kiểu dữ liệu.
    ${old_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${old_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]/div[3]/div[2]/div[3]/a/i
    ${new_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_amount_int}    Set Variable    ${old_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${new_amount_int}    Set Variable    ${new_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${price_difference}    Evaluate    "{:.1f}".format((float(${new_amount_int}) - float(${old_amount_int})) / 100.0)
    ${price_text}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[2]/div[3]/div[2]/div[3]/div[2]/div
    ${price_value}    Set Variable    ${price_text.replace("$", "").replace(",", "")}
    ${price_value_float}    Set Variable    ${price_value.strip()}
    Should Be Equal As Numbers    ${price_difference}    ${price_value_float}
    # Lấy số lượng trong giỏ hàng trước và sau khi chọn sản phẩm, thực hiện so sánh
    ${new_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${quantity_difference}    Evaluate    ${new_quantity} - ${old_quantity}
    Should Be Equal As Numbers    ${quantity_difference}    1
    Close Browser

Module 9_12
    [Documentation]    HAIR CARE - Test Add To Cart Product 2 From Hair care
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    #Click HAIR CARE
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[7]/a
    Wait Until Page Contains Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/div[3]/a/i
    # Lấy giá trị số tiền trước và sau khi chọn sản phẩm, chuyển đổi kiểu dữ liệu.
    ${old_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${old_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Click Element    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/div[3]/a/i
    ${new_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_amount_int}    Set Variable    ${old_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${new_amount_int}    Set Variable    ${new_amount.replace("$", "").replace(".", "").replace(",", "")}
    ${price_difference}    Evaluate    "{:.1f}".format((float(${new_amount_int}) - float(${old_amount_int})) / 100.0)
    ${price_text}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/div/div[3]/div[2]/div[2]/div[3]/div[2]/div
    ${price_value}    Set Variable    ${price_text.replace("$", "").replace(",", "")}
    ${price_value_float}    Set Variable    ${price_value.strip()}
    Should Be Equal As Numbers    ${price_difference}    ${price_value_float}
    # Lấy số lượng trong giỏ hàng trước và sau khi chọn sản phẩm, thực hiện so sánh
    ${new_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    Wait Until Page Contains Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${quantity_difference}    Evaluate    ${new_quantity} - ${old_quantity}
    Should Be Equal As Numbers    ${quantity_difference}    1
    Close Browser

Module 9_13
    [Documentation]    home - Test Product Out Of Stock
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[1]/a
    Wait Until Element Is Visible    xpath=//*[@id="block_frame_featured_1769"]/div/div[2]/div[2]/div[3]/span
    ${out_of_stock_text}=    Get Text    xpath=//*[@id="block_frame_featured_1769"]/div/div[2]/div[2]/div[3]/span
    Should Be Equal As Strings    ${out_of_stock_text}    OUT OF STOCK
    Close Browser

Module 9_14
    [Documentation]    Choose product exceed in stock - 4 Special
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    ${USERNAME}
    Input Text    xpath=//*[@id="loginFrm_password"]    ${PASSWORD}
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[1]/a
    Wait Until Page Contains Element    xpath=//*[@id="block_frame_latest_1770"]/div/div[3]/div[2]/a/img
    Click Element    xpath=//*[@id="block_frame_latest_1770"]/div/div[3]/div[2]/a/img
    Input Text    xpath=//*[@id="product_quantity"]    200000000
    Click Element    xpath=//*[@id="product"]/fieldset/div[4]/ul/li/a
    Wait Until Element Contains    xpath=//*[@id="maincontainer"]/div/div/div/div/strong    Products marked with *** are not available in the desired quantity or out of stock!
    Close Browser

Module 9_15
    [Documentation]    Update product
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[1]/a
    Wait Until Page Contains Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    //*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Sleep    2s
    Click Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a
    Wait Until Page Contains Element    //*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]
    ${old_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${old_amount}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${old_amount_float}    Set Variable    ${old_amount.replace("$", "").replace(",", "")}
    Input Text    //*[@id="cart_quantity50"]    5
    Click Element    xpath=//*[@id="cart_update"]
    ${update_quantity}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[1]
    ${update_price}    Get Text    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a/span[2]
    ${update_price_float}    Set Variable    ${update_price.replace("$", "").replace(",", "")}
    ${price_difference}    Evaluate    "{:.1f}".format(float(${update_price_float}) - float(${old_amount_float}))
    ${distance_quantity}    Evaluate    int(${update_quantity}) - int(${old_quantity})
    ${update_quantity_distance}    Get Element Attribute    //*[@id="cart_quantity50"]    value
    ${update_quantity_distance}    Evaluate    int(${update_quantity_distance}) - int(${old_quantity})
    ${price_text}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[2]/td[4]
    ${price_text_float}    Set Variable    ${price_text.replace("$", "").replace(",", "")}
    ${total_price}    Evaluate    float(float(${price_text_float}) * int(${update_quantity_distance}))
    Should Be Equal As Numbers    ${price_difference}    ${total_price}
    Should Be Equal As Numbers    ${distance_quantity}    ${update_quantity_distance}
    Close Browser

Module 9_16
    [Documentation]    checkout process
    #Thêm sản phẩm vào giỏ
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Click Element    xpath=//*[@id="customer_menu_top"]/li/a
    Input Text    xpath=//*[@id="loginFrm_loginname"]    nguoidung2
    Input Text    xpath=//*[@id="loginFrm_password"]    passworduser2
    Click Button    xpath=//*[@id="loginFrm"]/fieldset/button
    Sleep    2s
    Click Element    xpath=//*[@id="categorymenu"]/nav/ul/li[1]/a
    Wait Until Page Contains Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_featured_1769"]/div/div[1]/div[2]/div[3]/a/i
    Click Element    xpath=//*[@id="block_frame_latest_1770"]/div/div[3]/div[2]/div[3]/a/i
    #Click vào giỏ
    Click Element    xpath=/html/body/div/header/div[2]/div/div[3]/ul/li/a
    # Tính tổng giá tiền của các sản phẩm trong giỏ hàng
    ${total_price_in_cart}    Set Variable    0
    ${number_of_products}    Get Element Count    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr
    ${product_xpath_list}    Create List    //*[@id="cart_quantity50"]    //*[@id="cart_quantity66"]
    FOR    ${index}    IN RANGE    0    ${number_of_products}-1
        ${quantity_xpath}    Set Variable    ${product_xpath_list}[${index}]
        ${quantity}    Get Element Attribute    xpath=${quantity_xpath}    value
        ${quantity_int}    Convert To Number    ${quantity}
        ${price_per_unit}    Get Text    xpath=//*[@id="cart"]/div/div[1]/table/tbody/tr[${index+2}]/td[4]
        # Remove currency symbol and convert to float
        ${price_per_unit}    Evaluate    float("${price_per_unit}".replace("$", "").replace(",", ""))
        ${product_total_price}    Evaluate    ${quantity_int} * ${price_per_unit}
        ${total_price_in_cart}    Evaluate    ${total_price_in_cart} + ${product_total_price}
    END
    Wait Until Page Contains Element    xpath=//*[@id="totals_table"]/tbody/tr[1]/td[2]/span
    ${total_price_in_cart_displayed}    Get Text    xpath=//*[@id="totals_table"]/tbody/tr[1]/td[2]/span
    ${total_price_in_cart_displayed_float}    Evaluate    float("${total_price_in_cart_displayed}".replace("$", "").replace(",", ""))
    ${total_price_in_cart_float}    Convert To Number    ${total_price_in_cart}
    Should Be Equal As Numbers    ${total_price_in_cart_float}    ${total_price_in_cart_displayed_float}
    ${ship_price}    Get Text    xpath=//*[@id="totals_table"]/tbody/tr[2]/td[2]/span
    ${ship_price}    Evaluate    float("${ship_price}".replace("$", "").replace(",", ""))
    ${total_price_with_ship}    Get Text    xpath=//*[@id="totals_table"]/tbody/tr[3]/td[2]/span
    ${total_price_with_ship}    Evaluate    float("${total_price_with_ship}".replace("$", "").replace(",", ""))
    ${total_amount}    Evaluate    ${total_price_in_cart_float} + ${ship_price}
    Should Be Equal As Numbers    ${total_amount}    ${total_price_with_ship}
    #click checkout
    Click Element    xpath=//*[@id="cart_checkout2"]
    Wait Until Page Contains Element    xpath=//*[@id="maincontainer"]/div/div[1]/div/div[2]/div/div[1]/table/tbody/tr[3]/td[2]/span
    ${total_price_confirm}    Get Text    xpath=//*[@id="maincontainer"]/div/div[1]/div/div[2]/div/div[1]/table/tbody/tr[3]/td[2]/span
    ${total_price_confirm}    Evaluate    float("${total_price_confirm}".replace("$", "").replace(",", ""))
    Should Be Equal As Numbers    ${total_amount}    ${total_price_confirm}
    Click Element    xpath=//*[@id="checkout_btn"]
    ${Success_text}    Get Text    xpath=//*[@id="maincontainer"]/div/div/div/h1/span[1]
    Should Contain    ${Success_text}    CHECKOUT CONFIRMATION
    Close Browser

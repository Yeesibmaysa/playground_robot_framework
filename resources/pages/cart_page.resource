*** Settings ***
Documentation    Keywords for SauceDemo cart page.
Library    SeleniumLibrary

*** Variables ***
${CART_LINK}                  css:.shopping_cart_link
${BACKPACK_NAME}              xpath://div[@data-test="inventory-item-name" and text()="Sauce Labs Backpack"]
${BACKPACK_REMOVE_BUTTON}     id:remove-sauce-labs-backpack

*** Keywords ***
Open Shopping Cart
    [Documentation]    Open Shopping Cart Page.
    Click Element    ${CART_LINK}
    Wait Until Location Contains    cart.html

Backpack Should Display In Cart
    [Documentation]    Verify That The Sauce Labs Backpack Is In The Cart.
    Wait Until Element Is Visible    ${BACKPACK_NAME}
    Element Text Should Be    ${BACKPACK_NAME}    Sauce Labs Backpack

Remove Backpack From Cart
    [Documentation]    Remove Sauce Labs Backpack From Cart.
    Click Button    ${BACKPACK_REMOVE_BUTTON}

Backpack Should Not Display In Cart
    [Documentation]    Verify That The Sauce Labs Backpack Is Not Display In The Cart.
    Wait Until Page Does Not Contain Element    ${BACKPACK_NAME}

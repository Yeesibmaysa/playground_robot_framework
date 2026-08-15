*** Settings ***
Documentation    Keywords For SauceDemo Cart Page.
Library    SeleniumLibrary

*** Variables ***
${CART_LINK}                  css:.shopping_cart_link
${BACKPACK_NAME}              xpath://div[@data-test="inventory-item-name" and text()="Sauce Labs Backpack"]
${BACKPACK_REMOVE_BUTTON}     id:remove-sauce-labs-backpack

*** Keywords ***
Open Shopping Cart
    [Documentation]    Open Shopping Cart Page.
    Wait Until Element Is Visible    ${CART_LINK}
    Execute Javascript    document.querySelector('.shopping_cart_link').click()
    Wait Until Location Contains    cart.html

Backpack Should Display In Cart
    [Documentation]    Verify That The Sauce Labs Backpack Is In The Cart.
    Wait Until Element Is Visible    ${BACKPACK_NAME}
    Element Text Should Be    ${BACKPACK_NAME}    Sauce Labs Backpack

Remove Backpack From Cart
    [Documentation]    Remove Sauce Labs Backpack From Cart.
    Wait Until Element Is Visible    ${BACKPACK_REMOVE_BUTTON}
    Scroll Element Into View         ${BACKPACK_REMOVE_BUTTON}
    Wait Until Element Is Enabled    ${BACKPACK_REMOVE_BUTTON}
    Execute Javascript    document.querySelector('[data-test="remove-sauce-labs-backpack"]').click()

Backpack Should Not Display In Cart
    [Documentation]    Verify That The Sauce Labs Backpack Is Not Display In The Cart.
    Wait Until Page Does Not Contain Element    ${BACKPACK_NAME}

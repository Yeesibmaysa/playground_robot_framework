*** Settings ***
Documentation    Keywords For Inventory Page Saucedemo.
Library    SeleniumLibrary

*** Variables ***
${BACKPACK_ADD_BUTTON}      id:add-to-cart-sauce-labs-backpack
${CART_BADGE}               css:.shopping_cart_badge

*** Keywords ***
Add Backpack To Cart
    [Documentation]    Add Sauce Labs Backpack To Cart.
    Wait Until Element Is Visible    ${BACKPACK_ADD_BUTTON}
    Wait Until Element Is Enabled    ${BACKPACK_ADD_BUTTON}
    Execute Javascript    document.querySelector('[data-test="add-to-cart-sauce-labs-backpack"]').click()
    Wait Until Element Is Visible    ${CART_BADGE}
    Element Text Should Be           ${CART_BADGE}    1

Cart Badge Should Show 1 Item
    [Documentation]    Verify That The Cart Badge Display 1 Item.
    Wait Until Element Is Visible    ${CART_BADGE}
    Element Text Should Be    ${CART_BADGE}    1


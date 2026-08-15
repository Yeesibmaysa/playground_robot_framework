*** Settings ***
Documentation    Keywords For Inventory Page Saucedemo.
Library    SeleniumLibrary

*** Variables ***
${BACKPACK_ADD_BUTTON}      id:add-to-cart-sauce-labs-backpack
${CART_BADGE}               css:.shopping_cart_badge

*** Keywords ***
Add Backpack To Cart
    [Documentation]    Add Sauce Labs Backpack To Cart.
    Click Button    ${BACKPACK_ADD_BUTTON}

Cart Badge Should Show 1 Item
    [Documentation]    Verify That The Cart Badge Display 1 Item.
    Wait Until Element Is Visible    ${CART_BADGE}
    Element Text Should Be    ${CART_BADGE}    1


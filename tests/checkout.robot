*** Settings ***
Documentation    Checkout Tests For The SauceDemo Web Application.
Resource    ../resources/pages/login_page.resource
Resource    ../resources/pages/inventory_page.resource
Resource    ../resources/pages/cart_page.resource
Resource    ../resources/pages/checkout_page.resource
Variables    ../variables/saucedemo.py

Test Setup    Open SauceDemo Login Page
Test Teardown    Close All Browsers
Test Tags    checkout portfolio

*** Test Cases ***
User Can Complete Checkout Successfully
    [Documentation]    Login User Can Complete Order Successfully.
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Inventory Page Should Be Displayed
    Add Backpack To Cart
    Open Shopping Cart
    Backpack Should Display In Cart
    Start Checkout
    Input Customer Information    
    ...    ${CUSTOMER_FIRST_NAME}  
    ...    ${CUSTOMER_LAST_NAME}    
    ...    ${CUSTOMER_POSTAL_CODE}
    Finish Checkout
    Order Should Be Complete

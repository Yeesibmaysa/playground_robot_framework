*** Settings ***
Documentation    Cart tests for the SauceDemo web application
Resource    ../resources/pages/login_page.resource
Resource    ../resources/pages/inventory_page.resource
Variables    ../variables/saucedemo.py

Test Setup    Open SauceDemo Login Page
Test Teardown    Close All Browsers
Test Tags    cart portfolio

*** Test Cases ***
User Can Add Backpack To Cart
    [Documentation]    Login User Can Add Backpack To The Cart.
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Inventory Page Should Be Displayed
    Add Backpack To Cart
    Cart Badge Should Show 1 Item
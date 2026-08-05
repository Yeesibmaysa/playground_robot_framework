*** Settings ***
Documentation       Login tests for the SauceDemo web application.
Resource            ../resources/pages/login_page.resource
Variables           ../variables/saucedemo.py

Suite Setup         Open SauceDemo Login Page
Suite Teardown      Close All Browsers
Test Tags           login    portfolio


*** Test Cases ***
Standard User Can Login Successfully
    [Documentation]    A valid user should reach the products page after login.
    Login With Credentials    ${VALID_USERNAME}    ${VALID_PASSWORD}
    Inventory Page Should Be Displayed

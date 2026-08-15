*** Settings ***
Documentation       Login Tests For The SauceDemo Web Application.
Resource            ../resources/pages/login_page.resource
Variables           ../variables/saucedemo.py

Test Setup         Open SauceDemo Login Page
Test Teardown      Close All Browsers
Test Tags           login    portfolio


*** Test Cases ***
User Can Login Successfully
    [Documentation]    User Can Login Successfully
    Login With Credentials    ${USERNAME}    ${PASSWORD}
    Inventory Page Should Be Displayed

Invalid Password Should Display Error Message
    [Documentation]    Invalid Password Should Display Error Message
    Login With Credentials    ${INVALID_USERNAME}    ${INVALID_PASSWORD}
    Error Message Should Be Displayed

*** Settings ***
Documentation       Keywords For Login Page Saucedemo.
Library             SeleniumLibrary


*** Variables ***
${USERNAME_FIELD}       id:user-name
${PASSWORD_FIELD}       id:password
${LOGIN_BUTTON}         id:login-button
${INVENTORY_PAGE}       id:inventory_container
${ERROR_MESSAGE}        css:[data-test="error"]


*** Keywords ***
Open SauceDemo Login Page
    [Documentation]    Opens the browser at the SauceDemo login page.
    ${browser_options}=    Set Variable    ${EMPTY}
    IF    ${HEADLESS}
        ${browser_options}=    Set Variable    add_argument("--headless=new");add_argument("--no-sandbox");add_argument("--disable-dev-shm-usage")
    END
    Open Browser    ${BASE_URL}    ${BROWSER}    options=${browser_options}
    IF    not ${HEADLESS}
        Maximize Browser Window
    END
    Set Selenium Timeout    10 seconds

Login With Credentials
    [Documentation]    Enters a username and password, then submits the form.
    [Arguments]    ${username}    ${password}
    Input Text        ${USERNAME_FIELD}    ${username}
    Input Password    ${PASSWORD_FIELD}    ${password}
    Click Button      ${LOGIN_BUTTON}

Login Failed
    [Documentation]    Enters wrong a user and password, then submits the form.
    [Arguments]    ${invalid_user}    ${invalid_password}
    Input Text    ${USERNAME_FIELD}    ${invalid_user}
    Input Password    ${PASSWORD_FIELD}    ${invalid_password}
    Click Button    ${LOGIN_BUTTON}   

Inventory Page Should Be Displayed
    [Documentation]    Verify that login succeeded and the products page loaded.
    Wait Until Element Is Visible    ${INVENTORY_PAGE}
    Location Should Contain          inventory.html

Error Message Should Be Displayed
    [Documentation]    Verify that login failed and display error message.
    Wait Until Element Is Visible    ${ERROR_MESSAGE}

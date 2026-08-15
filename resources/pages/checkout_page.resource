*** Settings ***
Documentation    Keywords For Checkout SauceDemo Pages
Library    SeleniumLibrary

*** Variables ***
${CHECKOUT_BUTTON}          id:checkout
${FIRST_NAME_FIELD}         id:first-name
${LAST_NAME_FIELD}          id:last-name
${POSTAL_CODE_FIELD}        id:postal-code
${CONTINUE_BUTTON}          id:continue
${FINISH_BUTTON}            id:finish
${ORDER_COMPLETE_MESSAGE}   css:[data-test="complete-header"]

*** Keywords ***
Start Checkout
    [Documentation]    Start Checkout From Shopping Cart.
    Click Button    ${CHECKOUT_BUTTON}
    Wait Until Location Contains    checkout-step-one.html

Input Customer Information
    [Documentation]    Input Customer Details And Continues To Order Overview.
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text    ${FIRST_NAME_FIELD}    ${first_name}
    Input Text    ${LAST_NAME_FIELD}    ${last_name}
    Input Text    ${POSTAL_CODE_FIELD}    ${postal_code}
    Click Button    ${CONTINUE_BUTTON}
    Wait Until Location Contains    checkout-step-two.html

Finish Checkout
    [Documentation]    Finish Checkout From Order Overview Page.
    Click Button    ${FINISH_BUTTON}
    Wait Until Location Contains    checkout-complete.html

Order Should Be Complete
    [Documentation]    Verify That The Order Was Complete Succesfully.
    Wait Until Element Is Visible    ${ORDER_COMPLETE_MESSAGE}
    Element Text Should Be    ${ORDER_COMPLETE_MESSAGE}    Thank you for your order!    

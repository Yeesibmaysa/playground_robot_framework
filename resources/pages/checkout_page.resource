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
    Wait Until Element Is Visible    ${CHECKOUT_BUTTON}
    Scroll Element Into View         ${CHECKOUT_BUTTON}
    Wait Until Element Is Enabled    ${CHECKOUT_BUTTON}
    Execute Javascript    document.querySelector('[data-test="checkout"]').click()
    Wait Until Location Contains     checkout-step-one.html

Input Customer Information
    [Documentation]    Input Customer Details And Continues To Order Overview.
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}

    Wait Until Element Is Visible    ${FIRST_NAME_FIELD}
    Execute Javascript    const e=document.querySelector('[data-test="firstName"]'); const s=Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,'value').set; s.call(e,'${first_name}'); e.dispatchEvent(new Event('input',{bubbles:true}));
    Execute Javascript    const e=document.querySelector('[data-test="lastName"]'); const s=Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,'value').set; s.call(e,'${last_name}'); e.dispatchEvent(new Event('input',{bubbles:true}));
    Execute Javascript    const e=document.querySelector('[data-test="postalCode"]'); const s=Object.getOwnPropertyDescriptor(HTMLInputElement.prototype,'value').set; s.call(e,'${postal_code}'); e.dispatchEvent(new Event('input',{bubbles:true}));

    Textfield Value Should Be    ${FIRST_NAME_FIELD}    ${first_name}
    Textfield Value Should Be    ${LAST_NAME_FIELD}     ${last_name}
    Textfield Value Should Be    ${POSTAL_CODE_FIELD}   ${postal_code}

    Wait Until Element Is Enabled    ${CONTINUE_BUTTON}
    Execute Javascript    document.querySelector('[data-test="continue"]').click()
    Wait Until Location Contains    checkout-step-two.html

Finish Checkout
    [Documentation]    Finish Checkout From Order Overview Page.
    Wait Until Element Is Visible    ${FINISH_BUTTON}
    Scroll Element Into View         ${FINISH_BUTTON}
    Wait Until Element Is Enabled    ${FINISH_BUTTON}
    Execute Javascript    document.querySelector('[data-test="finish"]').click()
    Wait Until Location Contains     checkout-complete.html

Order Should Be Complete
    [Documentation]    Verify That The Order Was Complete Succesfully.
    Wait Until Element Is Visible    ${ORDER_COMPLETE_MESSAGE}
    Element Text Should Be    ${ORDER_COMPLETE_MESSAGE}    Thank you for your order!    

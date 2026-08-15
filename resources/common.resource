*** Settings ***
Documentation       Reusable Keywords Shared Across Test Suites.


*** Keywords ***
Log Project Information
    [Documentation]    Logs The Active Project And Environment.
    [Arguments]    ${project_name}    ${environment}
    Log    Running ${project_name} in ${environment}

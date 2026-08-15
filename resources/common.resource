*** Settings ***
Documentation       Reusable keywords shared across test suites.


*** Keywords ***
Log Project Information
    [Documentation]    Logs The Active Project And Environment.
    [Arguments]    ${project_name}    ${environment}
    Log    Running ${project_name} in ${environment}

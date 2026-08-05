*** Settings ***
Documentation       Reusable keywords shared across test suites.


*** Keywords ***
Log Project Information
    [Documentation]    Logs the active project and environment.
    [Arguments]    ${project_name}    ${environment}
    Log    Running ${project_name} in ${environment}

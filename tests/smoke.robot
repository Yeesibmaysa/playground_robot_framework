*** Settings ***
Documentation       Basic Smoke Tests For The Starter Project.
Resource            ../resources/common.resource
Variables           ../variables/environments.py

Test Tags           smoke


*** Test Cases ***
Starter Project Is Ready
    [Documentation]    Verifies That Shared Resources And Variables Are Loaded.
    Log Project Information    ${PROJECT_NAME}    ${ENVIRONMENT}
    Should Be Equal    ${PROJECT_NAME}    playground_robot_framework


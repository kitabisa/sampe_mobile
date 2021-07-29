*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
Resource    ../utils/config.robot

*** Keywords ***
Remove Kitabisa Application
    ${applicationId}=   remove string   ${appId}    bs://
    ${auth}=    Create List     ${usernameCloud}      ${apiKeyCloud}
    Create Session  baseurl     https://api-cloud.browserstack.com     auth=${auth}     verify=true
    ${resp}=    Delete Request     baseurl     /app-automate/app/delete/${applicationId}

    Should Be Equal As Strings    ${resp.status_code}    200

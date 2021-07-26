*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
Resource    ../utils/config.robot

*** Keywords ***
Remove Kitabisa Application

    ${auth}=    Create List     ${usernameKobiton}      ${apiKeyKobiton}
    Create Session  baseurl     ${hostKobiton}     auth=${auth}     verify=true
    ${resp}=    Get Request     baseurl     /v1/apps

    Should Be Equal As Strings    ${resp.status_code}    200

    ${deviceName}=      get value from json     ${resp.json()}     $..os
    ${json_object}    evaluate        json.loads('''${resp.content}''')    json

    ${key_count}    Get Length    ${json_object["apps"]}

    FOR     ${index}     IN RANGE     ${key_count}
        ${appsId}=      Set Variable    ${json_object["apps"][${index}]["id"]}
        ${appsName}=    Set Variable    ${json_object["apps"][${index}]["name"]}
        run keyword if      '${appsName}'=='Kitabisa-staging'   run keywords    Process Remove      ${appsId}
        ...     AND     log to console      Success remove kitabisa apps
        ...     ELSE    log to console      No application to remove
    END

Process Remove
    [Arguments]     ${apps}

     ${resp}=    Delete Request     baseurl     /v1/apps/${apps}

     Should Be Equal As Strings    ${resp.status_code}    200

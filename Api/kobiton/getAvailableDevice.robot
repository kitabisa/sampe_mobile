*** Settings ***
Library     RequestsLibrary
Library     JSONLibrary
Library     String
Library     BuiltIn
Resource    ../utils/config.robot

*** Keywords ***
Get Available Device
    [Arguments]  ${platformName}        ${platformVersion}

    ${auth}=    Create List     ${usernameKobiton}      ${apiKeyKobiton}
    Create Session  baseurl     ${hostKobiton}     auth=${auth}     verify=true
    ${resp}=    Get Request     baseurl     /v1/devices?isOnline=true&isBooked=false&platformName=${platformName}&platformVersion=${platformVersion}
    
    Should Be Equal As Strings    ${resp.status_code}    200

    ${PABOTQUEUEINDEX}=     run keyword if      '${PABOTQUEUEINDEX}'=='${EMPTY}'    set variable    0
    ...     ELSE        set variable    ${PABOTQUEUEINDEX}

    ${deviceName}=      get value from json     ${resp.json()}     $.cloudDevices[${PABOTQUEUEINDEX}].deviceName
    log to console      ${PABOTQUEUEINDEX}
    log to console      Automation test will be running on ${deviceName[0]} with OS ${platformVersion}

    [Return]    ${deviceName[0]}

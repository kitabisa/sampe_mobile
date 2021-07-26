*** Settings ***
Library     AppiumLibrary
Library     DateTime

Resource    ../Var/var.robot
Resource    ../Api/kobiton/getAvailableDevice.robot
Resource    ../Api/kobiton/removeApps.robot
Resource    ../Api/utils/config.robot

*** Keywords ***
Start Application
    ${date}=        Get Current Date    UTC     + 7 hours   result_format=%d-%b-%Y %H:%M
    ${device}=      Get Available Device    android     ${platformVersion}
    Open Application    https://${usernamecloud}:${apiKeyCloud}@${domainCloud}/wd/hub
    ...     app=bs://de6cbb260624fdde248c6da28f1421a22486679f
    ...     platformName=Android            platformVersion=9.0     device=Samsung Galaxy S10
    ...     newCommandTimeout=60000         noReset=true            autoGrantPermissions=true
    ...     unicodeKeyboard=true            resetKeyboard=true      automationName=uiautomator2
    ...     browserstack.idleTimeout=60     name=Regression, ${date} [${SUITE NAME}]

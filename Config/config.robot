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
    Open Application    https://${usernamecloud}:${apiKeyCloud}@${domainCloud}/wd/hub
    ...     app=bs://744b00279ef2d1bdcdd2d021406c4bb0b19cbb34"
    ...     platformName=Android            platformVersion=9.0     device=Samsung Galaxy S10
    ...     newCommandTimeout=60000         noReset=true            autoGrantPermissions=true
    ...     unicodeKeyboard=true            resetKeyboard=true      automationName=uiautomator2
    ...     browserstack.idleTimeout=60     name=Regression, ${date} [${SUITE NAME}]

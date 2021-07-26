*** Settings ***
Library     AppiumLibrary
Library     DateTime

Resource    ../Var/var.robot
Resource    ../Api/kobiton/getAvailableDevice.robot
Resource    ../Api/kobiton/removeApps.robot
Resource    ../Api/utils/config.robot

*** Keywords ***
Start Application on Local
    Open Application    ${appiumLocal}
    ...     platformName=android    platformVersion=${platformVersion}
    ...     app=${app}      appPackage=com.kitabisa.android.staging      appActivity=com.kitabisa.android.ui.splash.SplashActivity
    ...     newCommandTimeout=60000      noReset=true      autoGrantPermissions=true
    ...     unicodeKeyboard=true        resetKeyboard=true      automationName=uiautomator2

Start Application on Cloud
    ${date}=        Get Current Date    UTC     + 7 hours   result_format=%d-%b-%Y %H:%M
    ${device}=      Get Available Device    android     ${platformVersion}
    Open Application    https://${usernameKobiton}:${apiKeyKobiton}@api.kobiton.com/wd/hub
    ...     platformName=android    platformVersion=${platformVersion}      deviceName=${device}
    ...     app=kobiton-store:${appId}      appPackage=com.kitabisa.android.staging      appActivity=com.kitabisa.android.ui.splash.SplashActivity
    ...     newCommandTimeout=60000      noReset=true        autoGrantPermissions=true
    ...     unicodeKeyboard=true        resetKeyboard=true      automationName=uiautomator2
    ...     sessionName=Regression, ${date} [${SUITE NAME}]

Start Application
    run keyword if      '${isCloud}'=='true'        Run Keyword     Start Application on Cloud
    ...     ELSE        Run Keyword                 Start Application on Local

Remove Application on Cloud
    run keyword if      '${isCloud}'=='true'        Run Keyword     Remove Kitabisa Application

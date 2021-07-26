*** Settings ***
Library     AppiumLibrary       timeout=60
Library     RedisLibrary
Resource    ../../Config/config.robot
Resource    ../../Test/TestLogin.robot
Resource    ../../Test/TestForgotPassword.robot
Resource    ../../Test/TestRegister.robot
Resource    ../../Var/var.robot
Resource    ../../Utils/testrails.robot

Suite Setup         Start Application
Test Setup          Launch Application
Suite Teardown      After Suite

*** Keywords ***
After Suite
    Remove Application      com.kitabisa.android.staging
    Close Application

*** Test Case ***
C3676 User Register with Existing Email
    [Tags]      register        regression      negative
    [Documentation]     ${3676}
    Register with Existing Email                                ${activationEmail}       ${nameToRegis}

C3677 User Register with Empty Phone Number or Email and Name
    [Tags]      register        regression      negative
    [Documentation]     ${3677}
    Register with Empty Phone Number or Email and Name

C9648 Register with Empty Name
    [Tags]      register        regression      negative
    [Documentation]     ${9648}
    Register with Empty Name            teta.kibites@gmail.com

C3678 User Register with Invalid Email Format
    [Tags]      register        regression      negative
    [Documentation]     ${3678}
    Register with Invalid Email or Phone Format                 teta.kibites.com@gmail

C9655 User Register with Invalid Fullname
    [Tags]      register        regression      negative
    [Documentation]     ${9655}
    Register with Invalid Fullname Format       teta.kibitesnew@gmail.com

C9652 User Register Resend OTP
    [Tags]      register        regression        positive
    [Documentation]     ${9652}
    Register with Resend OTP                      ${unregisEmail}         ${nameToRegis}

C9651 User Register with Invalid Email OTP Key
    [Tags]      register        regression      negative
    [Documentation]     ${9651}
    Register with Invalid Email OTP Key                         ${unregisEmail}         ${nameToRegis}

C9656 User Register with 3 Times Invalid Email OTP Key
    [Tags]      register        regression      negative
    [Documentation]     ${9656}
    Register with 3 Times Invalid OTP Key                         ${unregisEmail}         ${nameToRegis}

C3680 User Register using Email with Password Less Than Minimum Char
    [Tags]      register        regression      negative
    [Documentation]     ${3680}
    Register using Email with Password Less Than Minimum Char   ${emailToRegis}         ${nameToRegis}

C3681 User Register using Email with Invalid Confirm Password
    [Tags]      register        regression      negative
    [Documentation]     ${3681}
    Register using Email with Invalid Confirm Password          ${emailToRegis}         ${nameToRegis}

C3682 User Register with Email
    [Tags]      register        regression      positive
    [Documentation]     ${3682}
    Register with Email                                         ${emailToRegis}         ${nameToRegis}
    Logout Process

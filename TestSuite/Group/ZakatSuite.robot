*** Settings ***
Library     AppiumLibrary       timeout=60
Library     RedisLibrary
Resource    ../../Config/config.robot
Resource    ../../Test/TestLogin.robot
Resource    ../../Test/TestDonation.robot
Resource    ../../Test/TestDompetKebaikan.robot
Resource    ../../Test/TestZakat.robot
Resource    ../../Test/TestSalingJaga.robot
Resource    ../../Var/var.robot
Resource    ../../Utils/testrails.robot
Resource    ../../Test/TestHome.robot

Suite Setup         Start Application
Test Setup          Launch Application
Suite Teardown      After Suite

*** Keywords ***
After Suite
    Remove Application      com.kitabisa.android.staging
    Close Application

*** Test Case ***
User Login with Email and Password
    [Tags]      login       regression      positive
    Login with Email and Password               ${zakatEmail}     ${zakatPassword}

#C3729 User Distribute Zakat with Amount Less Than Minimum Required using Bank Transfer
#    [Tags]      zakat       regression      negative
#    [Documentation]     ${3729}
#    Distribute Zakat with Amount Less Than Minimum Required     Rumah Zakat       bca
#
#C3730 User Distribute Zakat to Organization using BCA Bank Transfer
#    [Tags]      zakat       regression      positive
#    [Documentation]     ${3730}
#    Distribute Zakat to Organization                Rumah Zakat       bca    15000
#
#C3724 User Distribute Zakat with Amount Less Than Minimum Required using Virtual Account
#    [Tags]      zakat       regression      negative
#    [Documentation]     ${3724}
#    Distribute Zakat with Amount Less Than Minimum Required     Rumah Zakat       vabca
#
#C3725 User Distribute Zakat to Organization using BCA Virtual Account
#    [Tags]      zakat       regression      positive
#    [Documentation]     ${3725}
#    Distribute Zakat to Organization                Rumah Zakat       vabca    13000
#
#C3722 User Calculate Zakat Profesi
#    [Tags]      zakat       regression      positive
#    [Documentation]     ${3722}
#    Calculate Zakat Profesi                         Rumah Zakat         mandiri
#
#C3723 User Calculate Zakat Maal
#    [Tags]      zakat       regression      positive
#    [Documentation]     ${3723}
#    Calculate Zakat Maal                            Rumah Zakat         bri
#
#C3737 User Calculate Zakat Profesi with Nisab Less Than Minimum Required
#    [Tags]      zakat       regression      negative
#    [Documentation]     ${3737}
#    Calculate Zakat Profesi with Nisab Less Than Minimum Required
#
#C3738 User Calculate Zakat Profesi with Nisab Meet Minimum Required
#    [Tags]      zakat       regression      negative
#    [Documentation]     ${3738}
#    Calculate Zakat Profesi with Nisab Meet Minimum Required
#
#C3739 User Calculate Zakat Maal with Nisab Less Than Minimum Required
#    [Tags]      zakat       regression      negative
#    [Documentation]     ${3739}
#    Calculate Zakat Maal with Nisab Less Than Minimum Required
#
#C3740 User Calculate Zakat Maal with Nisab Meet Minimum Required
#    [Tags]      zakat       regression      negative
#    [Documentation]     ${3740}
#    Calculate Zakat Maal with Nisab Meet Minimum Required

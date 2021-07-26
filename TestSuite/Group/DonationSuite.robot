*** Settings ***
Library     AppiumLibrary       timeout=60
Library     RedisLibrary
Resource    ../../Config/config.robot
Resource    ../../Test/TestLogin.robot
Resource    ../../Test/TestDonation.robot
Resource    ../../Test/TestDompetKebaikan.robot
Resource    ../../Test/TestZakat.robot
Resource    ../../Test/TestSalingJaga.robot
Resource    ../../Test/TestFavorite.robot
Resource    ../../Var/var.robot
Resource    ../../Utils/testrails.robot
Resource    ../../Test/TestDonasiRutin.robot
Resource    ../../Test/TestRegister.robot
Resource    ../../Test/TestCampaignDetail.robot
Resource    ../../Test/TestDoa.robot

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
    Login with Email and Password               ${donationEmail}        ${donationPassword}

#C3711 User Create Bank Donation Using Bank Transfer with Amount Less Than Minimum Required
#    [Tags]      donation        regression      negative
#    [Documentation]     ${3711}
#    Choose Campaign
#    Create Bank Donation with Amount Less Than Minimum Required      5000    bca
#
#C3713 User Create Bank Donation using BCA
#    [Tags]      donation        regression      positive
#    [Documentation]     ${3713}
#    Choose Campaign
#    Create Bank Donation        14000       bca
#
#C3708 User Create VA Donation using VA BCA
#    [Tags]      donation        regression      positive
#    [Documentation]     ${3708}
#    Choose Campaign
#    Create VA Donation          12000       vabca
#
#C12679 User Validate Individual Medical Campaign Case 1
#    [Documentation]     ${12679}
#    Verify Individual Medical Campaign Case One
#
#C9005 Verify Parent Campaign Detail Section
#    [Tags]      campaign detail        regression
#    [Documentation]         ${9005}
#    Go to Campaign Detail
#    Verify All Section on Campaign Detail
#
#C9023 Laporkan Penggalangan
#    [Tags]      campaign detail         regression
#    [Documentation]         ${9023}
#    Go to Campaign Detail
#    Go to Report Penggalangan Page
#    SLeep   3s
#    Fill Detail Report Penggalangan     QA Tester       0859106963592       teta.kibites@gmail.com      test report galang dana with reason penyalahgunaan dana
#
#User Logout
#    Logout Process

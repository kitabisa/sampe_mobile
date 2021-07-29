*** Settings ***
Library     AppiumLibrary       timeout=60
Library     RedisLibrary
Library     DatabaseLibrary
Resource    ../../Config/config.robot
Resource    ../../Test/TestLogin.robot
Resource    ../../Test/TestChangeProfile.robot
Resource    ../../Test/TestCampaignDetail.robot
Resource    ../../Test/TestFavorite.robot
Resource    ../../Test/TestInbox.robot
Resource    ../../Test/TestDonasiSaya.robot
Resource    ../../Test/TestSetting.robot
Resource    ../../Test/TestSearch.robot
Resource    ../../Test/TestBanner.robot
Resource    ../../Test/TestGalangDanaMendesak.robot
Resource    ../../Test/TestKategoriFavorit.robot
Resource    ../../Test/TestDonation.robot
Resource    ../../Test/TestSalingJaga.robot
Resource    ../../Test/TestDompetKebaikan.robot
Resource    ../../Var/var.robot
Resource    ../../Test/TestHome.robot
Resource    ../../Test/TestKategoriFavorit.robot
Resource    ../../Test/TestPilihanKitabisa.robot
Resource    ../../Utils/testrails.robot
Resource    ../../Test/TestDoa.robot
Resource    ../../Test/TestChangePassword.robot
Resource    ../../Test/TestSubMenuAkun.robot

Suite Setup         Start Application
Test Setup          Launch Application
Suite Teardown      After Suite

*** Keywords ***
After Suite
    Remove Application      com.kitabisa.android.staging
    Close Application
    Remove Application on Cloud

*** Test Case ***
User Login with Empty Inbox Email
    [Tags]      login       regression      positive
    Login with Email and Password               ${noInboxEmail}     ${noInboxPassword}

C8747 User View Inbox Menu for Tab Pesan
    [Tags]      inbox       regression      positive
    [Documentation]     ${8747}
    Cek Empty Pesan Page
#
#C8749 User View Inbox Menu for Tab Berita
#    [Tags]      inbox       regression      positive
#    [Documentation]     ${8749}
#    Cek Empty Berita Page
#    Logout Process
#
#User Login with Email
#    [Tags]      login       regression     positive
#    Login with Email and Password                   ${otherEmail}     ${otherPassword}
#
#C11232 Verify All Tiles Menu
#    [Tags]      tiles       regression      positive
#    [Documentation]     ${11232}
#    Validate All Tiles Menu
#
#C8865 Give Recomendation Rate
#    [Tags]    donasi paling cocok        regression    positive
#    [Documentation]     ${8865}
#    Give Recomendation            donasi mania, mantaaaap!
#
#C3749 User See Donation History
#    [Tags]      donasisaya      regression      positive
#    [Documentation]     ${3749}
#    See Donation History
#
#C11231 Verify Wallet on Homepage
#    [Tags]    Homepage    regression    positive
#    [Documentation]     ${11231}
#    Validate Wallet Section on Homepage
#    Validate Topup Wallet on Homepage
#
#C3758 User Successfully Change Account Profile
#    [Tags]      account     regression      positive
#    [Documentation]     ${3758}
#    Change Account Profile                      QA Testing      I'm a tester who tested all the feature
#
#C3764 User View Campaign on Love List
#    [Tags]      lovelist       regression      positive
#    [Documentation]     ${3764}
#    Navigate to Favorite
#
#C11239 User Search Any Campaign
#    [Tags]      search      regression      positive
#    [Documentation]     ${11239}
#    Search Any Campaign         masjid

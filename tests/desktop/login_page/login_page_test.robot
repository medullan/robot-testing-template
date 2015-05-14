*** Settings ***
Documentation   Tests for the Login Page
Resource        ../../../resources/home_page/home_page_resources.robot
Suite Setup     Environment Setup
Suite Teardown  Teardown Browser

*** Test Cases ***
################################################################################
########	LOGIN PAGE TESTS					########
################################################################################
I can see the Login Page
  [Tags]  login_page  sprint_xxx functionality
  Given I am on the home page
  Then I should see the "login" page is responsive

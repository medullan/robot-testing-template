*** Settings ***
Documentation  A resource file with reusable keywords and variables.
...            This file contains variables and keywords which are used to setup
...            and configure tests
Library        Selenium2Library
Library        Collections
Library        OperatingSystem

*** Variables ***

#Environment settings:  Dev = dev | Test = test | Stage = stage
${ENVIRONMENT}          dev

#Wait settings
${WAIT_TIMEOUT}         60s
${WAIT_RETRY_INTERVAL}  1s

#Routes
${HOST}=                https://www.google.tt


*** Keywords ***

####  Setup global variables                                                ####
Environment setup
  Run Keyword If  '${SELENIUM_BROWSER}'==''  Set global variable  ${BROWSER}  firefox
  Run Keyword If  '${ENVIRONMENT}'=='dev'  develop
  Run Keyword If  '${ENVIRONMENT}'=='test'   test
  Run Keyword If  '${ENVIRONMENT}'=='stage'  stage
  Run Keyword If  '${ENVIRONMENT}'=='local'  local
  Run Keyword If  '${ENVIRONMENT}'=='prod'   prod
  Create Directory  ${OUTPUT DIR}/screenshots/${SUITE_NAME}/
  Open test browser
  Run Keyword If  '${APPLITOOLS_KEY}'!=''  Open Eyes Session
  ...  url=${HOST}
  ...  appname=${APPLITOOLS_APP_NAME}
  ...  testname=${SUITE_NAME}
  ...  apikey=${APPLITOOLS_KEY}
  ...  matchlevel=${APPLITOOLS_MATCHLEVEL}
  ...  includeEyesLog=${APPLITOOLS_EYESLOG}
  ...  httpDebugLog=${APPLITOOLS_DEBUGLOG}


develop
  #Develop Configuration
  Set global variable  ${HOST}  https://www.google.tt

test
  #Test Configuration
  Set global variable  ${HOST}  https://www.google.tt

stage
  #Stage Configuration
  Set global variable  ${HOST}  https://www.google.tt

local
  #Local Configuration
  Set global variable  ${HOST}  https://www.google.tt

prod
  #Production Configuration
  Set global variable  ${HOST}  https://www.google.tt

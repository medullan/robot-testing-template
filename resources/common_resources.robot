*** Settings ***
Documentation  Resources that are common for the app being tested
...
...            The system specific keywords created here form our own
...            domain specific language. They utilize keywords provided
...            by the imported Selenium2Library.
Library        Selenium2Library
Library        Collections
Library        OperatingSystem
Library        DateTime
Library        RobotAppEyes
Library        SauceLabs
Variables      variables.py
Variables      app_variables.py
Resource       environment_setup.robot

*** Variables ***
${TEST NAME}
${TEST STATUS}
${TEST TAGS}
${SELENIUM_DEVICE}


*** Keywords ***
#   BEGIN GENERIC KEYWORDS
Open Test browser
  [Documentation]  Open Browser ${BROWSER} to ${HOST} for testing ${SUITE_NAME}
  Run Keyword If  '${SAUCE_URL}' != ''  Open Browser  ${HOST}
  ...  remote_url=${SAUCE_URL}
  ...  desired_capabilities=${SAUCE_CAPABILITIES}
  Run Keyword If  '${SAUCE_URL}' == ''
  ...  Open Browser  ${HOST}  browser=${BROWSER}
  Run Keyword If  '${SELENIUM_DEVICE}' == ''
  ...  Maximize Browser Window
  Set Selenium Speed  ${SELENIUM_DELAY}

Teardown Take Failure Snapshot
  Create Directory  ${OUTPUT DIR}/screenshots/failed_tests/
  Run Keyword If Test Failed  Capture Screenshot  screenshots/failed_tests/${TEST NAME}.png
  Run Keyword If  '${SAUCE_URL}' != ''
  ...  Run Keyword And Continue On Failure  Report Sauce status
  ...  ${TEST NAME}  ${TEST STATUS}  ${TEST TAGS}  ${SAUCE_URL}
  Run Keyword If  '${APPLITOOLS_KEY}' != ''
  ...  Run Keyword And Continue On Failure   Close Eyes Session
  Close all browsers

Teardown Browser
  Run Keyword If  '${SAUCE_URL}' != ''
  ...  Run Keyword And Continue On Failure  Report Sauce status
  ...  ${TEST NAME}  ${TEST STATUS}  ${TEST TAGS}  ${SAUCE_URL}
  Run Keyword If  '${APPLITOOLS_KEY}' != ''
  ...  Run Keyword And Continue On Failure   Close Eyes Session
  Close all browsers

Take Screenshot of "${screenshot_name}" page
#  ${current_date}=  Get Current Date  result_format=datetime
#  ${date_string}=  Set Variable
#  ...  ${current_date.year}_${current_date.month}_${current_date.day}__${current_date.hour}
#  Create Directory  ${OUTPUT DIR}/screenshots/${SUITE_NAME}/
  Capture Page Screenshot  screenshots/${SUITE_NAME}/${screenshot_name}
  Run keyword if  '${APPLITOOLS_KEY}' != ''
  ...  Run Keyword And Continue On Failure
  ...  Check Eyes Window  ${screenshot_name}  False

#UI Testing
I should see the "${page_name}" page is responsive
  Run Keyword If  '${SELENIUM_DEVICE}' == ''  Run Keywords
  ...  Set Window Size  ${MAX_MOBILE_HEIGHT}  ${MAX_MOBILE_WIDTH}
  ...  AND  Take Screenshot of "max_mobile_${page_name}.png" page
  ...  AND  Set Window Size  ${MIN_TABLET_HEIGHT}  ${MIN_TABLET_WIDTH}
  ...  AND  Take Screenshot of "min_tablet_${page_name}.png" page
  ...  AND  Set Window Size  ${MAX_TABLET_HEIGHT}  ${MAX_TABLET_WIDTH}
  ...  AND  Take Screenshot of "max_tablet_${page_name}.png" page
  ...  AND  Set Window Size  ${MIN_DESKTOP_HEIGHT}  ${MIN_DESKTOP_WIDTH}
  ...  AND  Take Screenshot of "min_desktop_${page_name}.png" page
  ...  AND  Set Window Size  ${MAX_DESKTOP_HEIGHT}  ${MAX_DESKTOP_WIDTH}
  ...  AND  Take Screenshot of "max_desktop_${page_name}.png" page
  Run Keyword If  '${SELENIUM_DEVICE}' != ''
  ...  Take Screenshot of "mobile_only_${page_name}.png" page

I should see the "${page_name}" page
  Take Screenshot of "${page_name}.png" page

#Other Keywords

I wait for the page to load
  Check Page Status

Check Page Status
  ${temp_var}=  Run Keyword And Return Status  Element Should Be Visible  jquery=[id="ERROR"]
  Run Keyword If  ${temp_var}  FAIL  "Internal Server Error"  internal_server_error
  Wait Until Keyword Succeeds  ${WAIT_TIMEOUT}  ${WAIT_RETRY_INTERVAL}
  ...  Page Should Contain Element  jquery=div
  Wait Until Keyword Succeeds  ${WAIT_TIMEOUT}  ${WAIT_RETRY_INTERVAL}
  ...  Element Should Not Be Visible  jquery=[loading-screen]:visible

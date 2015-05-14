*** Settings ***
Documentation  Resources for the LANDING page
Resource       ../home_page/home_page_resources.robot


***Variables***



*** Keywords ***
I am an authenticated user
  Wait Until Keyword Succeeds  ${WAIT_TIMEOUT}  ${WAIT_RETRY_INTERVAL}
  ...  Page Should Contain Element  jquery=[id="Username"]

I am not an authenticated user
  Wait Until Keyword Succeeds  ${WAIT_TIMEOUT}  ${WAIT_RETRY_INTERVAL}
  ...  Page Should Not Contain Element  jquery=[id="Username"]

I log out
  Click Element	jquery=[id="logout"]
  I wait for the page to load

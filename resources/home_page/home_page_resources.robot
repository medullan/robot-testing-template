*** Settings ***
Documentation  Resources for the LOGIN page
Resource       ../common_resources.robot


*** Keywords ***

I should see the Username textbox
  Element Should Be Visible  jquery=[id="LoginUsername"]

I should see the Password textbox
  Element Should Be Visible  jquery=[id="LoginPassword"]

I am on the home page
  Title Should Be  Google

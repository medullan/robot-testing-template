# FEP DA - Functional Tests
######## Created from Robot Framework Template for Automated Functional Testing

##  Installing the testing Framework

### Installing on Windows

1. Install Python https://www.python.org/downloads/
2. Using pip (installed with Python 2.7.9 and higher) setup Robot-AppEyes https://github.com/NaviNet/Robot-AppEyes
 * Install Robot App Eyes and dependencies <code>pip install Robot-AppEyes</code>
 * Upgrade Robot App Eyes and dependencies <code>pip install --upgrade Robot-AppEyes</code>


### Installing on Mac OSx

1. Python is installed on Mac OSx natively to use a specific version go https://www.python.org/downloads/
2. Using pip (installed with Python 2.7.9 and higher) setup Robot-AppEyes https://github.com/NaviNet/Robot-AppEyes
 * Install Robot App Eyes and dependencies <code>pip install Robot-AppEyes</code>
 * Upgrade Robot App Eyes and dependencies <code>pip install --upgrade Robot-AppEyes</code>


##  Running the tests

<code>pybot --outputdir robot_test_results --variable ENVIRONMENT:dev --variable APPLITOOLS_KEY:'' --variable APPLITOOLS_APP_NAME:'FEP_DA' --variable SAUCE_URL:http://"$SAUCE_USER_NAME":"$SAUCE_API_KEY"@ondemand.saucelabs.com:80/wd/hub --variable SAUCE_CAPABILITIES:platform:"$SELENIUM_PLATFORM",browserName:"$SELENIUM_BROWSER",version:"$SELENIUM_VERSION",deviceName:"$SELENIUM_DEVICE",device-orientation:"$SELENIUM_DEVICE_ORIENTATION" --exclude ignore --RemoveKeywords WUKS --argumentfile full_suite.txt</code>

### Variables

* ENVIRONMENT = Environment that is under test. This variable can be used to pre-configure environment variables in the environment_setup.resources file
* BROWSER = Browser that is under test, used by the Open Browser keyword
* SELENIUM_BROWSER = Browser that is chosen from the Sauce Labs list of available browser/device combos
* APPLITOOLS_KEY = Applitools key associated to the Applitools Account
* APPLITOOLS_APP_NAME = Name of the application
* SAUCE_URL = The Sauce Labs URL where the Robot Tests are run
* SAUCE_USER_NAME = Sauce Labs username, this variable is set by the Jenkins Sauce Plugin
* SAUCE_API_KEY = Sauce Labs key, this variable is set by the Jenkins Sauce Plugin
* SAUCE_CAPABILITIES = Remote capabilities as defined by Selenium
* SELENIUM_PLATFORM = Operating System
* SELENIUM_VERSION = Version
* SELENIUM_DEVICE = Mobile Device, this is blank if the device is desktop
* SELENIUM_DEVICE_ORIENTATION = Orientation of the mobile device, blank if device is desktop

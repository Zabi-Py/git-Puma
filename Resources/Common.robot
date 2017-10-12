*** Settings ***
Library  Selenium2Library

*** Keywords ***
Begin Test
    run keyword if  '${BROWSER}'=='chrome'  CHROME  ELSE  OtherBrowsers

CHROME
    [Arguments]  ${alias}=${EMPTY}
    ${options}=   Evaluate   sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
    Call Method    ${options}    add_argument   disable-infobars  # to suppress "Chrome is being controlled by automated test software" info line
    Create WebDriver  Chrome  alias=${alias}  chrome_options=${options}
    maximize browser window
    sleep  3s

OtherBrowsers
    open browser  about:blank  ${BROWSER}
    sleep  3s

End Test
    close browser
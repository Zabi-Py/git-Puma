*** Settings ***
Library  Selenium2Library
Library  String

*** Keywords ***
Begin Test
    ${Browser1} =  convert to lowercase  ${BROWSER}
    set global variable  ${Browser1}
    run keyword if  '${Browser1}'=='edge'  EDGE  ELSE IF  '${Browser1}'=='chrome'  CHROME  ELSE  FIREFOX

CHROME
    [Arguments]  ${alias}=${EMPTY}
    ${options} =   Evaluate   sys.modules['selenium.webdriver'].ChromeOptions()   sys, selenium.webdriver
    Call Method    ${options}    add_argument   disable-infobars
    Create WebDriver  Chrome  alias=${alias}  chrome_options=${options}
    maximize browser window
    set selenium speed  1s
    set selenium implicit wait  3s

FIREFOX
    open browser  about:blank  ${Browser1}
    maximize browser window
    set selenium speed  1s
    set selenium implicit wait  3s

EDGE
    open browser  about:blank  ${Browser1}
    set selenium speed  1s
    set selenium implicit wait  3s

End Test
    close browser
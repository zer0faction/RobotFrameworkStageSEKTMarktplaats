*** Settings ***
Library    SeleniumLibrary      run_on_failure=Nothing

*** Keywords ***
Open Browser On Local Machine
    [Arguments]                         ${URL}                                                       ${BROWSER}                                                   
    Set Selenium Speed                  ${SELENIUM_DELAY}
    Open Browser                        ${URL}                                                       ${BROWSER} 

Get Parent Webelement
    [Arguments]    ${locator}

    ${element}    Get WebElement    ${locator}
    ${parent}     Call Method
    ...                ${element}
    ...                find_element
    ...                  by=xpath    value=parent::*

    [Return]    ${parent}

Get Child Webelements
    [Arguments]    ${locator}

    ${element}    Get WebElement    ${locator}    
    ${children}     Call Method       
    ...                ${element}    
    ...                find_elements   
    ...                  by=xpath    value=child::*    

    [Return]      ${children}

Open Browser In Jenkins
    [Arguments]                         ${URL}
    Set Selenium Speed                  ${SELENIUM_DELAY}
    Import Library                      XvfbRobot
    Start Virtual Display               1920                                                         1080
    Open Browser                        ${URL}                                                       browser=firefox
    Set Window Size                     1920                                                         1080


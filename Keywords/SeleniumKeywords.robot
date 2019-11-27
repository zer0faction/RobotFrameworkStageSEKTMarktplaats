*** Settings ***
Library    SeleniumLibrary


*** Keywords ***
Open Browser On Local Machine
    [Arguments]                         ${URL}                                                       ${BROWSER}                                                   
    Set Selenium Speed                  ${SELENIUM_DELAY}
    Open Browser                        ${URL}                                                       ${BROWSER} 

Open Browser In Jenkins
    [Arguments]                         ${URL}
    Set Selenium Speed                  ${SELENIUM_DELAY}
    Import Library                      XvfbRobot
    Start Virtual Display               1920                                                         1080
    Open Browser                        ${URL}                                                       browser=firefox
    Set Window Size                     1920                                                         1080

Select Cursus From Cursuslist
    [Arguments]                         ${TRAINING_NAME}
    Wait Until Page Contains Element    id=create                                                    timeout=1          error=Kan geen training selecteren, lijst is niet beschikbaar
    Click Element                       //*[contains(text(),'${TRAINING_NAME}')]

Click Cursus Details Button
    Wait Until Page Contains Element    //*[@class="expanded"]//*[@id="goToTrainingDetails"]         timeout=1
    Click Element                       //*[@class="expanded"]//*[@id="goToTrainingDetails"]

Click Cursus Wijzigen Button
    Wait Until Page Contains Element    //*[@class="expanded"]//*[@id="editTraining"]                timeout=1
    Click Element                       //*[@class="expanded"]//*[@id="editTraining"]

Click Cursus Verwijderen Button
    Wait Until Page Contains Element    //*[@class="expanded"]//*[contains(text(),'Verwijderen')]    timeout=1
    Click Element                       //*[@class="expanded"]//*[contains(text(),'Verwijderen')]
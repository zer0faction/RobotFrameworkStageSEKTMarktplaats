*** Settings ***
Resource             ../Keywords/SeleniumKeywords.robot
Suite Teardown       Close All Browsers
Documentation        Keyword documentation: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
...
...                  Kijk goed of er keywords zijn die je kan gebruiken in de Keywords/SeleniumKeywords.robot file

*** Variable ***
${SELENIUM_DELAY}    0
${TEST_URL}          https://avansmarktplaats-test.mendixcloud.com/index.html

${BROWSER}          Chrome
${STUDENT_PASSWORD}

*** Test Cases ***
Testcase 0: Site bezoeken
    Open Browser On Local Machine  ${TEST_URL}  ${BROWSER}
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 squarebutton btn-default')]    timeout=5
    Login As Student Or Teacher  STUDENT_PASSWORD

Testcase 17: Als willekeurig gebruiker de taal wijzigen
    # Rechtsboven op "Instellingen" klikken
    Sleep   5.0
    Wait Until Page Contains Element  //*[contains(@class,'mx-link mx-name-actionButton2')]  timeout=5
    Click Element  //*[@class='mx-link mx-name-actionButton2']  modifier=False

    # Op de knop "Taal wijzigen..." klikken
    Wait Until Page Contains Element  //*[contains(@class,'mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid')]//*[contains(@class,'row')]//*[contains(@class,'col-md-9')]  timeout=5
    Sleep   1.0
    Click Element  //*[@class='mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid']//*[@class='row']//*[contains(@class,'col-md-9')]//*[@class='mx-link mx-name-actionButton2']    modifier=False

    # Nakijken of de website nu Engels is
    Wait Until Page Contains Element  //*[contains(text(),'Avans Marketplace')]

    # Terugzetten naar Nederlands, dus rechtsboven op "Instellingen" klikken
    Wait Until Page Contains Element  //*[contains(@class,'mx-link mx-name-actionButton2')]  timeout=5
    Click Element  //*[@class='mx-link mx-name-actionButton2']  modifier=False

    # Op de knop "Change language..." klikken
    Wait Until Page Contains Element  //*[contains(@class,'mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid')]//*[contains(@class,'row')]//*[contains(@class,'col-md-9')]  timeout=5
    Sleep   1.0
    Click Element  //*[@class='mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid']//*[@class='row']//*[contains(@class,'col-md-9')]//*[@class='mx-link mx-name-actionButton1']    modifier=False
    
    # Nakijken of de website nu Nederlands is
    Wait Until Page Contains Element  //*[contains(text(),'Avans marktplaats')]
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
    Maximize Browser Window
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 squarebutton btn-default')]    timeout=5
    Login As Student Or Teacher  ${STUDENT_PASSWORD}

Testcase 28: Als student een opdracht zoeken
    Wait Until Page Contains Element  //*[contains(@class,'search-bar')]//*[contains(@class,'form-control')]
    # Opdracht zoeken met de naam "Broed"
    Sleep   0.5
    input text  //*[@class='search-bar']//*[@class='form-control']  Broed
    Wait Until Page Contains Element  //*[contains(@id, 'mxui_widget_ListViewItem')]  timeout=5
    # Op de opdracht klikken met de naam "Broed"
    Click Element  //*[contains(@id, 'mxui_widget_ListViewItem')]  modifier=False

Testcase 29: Als student inschrijven voor een opdracht
    Wait Until Page Contains Element  //*[@class='btn mx-button mx-name-actionButton2 btn-info']  timeout=5
    # Op de knop "Inschrijven" klikken
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-info']  modifier=False

    # Popup verschijnt die aangeeft dat er is ingeschreven.
    Wait Until Page Contains Element  //*[contains(text(),'Informatie')]
    # "Ok" klikken
    Click Element  //*[@class='btn btn-primary']  modifier=False

Testcase 30: Als student mijn inschrijvingen bekijken
    # Op de "Mijn inschrijvingen" knop klikken
    Wait Until Page Contains Element  //*[@class='mx-link mx-name-actionButton5']  timeout=5
    Click Element  //*[@class='mx-link mx-name-actionButton5']  modifier=False

    # Nakijken of de "Broed" opdracht staat ingeschreven
    Wait Until Page Contains Element  //*[contains(text(),'Broed')]  timeout=5

Testcase 31: Als student uitschrijven voor een opdracht
    Wait Until Page Contains Element  //*[contains(@class, 'btn mx-button mx-name-actionButton2 pull-right btn-inverse')]  timeout=5
    Page Should Not Contain  //*[contains(@class, 'mx-listview-empty')]
    
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 pull-right btn-inverse']  modifier=False
    # Bevestegingspopup verschijnt
    Wait Until Page Contains Element  //*[contains(@class,'btn btn-primary')]  timeout=5
    Click Element  //*[@class='btn btn-primary']  modifier=False

    # Terug naar mijn inschrijvingen om te kijken of er ook echt uitgeschreven is
    Wait Until Page Contains Element  //*[contains(@class, 'mx-link mx-name-actionButton5')]  timeout=5  
    Click Element  //*[@class='mx-link mx-name-actionButton5']  modifier=False
    Wait Until Page Contains Element  //*[@class='mx-listview-empty']  timeout=5

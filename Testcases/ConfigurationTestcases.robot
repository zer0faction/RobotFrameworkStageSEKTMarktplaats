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
    Login As Student Or Teacher Navigate To Page
    Login As Student Or Teacher Fill In Page  ${STUDENT_PASSWORD}

Testcase 17: Als willekeurig gebruiker de taal wijzigen
    # Rechtsboven op "Instellingen" klikken
    Wait Until Page Contains Element  //*[contains(@class,'mx-link mx-name-actionButton2')]  timeout=5
    Sleep   0.5
    Click Element  //*[@class='mx-link mx-name-actionButton2']  modifier=False

    # Op de knop "Taal wijzigen..." klikken
    Wait Until Page Contains Element  //*[contains(@class,'mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid')]//*[contains(@class,'row')]//*[contains(@class,'col-md-9')]  timeout=5
    Sleep   0.5
    Click Element  //*[@class='mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid']//*[@class='row']//*[contains(@class,'col-md-9')]//*[@class='mx-link mx-name-actionButton2']    modifier=False

    # Nakijken of de website nu Engels is
    Wait Until Page Contains Element  //*[contains(text(),'Avans Marketplace')]

    # Terugzetten naar Nederlands, dus rechtsboven op "Instellingen" klikken
    Wait Until Page Contains Element  //*[contains(@class,'mx-link mx-name-actionButton2')]  timeout=5
    Click Element  //*[@class='mx-link mx-name-actionButton2']  modifier=False

    # Op de knop "Change language..." klikken
    Wait Until Page Contains Element  //*[contains(@class,'mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid')]//*[contains(@class,'row')]//*[contains(@class,'col-md-9')]  timeout=5
    Sleep   0.5
    Click Element  //*[@class='mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid']//*[@class='row']//*[contains(@class,'col-md-9')]//*[@class='mx-link mx-name-actionButton1']    modifier=False
    
    # Nakijken of de website nu Nederlands is
    Wait Until Page Contains Element  //*[contains(text(),'Avans marktplaats')]

Testcase 18: Als student jou primaire opleiding wijzigen
    Wait Until Page Contains Element  //*[contains(@class,'mx-link mx-name-actionButton2')]  timeout=5
    Sleep   0.5
    # Rechtsboven op "Instellingen" klikken
    Click Element  //*[@class='mx-link mx-name-actionButton2']  modifier=False

    Wait Until Page Contains Element  id=mxui_widget_ReferenceSelector_0_input  timeout=5

    # Selecteer een opleiding uit de lijst met opleidingen
    Select From List By Index  id=mxui_widget_ReferenceSelector_0_input  1

    # Klik op opslaan
    Click Element  //*[@class='btn mx-button mx-name-actionButton4 btn-default']  modifier=False
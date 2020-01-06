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
    # Omschrijving:
    # ----------------------------------------------------------------------------------
    # In deze testcase wordt de browser geopend en ingelogd met een student account.
    # Hier is een student account voor nodig.
    # Na het succesvol inloggen bevind de pagina zich op de Home pagina van een student.
    # ----------------------------------------------------------------------------------

    Open Browser On Local Machine  ${TEST_URL}  ${BROWSER}
    Maximize Browser Window
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 squarebutton btn-default')]    timeout=5
    Login As Student Or Teacher Navigate To Page
    Login As Student Or Teacher Fill In Page  ${STUDENT_PASSWORD}

Testcase 28: Als student een opdracht zoeken
    # Omschrijving:
    # ------------------------------------------------------------------------------------------------------------------------------
    # In deze testcase zoekt een student naar de zoekterm "Broed". Er wordt vervolgens gecontroleerd of er een resultaat verschijnt.
    # Deze testcase gaat ervan uit dat de pagina zich bevind op de home pagina van een student.
    # Na de testcase bevind de pagina op home, en is de opdracht met "Broed" aangeklikt
    # ------------------------------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element  //*[contains(@class,'search-bar')]//*[contains(@class,'form-control')]
    # Opdracht zoeken met de naam "Broed"
    Sleep   0.5
    input text  //*[@class='search-bar']//*[@class='form-control']  Broed
    Wait Until Page Contains Element  //*[contains(@id, 'mxui_widget_ListViewItem')]  timeout=5
    # Op de opdracht klikken met de naam "Broed"
    Click Element  //*[contains(@id, 'mxui_widget_ListViewItem')]  modifier=False


Testcase 29: Als student inschrijven voor een opdracht
    # Omschrijving:
    # -----------------------------------------------------------------------------------
    # In deze testcase klikt de student op de inschrijven knop. Er verschijnt een popup.
    # Deze testgate gaat ervan uit dat de student al op een opdracht heeft geklikt.
    # Na de testcase bevind de pagina zich op home.
    # -----------------------------------------------------------------------------------

    Wait Until Page Contains Element  //*[@class='btn mx-button mx-name-actionButton2 btn-info']  timeout=5
    # Op de knop "Inschrijven" klikken
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-info']  modifier=False

    # Popup verschijnt die aangeeft dat er is ingeschreven.
    Wait Until Page Contains Element  //*[contains(text(),'Informatie')]
    # "Ok" klikken
    Click Element  //*[@class='btn btn-primary']  modifier=False

Testcase 30: Als student mijn inschrijvingen bekijken
    # Omschrijving:
    # ------------------------------------------------------------------------------------------------------------
    # In deze testcase wordt genavigeerd naar "Mijn inschrijvingen" om te kijken of ingeschreven is voor "Broed".
    # De testcase gaat ervan uit dat een student ingeschreven staat voor "Broed".
    # Na de testcase bevind de pagina zich op ""Mijn inschrijvingen".
    # ------------------------------------------------------------------------------------------------------------

    # Op de "Mijn inschrijvingen" knop klikken
    Wait Until Page Contains Element  //*[@class='mx-link mx-name-actionButton5']  timeout=5
    Click Element  //*[@class='mx-link mx-name-actionButton5']  modifier=False

    # Nakijken of de "Broed" opdracht staat ingeschreven
    Wait Until Page Contains Element  //*[contains(text(),'Broed')]  timeout=5

Testcase 31: Als student uitschrijven voor een opdracht
    # Omschrijvingen
    # --------------------------------------------------------------------------------
    # In deze testcase schrijft de student zich uit.
    # De testcase gaat ervan uit dat de student zich op "Mijn inschrijvingen" bevind.
    # Na de testcase bevind de pagina zich op "Mijn inschrijvingen".
    # --------------------------------------------------------------------------------

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
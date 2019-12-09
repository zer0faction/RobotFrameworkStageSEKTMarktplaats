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
    Login As Organisation       gijs@avans.nl       Welkom1234

Testcase 12: Als Avans medewerker een organisatie toevoegen
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container26 card cardaction col-center ClickableContainer')]   timeout=5

    # Klik op knop(tegel) "Relatiebeheer"
    Click Element  //*[@class='mx-name-container26 card cardaction col-center ClickableContainer']    modifier=false

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton6 btn-default')]   timeout=5

    # Klik op de knop "+Organisatie"
    Click Element  //*[@class='btn mx-button mx-name-actionButton6 btn-default']    modifier=false

    #
    Wait Until Page Contains Element        //*[contains(@class,'mx-name-Organisatienaam mx-textbox form-group')]      timeout=5

    # Vul de organisatienaam in
    input text      //*[@class='mx-name-Organisatienaam mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        chatmetvreemden.nl

    # Vul de ondernemingsvorm in
    Select From List By Index   //*[@class='mx-name-Ondernemingsvorm mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']   1

    # Vul de Branche in
    Select From List By Index   //*[contains(@class,'form-group mx-referenceselector mx-name-Branche')]//*[@class='col-sm-9']//*[@class='mx-compound-control']//*[@class='form-control']   1

    # Vul de website in
    input text      //*[@class='mx-name-Website mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        wwww.chatmetvreemden.nl

    # Vul aantal medewerkers in
    Select From List By Index   //*[@class='mx-name-AantalMedewerkers mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']      4

    # Vul een beschrijving in
    input text      //*[@class='mx-name-OrganisatieOmschrijving TestTooltip mx-textarea form-group']//*[@class='col-sm-9']//*[@class='form-control mx-textarea-input']      Chat met vreemdem!

    # Vul postcode in
    input text      //*[@class='mx-name-Postcode mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        7821 AD

    # Vul huisnummer in
    input text      //*[@class='mx-name-Huisnummer mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        110

    # Vul straatnaam in
    input text      //*[@class='mx-name-Straatnaam mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Jules Verneweg

    # Vul plaatsnaam in
    input text      //*[@class='mx-name-Plaatsnaam mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       Emmen

    # Selecteer het type adres
    Select From List By Index   //*[@class='mx-name-SoortAdres mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']      1
]
    # Klik op de knop "Opslaan"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-primary']    modifier=false
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0')]   timeout=5

    # Klik op het tabje "Home"
    Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0']    modifier=false

Testcase 13: Als Avans medewerker een organisatie aanpassen

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container26 card cardaction col-center ClickableContainer')]   timeout=5

    # Klik op knop(tegel) "Relatiebeheer"
    Click Element  //*[@class='mx-name-container26 card cardaction col-center ClickableContainer']    modifier=false

    Wait Until Page Contains Element    //*[contains(@class,'widget-text-box-search mx-name-textBoxSearch1 ')]   timeout=5

    # Vul de tekst "chatmetvreemden" in de zoekbar
    input text      //*[@class='widget-text-box-search mx-name-textBoxSearch1 ']//*[@class='search-bar']//*[@class='form-control']        chatmetvreemden
    Sleep   1.0

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container8 cardOrganisation')]   timeout=5

    # Klik op knop(tegel) voor de organisatie Chat met Vreemden
    Click Element  //*[@class='mx-name-container7 card']//*[@class='mx-name-container8 cardOrganisation']    modifier=false

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-default')]   timeout=5

    # Klik op de knop "Organisatiegegevens wijzigen"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']    modifier=false
    
    Wait Until Page Contains Element    //*[@class='mx-name-Organisatienaam mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']      timeout=5

    Press Keys    //*[@class='mx-name-Organisatienaam mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']        CTRL+a+BACKSPACE
    # Vul de organisatienaam in
    input text    //*[@class='mx-name-Organisatienaam mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']        chatmetvreemden.com

    # Selecteer de ondernemingsvorm
    Select From List By Index   //*[@class='mx-name-Ondernemingsvorm mx-dropdown form-group']//*[@class='col-sm-8']//*[@class='form-control']   4
    # Select From List By Index   //*[@class='form-group mx-referenceselector mx-name-referenceSelector1']//*[@class='col-sm-8']//*[@class='mx-compound-control']//*[@class='form-control']   7

    Press Keys    //*[@class='mx-name-Website mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']        CTRL+a+BACKSPACE
    # Vul de website in
    input text    //*[@class='mx-name-Website mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']        wwww.chatmetvreemden.com

    # Kies het Aantal Werknemers
    Select From List By Index   //*[@class='mx-name-Aantalmdw mx-dropdown form-group']//*[@class='col-sm-8']//*[@class='form-control']      5

    Press Keys    //*[@class='mx-name-KorteOmschrijving TestTooltip mx-textarea form-group']//*[@class='col-sm-8']//*[@class='form-control mx-textarea-input']        CTRL+a+BACKSPACE
    # Vul de website in
    input text    //*[@class='mx-name-KorteOmschrijving TestTooltip mx-textarea form-group']//*[@class='col-sm-8']//*[@class='form-control mx-textarea-input']        Chat met vreemden!

    # Klik op de knop "Opslaan"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']    modifier=false

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-tabPage2')]   timeout=5

    # Klik op het tabje "Vestigingen wijzigen"
    Click Element   //*[@class='mx-name-tabPage2']    modifier=false
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-index-0')]   timeout=5

    # Klik op het bovenste element in de lijst met vestigingen
    Click Element   //*[contains(@class,'mx-name-index-0')]    modifier=false

    # Klik op de knop "Wijzigen"
    Click Element   id=mxui_widget_ControlBarButton_1    modifier=false

    Wait Until Page Contains Element        //*[contains(@class,'mx-name-Postcode mx-textbox form-group')]      timeout=5
    
    Press Keys    //*[@class='mx-name-Postcode mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
    # Vul de postcode in
    input text      //*[@class='mx-name-Postcode mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       4761 BK     True
    
    Press Keys    //*[@class='mx-name-Huisnummer mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
    # Vul het type adres in
    input text      //*[@class='mx-name-Huisnummer mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       1        True

    Press Keys    //*[@class='mx-name-Straatnaam mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
    # Vul straatnaam in
    input text      //*[@class='mx-name-Straatnaam mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       IJshof       True

    Press Keys    //*[@class='mx-name-Plaatsnaam mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
    # Vul plaats in
    input text      //*[@class='mx-name-Plaatsnaam mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       Zevenbergen     True

    # Selecteer type bezoekadress
    Select From List By Index   //*[@class='mx-name-SoortAdres mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']      1

    # Klik op de knop "Opslaan"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-primary']    modifier=false
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0')]   timeout=5
    Sleep   0.5
    # Klik op het tabje "Home"
    Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0']    modifier=false
    Sleep   0.5

Testcase 14: Als admin een organisatie verwijderen
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container26 card cardaction col-center ClickableContainer')]   timeout=5
    # Op de dashboard knop "Relatiebeheer" klikken
    Click Element  //*[@class='mx-name-container26 card cardaction col-center ClickableContainer']    modifier=false
    Wait Until Page Contains Element    //*[contains(@class,'widget-text-box-search mx-name-textBoxSearch1 ')]   timeout=5
    # Vul de organisatie naam in
    input text      //*[@class='widget-text-box-search mx-name-textBoxSearch1 ']//*[@class='search-bar']//*[@class='form-control']        chatmetvreemden
    Sleep   1

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container8 cardOrganisation')]   timeout=5
    # Klik op het gevonden bedrijf
    Click Element  //*[@class='mx-name-container7 card']//*[@class='mx-name-container8 cardOrganisation']    modifier=false
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton11 btn-danger')]   timeout=5

    # Klik op de "Verwijderen(admin)" knop
    Click Element  //*[@class='btn mx-button mx-name-actionButton11 btn-danger']    modifier=false

    # Klik op "Ok"
    Wait Until Page Contains Element    //*[contains(@class,'btn btn-primary')]   timeout=5
    Click Element  //*[@class='btn btn-primary']    modifier=false

    # Linksboven op de "Home" knop klikken
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0')]   timeout=5
    Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0']    modifier=false

Testcase 16: Als Technisch beheer medewerker een organisatie registratie goedkeuren/afkeuren
    Wait Until Page Contains Element    //*[contains(@class,'mx-link mx-name-actionButton26 nowrap')]   timeout=5
    # Klik op de dashboard knop "Registratie verzoeken"
    Click Element  //*[@class='mx-link mx-name-actionButton26 nowrap']  modifier=false

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton3 btn-default')]   timeout=5
    # Klik op de registratie verzoek van "Ed"
    Click Element  //*[text()='Ed']    modifier=false
    # Klik op de "Beoordelen" knop
    Click Element  //*[@class='btn mx-button mx-name-actionButton3 btn-default']  modifier=false
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 btn-default')]   timeout=5
    # Op de "Afkeuren" knop klikken
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-default']    modifier=false

    Wait Until Page Contains Element    //*[@class='form-control mx-textarea-input']    timeout=5
    # Reden van afkeuren invullen
    input text  //*[@class='form-control mx-textarea-input']   Reden Van Afkeuren Text
    # Op de "OK" knop klikken
    Click Element  //*[@class='btn mx-button mx-name-actionButton3 btn-primary']    modifier=false

    Sleep   0.5
    # Nakijken of Ed niet meer in het lijstje staat
    Page Should Not Contain Element  //*[contains(text(),'Ed')]  timeout=5
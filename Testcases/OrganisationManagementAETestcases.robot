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
    # -------------------------------------------------------------------------------------------------
    # In deze testcase wordt de browser geopend en ingelogd met een externe bedrijfsmedewerker account.
    # Hier is een externe bedrijfsmedewerkers account voor nodig.
    # Na het succesvol inloggen is de huidige pagina de home pagina
    # -------------------------------------------------------------------------------------------------
    Open Browser On Local Machine  ${TEST_URL}  ${BROWSER}
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 squarebutton btn-default')]    timeout=5
    Login As Organisation       gijs@avans.nl       Welkom1234

Testcase 12.0: Als Avans medewerker naar het nieuwe organisatie form navigeren
    # Omschrijving:
    # ----------------------------------------------------------------------------------------------------------------------------
    # De testcase regelt het navigeren naar de registratie pagina. 
    # De navigatie is opgesplits, omdat er ook een falende testcase versie is van het toevoegen van een nieuwe organisatie.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de home pagina zijn. 
    # ----------------------------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container26 card cardaction col-center ClickableContainer')]   timeout=5

    # Klik op knop(tegel) "Relatiebeheer"
    Click Element  //*[@class='mx-name-container26 card cardaction col-center ClickableContainer']    modifier=false

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton6 btn-default')]   timeout=5

    # Klik op de knop "+Organisatie"
    Click Element  //*[@class='btn mx-button mx-name-actionButton6 btn-default']    modifier=false

    Wait Until Page Contains Element        //*[contains(@class,'mx-name-Organisatienaam mx-textbox form-group')]      timeout=5

Testcase 12.1: Als Avans medewerker een organisatie toevoegen zonder alle gegevens in te vullen
    # Omschrijving:
    # -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Dit is een falende versie van het toevoegen van een nieuwe organisatie. In deze testcase onstaan foutmeldingen die aangeven dat bepaalde invoervelden nog niet zijn ingevuld.
    # Op het moment van het uitvoeren van de testcase moet het systeem zich op de "Nieuwe organisatie" pagina bevinden. 
    # Na het uitvoeren is de huidige pagina opnieuw de "Nieuwe organisatie" pagina.
    # -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    # Klik op de knop "Opslaan"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-primary']    modifier=false

    # Er zou een foutmelding moeten komen die aangeeft dat er een fout is opgetreden. Klik op OK
    Wait Until Page Contains Element    //*[contains(@class,'btn btn-primary')]   timeout=5
    Click Element  //*[@class='btn btn-primary']    modifier=false

Testcase 12.2: Als Avans medewerker een organisatie toevoegen
    # Omschrijving:
    # --------------------------------------------------------------------------------------------------------
    # De testcase voert het toevoegen van een nieuwe organisatie in het systeem uit.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de "Nieuwe organisatie" pagina zijn. 
    # Na het uitvoeren is de huidige pagina de "Relatiebeheer" pagina.
    # --------------------------------------------------------------------------------------------------------

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

    # Klik links-boven op het tabje "Home"
    Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0']    modifier=false

Testcase 13.0: Als Avans medewerker navigeren naar een organisatie (chatmetvreemden.nl)
    # Omschrijving:
    # -----------------------------------------------------------------------------------------------------------
    # De testcase regelt het navigeren naar de "Organisatie details" pagina van chatmetvreemden.nl pagina. 
    # De navigatie is opgesplits, omdat er ook een falend testcase versie is van het wijzigen van de organisatie.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de home pagina zijn. 
    # -----------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container26 card cardaction col-center ClickableContainer')]   timeout=5
    Sleep  0.5

    # Klik op knop(tegel) "Relatiebeheer"
    Click Element  //*[@class='mx-name-container26 card cardaction col-center ClickableContainer']    modifier=false

    Wait Until Page Contains Element    //*[contains(@class,'widget-text-box-search mx-name-textBoxSearch1')]   timeout=5

    # Vul de tekst "chatmetvreemden" in de zoekbar
    input text      //*[@class='widget-text-box-search mx-name-textBoxSearch1 ']//*[@class='search-bar']//*[@class='form-control']        chatmetvreemden
    Sleep   0.5

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container8 cardOrganisation')]   timeout=5
    
    Sleep   0.5
    # Klik op knop(tegel) voor de organisatie Chat met Vreemden
    Click Element  //*[@class='mx-name-container7 card']//*[@class='mx-name-container8 cardOrganisation']    modifier=false

Testcase 13.1: Als Avans medewerker een organisatie aanpassen met verkeerde gegevens
    # Omschrijving:
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Dit is een falende versie van het gegevens wijzigen van een organisatie. In deze testcase onstaan foutmeldingen die aangeven dat bepaalde invoervelden nog niet zijn ingevuld.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de "Organisatie details" pagina zijn. 
    # Na het uitvoeren is de huidige pagina opnieuw de "Organisatie details" pagina.
    # ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-default')]   timeout=5

    # Klik op de knop "Organisatiegegevens wijzigen"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']    modifier=false

    Wait Until Page Contains Element    //*[@class='mx-name-Organisatienaam mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']      timeout=5

    # Haal de organisatienaam weg
    Press Keys    //*[@class='mx-name-Organisatienaam mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']        CTRL+a+BACKSPACE

    # Klik op de knop "Opslaan"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']    modifier=false

    # Er zou een waarschuwing moeten komen die aangeeft dat de organisatienaam niet is ingevuld
    Wait Until Page Contains Element   //*[@class='mx-name-Organisatienaam mx-textbox form-group has-error']//*[@class='col-sm-8']//*[@class='form-control']  timeout=5
    Sleep  0.5

    # Vul de naam weer goed in en sla het op
    Press Keys    //*[@class='mx-name-Organisatienaam mx-textbox form-group has-error']//*[@class='col-sm-8']//*[@class='form-control']        CTRL+a+BACKSPACE
    input text    //*[@class='mx-name-Organisatienaam mx-textbox form-group has-error']//*[@class='col-sm-8']//*[@class='form-control']        chatmetvreemden.com

    # Klik op de knop "Opslaan"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']    modifier=false
    Sleep   0.5
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']    modifier=false

Testcase 13.2: Als Avans medewerker een organisatie aanpassen
    # Omschrijving:
    # ------------------------------------------------------------------------------------------------------------------------------------------------------
    # De testcase voert het gegevens wijzigen van een organisatie uit als Avans medewerker. Alle informatie dat wordt ingevuld is nep.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de "Organisatie details" pagina zijn. 
    # Na het uitvoeren is de huidige pagina de home pagina.
    # ------------------------------------------------------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-default')]   timeout=5
    Sleep   0.5

    # Klik op de knop "Organisatiegegevens wijzigen"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']    modifier=false
    Wait Until Page Contains Element    //*[@class='mx-name-Organisatienaam mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']      timeout=5

    Sleep  0.5
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
    input text      //*[@class='mx-name-Postcode mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        4818 AJ     True
    
    Press Keys    //*[@class='mx-name-Huisnummer mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
    # Vul het type adres in
    input text      //*[@class='mx-name-Huisnummer mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       61        True

    Press Keys    //*[@class='mx-name-Straatnaam mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
    # Vul straatnaam in
    input text      //*[@class='mx-name-Straatnaam mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       Lovensdijkstraat       True

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
     # Omschrijving:
    # ---------------------------------------------------------------------------------------------------------------------------------------------------------
    # De testcase voert het verwijderen van een organisatie uit als Avans medewerker. 
    # Op het moment van het uitvoeren van de testcase moet het systeem op de home pagina zijn. Ook moet de chatmetvreemden.nl organisatie in het systeem staan.
    # Na het uitvoeren is de huidige pagina de home pagina.
    # ---------------------------------------------------------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container26 card cardaction col-center ClickableContainer')]   timeout=5
    # Op de dashboard knop "Relatiebeheer" klikken
    Click Element  //*[@class='mx-name-container26 card cardaction col-center ClickableContainer']    modifier=false
    Wait Until Page Contains Element    //*[contains(@class,'widget-text-box-search mx-name-textBoxSearch1 ')]   timeout=5
    Sleep   0.5
    # Vul de organisatie naam in
    input text      //*[@class='widget-text-box-search mx-name-textBoxSearch1 ']//*[@class='search-bar']//*[@class='form-control']        chatmetvreemden
    Sleep   0.5

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container8 cardOrganisation')]   timeout=5
    Sleep   0.5
    # Klik op het gevonden bedrijf
    Click Element  //*[@class='mx-name-container7 card']//*[@class='mx-name-container8 cardOrganisation']    modifier=false
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton11 btn-danger')]   timeout=5
    Sleep   0.5
    # Klik op de "Verwijderen(admin)" knop
    Click Element  //*[@class='btn mx-button mx-name-actionButton11 btn-danger']    modifier=false

    # Klik op "Ok"
    Wait Until Page Contains Element    //*[contains(@class,'btn btn-primary')]   timeout=5
    Click Element  //*[@class='btn btn-primary']    modifier=false

    # Linksboven op de "Home" knop klikken
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0')]   timeout=5
    Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0']    modifier=false

Testcase 15: Als Technisch beheer medewerker een organisatie registratie goedkeuren/afkeuren
    # Omschrijving:
    # ----------------------------------------------------------------------------------------------------------------
    # In deze testcase wordt het goedkeuren/afkeuren getest door het nieuwe registratieverzoek van "Ed" af te keuren.
    # Deze testcase gaat ervan uit dat de Technisch beheer medewerker zich bevind op de home pagina.
    # Na de testcase bevind het systeem zich op de "Registratie verzoeken" pagina.
    # ----------------------------------------------------------------------------------------------------------------

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
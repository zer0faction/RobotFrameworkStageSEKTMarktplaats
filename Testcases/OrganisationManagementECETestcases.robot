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
    # ---------------------------------------------------------------------------------------------------
    # In deze testcase wordt de browser geopend en ingelogd met een medewerkers account.
    # Hier is een Extern Bedrijfsmedewerker account voor nodig.
    # Na het succesvol inloggen bevind de pagina zich op de Home pagina van de Extern Bedrijfsmedewerker.
    # ---------------------------------------------------------------------------------------------------

    Open Browser On Local Machine  ${TEST_URL}  ${BROWSER}
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 squarebutton btn-default')]    timeout=5
    Login As Organisation   g.vanmorsel@coolblue.nl  Mendix1

Testcase 6.0: Als extern bedrijfsmedewerker naar het opdrachtform navigeren
    # Omschrijving:
    # ------------------------------------------------------------------------------------------
    # In deze testcase navigeert de extern medewerker naar het Form om opdrachten in te vullen.
    # Er wordt van uitgegaan dat ingelogd is met een medewerkers account.
    # Na de testcase bevind de pagina zich op het opdracht invullen form.
    # ------------------------------------------------------------------------------------------

    As External Employee Navigate To Assignment Form

Testcase 6.1: Als extern bedrijfsmedewerker een stageopdracht aanmelden maar niet alle gegevens invullen
    # Omschrijving:
    # ---------------------------------------------------------------------------------------------------------------------
    # In deze testcase wordt het Opdracht Invullen forum niet compleet ingevuld, maar wel op de "Bevestigen" knop gedrukt.
    # Er wordt vanuit gegaan dat de pagina zich bevind op het opdracht invullen form.
    # Na de testcase bevind de pagina zich nog steeds op het opdracht invullen form.
    # ---------------------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element  //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-primary')]  timeout=5

    # Klik op de "Bevestigen en verzenden" knop. De
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-primary']  modifier=false

    Wait Until Page Contains Element  //*[contains(@class,'alert alert-danger mx-validation-message')]  timeout=5

    # Klik op de "Annuleren" knop
    Click Element  //*[@class='btn mx-button mx-name-actionButton4 btn-inverse']  modifier=false

Testcase 6.2: Als extern bedrijfsmedewerker succesvol een stageopdracht aanmelden
    # Omschrijving:
    # ------------------------------------------------------------------------------------------------------------
    # In deze testcase wordt het Opdracht Invullen forum compleet ingevuld, waardoor een opdracht verzonden wordt.
    # Er wordt vanuit gegaan dat de pagina zich bevind op het opdracht invullen form.
    # Na de testcase bevind de pagina zich op de home pagina.
    # ------------------------------------------------------------------------------------------------------------

    As External Employee Navigate To Assignment Form

    # Kies een academy
    Wait Until Page Contains Element        //*[contains(@class,'form-group mx-referenceselector mx-name-referenceSelector1 StudyprogramNL')]      timeout=5
    Sleep   0.5
    Select From List By Index           //*[@class='form-group mx-referenceselector mx-name-referenceSelector2']//*[@class='col-sm-9']//*[@class='mx-compound-control']//*[@class='form-control']       2
    Select From List By Index           //*[@class='form-group mx-referenceselector mx-name-referenceSelector1 StudyprogramNL']//*[@class='col-sm-9']//*[@class='mx-compound-control']//*[@class='form-control']       1

    # Naam opdracht invullen
    input text      //*[@class='mx-name-textBoxTitel Titel mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        testopdracht
    # Aanleiding invullen
    input text      //*[@class='mx-name-textAreaAanleiding Aanleiding mx-textarea form-group']//*[@class='col-sm-9']//*[@class='form-control mx-textarea-input']        we makem een testopdracht
    # Opdracht beschrijving
    input text      //*[@class='mx-name-textAreaOmschrijving OpdrachtOmschrijving mx-textarea form-group']//*[@class='col-sm-9']//*[@class='form-control mx-textarea-input']        we maken een testopdracht
    # Aanvullende informatie (link)
    input text      //*[@class='mx-name-textBoxAanbvullendeInfo Literatuur mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        www.chatmetvreemden.nl
    # Solliciteren via
    input text      //*[@class='mx-name-textAreaSolliciterenVia Solliciteren mx-textarea form-group']//*[@class='col-sm-9']//*[@class='form-control mx-textarea-input']        diego sweet
    # Opmerkingen
    input text      //*[@class='mx-name-Opmerkingen Opmerkingen mx-textarea form-group']//*[@class='col-sm-9']//*[@class='form-control mx-textarea-input']        wwww.chatmetvreemden.nl

    # Klik op de "Bevestigen en verzenden" knop
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-primary']  modifier=false

    # Wacht totdat het versturen bevestigd is, klik dan op "OK"
    Wait Until Page Contains Element    //*[contains(@class,'btn btn-primary')]   timeout=5
    Click Element  //*[@class='btn btn-primary']  modifier=false
    Sleep   0.5

Testcase 7: Als extern bedrijfsmedewerker een stageopdracht als concept opslaan
    # Omschrijving:
    # --------------------------------------------------------------------------------
    # In deze testcase wordt getest of een opdracht goed opgeslagen wordt als concept.
    # Er wordt vanuit gegaan dat de pagina zich bevind op Home.
    # Na de testcase bevind de pagina zich op de Home pagina.
    # --------------------------------------------------------------------------------

    # Klik op de "Meld uw opdracht direct aan" link
    Sleep   0.5
    Wait Until Page Contains Element    //*[contains(@class,'mx-link mx-name-actionButton9')]   timeout=5
    Sleep   0.5
    Click Element  //*[@class='mx-link mx-name-actionButton9']  modifier=false

    # Klik op de "Volgende" knop
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-default')]   timeout=5
    Sleep   0.5
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']    modifier=false

    # Kies een academy
    Wait Until Page Contains Element        //*[contains(@class,'form-group mx-referenceselector mx-name-referenceSelector1 StudyprogramNL')]      timeout=5
    Sleep   0.5
    Select From List By Index   //*[@class='form-group mx-referenceselector mx-name-referenceSelector1 StudyprogramNL']//*[@class='col-sm-9']//*[@class='mx-compound-control']//*[@class='form-control']    1

    # Naam opdracht invullen
    input text      //*[@class='mx-name-textBoxTitel Titel mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        tempopdracht
    # Aanleiding invullen
    input text      //*[@class='mx-name-textAreaAanleiding Aanleiding mx-textarea form-group']//*[@class='col-sm-9']//*[@class='form-control mx-textarea-input']        we maken een tempopdracht

    # Pagine refreshen
    Click Element  //*[@class='btn mx-button mx-name-actionButton5 btn-default']  modifier=false

    # Klik op de "Meld uw opdracht direct aan" link
    Wait Until Page Contains Element    //*[contains(@class,'mx-link mx-name-actionButton9')]   timeout=5
    Sleep   0.5
    Click Element  //*[@class='mx-link mx-name-actionButton9']  modifier=false

    # Klik op "Ja/Yes"
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 btn-default')]   timeout=5
    Sleep       0.5
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-default']    modifier=false

    Sleep   0.5
    # Nakijken of de concept is opgeslagen
    Wait Until Page Contains Element  //*[contains(text(),'tempopdracht')]  timeout=5

    # Klik op de knop "Annuleren"
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton4 btn-inverse')]   timeout=5
    Click Element  //*[@class='btn mx-button mx-name-actionButton4 btn-inverse']    modifier=false

    # Klik op de "Meld uw opdracht direct aan" link
    Wait Until Page Contains Element    //*[contains(@class,'mx-link mx-name-actionButton9')]   timeout=5
    Sleep   0.5
    Click Element  //*[@class='mx-link mx-name-actionButton9']  modifier=false

    # Klik op "Nee/No"
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-inverse')]   timeout=5
    Sleep   0.5
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-inverse']    modifier=false

    # Klik op de knop "Annuleren"
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton4 btn-inverse')]   timeout=5
    Sleep   0.5
    Click Element  //*[@class='btn mx-button mx-name-actionButton4 btn-inverse']  modifier=false

Testcase 8: Als extern bedrijfsmedewerker uw opdrachten inzien
    # Omschrijving:
    # --------------------------------------------------------------------------------------------------------
    # In deze testcase wordt genavigeerd naar "Mijn opdrachten" om te kijken wat zich daar bevind.
    # Er wordt vanuit gegaan dat er een opdracht die "Testopdracht" heet bestaat, aangemaakt in testcase 6.2.
    # Na de testcase bevind de pagina zich op de "Mijn opdrachten" pagina.
    # --------------------------------------------------------------------------------------------------------

    # Klik op de knop "Mijn Opdrachten"
    Sleep   0.5
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton12 nowrap btn-default')]   timeout=5
    Click Element  //*[@class='btn mx-button mx-name-actionButton12 nowrap btn-default']  modifier=false

    # Vul tekst in het "Titel" zoekveld, en klik de op knop "Zoeken"
    Wait Until Page Contains Element    //*[contains(@class,'mx-grid-search-input mx-name-searchField2')]   timeout=5
    input text      //*[@class='mx-grid-search-input mx-name-searchField2']//*[@class='form-control']        testopdracht
    Click Element  //*[@class='btn mx-button btn-default mx-name-search mx-grid-search-button']  modifier=false

    # Klik op de opdracht "testopdracht"
    Sleep   0.5
    Click Element  //*[contains(text(),'testopdracht')]     modifier=false

    # Klik op de op "Toon details" knop
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-default']  modifier=false

    # Klik op "Terug naar overzicht"
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 btn-inverse')]   timeout=5
    Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-1']  modifier=false

Testcase 9.0: Als extern medewerker naar "Mijn gegevens" navigeren
    # Omschrijving:
    # --------------------------------------------------------
    # In deze testcase wordt genavigeerd naar "Mijn gegevens".
    # Dit kan altijd.
    # --------------------------------------------------------

    As External Employee Go To My Details

Testcase 9.1: Als extern bedrijfsmedewerker mijn persoonsgegevens niet succesvol wijzigen
    # Omschrijving:
    # --------------------------------------------------------------------------------------------------------------
    # In deze testcase worden de persoonsgegevens niet volledig ingevuld, maar wel op "Wijzigingen Opslaan" gedrukt.
    # Er wordt vanuit gegaan dat de pagina zich bevind op "Mijn persoonsgegevens".
    # Na de testcase bevind de pagina zich weer op Home.
    # --------------------------------------------------------------------------------------------------------------

    Sleep   0.5
    # Voornaam leeghalen
    Press Keys  //*[@class='mx-name-textBox4 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       CTRL+a+BACKSPACE

    # Klik op de knop "Wijzigingen opslaan"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=False

    Wait Until Page Contains Element  //*[contains(@class,'alert alert-danger mx-validation-message')]  timeout=5

    # klik op de knop "Pagina Sluiten"
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-inverse']  modifier=False

Testcase 9.2: Als extern bedrijfsmedewerker mijn persoonsgegevens succesvol wijzigen
    # Omschrijving:
    # ------------------------------------------------------------------
    # In deze testcase worden de persoonsgegevens ingevuld en veranderd.
    # Dit kan altijd.
    # Na deze testcase bevind de pagina zich op "Mijn gegevens".
    # ------------------------------------------------------------------

    As External Employee Go To My Details

    Sleep   0.5
    # Voornaam invullen
    Press Keys  //*[@class='mx-name-textBox4 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-textBox4 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  Gino

    # Tussenvoegsel invullen
    Press Keys  //*[@class='mx-name-textBox6 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-textBox6 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  van

    # Achternaam invullen
    Press Keys  //*[@class='mx-name-textBox5 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-textBox5 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  Morsel

    # Email invullen
    Press Keys  //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  g.vanmorsel@coolblue.nl

    # Telefoonnummer invullen
    Press Keys  //*[@class='mx-name-textBox2 mx-textbox form-group no-columns']//*[@class='form-control']       CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-textBox2 mx-textbox form-group no-columns']//*[@class='form-control']  677825691

    # Klik op de knop "Wijzigingen opslaan"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=False

    # Wacht op confirmation venster en klik die weg
    Wait Until Page Contains Element  //*[contains(@class, 'modal-footer mx-dialog-footer')]  timeout=5
    Click Element  //*[@class='modal-footer mx-dialog-footer']//*[@class='btn btn-primary']  modifier=False

    # klik op de knop "Pagina Sluiten"
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-inverse']  modifier=False

Testcase 10.0: Als extern bedrijfsmedewerker naar "Mijn werkervaring" navigeren
    # Omschrijving:
    # -----------------------------------------------------------------------------------
    # In deze testcase wordt naar "Mijn werkervaring" genavigeerd vanuit "Mijn gegevens".
    # -----------------------------------------------------------------------------------

    As External Employee Go To My Work Experience

# Testcase 10.2: Als extern bedrijfsmedewerker mijn werkervaringsgegevens niet succesvol wijzigen
    # Er is niks verplicht, dus ik kan niet testen of je dit onsuccevol kan wijzigen

Testcase 10.1: Als extern bedrijfsmedewerker mijn werkervaringsgegevens succesvol wijzigen
    # Omschrijving:
    # ------------------------------------------------------------------------------------
    # In deze testcase worden de werkervaringsgegevens succesvol gewijzigd.
    # Dit kan alleen vanuit "Mijn werkervaringsgegevens", en daar eindigd de testcase ook.
    # ------------------------------------------------------------------------------------

    Wait Until Page Contains Element  //*[contains(text(),'Afdeling')]  timeout=5

    # Functie invullen
    Press Keys    //*[@class='mx-name-Functie mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-Functie mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  Manager Logistiek

    # Afdeling invullen
    Press Keys    //*[@class='mx-name-Afdeling mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-Afdeling mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  Logistiek

    # Datum invullen
    Press Keys    //*[@class='mx-name-Werkzaambijbedrijfsinds mx-datepicker form-group']//*[@class='col-sm-9']//*[@class='mx-compound-control']//*[@class='form-control']        CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-Werkzaambijbedrijfsinds mx-datepicker form-group']//*[@class='col-sm-9']//*[@class='mx-compound-control']//*[@class='form-control']  01-06-2016

    # Invullen hoeveel werkervaring je hebt in jaren
    Select From List By Index   //*[@class='mx-name-Werkervaring mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']   2

    # Invullen hoogste opleiding
    Select From List By Index   //*[@class='mx-name-Opleidingsniveau mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']   2

    # Klik op de knop "Wijzigingen opslaan"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=False

    # Wacht op het confirmatie venster en klik die weg
    Wait Until Page Contains Element  //*[contains(@class, 'modal-footer mx-dialog-footer')]  timeout=5
    Click Element  //*[@class='modal-footer mx-dialog-footer']//*[@class='btn btn-primary']  modifier=False

Testcase 11.0: Als extern bedrijfsmedewerker naar mijn organisatiegegevens navigeren
    # Omschrijving:
    # --------------------------------------------------------------------------------------------------------------------------
    # Navigeren naar "Mijn organisatiegegevens". Dit kan alleen vanuit "Mijn werkervaringsgegevens" of "Mijn persoonsgegevens".
    # --------------------------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element    //*[contains(@role,'presentation')]//*[contains(@class,'mx-name-MijnOrganisatie')]   timeout=5
    Sleep   0.5

    # Klik op het tabje "Mijn organisatie"
    Click Element   //*[@role='presentation']//*[@class='mx-name-MijnOrganisatie']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid')]//*[contains(@class,'btn mx-button mx-name-actionButton3 btn-default')]   timeout=5
    Sleep   0.5

    # Klik op de knop "Naar organisatie details"
    Click Element  //*[@class='mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid']//*[@class='btn mx-button mx-name-actionButton3 btn-default']  modifier=False
    Sleep  5.0

Testcase 11.1: Als extern bedrijfsmedewerker mijn algemene organisatiegegevens niet succesvol wijzigen
    # Omschrijving:
    # ------------------------------------------------------------------------------------------------------------------------------------------
    # In deze testwordt worden organisatiegegevens verwijderd, maar wordt alsnog op "Opslaan" geklikt. Dit zou in een foutmelding moeten leiden.
    # Dit kan alleen vanuit "Mijn organisatiegegevens", en daar bevind de pagina zich ook na de testcase.
    # ------------------------------------------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-layoutGrid4 mx-layoutgrid mx-layoutgrid-fluid')]//*[contains(@class,'btn mx-button mx-name-actionButton1 btn-default')]   timeout=5
    Sleep   0.5
    # Klik op de knop "Organisatie gegevens wijzigen", onder het tabje "Organisatiegegevens"
    Click Element  //*[@class='mx-name-layoutGrid4 mx-layoutgrid mx-layoutgrid-fluid']//*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=False

    Sleep  0.5
    Wait Until Page Contains Element  //*[contains(@class,'mx-name-Organisatienaam mx-textbox form-group')]  timeout=5

    # Maak het veldje voor organisatienaam leeg
    Press Keys  //*[@class='mx-name-Organisatienaam mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']       CTRL+a+BACKSPACE

    # Klik op knop "Opslaan"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=False

    Wait Until Page Contains Element  //*[contains(@class,'alert alert-danger mx-validation-message')]  timeout=5

    # Klik op de knop "Pagina Sluiten"
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-inverse']  modifier=false

Testcase 11.2: Als extern bedrijfsmedewerker mijng algemene organisatiegegevens succesvol wijzigen
    # Omschrijving:
    # ---------------------------------------------------------------------------------------------------
    # In deze testwordt worden organisatiegegevens verwijderd.
    # Dit kan alleen vanuit "Mijn organisatiegegevens", en daar bevind de pagina zich ook na de testcase.
    # ---------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-layoutGrid4 mx-layoutgrid mx-layoutgrid-fluid')]//*[contains(@class,'btn mx-button mx-name-actionButton1 btn-default')]   timeout=5
    Sleep   0.5
     # Klik op de knop "Organisatie gegevens wijzigen", onder het tabje "Organisatiegegevens"
    Click Element  //*[@class='mx-name-layoutGrid4 mx-layoutgrid mx-layoutgrid-fluid']//*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-Organisatienaam mx-textbox form-group')]//*[contains(@class,'col-sm-8')]//*[contains(@class,'form-control')]   timeout=5

    # Vul de organisatienaam in
    Press Keys  //*[@class='mx-name-Organisatienaam mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']       CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-Organisatienaam mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']    Coolblue

    Select From List By Index   //*[@class='mx-name-Ondernemingsvorm mx-dropdown form-group']//*[@class='col-sm-8']//*[@class='form-control']  1

    # Vul de website naam in
    Press Keys  //*[@class='mx-name-Website mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']       CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-Website mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']    http://www.coolblue.nl

    Select From List By Index   //*[@class='mx-name-Aantalmdw mx-dropdown form-group']//*[@class='col-sm-8']//*[@class='form-control']      8

    # Vul de korte omschrijving in
    Press Keys  //*[@class='mx-name-KorteOmschrijving TestTooltip mx-textarea form-group']//*[@class='col-sm-8']//*[@class='form-control mx-textarea-input']       CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-KorteOmschrijving TestTooltip mx-textarea form-group']//*[@class='col-sm-8']//*[@class='form-control mx-textarea-input']    Coolblue. Ooit begonnen als studentenbedrijf. Nu een snelgroeiend e-commercebedrijf met 11 fysieke winkels in Nederland en België. Sinds onze oprichting in 1999 hebben we maar één doel: jou blij maken. We geven advies met verstand van zaken en we hebben een obsessieve focus op klanttevredenheid. Met meer dan 3.000 Coolblue'ers werken we keihard om onze klanten te verwonderen.

    # Klik op knop "Opslaan"
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-tabPage2')]   timeout=5

Testcase 11.3: Als extern bedrijfsmedewerker mijn vestigingen niet succesvol wijzigen
    # Omschrijving:
    # ---------------------------------------------------------------------------------------------------------------------------------
    # In deze testwordt word een vestiging toegevoegd, maar worden niet alle gegevens ingevuld. Dit moet resulteren in een foutmelding.
    # Dit kan alleen vanuit "Mijn vestigingen", en daar bevind de pagina zich ook na de testcase.
    # ---------------------------------------------------------------------------------------------------------------------------------

    # Klik op het tabje "Vestigingen"
    Click Element   //*[@class='mx-name-tabPage2']  modifier=False

    Sleep   0.5
    # Klik op de knop "Nieuw"
    Click Element   //*[@class='btn mx-button mx-name-actionButton3 btn-default']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-primary')]   timeout=5

    # Klik op de knop "Opslaan"
    Click Element   //*[@class='btn mx-button mx-name-actionButton1 btn-primary']  modifier=False

    Wait Until Page Contains Element  //*[contains(@class,'alert alert-danger mx-validation-message')]

    # Klik de knop "Annuleren"
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-default']  modifier=False

    Sleep  0.5

Testcase 11.4: Als extern bedrijfsmedewerker mijn vestigingen succesvol wijzigen
    # Omschrijving:
    # -----------------------------------------------------------------------------------------------------------------------------------------
    # In deze testwordt word een vestiging toegevoegd. Vervolgens wordt gekeken of deze vestiging goed is toegevoegt, en wordt deze weer verwijderd.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de "Mijn vestigingen" pagina zijn. 
    # Na het uitvoeren is de huidige pagina opnieuw de "Mijn vestigingen" pagina.
    # -----------------------------------------------------------------------------------------------------------------------------------------

    # Klik op het tabje "Vestigingen"
    Click Element   //*[@class='mx-name-tabPage2']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton3 btn-default')]   timeout=5

    # Klik op de knop "Nieuw"
    Click Element   //*[@class='btn mx-button mx-name-actionButton3 btn-default']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-primary')]   timeout=5

    # Vul de postcode in
    input text  //*[@class='mx-name-Postcode mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']   3011KW

    # Vul de straatnummer nog in
    input text  //*[@class='mx-name-Huisnummer mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']    3

    # Vul de straatnaam in
    input text  //*[@class='mx-name-Straatnaam mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']    Oostplein
    #input text  //*[@class='mx-name-Plaatsnaam mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']   Rotterdam

    # Select Checkbox     //*[@class='mx-name-checkBox1 mx-checkbox label-after form-group']//*[contains(@class,'col-sm-9')]//*[@type='checkbox']

    Select From List By Index   //*[@class='mx-name-SoortAdres mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']  1

    # Klik op de knop "Opslaan"
    Click Element   //*[@class='btn mx-button mx-name-actionButton1 btn-primary']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class, 'mx-grid-search-input mx-name-searchField4')]//*[contains(@class,'form-control')]  timeout=5

    # Vul hier de zoekvelden in om confirmatie te krijgen dat de zojuist aangemaakte vestiging bestaat
    input text  //*[contains(@class, 'mx-grid-search-input mx-name-searchField4')]//*[contains(@class,'form-control')]  3011KW
    input text  //*[contains(@class, 'mx-grid-search-input mx-name-searchField5')]//*[contains(@class,'form-control')]  Oostplein
    input text  //*[contains(@class, 'mx-grid-search-input mx-name-searchField6')]//*[contains(@class,'form-control')]  3

    # Klik op de knop "Zoeken"
    Click Element  //*[@class='btn mx-button btn-default mx-name-search mx-grid-search-button']  modifier=False
    Sleep   0.5

    # Klik op het eerste zoekresultaat
    Click Element  //*[@class='mx-name-index-0']  modifier=False

    # Klik op de knop "Verwijderen"
    Click Element  //*[@class='btn mx-button mx-name-actionButton5 btn-inverse']  modifier=False

    # Klik op de knop "Pagina sluiten"
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-inverse']  modifier=False
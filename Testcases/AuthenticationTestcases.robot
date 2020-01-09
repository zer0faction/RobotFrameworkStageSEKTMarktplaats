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

Testcase 1.0: Aanmelden als extern bedrijfsmedewerker met een niet bestaand account
    # Omschrijving:
    # ----------------------------------------------------------------------------------------------------------------------------------------------------------
    # Dit is een falende versie van het aanmelden als bedrijf medewerken. In deze testcase onstaan foutmeldingen die aangeven dat de logingegevens niet kloppen.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de login pagina zijn. Na het uitvoeren is de huidige pagina opnieuw de aanmeld pagina.
    # ----------------------------------------------------------------------------------------------------------------------------------------------------------

    Login As Organisation  ditiseennietbestaandaccount@faal.nl  wachtwoord12943289
    # Check of de validatie inderdaad niet klopt
    Wait Until Page Contains Element  //*[contains(@class,'alert alert-danger mx-name-validationMessage1')]  timeout=5

    # Pagina herladen
    Reload Page
    Sleep  0.5

Testcase 1.1: Aanmelden als extern bedrijfsmedewerker
    # Omschrijving:
    # -----------------------------------------------------------------------------------------
    # In deze Testcase wordt er ingelogd als extern bedrijfsmedewerker.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de login pagina zijn. 
    # Na het uitvoeren is de huidige pagina de home pagina.
    # -----------------------------------------------------------------------------------------

    Login As Organisation   g.vanmorsel@coolblue.nl     Mendix1

Testcase 4: Als willekeurig gebruiker afmelden
    # Omschrijving:
    # ---------------------------------------------------------------
    # In deze Testcase wordt er uitgelogd als willekeurige gebruiker.
    # Op het moment van het uitvoeren moet het systeem ingelogd zijn.
    # Na het uitvoeren is de huidige pagina de login pagina.
    # ---------------------------------------------------------------
    Log Out As User
    
Testcase 3.0: Navigeren naar Registeren forum
    # Omschrijving:
    # ------------------------------------------------------------------------------------------------------------------------------
    # De testcase regelt het navigeren naar de registratie pagina. 
    # De navigatie is opgesplits, omdat er ook een falende testcase versie is van het registreren van een extern bedrijfsmedewerker.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de login pagina zijn. 
    # ------------------------------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 squarebutton btn-default')]    timeout=5
    # Klik op de "Inloggen voor bedrijven" knop
    Click Element   //*[@class='btn mx-button mx-name-actionButton2 squarebutton btn-default']      modifier=False
    # Klik op de "Registreer via deze link!" knop
    Click Element       //*[@class='mx-link mx-name-actionButton2']    modifier=False

Testcase 3.1: Registreren als extern bedrijfsmedewerker: faal versie (klikt meteen op "Registreer!" knop)
    # Omschrijving:
    # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Dit is een falende versie van het registreren als bedrijf medewerken. In deze testcase onstaan foutmeldingen die aangeven dat bepaalde invoervelden nog niet zijn ingevuld.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de registratie pagina zijn. Na het uitvoeren is de huidige pagina opnieuw de registratie pagina.
    # ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element        //*[contains(@class,'mx-name-textBox1 mx-textbox form-group')]      timeout=5
    Sleep   0.5

    # Klik op de "Registreer!" knop
    click element   //*[@class='btn mx-button mx-name-actionButton1 btn-default']       modifier=False

    # Check of de er een "Dit veld is verplicht" of "This field is required" div bestaat.
    Wait Until Page Contains ELement  //*[contains(@class, 'alert alert-danger mx-validation-message')]  timeout=5

Testcase 3.2: Registreren als extern bedrijfsmedewerker
    # Omschrijving:
    # ------------------------------------------------------------------------------------------------------------------------------------------------------
    # De testcase voert het registreren als extern bedrijf medewerker uit. Alle informatie dat wordt ingevuld is nep.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de registratie pagina zijn. Na het uitvoeren is de huidige pagina de login pagina.
    # ------------------------------------------------------------------------------------------------------------------------------------------------------

    Wait Until Page Contains Element        //*[contains(@class,'mx-name-textBox1 mx-textbox form-group')]      timeout=5
    Sleep   0.5
    # Voornaam invullen
    input text      //*[contains(@class,'mx-name-textBox1 mx-textbox form-group')]//*[@class='col-sm-9']//*[@class='form-control']        Ed
    # Tussenvoegsel invullen
    input text      //*[contains(@class,'mx-name-textBox3 mx-textbox form-group')]//*[@class='col-sm-9']//*[@class='form-control']        de
    # Achternaam invullen
    input text      //*[contains(@class,'mx-name-textBox2 mx-textbox form-group')]//*[@class='col-sm-9']//*[@class='form-control']        Vreemden
    # E-mail invullen
    input text      //*[contains(@class,'mx-name-textBox4 mx-textbox form-group')]//*[@class='col-sm-9']//*[@class='form-control']        Ed@Outlook.com
    # Organisatie invullen
    input text      //*[contains(@class,'mx-name-textBox6 mx-textbox form-group')]//*[@class='col-sm-9']//*[@class='form-control']        ChatMetVreemden.nl
    # Functie invullen
    input text      //*[contains(@class,'mx-name-textBox5 mx-textbox form-group')]//*[@class='col-sm-9']//*[@class='form-control']        Leraar

    # Landnummer kiezen
    click element   id=mxui_widget_ReferenceSelector_0      modifier=False
    Wait Until Page Contains Element    //*[contains(text(),'+30 (Griekenland)')]
    click element   //*[text()='+30 (Griekenland)']       modifier=False
    # Telefoonnummer invullen
    input text      //*[contains(@class,'mx-name-textBox7 mx-textbox form-group')]//*[@class='form-control']        46123124
    # Aanhef kiezen
    click element   //*[@class='mx-radiogroup']//*[@class='radio']//*[@value='Heer']       modifier=False
    # Klik op de "Registreer!" knop
    click element   //*[@class='btn mx-button mx-name-actionButton1 btn-default']       modifier=False
    Wait Until Page Contains Element    //*[contains(@class,'btn btn-primary')]     timeout=5
    # Klik op de "OK" knop
    click element   //*[@class='btn btn-primary']       modifier=False

Testcase 2.0: Aanmelden als Avans student/medewerker met een niet bestaand account
    # Omschrijving:
    # -----------------------------------------------------------------------------------------------------------------------------------------------------------------
    # Dit is een falende versie van het aanmedlden als Avans student/medewerker. In deze testcase onstaan foutmeldingen die aangeven dat de logingegevens niet kloppen.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de login pagina zijn. Na het uitvoeren is de huidige pagina opnieuw de login pagina.
    # -----------------------------------------------------------------------------------------------------------------------------------------------------------------

    Login As Student Or Teacher Navigate To Page
    Login As Student Or Teacher Fill In Page  ditwachtwoordklopthelemaalniet

Testcase 2.1: Aanmelden als Avans student/medewerker
    # Omschrijving:
    # -----------------------------------------------------------------------------------------------
    # In deze Testcase wordt er ingelogd als Avans student/medewerker.
    # Op het moment van het uitvoeren van de testcase moet het systeem op de registratie pagina zijn. 
    # Na het uitvoeren is de huidige pagina de home pagina.
    # -----------------------------------------------------------------------------------------------

    Login As Student Or Teacher Fill In Page  ${STUDENT_PASSWORD}
    Wait Until Page Contains Element  //*[contains(@class,'mx-text mx-name-text1')]  timeout=15


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

Testcase 1: Aanmelden als extern bedrijfsmedewerker
    Login As Organisation

Testcase 2: Als willekeurig gebruiker afmelden
    Log Out As User
    
Testcase 3: Registreren als extern bedrijfsmedewerker
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 squarebutton btn-default')]    timeout=5
    # Klik op de "Inloggen voor bedrijven" knop
    Click Element   //*[@class='btn mx-button mx-name-actionButton2 squarebutton btn-default']      modifier=False
    Wait Until Page Contains Element    id=55_13    timeout=5   
    # Klik op de "Registreer via deze link!" knop
    Click Element       //*[@class='mx-link mx-name-actionButton2']    modifier=False

    Wait Until Page Contains Element        //*[contains(@class,'mx-name-textBox1 mx-textbox form-group')]      timeout=5
    # Voornaam invullen
    input text      //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Ed
    # Tussenvoegsel invullen
    input text      //*[@class='mx-name-textBox3 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        van
    # Achternaam invullen
    input text      //*[@class='mx-name-textBox2 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Vreemden
    # E-mail invullen
    input text      //*[@class='mx-name-textBox4 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Edje@Outlook.com
    # Organisatie invullen
    input text      //*[@class='mx-name-textBox6 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        ChatMetVreemden.nl
    # Functie invullen
    input text      //*[@class='mx-name-textBox5 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Werkloos

    # Landnummer kiezen
    click element   id=mxui_widget_ReferenceSelector_0      modifier=False
    Wait Until Page Contains Element    //*[contains(text(),'+30 (Griekenland)')]
    click element   //*[text()='+30 (Griekenland)']       modifier=False
    # Telefoonnummer invullen
    input text      //*[contains(@id,'53_30')]        46123124
    # Aanhef kiezen
    click element   //*[contains(@name,'53_16')]       modifier=False
    # Klik op de "Registreer!" knop
    click element   //*[@class='btn mx-button mx-name-actionButton1 btn-default']       modifier=False
    Wait Until Page Contains Element    //*[contains(@class,'btn btn-primary')]     timeout=5
    # Klik op de "OK" knop
    click element   //*[@class='btn btn-primary']       modifier=False
    Wait Until Page Contains Element       //*[contains(@type,'submit')]   timeout=5

Testcase 4: Aanmelden als Avans student/medewerker
    Login As Student Or Teacher  ${STUDENT_PASSWORD}



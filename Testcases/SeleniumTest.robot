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
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 squarebutton btn-default')]    timeout=5
    Sleep   0.5
    Click Element   //*[@class='btn mx-button mx-name-actionButton2 squarebutton btn-default']      modifier=False
    Wait Until Page Contains Element    //*[contains(@class,'form-group mx-loginidtextbox no-columns mx-name-loginIdTextBox1')]    timeout=5
    input text        //*[@class='form-group mx-loginidtextbox no-columns mx-name-loginIdTextBox1']//*[@class='form-control']  g.vanmorsel@coolblue.nl
    input text        //*[@class='form-group mx-passwordtextbox no-columns mx-name-passwordTextBox1']//*[@class='form-control']  Mendix1
    Click Element   //*[@class='btn mx-button mx-name-signInButton1 SignIn btn-default']    modifier=False

# Testcase 2: Aanmelden als Avans student/medewerker
#     Click Element   //*[@type='submit']    modifier=False
#     Wait Until Page Contains Element    //*[contains(@class,'mod-search-input active')]   timeout=5
#     input text        //*[@class='mod-search-input active']  Avans Hogeschool
#     Wait Until Page Contains Element    //*[contains(@class,'result active access focussed')]   timeout=2
#     Click Element   //*[@class='result active access focussed']    modifier=False
    
#     Wait Until Page Contains Element  id=Ecom_User_ID  timeout=5
#     input text  id=Ecom_User_ID  e.wallaard@student.avans.nl
#     input text  id=Ecom_Password  ${STUDENT_PASSWORD}
#     Click Element  id=loginButton2  modifier=False

# Testcase 3: Registreren als extern bedrijfsmedewerker
#     Click Element   id=mxui_widget_Wrapper_2    modifier=False
#     Wait Until Page Contains Element    id=55_10    timeout=5   
#     Click Element       //*[@class='mx-link mx-name-actionButton2']    modifier=False

#     Wait Until Page Contains Element        //*[contains(@class,'mx-name-textBox1 mx-textbox form-group')]      timeout=5
#     input text      //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Ed
#     input text      //*[@class='mx-name-textBox3 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        van
#     input text      //*[@class='mx-name-textBox2 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Vreemden
#     input text      //*[@class='mx-name-textBox4 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Edje@Outlook.com
#     input text      //*[@class='mx-name-textBox6 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        ChatMetVreemden.nl
#     input text      //*[@class='mx-name-textBox5 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Werkloos

#     click element   id=mxui_widget_ReferenceSelector_0      modifier=False
#     Wait Until Page Contains Element    //*[contains(text(),'+30 (Griekenland)')]
#     click element   //*[text()='+30 (Griekenland)']       modifier=False

#     input text      //*[contains(@id,'53_26')]        46123124

#     click element   //*[contains(@name,'53_12')]       modifier=False
#     click element   //*[@class='btn mx-button mx-name-actionButton1 btn-default']       modifier=False

#     Wait Until Page Contains Element    //*[contains(@class,'btn btn-primary')]     timeout=5
#     click element   //*[@class='btn btn-primary']       modifier=False

# Testcase 5: Als Technisch beheer medewerker een organisatie registratie goedkeuren/afkeuren
#     Wait Until Page Contains Element    //*[contains(@class,'mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0')]   timeout=5
#     Sleep   0.5
#     Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0']  modifier=false
#     Wait Until Page Contains Element    //*[contains(@class,'mx-link mx-name-actionButton26 nowrap')]   timeout=5
#     Click Element  //*[@class='mx-link mx-name-actionButton26 nowrap']  modifier=false
#     Wait Until Page Contains Element    id=mxui_widget_ControlBarButton_0   timeout=5
#     Click Element  //*[text()='Ed']    modifier=false
#     Click Element  id=mxui_widget_ControlBarButton_0  modifier=false
#     Wait Until Page Contains Element  //*[text()='Persoonsgegevens']  timeout=5
#     Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-default']    modifier=false

# #   Afkeuren veldje inklikken
#     Wait Until Page Contains Element    //*[@class='form-control mx-textarea-input']    timeout=5
#     input text  //*[@class='form-control mx-textarea-input']   Reden Van Afkeuren Text
#     Click Element  //*[@class='btn mx-button mx-name-actionButton3 btn-primary']    modifier=false

#     Sleep   0.5
#     Page Should Not Contain Element  //*[contains(text(),'Ed')]  timeout=5

# Testcase 6: Als extern bedrijfsmedewerker een stageopdracht aanmelden
#     Wait Until Page Contains Element    //*[contains(@class,'mx-link mx-name-actionButton9')]   timeout=5
#     Click Element  //*[@class='mx-link mx-name-actionButton9']  modifier=false

#     Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-default')]   timeout=5
#     Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=false

#     Wait Until Page Contains Element        //*[contains(@class,'mx-name-textBox2 Titel mx-textbox form-group')]      timeout=5
#     Select From List By Index   //*[@class='form-group mx-referenceselector mx-name-referenceSelector1 OpleidingNL']//*[@class='col-sm-9']//*[@class='mx-compound-control']//*[@class='form-control']   1
#     input text      //*[@class='mx-name-textBox2 Titel mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        testopdracht
#     input text      //*[@class='mx-name-textArea1 Aanleiding mx-textarea form-group']//*[@class='col-sm-9']//*[@class='form-control mx-textarea-input']        we makem een testopdracht
#     input text      //*[@class='mx-name-textArea2 OpdrachtOmschrijving mx-textarea form-group']//*[@class='col-sm-9']//*[@class='form-control mx-textarea-input']        we maken een testopdracht
#     input text      //*[@class='mx-name-textBox6 Literatuur mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        www.chatmetvreemden.nl
#     input text      //*[@class='mx-name-textArea2 Solliciteren mx-textarea form-group']//*[@class='col-sm-9']//*[@class='form-control mx-textarea-input']        diego sweet
#     input text      //*[@class='mx-name-textArea1 Opmerkingen mx-textarea form-group']//*[@class='col-sm-9']//*[@class='form-control mx-textarea-input']        wwww.chatmetvreemden.nl

#     Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-primary']  modifier=false
#     Wait Until Page Contains Element    //*[contains(@class,'btn btn-primary')]   timeout=5
#     Click Element  //*[@class='btn btn-primary']  modifier=false

# Testcase 5: Als extern bedrijfsmedewerker uw opdrachten inzien
#     Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton12 nowrap btn-default')]   timeout=5
#     Click Element  //*[@class='btn mx-button mx-name-actionButton12 nowrap btn-default']  modifier=false

#     Wait Until Page Contains Element    //*[contains(@class,'mx-grid-search-input mx-name-searchField2')]   timeout=5
#     input text      //*[@class='mx-grid-search-input mx-name-searchField2']//*[@class='form-control']        testopdracht
#     Click Element  //*[@class='btn mx-button btn-default mx-name-search mx-grid-search-button']  modifier=false

#     Sleep   0.5
#     Click Element  //*[contains(text(),'testopdracht')]     modifier=false
#     Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-default']  modifier=false

#     Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton2 btn-inverse')]   timeout=5
#     Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-1']  modifier=false

Testcase 9: Als extern bedrijfsmedewerker mijn persoonsgegevens wijzigen
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container4')]//*[contains(@class,'mx-link mx-name-actionButton1')]   timeout=5
    Click Element  //*[@class='mx-link mx-name-actionButton1']  modifier=false

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-MijnOrganisatie')]   timeout=5
#     #Click Element  //*[@class='mx-name-mijnwerkervaring']  modifier=false

#     Sleep  1.0
#     #voornaam
#     Press Keys  //*[@class='mx-name-textBox4 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       CTRL+a+BACKSPACE
#     input text  //*[@class='mx-name-textBox4 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  Gino

#     #tussenvoegsel
#     Press Keys  //*[@class='mx-name-textBox6 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       CTRL+a+BACKSPACE
#     input text  //*[@class='mx-name-textBox6 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  van

#     #achternaam
#     Press Keys  //*[@class='mx-name-textBox5 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       CTRL+a+BACKSPACE
#     input text  //*[@class='mx-name-textBox5 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  Morsel

#     #email
#     Press Keys  //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       CTRL+a+BACKSPACE
#     input text  //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  g.vanmorsel@coolblue.nl

#     #Telefoonnummer
#     Press Keys  //*[@class='mx-name-textBox2 mx-textbox form-group no-columns']//*[@class='form-control']       CTRL+a+BACKSPACE
#     input text  //*[@class='mx-name-textBox2 mx-textbox form-group no-columns']//*[@class='form-control']  677825691

#     Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=False

#     #Wacht op confirmation venster en klik die weg
#     Wait Until Page Contains Element  //*[contains(@class, 'modal-footer mx-dialog-footer')]  timeout=5
#     Click Element  //*[@class='modal-footer mx-dialog-footer']//*[@class='btn btn-primary']  modifier=False

# Testcase 3: Als extern bedrijfsmedewerker mijn werkervaringsgegevens wijzigen
#     Wait Until Page Contains Element  //*[contains(@class, 'mx-name-mijnwerkervaring')]  timeout=5
#     Sleep  1
#     Click Element  //*[@class='mx-name-mijnwerkervaring']

#     Wait Until Page Contains Element  //*[contains(text(),'Afdeling')]  timeout=5

#     #Functie
#     Press Keys    //*[@class='mx-dataview mx-name-dataView3 form-horizontal']//*[@class='mx-dataview-content']//*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
#     input text  //*[@class='mx-dataview mx-name-dataView3 form-horizontal']//*[@class='mx-dataview-content']//*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  Manager Logistiek

#     #Afdeling
#     Press Keys    //*[@class='mx-name-textBox7 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
#     input text  //*[@class='mx-name-textBox7 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']  Logistiek

#     #Datum
#     Press Keys    //*[@class='mx-name-datePicker1 mx-datepicker form-group']//*[@class='col-sm-9']//*[@class='mx-compound-control']//*[@class='form-control']        CTRL+a+BACKSPACE
#     input text  //*[@class='mx-name-datePicker1 mx-datepicker form-group']//*[@class='col-sm-9']//*[@class='mx-compound-control']//*[@class='form-control']  01-06-2016

#     Select From List By Index   //*[@class='mx-dataview mx-name-dataView3 form-horizontal']//*[@class='mx-dataview-content']//*[@class='mx-name-dropDown2 mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']  4
#     Select From List By Index   //*[@class='mx-dataview mx-name-dataView3 form-horizontal']//*[@class='mx-dataview-content']//*[@class='mx-name-dropDown3 mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']  2

#     Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=False

#     #Wacht op confirmation venster en klik die weg
#     Wait Until Page Contains Element  //*[contains(@class, 'modal-footer mx-dialog-footer')]  timeout=5
#     Click Element  //*[@class='modal-footer mx-dialog-footer']//*[@class='btn btn-primary']  modifier=False

Testcase 11: Als extern bedrijfsmedewerker mijn organisatiegegevens wijzigen
    Wait Until Page Contains Element    //*[contains(@role,'presentation')]//*[contains(@class,'mx-name-MijnOrganisatie')]   timeout=5
    Sleep   0.5
    Click Element   //*[@role='presentation']//*[@class='mx-name-MijnOrganisatie']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid')]//*[contains(@class,'btn mx-button mx-name-actionButton3 btn-default')]   timeout=5
    Sleep   0.5
    Click Element  //*[@class='mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid']//*[@class='btn mx-button mx-name-actionButton3 btn-default']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-layoutGrid4 mx-layoutgrid mx-layoutgrid-fluid')]//*[contains(@class,'btn mx-button mx-name-actionButton1 btn-default')]   timeout=5
    Sleep   0.5
    Click Element  //*[@class='mx-name-layoutGrid4 mx-layoutgrid mx-layoutgrid-fluid']//*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-textBox1 mx-textbox form-group')]//*[contains(@class,'col-sm-8')]//*[contains(@class,'form-control')]   timeout=5

    #organisatienaam
    Press Keys  //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']       CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']    Coolblue

    Select From List By Index   //*[@class='mx-name-dropDown1 mx-dropdown form-group']//*[@class='col-sm-8']//*[@class='form-control']  1

    #website
    Press Keys  //*[@class='mx-name-textBox3 mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']       CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-textBox3 mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']    http://www.coolblue.nl

    Select From List By Index   //*[@class='mx-name-dropDown2 mx-dropdown form-group']//*[@class='col-sm-8']//*[@class='form-control']      8

    #tooltip
    Press Keys  //*[@class='mx-name-textArea3 TestTooltip mx-textarea form-group']//*[@class='col-sm-8']//*[@class='form-control mx-textarea-input']       CTRL+a+BACKSPACE
    input text  //*[@class='mx-name-textArea3 TestTooltip mx-textarea form-group']//*[@class='col-sm-8']//*[@class='form-control mx-textarea-input']    Coolblue. Ooit begonnen als studentenbedrijf. Nu een snelgroeiend e-commercebedrijf met 11 fysieke winkels in Nederland en België. Sinds onze oprichting in 1999 hebben we maar één doel: jou blij maken. We geven advies met verstand van zaken en we hebben een obsessieve focus op klanttevredenheid. Met meer dan 3.000 Coolblue'ers werken we keihard om onze klanten te verwonderen.

    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'mx-name-tabPage2')]   timeout=5
    Click Element   //*[@class='mx-name-tabPage2']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton3 btn-default')]   timeout=5
    Click Element   //*[@class='btn mx-button mx-name-actionButton3 btn-default']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-primary')]   timeout=5
    input text  //*[@class='mx-name-textBox12 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']   3011KW
    input text  //*[@class='mx-name-textBox9 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']    3
    input text  //*[@class='mx-name-textBox8 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']    Oostplein
    #input text  //*[@class='mx-name-textBox11 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']   Rotterdam

    # Select Checkbox     //*[@class='mx-name-checkBox1 mx-checkbox label-after form-group']//*[contains(@class,'col-sm-9')]//*[@type='checkbox']
    Click Element   //*[@class='btn mx-button mx-name-actionButton1 btn-primary']  modifier=False

    Wait Until Page Contains Element    //*[contains(@class, 'mx-grid-search-input mx-name-searchField4')]//*[contains(@class,'form-control')]  timeout=5
    input text  //*[contains(@class, 'mx-grid-search-input mx-name-searchField4')]//*[contains(@class,'form-control')]  3011KW
    input text  //*[contains(@class, 'mx-grid-search-input mx-name-searchField5')]//*[contains(@class,'form-control')]  Oostplein
    input text  //*[contains(@class, 'mx-grid-search-input mx-name-searchField6')]//*[contains(@class,'form-control')]  3

    Click Element  //*[@class='btn mx-button btn-default mx-name-search mx-grid-search-button']  modifier=False
    Sleep   1
    Click Element  //*[@class='mx-name-index-0']  modifier=False

    Click Element  //*[@class='btn mx-button mx-name-actionButton5 btn-inverse']  modifier=False
    Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-inverse']  modifier=False

# Testcase 14: Als Avans medewerker een organisatie toevoegen
#     Wait Until Page Contains Element    //*[contains(@class,'mx-name-container26 card cardaction col-center ClickableContainer')]   timeout=5
#     Click Element  //*[@class='mx-name-container26 card cardaction col-center ClickableContainer']    modifier=false
#     Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton6 btn-default')]   timeout=5
#     Click Element  //*[@class='btn mx-button mx-name-actionButton6 btn-default']    modifier=false

#     Wait Until Page Contains Element        //*[contains(@class,'mx-name-textBox1 mx-textbox form-group')]      timeout=5
#     input text      //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        chatmetvreemden.nl
#     Select From List By Index   //*[@class='mx-name-dropDown1 mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']   1
#     Select From List By Index   //*[@class='form-group mx-referenceselector mx-name-referenceSelector1']//*[@class='col-sm-9']//*[@class='mx-compound-control']//*[@class='form-control']   1
#     input text      //*[@class='mx-name-textBox3 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        wwww.chatmetvreemden.nl
#     Select From List By Index   //*[@class='mx-name-dropDown2 mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']      4
#     input text      //*[@class='mx-name-textArea3 TestTooltip mx-textarea form-group']//*[@class='col-sm-9']//*[@class='form-control mx-textarea-input']      Chat met vreemdem!

#     input text      //*[@class='mx-dataview mx-name-dataView2 form-horizontal']//*[@class='mx-dataview-content']//*[@class='mx-name-textBox12 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        7821 AD
#     input text      //*[@class='mx-dataview mx-name-dataView2 form-horizontal']//*[@class='mx-dataview-content']//*[@class='mx-name-textBox9 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        110
#     input text      //*[@class='mx-dataview mx-name-dataView2 form-horizontal']//*[@class='mx-dataview-content']//*[@class='mx-name-textBox8 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Jules Verneweg
#     input text      //*[@class='mx-dataview mx-name-dataView2 form-horizontal']//*[@class='mx-dataview-content']//*[@class='mx-name-textBox11 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       Emmen
#     Select From List By Index   //*[@class='mx-dataview mx-name-dataView2 form-horizontal']//*[@class='mx-dataview-content']//*[@class='mx-name-dropDown1 mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']      1

#     Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-primary']    modifier=false
#     Wait Until Page Contains Element    //*[contains(@class,'mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0')]   timeout=5
#     Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0']    modifier=false

# Testcase 15: Als Avans medewerker een organisatie aanpassen
#     Wait Until Page Contains Element    //*[contains(@class,'mx-name-container26 card cardaction col-center ClickableContainer')]   timeout=5
#     Click Element  //*[@class='mx-name-container26 card cardaction col-center ClickableContainer']    modifier=false
#     Wait Until Page Contains Element    //*[contains(@class,'widget-text-box-search mx-name-textBoxSearch1 ')]   timeout=5
#     input text      //*[@class='widget-text-box-search mx-name-textBoxSearch1 ']//*[@class='search-bar']//*[@class='form-control']        chatmetvreemden
#     Sleep   1

#     Wait Until Page Contains Element    //*[contains(@class,'mx-name-container8 cardOrganisation')]   timeout=5
#     Click Element  //*[@class='mx-name-container7 card']//*[@class='mx-name-container8 cardOrganisation']    modifier=false
#     Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-default')]   timeout=5
#     Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']    modifier=false
    
#     Wait Until Page Contains Element    //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']      timeout=5
    
#     Press Keys    //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']        CTRL+a+BACKSPACE
#     input text    //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']        chatmetvreemden.com

#     Select From List By Index   //*[@class='mx-name-dropDown1 mx-dropdown form-group']//*[@class='col-sm-8']//*[@class='form-control']   4      
#     # Select From List By Index   //*[@class='form-group mx-referenceselector mx-name-referenceSelector1']//*[@class='col-sm-8']//*[@class='mx-compound-control']//*[@class='form-control']   7

#     Press Keys    //*[@class='mx-name-textBox3 mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']        CTRL+a+BACKSPACE
#     input text    //*[@class='mx-name-textBox3 mx-textbox form-group']//*[@class='col-sm-8']//*[@class='form-control']        wwww.chatmetvreemden.com

#     Select From List By Index   //*[@class='mx-name-dropDown2 mx-dropdown form-group']//*[@class='col-sm-8']//*[@class='form-control']      5
#     Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']    modifier=false

#     Wait Until Page Contains Element    //*[contains(@class,'mx-name-tabPage2')]   timeout=5
#     Click Element   //*[@class='mx-name-tabPage2']    modifier=false
#     Wait Until Page Contains Element    //*[contains(@class,'mx-name-index-0')]   timeout=5
#     Click Element   //*[contains(@class,'mx-name-index-0')]    modifier=false
#     Click Element   id=mxui_widget_ControlBarButton_1    modifier=false

#     Wait Until Page Contains Element        //*[contains(@class,'mx-name-textBox12 mx-textbox form-group')]      timeout=5
    
#     Press Keys    //*[@class='mx-name-textBox12 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
#     input text      //*[@class='mx-name-textBox12 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       4761 BK     True
    
#     Press Keys    //*[@class='mx-name-textBox9 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE 
#     input text      //*[@class='mx-name-textBox9 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       1        True

#     Press Keys    //*[@class='mx-name-textBox8 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE 
#     input text      //*[@class='mx-name-textBox8 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       IJshof       True

#     Press Keys    //*[@class='mx-name-textBox11 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        CTRL+a+BACKSPACE
#     input text      //*[@class='mx-name-textBox11 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']       Zevenbergen     True

#     Select From List By Index   //*[@class='mx-name-dropDown1 mx-dropdown form-group']//*[@class='col-sm-9']//*[@class='form-control']      1

#     Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-primary']    modifier=false
#     Wait Until Page Contains Element    //*[contains(@class,'mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0')]   timeout=5
#     Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0']    modifier=false
#     Sleep   0.5

# Testcase 16: Als admin een organisatie verwijderen
#     Wait Until Page Contains Element    //*[contains(@class,'mx-name-container26 card cardaction col-center ClickableContainer')]   timeout=5
#     Click Element  //*[@class='mx-name-container26 card cardaction col-center ClickableContainer']    modifier=false
#     Wait Until Page Contains Element    //*[contains(@class,'widget-text-box-search mx-name-textBoxSearch1 ')]   timeout=5
#     input text      //*[@class='widget-text-box-search mx-name-textBoxSearch1 ']//*[@class='search-bar']//*[@class='form-control']        chatmetvreemden
#     Sleep   1

#     Wait Until Page Contains Element    //*[contains(@class,'mx-name-container8 cardOrganisation')]   timeout=5
#     Click Element  //*[@class='mx-name-container7 card']//*[@class='mx-name-container8 cardOrganisation']    modifier=false
#     Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton11 btn-danger')]   timeout=5
#     Click Element  //*[@class='btn mx-button mx-name-actionButton11 btn-danger']    modifier=false

#     Wait Until Page Contains Element    //*[contains(@class,'btn btn-primary')]   timeout=5
#     Click Element  //*[@class='btn btn-primary']    modifier=false

#     Wait Until Page Contains Element    //*[contains(@class,'mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0')]   timeout=5
#     Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0']    modifier=false
#     Sleep   0.5

# Testcase 18: Als willekeurig gebruiker de taal wijzigen
#     #Op instellingen klikken
#     Wait Until Page Contains Element  //*[contains(@class,'mx-link mx-name-actionButton2')]  timeout=5
#     Click Element  //*[@class='mx-link mx-name-actionButton2']  modifier=False

#     #Op "Taal wijzigen..." klikken
#     Wait Until Page Contains Element  //*[contains(@class,'mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid')]//*[contains(@class,'row')]//*[contains(@class,'col-md-9')]  timeout=5
#     Sleep   1.0
#     Click Element  //*[@class='mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid']//*[@class='row']//*[contains(@class,'col-md-9')]//*[@class='mx-link mx-name-actionButton2']    modifier=False

#     #Check of het nu Engels is
#     Wait Until Page Contains Element  //*[contains(text(),'Avans Marketplace')]

#     #Terugzetten naar Nederlands
#     Wait Until Page Contains Element  //*[contains(@class,'mx-link mx-name-actionButton2')]  timeout=5
#     Click Element  //*[@class='mx-link mx-name-actionButton2']  modifier=False

#     Wait Until Page Contains Element  //*[contains(@class,'mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid')]//*[contains(@class,'row')]//*[contains(@class,'col-md-9')]  timeout=5
#     Sleep   1.0
#     Click Element  //*[@class='mx-name-layoutGrid2 mx-layoutgrid mx-layoutgrid-fluid']//*[@class='row']//*[contains(@class,'col-md-9')]//*[@class='mx-link mx-name-actionButton1']    modifier=False

#     Wait Until Page Contains Element  //*[contains(text(),'Avans marktplaats')]

# Testcase 27: Als student een opdracht zoeken
#     Wait Until Page Contains Element  //*[@class='mx-text mx-name-text1']  timeout=5
#     Sleep  0.5
#     input text  //*[contains(@placeholder,'...')]  Broed
#     Wait Until Page Contains Element  //*[contains(@id, 'mxui_widget_ListViewItem')]  timeout=5
#     Click Element  //*[contains(@id, 'mxui_widget_ListViewItem')]  modifier=False

# Testcase 28: Als student inschrijven voor een opdracht
#     Wait Until Page Contains Element  //*[@class='btn mx-button mx-name-actionButton2 btn-info']  timeout=5
#     Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-info']  modifier=False

#     #Popup verschijnt die aangeeft dat er is ingeschreven.
#     Wait Until Page Contains Element  //*[contains(text(),'Informatie')]
#     Click Element  //*[@class='btn btn-primary']  modifier=False

# Testcase 29: Als student mijn inschrijvingen bekijken
#     # Mijn inschrijvingen button
#     Wait Until Page Contains Element  //*[@class='mx-link mx-name-actionButton5']  timeout=5
#     Click Element  //*[@class='mx-link mx-name-actionButton5']  modifier=False

#     #Kijken of de broed opdracht staat ingeschreven
#     Wait Until Page Contains Element  //*[contains(text(),'Broed')]  timeout=5

# Testcase 30: Als student uitschrijven voor een opdracht
#     Wait Until Page Contains Element  //*[contains(@class, 'btn mx-button mx-name-actionButton2 pull-right btn-inverse')]  timeout=5
#     Sleep   30
#     Page Should Not Contain  //*[contains(@class, 'mx-listview-empty')]
#     Sleep   30
#     Click Element  //*[@class='btn mx-button mx-name-actionButton2 pull-right btn-inverse']  modifier=False
#     Sleep   30
#     #Bevestegingspopup verschijnt
#     Wait Until Page Contains Element  //*[contains(@class,'btn btn-primary')]  timeout=5
#     Sleep   30
#     Click Element  //*[@class='btn btn-primary']  modifier=False

#     #Terug naar mijn inschrijvingen om te kijken of er ook echt uitgeschreven is
#     Wait Until Page Contains Element  //*[contains(@class, 'mx-link mx-name-actionButton5')]  timeout=5
#     Sleep   3    
#     Click Element  //*[@class='mx-link mx-name-actionButton5']  modifier=False
#     Sleep   3
#     Wait Until Page Contains Element  //*[@class='mx-listview-empty']  timeout=5

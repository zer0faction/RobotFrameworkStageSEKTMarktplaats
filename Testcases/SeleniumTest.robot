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

${CURSUS_NAAM}       Dit Is Een Cursus Naam

*** Test Cases ***
Testcase 0: Site bezoeken
    Open Browser On Local Machine  ${TEST_URL}  ${BROWSER}
    Wait Until Page Contains Element    id=mxui_widget_Wrapper_2    timeout=5

# Testcase 1: Aanmelden als extern bedrijfsmedewerker
#     Click Element   id=mxui_widget_Wrapper_2    modifier=False
#     Wait Until Page Contains Element    id=55_10    timeout=5
#     input text        id=55_10  gijs@avans.nl
#     input text        id=55_11  Welkom123
#     Click Element   id=mxui_widget_LoginButton_0    modifier=False
#     Wait Until Page Contains Element    //*[contains(@class,'mx-link mx-name-actionButton3')]   timeout=5

# Testcase 2: Aanmelden als Avans student/medewerker 
#     Click Element   //*[@type'submit']    modifier=False
#     Wait Until Page Contains Element    //*[contains(@class,'mod-search-input active')]   timeout=5
#     input text        //*[@class='mod-search-input active']  Avans Hogeschool
#     Wait Until Page Contains Element    //*[contains(@class,'result active access focussed')]   timeout=2
#     Click Element   //*[@class='result active access focussed']    modifier=False 

#     Click Element  id=loginButton2  modifier=False  

Opdracht 3: Registreren als extern bedrijfsmedewerker
    Click Element   id=mxui_widget_Wrapper_2    modifier=False
    Wait Until Page Contains Element    id=55_10    timeout=5   
    Click Element       //*[@class='mx-link mx-name-actionButton2']    modifier=False

    Wait Until Page Contains Element        //*[contains(@class,'mx-name-textBox1 mx-textbox form-group')]      timeout=5
    input text      //*[@class='mx-name-textBox1 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Ed
    input text      //*[@class='mx-name-textBox3 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        van
    input text      //*[@class='mx-name-textBox2 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Vreemden
    input text      //*[@class='mx-name-textBox4 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Edje@Outlook.com
    input text      //*[@class='mx-name-textBox6 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        ChatMetVreemden.nl
    input text      //*[@class='mx-name-textBox5 mx-textbox form-group']//*[@class='col-sm-9']//*[@class='form-control']        Werkloos

    click element   id=mxui_widget_ReferenceSelector_0      modifier=False
    Wait Until Page Contains Element    //*[contains(text(),'+30 (Griekenland)')]
    click element   //*[text()='+30 (Griekenland)']       modifier=False

    input text      //*[contains(@id,'53_26')]        46123124

    click element   //*[contains(@name,'53_12')]       modifier=False
    click element   //*[@class='btn mx-button mx-name-actionButton1 btn-default']       modifier=False

# Testcase 4: Als Technisch beheer medewerker een organisatie registratie goedkeuren/afkeuren
#     Click Element  //*[@class='mx-name-159b6aef-dbc3-5b23-a735-cf99f8341771-0']  modifier=false
#     Click Element  //*[@class='mx-link mx-name-actionButton26 nowrap']  modifier=false
#     Wait Until Page Contains Element    id=mxui_widget_ControlBarButton_0   timeout=5
#     Click Element  //*[text()='Ed']    modifier=false
#     Click Element  id=mxui_widget_ControlBarButton_0  modifier=false
#     Wait Until Page Contains Element  //*[text()='Persoonsgegevens']  timeout=5
#     Click Element  //*[@class='btn mx-button mx-name-actionButton2 btn-default']    modifier=false

# #   Afkeuren veldje inklikken
#     input text  //*[@class='form-control mx-textarea-input']   Reden Van Afkeuren Text
#     Click Element  //*[@class='btn mx-button mx-name-actionButton3 btn-primary']    modifier=false

#     Page Should Not Contain Element  //*[contains(text(),'Ed')]  timeout=5

# Opdracht 4: Maak een nieuwe training aan
#     Wait Until Page Contains Element    id=maxParticipants                   timeout=5

#     input text        id=trainingName     fietsen
#     input text        id=maxParticipants     2
#     input text        id=trainerName     piet
#     input text        id=trainerEmail     piet@hotmail.com
#     input text        id=trainingDescription     leren fietsen

#     Select From List By Index   id=selectAttitude   0
#     Select From List By Index   id=functieniveau   0
#     Select From List By Index   id=passingCriteria   0
#     Select From List By Index   id=status   0

#     Click Element   id=setDefaultDate   modifier=False
#     Click Element   id=save   modifier=False

# Opdracht 5: Meld je aan voor de training die je net hebt gemaakt
#     Wait Until Page Contains Element    id=aanmelden                   timeout=5
#     Click Element   id=aanmelden   modifier=False
#     Sleep   0.5
#     Wait Until Page Contains Element    id=ja                   timeout=5
#     Click Element   id=ja   modifier=False
#     Click Element   id=terug   modifier=False

# Opdracht 6: Controleer of de aangemaakte training in de lijst van trainingen terugkomt
#     Wait Until Page Contains Element    id=create                   timeout=5
#     Wait Until Page Contains Element    //*[contains(text(),'fietsen')]  timeout=5
#     Click Element   //*[contains(text(),'fietsen')]
#     Sleep   0.5

# Opdracht 7: Controleer de details pagina van de aangemaakte training
#     Click ELement   id=goToTrainingDetails
#     Wait Until Page Contains Element    id=aanmelden                   timeout=5
#     Click ELement   id=terug

# Opdracht 8: Verwijder de aangemaakte training
#     Wait Until Page Contains Element    id=create                   timeout=5
#     Wait Until Page Contains Element    //*[contains(text(),'fietsen')]  timeout=5
#     Click Element   //*[contains(text(),'fietsen')]
#     Sleep   0.5
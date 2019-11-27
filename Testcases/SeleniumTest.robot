*** Settings ***
Resource             ../Keywords/SeleniumKeywords.robot
Suite Teardown       Close All Browsers
Documentation        Keyword documentation: https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html
...
...                  Kijk goed of er keywords zijn die je kan gebruiken in de Keywords/SeleniumKeywords.robot file

*** Variable ***
${SELENIUM_DELAY}    0
${TEST_URL}          https://avansmarktplaats-test.mendixcloud.com/index.html

@{BROWSERS}          chrome     IE

${CURSUS_NAAM}       Dit Is Een Cursus Naam

*** Test Cases ***
#Opdracht 0: Google Test
    # Als deze test werkt dan werkt RobotFramework goed. Verwijder deze als je begint.
    #Open Browser On Local Machine       https://www.google.com
    #Wait Until Page Contains Element    name=q                    timeout=5

# Testcase 1: Aanmelden als extern bedrijfsmedewerker
#     :FOR  ${browser}  IN    @{BROWSERS}  
#     \  log to console  call keyword that does your test with ${browser}
#     \   Open Browser On Local Machine  ${TEST_URL}  ${browser}

#     \   Wait Until Page Contains Element    id=mxui_widget_Wrapper_2    timeout=5
#     \   Click Element   id=mxui_widget_Wrapper_2    modifier=False
    
#     \   Wait Until Page Contains Element    id=55_10    timeout=5
#     \   input text        id=55_10  gijs@avans.nl
#     \   input text        id=55_11  Welkom123

#     \   Click Element   id=mxui_widget_LoginButton_0    modifier=False
#     \   Wait Until Page Contains Element    //*[contains(@class,'mx-link mx-name-actionButton3')]   timeout=5

Testcase 2: Aanmelden als Avans student/medewerker
    :FOR  ${browser}  IN    @{BROWSERS}  
    \   log to console  call keyword that does your test with ${browser}
    \   Open Browser On Local Machine  ${TEST_URL}  ${browser}
njnu
    \   Wait Until Page Contains Element    id=mxui_widget_Wrapper_2    timeout=5
    \   Click Element   //*[contains(@type,'submit')]    modifier=False
    \   ${Result} =   Page Should Contain Element  //*[contains(text(),'Avans Hogeschool (new test)')]      timeout=5  
    \   log to console  result is ${Result}
    \   Run Keyword If    '${RESULT}'=='PASS'   Click Element   //*[contains(@class,'result active')]    modifier=False
    \   ...                ELSE     Click Element   //*[contains(@class,'result active access')]    modifier=False

# Opdracht 3: Open het scherm om een nieuwe training aan te maken
#     Wait Until Page Contains Element    id=create                   timeout=5
#     Click Element   id=create   modifier=False

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

#     Click ELement   //*[contains(text(),'Verwijderen')]
#     Sleep   0.5
#     Wait Until Page Contains Element    id=yesImSure                   timeout=5

# Opdracht 9: Test de logout functionaliteit
#     Wait Until Page Contains Element    id=logout  timeout=5
#     Click Element   id=logout    modifier=False
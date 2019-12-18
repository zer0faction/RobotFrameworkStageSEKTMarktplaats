*** Settings ***
Library    SeleniumLibrary      run_on_failure=Nothing

*** Keywords ***
Open Browser On Local Machine
    [Arguments]                         ${URL}                                                       ${BROWSER}                                                   
    Set Selenium Speed                  ${SELENIUM_DELAY}
    Open Browser                        ${URL}                                                       ${BROWSER} 

Login As Organisation
    [Arguments]                         ${EMPLOYEE_USERNAME}                                         ${EMPLOYEE_PASSWORD}
    # Klik op de "Inloggen voor bedrijven" knop
    Click Element   //*[@class='btn mx-button mx-name-actionButton2 squarebutton btn-default']      modifier=False
    Wait Until Page Contains Element    //*[contains(@class,'form-group mx-loginidtextbox no-columns mx-name-loginIdTextBox1')]    timeout=5
    # Gebruikersnaam invullen
    input text        //*[@class='form-group mx-loginidtextbox no-columns mx-name-loginIdTextBox1']//*[@class='form-control']  ${EMPLOYEE_USERNAME}
    # Wachtwoord invullen
    input text        //*[@class='form-group mx-passwordtextbox no-columns mx-name-passwordTextBox1']//*[@class='form-control']  ${EMPLOYEE_PASSWORD}
    # Klik op de "Aanmelden" knop
    Click Element       id=mxui_widget_LoginButton_0    modifier=False

Login As Student Or Teacher Navigate To Page
    # Klik op de "Inloggen voor studenten en medewerkers" knop
    Sleep   0.5
    Click Element   //*[@type='submit']    modifier=False
    Wait Until Page Contains Element    //*[contains(@class,'mod-search-input active')]   timeout=5
    # Naam van instelling invullen
    input text        //*[@class='mod-search-input active']  Avans Hogeschool
    Wait Until Page Contains Element    //*[contains(@class,'result active access focussed')]   timeout=2
    # Instelling kiezen
    Click Element   //*[@class='result active access focussed']    modifier=False

Login As Student Or Teacher Fill In Page
    [Arguments]                         ${STUDENT_PASSWORD}
    Wait Until Page Contains Element  id=Ecom_User_ID  timeout=5
    # Gebruikersnaam invullen
    input text  id=Ecom_User_ID  ewallaar
    # Wachtwoord invullen
    input text  id=Ecom_Password  ${STUDENT_PASSWORD}
    # Klik op de "Sign in" knop
    Click Element  id=loginButton2  modifier=False

Log Out As User
    Wait Until Page Contains Element  //*[contains(@class,'mx-link mx-name-actionButton3')]  timeout=5
    Sleep   0.5
    Click Element  //*[@class='mx-link mx-name-actionButton3']  modifier=false

As External Employee Navigate To Assignment Form
    Sleep  2.0

    # Klik op de "Meld uw opdracht direct aan" link
    Wait Until Page Contains Element    //*[contains(@class,'mx-link mx-name-actionButton9')]   timeout=5
    Click Element  //*[@class='mx-link mx-name-actionButton9']  modifier=false

    # Klik op de "Volgende" knop
    Wait Until Page Contains Element    //*[contains(@class,'btn mx-button mx-name-actionButton1 btn-default')]   timeout=5
    Sleep   0.5
    Click Element  //*[@class='btn mx-button mx-name-actionButton1 btn-default']    modifier=false

As External Employee Go To My Details
    # Klik boven op de knop "Mijn gegevens"
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container4')]//*[contains(@class,'mx-link mx-name-actionButton1')]   timeout=5
    Click Element  //*[@class='mx-link mx-name-actionButton1']  modifier=false
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-MijnOrganisatie')]   timeout=5

As External Employee Go To My Work Experience
    # Klik boven op de knop "Mijn gegevens"
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-container4')]//*[contains(@class,'mx-link mx-name-actionButton1')]   timeout=5
    Click Element  //*[@class='mx-link mx-name-actionButton1']  modifier=false
    Wait Until Page Contains Element    //*[contains(@class,'mx-name-MijnOrganisatie')]   timeout=5

    # Klik op de het tabje "Mijn werkervaring"
    Wait Until Page Contains Element  //*[contains(@class, 'mx-name-mijnwerkervaring')]  timeout=5
    Sleep   0.5
    Click Element  //*[@class='mx-name-mijnwerkervaring']
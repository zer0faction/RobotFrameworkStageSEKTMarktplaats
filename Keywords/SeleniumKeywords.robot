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
    input text        id=55_13  ${EMPLOYEE_USERNAME}
    # Wachtwoord invullen
    input text        id=55_14  ${EMPLOYEE_PASSWORD}
    # Klik op de "Aanmelden" knop
    Click Element       id=mxui_widget_LoginButton_0    modifier=False

Login As Student Or Teacher
    [Arguments]                         ${STUDENT_PASSWORD}
    # Klik op de "Inloggen voor studenten en medewerkers" knop
    Sleep   0.5
    Click Element   //*[@type='submit']    modifier=False
    Wait Until Page Contains Element    //*[contains(@class,'mod-search-input active')]   timeout=5
    # Naam van instelling invullen
    input text        //*[@class='mod-search-input active']  Avans Hogeschool
    Wait Until Page Contains Element    //*[contains(@class,'result active access focussed')]   timeout=2
    # Instelling kiezen
    Click Element   //*[@class='result active access focussed']    modifier=False
    
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
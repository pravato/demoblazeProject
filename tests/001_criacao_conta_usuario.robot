*** Settings ***
Documentation     Cenário de teste contendo a criação da conta na DemoBlaze
Library           SeleniumLibrary
Library           ../resources/FakerLibrary.py

*** Test Cases ***
Cenário: Criação da conta de usuário em www.demoblaze.com
    Given que eu acesso "https://www.demoblaze.com"
    When eu crio uma conta válida
    Then eu vejo a confirmação

*** Keywords ***
que eu acesso "${URL}"
    Open Browser    about:blank    Chrome
    Go To    ${URL}

eu crio uma conta válida
    Click Element    signin2
    Wait Until Element Is Visible    signInModal
    Sleep    1
    ${username}=    Get Fake Username
    Set Global Variable    ${username}
    Input Text    sign-username     ${username}
    ${password}=    Get Fake Password
    Set Global Variable    ${password}
    Input Password    sign-password    ${password}
    Click Button    xpath=//button[contains(.,'Sign up')]
    Capture Page Screenshot
    Log    Criada a nova conta utilizando o username: ${username} e a password: ${password}
    
eu vejo a confirmação
    Alert Should Be Present     Sign up successful.
    Close Browser
*** Settings ***
Documentation     Cenário de teste contendo o fluxo completo de compras na DemoBlaze
Library           SeleniumLibrary
Library           ../resources/FakerLibrary.py

*** Test Cases ***
Cenário: Fluxo de Compras em www.demoblaze.com
    Given que eu faço login "https://www.demoblaze.com"
    When eu realizo uma compra com 3 produtos
    Then eu vejo a confirmação da compra

*** Keywords ***
que eu faço login "${URL}"
    Open Browser    about:blank    Chrome
    Go To    ${URL}
    Click Element    login2
    Wait Until Element Is Visible    logInModal
    Sleep    1
    Input Text    loginusername    ${username}
    Input Password    loginpassword    ${password}
    Click Button    //button[contains(.,'Log in')]
    Wait Until Element Is Visible    nameofuser
    Log    Novo login na DemoBlaze utilizando o username: ${username}

eu realizo uma compra com 3 produtos
    Click Link    prod.html?idp_=1
    Wait Until Element Is Visible    xpath=//a[contains(.,'Add to cart')]
    Click Element    //a[@href='#'][contains(.,'Add to cart')]
    Alert Should Be Present     Product added.
    Click Element    //a[contains(.,'Home (current)')]
    Sleep    1
    Wait Until Element Is Visible    cat
    Click Link    prod.html?idp_=2
    Wait Until Element Is Visible    xpath=//a[contains(.,'Add to cart')]
    Click Element    xpath=//a[@href='#'][contains(.,'Add to cart')]
    Alert Should Be Present     Product added.
    Click Element    //a[contains(.,'Home (current)')]
    Sleep    1
    Wait Until Element Is Visible    cat
    Click Link    prod.html?idp_=3
    Wait Until Element Is Visible    xpath=//a[contains(.,'Add to cart')]
    Click Element    xpath=//a[@href='#'][contains(.,'Add to cart')]
    Alert Should Be Present     Product added.
    Click Element    //a[contains(.,'Cart')]
    Wait Until Element Is Visible    xpath=//button[contains(.,'Place Order')]
    Sleep    1
    Capture Page Screenshot
    Click Button    xpath=//button[contains(.,'Place Order')]
    Wait Until Element Is Visible    orderModalLabel
    ${name}=    Get Fake Name
    Input Text    name    ${name}
    ${country}=     Get Fake Country
    Input Text    country    ${country}
    ${city}=    Get Fake City
    Input Text    city    ${city}
    ${card}=    Get Fake Card
    Input Text    card    ${card}
    ${month}=   Get Fake Month
    Input Text    month    ${month}
    ${year}=    Get Fake Year
    Input Text    year    ${year}
    Capture Page Screenshot
    Click Button    //button[contains(.,'Purchase')]

eu vejo a confirmação da compra
    Wait Until Element Is Visible    xpath=//button[@class='confirm btn btn-lg btn-primary'][contains(.,'OK')]
    Capture Page Screenshot
    Close Browser
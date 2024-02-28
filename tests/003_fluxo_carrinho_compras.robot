*** Settings ***
Documentation     Cenário de teste contendo o fluxo do carrinho de compras na DemoBlaze
Library           SeleniumLibrary

*** Test Cases ***
Cenário: Fluxo de Compras em www.demoblaze.com
    Given que eu faço login "https://www.demoblaze.com"
    When eu coloco 3 produtos no carrinho e removo o monitor
    Then eu vejo o carrinho de compras com apenas 2 produtos

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

eu coloco 3 produtos no carrinho e removo o monitor
    Click Link    prod.html?idp_=1
    Wait Until Element Is Visible    xpath=//a[contains(.,'Add to cart')]
    Click Element    //a[@href='#'][contains(.,'Add to cart')]
    Alert Should Be Present     Product added.
    Click Element    //a[contains(.,'Home (current)')]
    Sleep    1
    Wait Until Element Is Visible    cat
    Click Element    xpath=//a[@href='#'][contains(.,'Monitors')]
    Wait Until Element Is Visible    cat
    Sleep    1
    Click Link    prod.html?idp_=10
    Wait Until Element Is Visible    xpath=//a[contains(.,'Add to cart')]
    Click Element    xpath=//a[@href='#'][contains(.,'Add to cart')]
    Alert Should Be Present     Product added.
    Click Element    //a[contains(.,'Home (current)')]
    Sleep    1
    Wait Until Element Is Visible    cat
    Click Element    xpath=//a[@href='#'][contains(.,'Laptops')]
    Wait Until Element Is Visible    cat
    Click Link    prod.html?idp_=8
    Wait Until Element Is Visible    xpath=//a[contains(.,'Add to cart')]
    Click Element    xpath=//a[@href='#'][contains(.,'Add to cart')]
    Alert Should Be Present     Product added.
    Click Element    //a[contains(.,'Cart')]
    Wait Until Element Is Visible    xpath=//button[contains(.,'Place Order')]
    Sleep    1
    Capture Page Screenshot
    Click Element    xpath=//tr[contains(.,'monitor')]//a[contains(text(),'Delete')]
    Sleep    1
    Wait Until Element Is Visible    totalp
    Reload Page
    Page Should Not Contain    monitor

eu vejo o carrinho de compras com apenas 2 produtos
    Wait Until Element Is Visible    totalp
    Sleep    1
    Capture Page Screenshot
    Close Browser
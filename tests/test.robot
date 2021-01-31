*** Settings ***
Library        SeleniumLibrary

*** Variables ***

*** Test Cases ***

LoginTest user1
    [Documentation]        This is login test
    Open Browser           https://www.saucedemo.com/index.html    chrome
    Input Text             id=user-name       standard_user
    Input Password         id=password        secret_sauce 
    Click Button           id=login-button
    ${var}    Get Location
    Run Keyword If    """${var}"""=="""https://www.saucedemo.com/inventory.html"""    Test Keyword 3     ELSE    Test Keyword 4
    
    
Add products to cart for user1  
    ${items}=    Get Element Count    xpath://*[@class="inventory_list"]/div
    FOR     ${cpt}    IN RANGE    ${items}
    Click Button           ADD TO CART 
    END
    
Acces au panier user1
    Click Element           xpath://*[@id="shopping_cart_container"]/a/span
    
      
Verification panier user1
    ${nb_pdt}=    Get Text    xpath://*[@id="shopping_cart_container"]/a/span
    Run Keyword If    ${nb_pdt}==6    Test Keyword 1    ELSE    Test Keyword 2

LoginTest user2
    [Documentation]    This is login test
    Open Browser      https://www.saucedemo.com/index.html    chrome
    Input Text        id=user-name       locked_out_user
    Input Password    id=password        secret_sauce 
    Click Button      id=login-button
    
    ${var}    Get Location
    Run Keyword If    """${var}"""=="""https://www.saucedemo.com/inventory.html"""    Test Keyword 3     ELSE    Test Keyword 4
   
    

LoginTest user3
    [Documentation]    This is login test
    Open Browser      https://www.saucedemo.com/index.html    chrome
    Input Text        id=user-name       problem_user
    Input Password    id=password        secret_sauce 
    Click Button      id=login-button
    
    ${var}    Get Location
    Run Keyword If    """${var}"""=="""https://www.saucedemo.com/inventory.html"""    Test Keyword 3     ELSE    Test Keyword 4
    
Add products to cart for user3 
    ${items}=    Get Element Count    xpath://*[@class="inventory_list"]/div
    FOR     ${cpt}    IN RANGE    ${items}
    Click Button    ADD TO CART 
    END
    
Acces au panier user3
    Click Element           xpath://*[@id="shopping_cart_container"]/a/span
    
Verification panier user3
    ${nb_pdt}=    Get Text    xpath://*[@id="shopping_cart_container"]/a/span
    Run Keyword If    ${nb_pdt}==6    Test Keyword 1    ELSE    Test Keyword 2
    
LoginTest user4
    [Documentation]    This is login test
    Open Browser    https://www.saucedemo.com/index.html    chrome
    Input Text        id=user-name       performance_glitch_user
    Input Password    id=password        secret_sauce 
    Click Button      id=login-button
    
    ${var}    Get Location
    Run Keyword If    """${var}"""=="""https://www.saucedemo.com/inventory.html"""    Test Keyword 3     ELSE    Test Keyword 4
  
Add products to cart for user4
    ${items}=    Get Element Count    xpath://*[@class="inventory_list"]/div
    FOR     ${cpt}    IN RANGE    ${items}
    Click Button    ADD TO CART 
    END
    
Acces au panier user4
    Click Element           xpath://*[@id="shopping_cart_container"]/a/span
    
Verification panier user4
    ${nb_pdt}=    Get Text    xpath://*[@id="shopping_cart_container"]/a/span
    Run Keyword If    ${nb_pdt}==6    Test Keyword 1    ELSE   Test Keyword 2
    
*** Keywords ***
Test Keyword 3
    Log To Console    Connexion reussie    
Test Keyword 4
    Log To Console    Connexion non reussie Donc Pas de suite 
Test Keyword 1
    Log To Console    Verification Valide  
Test Keyword 2
    Log To Console    Verification Non Valide---Pas tous  
    
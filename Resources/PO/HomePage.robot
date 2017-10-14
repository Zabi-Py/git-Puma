*** Settings ***
Library  Selenium2Library

*** Variables ***
${URL} =  https://in.puma.com/
${Puma_Logo} =  //div[@class='skip-links']//img[1]
${Men} =  //div[@id='header-nav']/ul/li[1]
${Shoes_Running} =  //li[@id='men-subnav']//a[contains(@href,'https://in.puma.com/men/shoes/running.html')]
${Expected_Title} =  Buy Sports T-Shirts, Tracks, Running Shoes and Accessories Online - in.puma.com

*** Keywords ***
Navigate to Homepage
    Go to  ${URL}

Verify Page is Loaded
    page should contain element  ${Puma_Logo}

Verify Page title
    ${Current_Title} =  get title
    Log  ${Current_Title}
    should be equal as strings  ${Current_Title}  ${Expected_Title}

Navigate to Men/Shoes/Running
    mouse over  ${Men}
    click link  ${Shoes_Running}


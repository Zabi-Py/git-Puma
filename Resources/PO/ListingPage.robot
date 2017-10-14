*** Settings ***
Library  Selenium2Library
Library  Collections

*** Variables ***
${Shoes_Breadcrump} =  //div[@class='breadcrumbs']//a[contains(.,'Shoes')]
${PriceHigh_Sort} =  //*[@id='mobilesortby']//a[contains(.,'Price[High]')]
${Shoe} =  //div[@class='category-products']//ul[@class='products-grid products-grid--max-4-col first last odd']//li[1]

*** Keywords ***
Verify the Men/Shoes/Running listing page
    execute javascript  window.scrollTo(0,400)
    page should contain element  ${Shoes_Breadcrump}

Sorting by High Price
    click element  ${PriceHigh_Sort}
    execute javascript  window.scrollTo(0,500)

Click on a shoe
    click element  ${Shoe}
    ${Titles} =  get window titles
    Log  ${Titles}
    ${Title_2} =  Get from list  ${Titles}  index=1
    select window  ${Title_2}



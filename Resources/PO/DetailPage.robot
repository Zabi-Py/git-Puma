*** Settings ***
Library  Selenium2Library
Library  Collections
Library  String

*** Variables ***
${Breadcrumb} =  //div[@class='breadcrumbs']//li[5]
${Product_Name} =  //div[@class='product-shop']//div[@class='product-name']//span
${Product_Price} =  //div[@id='product-options-wrapper']//span[@class='price']
${Product_Price_Offer} =  //div[@id='product-options-wrapper']//p[@class='special-price']
${Product_Size} =  //div[@class='product-size-click-btn']
${Product_Size_Select} =  180~73
${Cart_Button} =  //button[@title='Add to Cart']

*** Keywords ***
Verify Detail page is loaded
    page should contain element  ${Breadcrumb}

Get Product Details
    ${Expected_Product_Name} =  get text  ${Product_Name}
    ${Expected_Product_Name} =  convert to lowercase  ${Expected_Product_Name}
    set global variable  ${Expected_Product_Name}
    ${Product_Price_Offer_Status} =  run keyword and return status  page should contain element  ${Product_Price_Offer}
    run keyword if  ${Product_Price_Offer_Status} is True  Expected_Product_Price1  ELSE  Expected_Product_Price2
    [Return]  ${Expected_Product_Name}

Expected_Product_Price1
    ${Expected_Product_Price} =  get text  ${Product_Price_Offer}
    set global variable  ${Expected_Product_Price}
    [Return]  ${Expected_Product_Price}

Expected_Product_Price2
    ${Expected_Product_Price} =  get text  ${Product_Price}
    set global variable  ${Expected_Product_Price}
    [Return]  ${Expected_Product_Price}

Add Product to cart
    execute javascript  window.scrollTo(0,100)
    mouse over  ${Product_Size}
    click element  ${Product_Size}
    click element  ${Product_Size_Select}
    click element  ${Cart_Button}
    @{Titles} =  get window titles
    select window  @{Titles}[1]


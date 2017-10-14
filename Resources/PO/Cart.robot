*** Settings ***
Library  Selenium2Library
Library  String

*** Variables ***
${Cart_Product_Name} =  //h2[@class='product-name']//a
${Cart_Product_Price} =  //td[@class='product-cart-price']//span[@class='price']

*** Keywords ***

Cart Item Verification
    ${Actual_Product_Name} =  get text  ${Cart_Product_Name}
    ${Actual_Product_Name} =  convert to lowercase  ${Actual_Product_Name}
    Log  ${Expected_Product_Name}
    Log  ${Actual_Product_Name}
    should be equal as strings  ${Expected_Product_Name}  ${Actual_Product_Name}

    ${Actual_Product_Price} =  get text  ${Cart_Product_Price}
    Log  ${Expected_Product_Price}
    Log  ${Actual_Product_Price}
    should be equal as strings  ${Expected_Product_Price}  ${Actual_Product_Price}
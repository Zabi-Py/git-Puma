*** Settings ***
Documentation  Contains only the test cases

Library   Selenium2Library
Resource  C:/git-Puma/Resources/Common.robot
Resource  C:/git-Puma/Resources/PO/HomePage.robot
Resource  C:/git-Puma/Resources/PO/ListingPage.robot
Resource  C:/git-Puma/Resources/PO/DetailPage.robot
Resource  C:/git-Puma/Resources/PO/Cart.robot

Suite Setup     Begin Test
Suite Teardown  End Test

*** Variables ***
${BROWSER} =  chrome

*** Test Cases ***
Puma Homepage
    [Documentation]  Launching URL & Navigating to Men/Shoes/Running listing page
    [Tags]  Smoke
    Homepage.Navigate to Homepage
    Homepage.Verify Page is Loaded
    Homepage.Verify Page title
    Homepage.Navigate to Men/Shoes/Running

Puma Listing Page
    [Documentation]  Listing Page verification & Navigation to Detail page of an item
    ListingPage.Verify the Men/Shoes/Running listing page
    ListingPage.sorting by high price
    ListingPage.click on a shoe

Puma Detail Page
    [Documentation]  Detail Page verification, capturing product details & adding item to cart
    DetailPage.Verify Detail page is loaded
    DetailPage.Get Product Details
    DetailPage.Add Product to cart

Puma Cart
    [Documentation]  Verification of Cart Items
    Cart.Cart Item Verification



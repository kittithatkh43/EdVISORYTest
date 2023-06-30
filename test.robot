*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***


*** Test Cases ***

Test Table
    Open browser    https://the-internet.herokuapp.com/tables  Chrome
    ${data}=    Get text    xpath://table[@id="table2"]/tbody/tr[3]/td[2]
    Table Cell Should Contain   xpath://table[@id="table2"]  3  4  $51.00
    Close browser

Test File Uploader
    Open Browser  https://the-internet.herokuapp.com/upload  Chrome
    Choose File  id:file-upload  C:/Users/natoyoylook/Downloads/snakebw.png
    Click Element  id:file-submit
    Element Text Should Be  id:uploaded-files   snakebw.png
    Close Browser

Open New Windows
    Open Browser  https://the-internet.herokuapp.com/windows  Chrome
    Click Element  css:[href="/windows/new"]
    Switch Window  title:New Window
    Element Text Should Be  tag:h3  New Window
    Close Browser

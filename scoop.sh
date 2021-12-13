#!/bin/bash
dateMenu=$(date +%Y-%m-%d)

if [ $# -eq 1 ]
  then
    dateMenu=$(date -d ""$1" days" +%Y-%m-%d)
fi

dateTech=$(date -d "$dateMenu -1 days" +%Y-%m-%d)

echo 'Le Scoop :' $(date -d "$dateMenu" +'%A %d %B %Y') 
echo

parameter='100-0%2F%2BMenuDate1%26%2BMenuOrder1%2FID%26MenuDate1%26MenuIngredients1%26MenuIngredients2%26MenuIngredients3%26MenuIngredients4%26MenuPricePrefix1%26MenuPrice1%26MenuPrice2%26MenuPrice3%26MenuPrice4%26MenuPriceDescription1%26MenuPriceDescription2%26MenuPriceDescription3%26MenuPriceDescription4%26Menuline%26Special%26MenuDeclaration%26_LanguageConfig%26Outlet.ID%26MenuAdditionalInformation1%26MenuNutriscore1%2FMenuDate1%3Dbt%3A%7B%7B2021-12-13%7C2021-12-19%7D%7D%26MenuDate1%3Dge%3A%7B%7B2021-12-13%7D%7D%26Outlet%3Deq%3A%7B%7B361%7D%7D%26MenuDate1%3Dle%3A%7B%7B2021-12-19%7D%7D'
encodedParameter=$(echo -n $parameter | base64 -w 0)

curl -s 'https://clients.eurest.ch/api/Menu/'$encodedParameter | \
jq -r '.data[] | select(.MenuDate1 | startswith("'$dateTech'")) | 
 .Menuline.MenulineKey1, 
 "--------------------",
 (select((.MenuIngredients1 != null) and (.MenuIngredients1 | contains("FR"))) | .MenuIngredients1 | sub(".*FR\":\"";"") | sub("\"}.*";"")), 
 (select((.MenuIngredients2 != null) and (.MenuIngredients2 | contains("FR"))) | .MenuIngredients2 | sub(".*FR\":\"";"") | sub("\"}.*";"")), 
 (select((.MenuIngredients3 != null) and (.MenuIngredients3 | contains("FR"))) | .MenuIngredients3 | sub(".*FR\":\"";"") | sub("\"}.*";"")), 
 (select((.MenuIngredients4 != null) and (.MenuIngredients4 | contains("FR"))) | .MenuIngredients4 | sub(".*FR\":\"";"") | sub("\"}.*";"")), 
 (.MenuPrice1|tostring + " CHF"),
 "--------------------",
 ""' 

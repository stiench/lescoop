#!/bin/bash
dateMenu=$(date +%Y-%m-%d)

if [ $# -eq 1 ]
  then
    dateMenu=$(date -d ""$1" days" +%Y-%m-%d)
fi

dateTech=$(date -d "$dateMenu -1 days" +%Y-%m-%d)

echo 'Le Scoop :' $(date -d "$dateMenu" +'%A %d %B %Y') 
echo

curl -s https://clients.eurest.ch/api/Menu/MTAwLTAlMkYlMkJNZW51RGF0ZTElMjYlMkJNZW51T3JkZXIxJTJGSUQlMjZNZW51RGF0ZTElMjZNZW51SW5ncmVkaWVudHMxJTI2TWVudUluZ3JlZGllbnRzMiUyNk1lbnVJbmdyZWRpZW50czMlMjZNZW51SW5ncmVkaWVudHM0JTI2TWVudVByaWNlUHJlZml4MSUyNk1lbnVQcmljZTElMjZNZW51UHJpY2UyJTI2TWVudVByaWNlMyUyNk1lbnVQcmljZTQlMjZNZW51UHJpY2VEZXNjcmlwdGlvbjElMjZNZW51UHJpY2VEZXNjcmlwdGlvbjIlMjZNZW51UHJpY2VEZXNjcmlwdGlvbjMlMjZNZW51UHJpY2VEZXNjcmlwdGlvbjQlMjZNZW51bGluZSUyNlNwZWNpYWwlMjZNZW51RGVjbGFyYXRpb24lMjZfTGFuZ3VhZ2VDb25maWclMjZPdXRsZXQuSUQlMjZNZW51QWRkaXRpb25hbEluZm9ybWF0aW9uMSUyNk1lbnVOdXRyaXNjb3JlMSUyRk1lbnVEYXRlMSUzRGJ0JTNBJTdCJTdCMjAyMS0xMS0yOSU3QzIwMjEtMTItMTklN0QlN0QlMjZNZW51RGF0ZTElM0RnZSUzQSU3QiU3QjIwMjEtMTItMDYlN0QlN0QlMjZPdXRsZXQlM0RlcSUzQSU3QiU3QjM2MSU3RCU3RCUyNk1lbnVEYXRlMSUzRGxlJTNBJTdCJTdCMjAyMS0xMi0xMiU3RCU3RA== | \
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

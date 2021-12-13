# Le scoop #

This script allows to retrieve and display the menu of the restaurant "Le scoop" in Lausanne through the API.

## API ##

The menu can be retrieve throught the following API call :

```http
GET https://clients.eurest.ch/api/Menu/parameterInBase64
```

The parameter of the API looks like the example below encoded in Base64 :

```
100-0%2F%2BMenuDate1%26%2BMenuOrder1%2FID%26MenuDate1%26MenuIngredients1%26MenuIngredients2%26MenuIngredients3%26MenuIngredients4%26MenuPricePrefix1%26MenuPrice1%26MenuPrice2%26MenuPrice3%26MenuPrice4%26MenuPriceDescription1%26MenuPriceDescription2%26MenuPriceDescription3%26MenuPriceDescription4%26Menuline%26Special%26MenuDeclaration%26_LanguageConfig%26Outlet.ID%26MenuAdditionalInformation1%26MenuNutriscore1%2FMenuDate1%3Dbt%3A%7B%7B2021-12-13%7C2021-12-19%7D%7D%26MenuDate1%3Dge%3A%7B%7B2021-12-13%7D%7D%26Outlet%3Deq%3A%7B%7B361%7D%7D%26MenuDate1%3Dle%3A%7B%7B2021-12-19%7D%7D
```

Here is an example of the URL :

[API call sample](https://clients.eurest.ch/api/Menu/MTAwLTAlMkYlMkJNZW51RGF0ZTElMjYlMkJNZW51T3JkZXIxJTJGSUQlMjZNZW51RGF0ZTElMjZNZW51SW5ncmVkaWVudHMxJTI2TWVudUluZ3JlZGllbnRzMiUyNk1lbnVJbmdyZWRpZW50czMlMjZNZW51SW5ncmVkaWVudHM0JTI2TWVudVByaWNlUHJlZml4MSUyNk1lbnVQcmljZTElMjZNZW51UHJpY2UyJTI2TWVudVByaWNlMyUyNk1lbnVQcmljZTQlMjZNZW51UHJpY2VEZXNjcmlwdGlvbjElMjZNZW51UHJpY2VEZXNjcmlwdGlvbjIlMjZNZW51UHJpY2VEZXNjcmlwdGlvbjMlMjZNZW51UHJpY2VEZXNjcmlwdGlvbjQlMjZNZW51bGluZSUyNlNwZWNpYWwlMjZNZW51RGVjbGFyYXRpb24lMjZfTGFuZ3VhZ2VDb25maWclMjZPdXRsZXQuSUQlMjZNZW51QWRkaXRpb25hbEluZm9ybWF0aW9uMSUyNk1lbnVOdXRyaXNjb3JlMSUyRk1lbnVEYXRlMSUzRGJ0JTNBJTdCJTdCMjAyMS0xMi0xMyU3QzIwMjEtMTItMTklN0QlN0QlMjZNZW51RGF0ZTElM0RnZSUzQSU3QiU3QjIwMjEtMTItMTMlN0QlN0QlMjZPdXRsZXQlM0RlcSUzQSU3QiU3QjM2MSU3RCU3RCUyNk1lbnVEYXRlMSUzRGxlJTNBJTdCJTdCMjAyMS0xMi0xOSU3RCU3RA==)


## Depedencies ##

The script needs the jq command line tool :
[jq](https://github.com/stedolan/jq)

The script must have the execution permissions :
```bash
$ chmod +x ./scoop.sh
```

## Usage ##

Running the script will provide the meals of the current day :
```bash
$ ./scoop.sh
```

In order to get the meals for another day of the week, you can add an argument. 

For tomorrow :
```bash
$ ./scoop.sh +1
```

For the day after tomorrow :
```bash
$ ./scoop.sh +2
```

For yesterday :
```bash
$ ./scoop.sh -1
```
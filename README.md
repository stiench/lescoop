# Le scoop #

This script allows to retrieve and display the menu of the restaurant "Le scoop" in Lausanne.

## Depedencies ##

The script needs the jq command line tool :
[jq](https://github.com/stedolan/jq)

The script must have the execution permissions :
```
$ chmod +x ./scoop.sh
```

## Usage ##

Running the script will provide the meals of the current day :
```
$ ./scoop.sh
```

In order to get the meals for another day of the week, you can add an argument. 

For tomorrow :
```
$ ./scoop.sh +1
```

For the day after tomorrow :
```
$ ./scoop.sh +2
```

For yesterday :
```
$ ./scoop.sh -1
```
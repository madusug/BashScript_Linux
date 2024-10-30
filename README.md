# Generating a Multiplication Table

The task is to create a bash script that generates a multiplication table for a number entered by the user. This project seeks to help with loops, handling user input and applying conditional logic in Bash Scripting.

The script would prompt the user to enter a number and then ask if they prefer to see a full multiplication table from 1 to 10 or a partial table within a specified range. Based on the user's choice, the script will display the corresponding multiplication table.

## Project Requirements

### User Input for Number

-------
The script must first ask the user to input a number for which the multiplication table will be generated. For this, I used the "read" command to store the value "num1"

Code: 
```
echo "Enter a number for the multiplication table: "
read num1
```
![num1](./img/1%20num1.jpg)

-------
Choice of Table Range: I also need to ask the user if they want a full multiplication table (1 to 10) or a partial table.

Code:
```
echo "Do you want a full table or a partial table? (Enter 'f' for full, 'p' for partial): "
read name1
```
![name1](./img/2%20name1.jpg)

-------

Using List Style Loops: If the user chooses "f" for the full multiplication table, I want a full multiplication table to be shown with a range from 1 to 10. To achieve my goal, I used an IF statement to ascertain that the inputted value is within the range of acceptable values and a FOR loop within that IF statement to run the multiplication table. Please see code below.

Code:
```
if [[ $num1 -ge 1 && $num1 -le 10 ]] && [[ $name1 == 'f' ]]
then
    for i in {1..10}
    do
        echo "$num1 x $i = $((num1 * i))"
    done
```
![IfFor](./img/3%20FirstIF.jpg)

--------

Using C-style loops: If the user chooses "p" for the partial multiplication table, I want a partial multiplication table to be shown but I want the user to input the start of the range and the end of the range. For this, I used a Nest IF statement with an else condition. The first IF statement reviews the first input "num1" to ensure it is between 1 and 10. The first IF statement also checks to ensure that "name1" is = "p". When those conditions are met, I used the echo command to take inputs for num2 and num3, which represent a starting number and an ending number.
 

Code:

```
elif [[ $num1 -ge 1 && $num1 -le 10 ]] && [[ $name1 == 'p' ]]
then
    echo "Enter the starting number (between 1 and 10): "
    read num2

    echo "Enter the ending number (between 1 and 10): "
    read num3

```
![elif](./img/4%20elif.jpg)

-------
I then proceeded to create another if statement within the above statement to check if num2 is within the range of 1 to 10 and num3 is in the range of 1 to 10 but with a value less than or equal to num3. I also used the FOR loop within the if statement to run the partial multiplication table. If the values are not within the specified range, it will output an error, "Invalid range. Showing full table instead".

Code:
```
    if [[ $num2 -ge 1 && $num2 -le 10 ]] && [[ $num3 -ge 1 && $num3 -le 10 && $num2 -le $num3 ]]
    then
        for ((i=num2; i<=num3; i++))
        do
            echo "$num1 x $i = $((num1 * i))"
        done
    else
        echo "Invalid range. Showing full table instead: "
        for i in {1..10}
        do
            echo "$num1 x $i = $((num1 * i))"
        done
    fi
```
![lastif](./img/5%20ifforelse.jpg)

-------
The final code is the last else statement that shows an error when the wrong values are used and provides the full multiplication table.

Code:
```
else
    echo "Invalid input. Showing full table instead: "
    for i in {1..10}
    do
        echo "$num1 x $i = $((num1 * i))"
    done
fi
```
![else](./img/6%20else.jpg)



### Full Code:

```
#!/bin/bash

echo "Enter a number for the multiplication table: "
read num1

echo "Do you want a full table or a partial table? (Enter 'f' for full, 'p' for partial): "
read name1

if [[ $num1 -ge 1 && $num1 -le 10 ]] && [[ $name1 == 'f' ]]
then
    for i in {1..10}
    do
        echo "$num1 x $i = $((num1 * i))"
    done

elif [[ $num1 -ge 1 && $num1 -le 10 ]] && [[ $name1 == 'p' ]]
then
    echo "Enter the starting number (between 1 and 10): "
    read num2

    echo "Enter the ending number (between 1 and 10): "
    read num3

    if [[ $num2 -ge 1 && $num2 -le 10 ]] && [[ $num3 -ge 1 && $num3 -le 10 && $num2 -le $num3 ]]
    then
        for ((i=num2; i<=num3; i++))
        do
            echo "$num1 x $i = $((num1 * i))"
        done
    else
        echo "Invalid range. Showing full table instead: "
        for i in {1..10}
        do
            echo "$num1 x $i = $((num1 * i))"
        done
    fi
else
    echo "Invalid input. Showing full table instead: "
    for i in {1..10}
    do
        echo "$num1 x $i = $((num1 * i))"
    done
fi

```

### Testing

------
For a full multiplication table with number 6 selected for the table:
![multifull](./img/7%20multifull.jpg)

------
For a partial multiplication table with number 4 selected for the table and a starting number of 5 and ending number of 9:
![multipart](./img/8%20multipart.jpg)

-------

I checked for errors by inputting a number above the range and selecting "f":

![error1](./img/9%20error1.jpg)

-------
I checked for another error when "p" is selected and there is a wrong input for the starting range:

![error2](./img/10%20error2.jpg)

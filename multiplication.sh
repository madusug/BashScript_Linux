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

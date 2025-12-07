#!/bin/bash

read -p "Введите число: " number
if (( $(echo "$number > 0" | bc -l) )); then
    echo "Введено положительное число"
elif (( $(echo "$number < 0" | bc -l) )); then
    echo "Введено отрицательное число"
else
    echo "Введенное число - ноль"
fi

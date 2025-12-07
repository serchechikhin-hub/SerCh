#!/bin/bash
read -p "Введите целое положительное число " number
# Цикл обратного отсчёта
echo "Начинаем обратный отсчёт от $number до 0:"
while [ $number -ge 0 ]; do
    echo "$number"
    ((number--))
done
echo "Отсчёт завершён!"

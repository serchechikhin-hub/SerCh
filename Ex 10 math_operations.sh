#!/bin/bash

# Сложение
addition() {
    local result
    result=$(echo "$1 + $2" | bc)
    echo "Результат сложения: $1 + $2 = $result"
}

# Вычитание
subtraction() {
    local result
    result=$(echo "$1 - $2" | bc)
    echo "Результат вычитания: $1 - $2 = $result"
}

# Умножение
multiplication() {
    local result
    result=$(echo "$1 * $2" | bc)
    echo "Результат умножения: $1 × $2 = $result"
}

# Деление
division() {
    # Проверка деления на ноль
    if [ "$(echo "$2 == 0" | bc)" -eq 1 ]; then
        echo "Операция невыполнима, деление на ноль не поддерживается"
        return 1
    fi
    
    local result
    result=$(echo "scale=2; $1 / $2" | bc)
    echo "Результат деления: $1 ÷ $2 = $result"
}

# Основная часть скрипта
main() {
    echo "=== Школьный калькулятор ==="
    echo "Выберите операцию:"
    echo "1. Сложение (+)"
    echo "2. Вычитание (-)"
    echo "3. Умножение (*)"
    echo "4. Деление (/)"
    read -p "Ваш выбор: " operation    
    
    # Запрашиваем первое число
    read -p "Введите первое число: " num1
      
    # Запрашиваем второе число
    read -p "Введите второе число: " num2
   
  
    # Выполняем выбранную операцию
    case $operation in
        "+"|"1")
            addition "$num1" "$num2"
            ;;
        "-"|"2")
            subtraction "$num1" "$num2"
            ;;
        "*"|"3")
            multiplication "$num1" "$num2"
            ;;
        "/"|"4")
            division "$num1" "$num2"
            ;;
    esac
}
main

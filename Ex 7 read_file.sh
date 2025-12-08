#!/bin/bash
read -p "Введите имя файла: " filename
echo "нетология" > "$filename"
echo "вшэ" >> "$filename"
echo "обучение" >> "$filename"
echo "devsecops" >> "$filename"
echo "Файл $filename создан"

echo "Содержимое файла '$filename':"
echo "----------------------------------------"

# Читаем файл построчно и выводим на экран
line_number=1
while IFS= read -r line; do
    echo "Строка $line_number: $line"
    ((line_number++))
done < "$filename"

echo "----------------------------------------"
echo "Количество строк: $((line_number-1))"

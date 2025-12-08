#!/bin/bash
read -p "Введите имя файла: " filename
echo "нетология-bash" > "$filename"
echo "нетология-вшэ" >> "$filename"
echo "нетология-обучение" >> "$filename"
echo "нетология-devsecops" >> "$filename"
echo "Файл $filename создан"

read -p "Введите слово, которое хотите изменить: " word1
read -p "Введите слово, на которое хотите заменить: " word2

# Заменяем слова
sed -i "s/$word1/$word2/g" "$filename"

echo "Содержимое файла '$filename':"
echo "----------------------------------------"

# Читаем файл построчно и выводим на экран
line_number=1
while IFS= read -r line; do
    echo "Строка $line_number: $line"
    ((line_number++))
done < "$filename"

#!/bin/bash

echo "Введите количество создаваемых файлов " n

# Создаём уникальную директорию
dir_name="temp_$(date +%s)"
mkdir "$dir_name"

# Переходим в директорию
cd "$dir_name" || exit

# Создаём файлы
for i in {1..n}; do
    echo "Content of file $i" > "file$i.txt"
done

echo "Создано $n файлов, сейчас они будут удалены"

# Удаляем файлы
rm -f *.txt

# Выходим из директории
cd ..

# Удаляем директорию
rmdir "$dir_name"

echo "Все операции выполнены успешно!"

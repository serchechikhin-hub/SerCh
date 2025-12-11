#!/bin/bash

src="Dir_Source"
mkdir -p "$src" 

# Переходим в директорию
cd "$src"
read -p "Введите количество файлов: " n

# Создаём файлы
for ((i = 1; i <= n; i++)); do
   touch "file$i.txt"
done

# Посмотреть файлы в текущей директории
echo "Файлы в директории $src: "
ls

cd ..
dst="Dir_backup"
mkdir -p "$dst"

# Получаем текущую дату
current_date=$(date +%Y%m%d)

# Копируем все файлы с добавлением даты
for file in "$src"/*.txt; do
    # Получаем только имя файла без пути
    filename=$(basename "$file")
    # Копируем с добавлением даты в начало имени
    cp "$file" "$dst/${current_date}_${filename}"
    done

echo "Резервное копирование из $src в $dst выполнено успешно"
echo "Файлы в директории $dst: "
cd "$dst"
ls 


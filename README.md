# Ex 1
#!/bin/bash
echo "Hello, World!"
Hello, World!

# Ex 2
#!/bin/bashn/bash
read -p "Добрый день. Давайте познакомимся. Как Ваше имя? " name
echo "Привет, $name!"
Добрый день. Давайте познакомимся. Как Ваше имя? Сергей
Привет, Сергей!

# Ex 3
#!/bin/bash
read -p "Введите число: " number
if (( $(echo "$number > 0" | bc -l) )); then
    echo "Введено положительное число"
elif (( $(echo "$number < 0" | bc -l) )); then
    echo "Введено отрицательное число"
else
    echo "Введенное число - ноль"
fi
Введите число: -9
Введено отрицательное число

# Ex 4
#!/bin/bash
read -p "Введите целое положительное число " number
echo "Начинаем обратный отсчёт от $number до 0:"
while [ $number -ge 0 ]; do
    echo "$number"
    ((number--))
done
echo "Отсчёт завершён!"
Введите целое положительное число 9
Начинаем обратный отсчёт от 9 до 0:
9
8
7
6
5
4
3
2
1
0
Отсчёт завершён!

# Ex5
#!/bin/bash

read -p "Введите количество файлов " n

#Создаём директорию
dir_name="temp_$(date +%s)"
mkdir "$dir_name"

#Переходим в директорию
cd "$dir_name" || exit

#Создаём файлы
for i in {1..n}; do
    echo "Content of file $i" > "file$i.txt"
done

echo "Создано $n файлов, сейчас они будут удалены"

#Удаляем файлы
rm -f *.txt

#Выходим из директории
cd ..

#Удаляем директорию
rmdir "$dir_name"

echo "Все операции выполнены успешно!"
Введите количество файлов 7
Создано 7 файлов, сейчас они будут удалены
Все операции выполнены успешно!

# Ex6
#!/bin/bash

read -p "Введите первый аргумент " num1
read -p "Введите второй аргумент " num2

#Вычисление суммы с помощью bc 
sum=$(echo "$num1 + $num2" | bc)
echo "Сумма аргументов $num1 и $num2 равна $sum"
Введите первый аргумент 5
Введите второй аргумент 6
Сумма аргументов 5 и 6 равна 11

# Ex7
#!/bin/bash
read -p "Введите имя файла: " filename
echo "нетология" > "$filename"
echo "вшэ" >> "$filename"
echo "обучение" >> "$filename"
echo "devsecops" >> "$filename"
echo "Файл $filename создан"

echo "Содержимое файла '$filename':"
echo "----------------------------------------"

#Читаем файл построчно и выводим на экран
line_number=1
while IFS= read -r line; do
    echo "Строка $line_number: $line"
    ((line_number++))
done < "$filename"

echo "----------------------------------------"
echo "Количество строк: $((line_number-1))"
Введите имя файла: student
Файл student создан
Содержимое файла 'student':
----------------------------------------
Строка 1: нетология
Строка 2: вшэ
Строка 3: обучение
Строка 4: devsecops
----------------------------------------
Количество строк: 4
ubuntu:~$ 

# Ex 8
ubuntu:~$ #!/bin/bash
read -p "Введите имя файла: " filename
echo "нетология-bash" > "$filename"
echo "нетология-вшэ" >> "$filename"
echo "нетология-обучение" >> "$filename"
echo "нетология-devsecops" >> "$filename"

read -p "Введите слово, которое хотите изменить: " word1 
read -p "Введите слово, на которое хотите заменить: " word2

#Заменяем слова
sed -i "s/$word1/$word2/g" "$filename"

echo "Содержимое файла '$filename':"
echo "----------------------------------------"

#Читаем файл построчно и выводим на экран

line_number=1
while IFS= read -r line; do
    echo "Строка $line_number: $line"
    ((line_number++))
done < "$filename"
Введите имя файла: student
Файл student создан
Введите слово, которое хотите изменить: нетология
Введите слово, на которое хотите заменить: NETOLOGY
Содержимое файла 'student':
----------------------------------------
Строка 1: NETOLOGY-bash
Строка 2: NETOLOGY-вшэ
Строка 3: NETOLOGY-обучение
Строка 4: NETOLOGY-devsecops
ubuntu:~$ 

# Ex 9
#!/bin/bash

src="Dir_Source"
mkdir -p "$src" 

#Переходим в директорию
cd "$src"
read -p "Введите количество файлов: " n

#Создаём файлы
for ((i = 1; i <= n; i++)); do
   touch "file$i.txt"
done

#Посмотреть файлы в текущей директории
echo "Файлы в директории $src: "
ls

cd ..
dst="Dir_backup"
mkdir -p "$dst"

#Получаем текущую дату
current_date=$(date +%Y%m%d)

#Копируем все файлы с добавлением даты
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
Введите количество файлов: 9
Файлы в директории Dir_Source: 
file1.txt  file2.txt  file3.txt  file4.txt  file5.txt  file6.txt  file7.txt  file8.txt  file9.txt
Резервное копирование из Dir_Source в Dir_backup выполнено успешно
Файлы в директории Dir_backup: 
20251211_file1.txt  20251211_file3.txt  20251211_file5.txt  20251211_file7.txt  20251211_file9.txt
20251211_file2.txt  20251211_file4.txt  20251211_file6.txt  20251211_file8.txt
ubuntu:~/Dir_backup$ 

# Ex10

#!/bin/bash

#Функции для математических операций

#Сложение
addition() {
    local result
    result=$(echo "$1 + $2" | bc)
    echo "Результат сложения: $1 + $2 = $result"
}

#Вычитание
subtraction() {
    local result
    result=$(echo "$1 - $2" | bc)
    echo "Результат вычитания: $1 - $2 = $result"
}

#Умножение
multiplication() {
    local result
    result=$(echo "$1 * $2" | bc)
    echo "Результат умножения: $1 × $2 = $result"
}

#Деление
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

mainesac
=== Школьный калькулятор ===
Выберите операцию:
1. Сложение (+)
2. Вычитание (-)
3. Умножение (*)
4. Деление (/)
Ваш выбор: 2
Введите первое число: 85 
Введите второе число: 29
Результат вычитания: 85 - 29 = 56

 #!/bin/bash
echo "Hello, World!"
Hello, World!

#!/bin/bashn/bash
read -p "Добрый день. Давайте познакомимся. Как Ваше имя? " name
echo "Привет, $name!"
Добрый день. Давайте познакомимся. Как Ваше имя? Сергей
Привет, Сергей!

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

#!/bin/bash

read -p "Введите количество файлов " n

# Создаём директорию
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
Введите количество файлов 7
Создано 7 файлов, сейчас они будут удалены
Все операции выполнены успешно!


#!/bin/bash

read -p "Введите первый аргумент " num1
read -p "Введите второй аргумент " num2

# Вычисление суммы с помощью bc (поддерживает дробные числа)
sum=$(echo "$num1 + $num2" | bc)
echo "Сумма аргументов $num1 и $num2 равна $sum"
Введите первый аргумент 5
Введите второй аргумент 6
Сумма аргументов 5 и 6 равна 11


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

ubuntu:~$ #!/bin/bash
read -p "Введите имя файла: " filename
echo "нетология-bash" > "$filename"
echo "нетология-вшэ" >> "$filename"
echo "нетология-обучение" >> "$filename"
echo "нетология-devsecops" >> "$filename"

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

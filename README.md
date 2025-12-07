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

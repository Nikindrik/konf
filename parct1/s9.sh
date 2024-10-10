#!/bin/bash



# ./replace_spaces.sh input.txt output.txt



# Проверка на правильное количество аргументов
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <input_file> <output_file>"
    exit 1
fi

# Параметры скрипта
input_file="$1"
output_file="$2"

# Проверка существования входного файла
if [ ! -f "$input_file" ]; then
    echo "Ошибка: Входной файл $input_file не существует."
    exit 1
fi

# Замена последовательностей из 4 пробелов на символ табуляции и запись в выходной файл
sed 's/    /\t/g' "$input_file" > "$output_file"

# Проверка на успешное выполнение команды sed
if [ $? -eq 0 ]; then
    echo "Замена выполнена успешно. Результат записан в $output_file."
else
    echo "Ошибка при выполнении замены."
    exit 1
fi

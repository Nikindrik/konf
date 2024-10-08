#!/bin/bash

# Программа для вывода всех уникальных идентификаторов из файла по правилам C/C++ или Java.
# Идентификаторы должны начинаться с буквы или подчеркивания, 
# а затем могут содержать буквы, цифры или подчеркивания.

file_content=$(cat "$1")  # Читаем содержимое файла, переданного в качестве аргумента.

# Используем регулярное выражение для поиска всех потенциальных идентификаторов.
# -oE - вывод каждого совпадения на новой строке, используя расширенное регулярное выражение.
# Идентификаторы начинаются с буквы или подчеркивания и могут включать буквы, цифры или подчеркивания.
identifiers=$(echo "$file_content" | grep -oE '\b[a-zA-Z_][a-zA-Z0-9_]*\b')

# Удаляем дубликаты идентификаторов, оставляем только уникальные значения.
unique_identifiers=$(echo "$identifiers" | sort | uniq)

# Объединяем все уникальные идентификаторы в одну строку с разделителем пробел.
output=$(echo "$unique_identifiers" | tr '\n' ' ')

# Выводим результат.
echo "$output"

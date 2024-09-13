#!/bin/bash

# Проверяем, передан ли текст
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 \"text\""
    exit 1
fi

text="$1"
length=${#text}

# Добавляем отступы и определяем ширину баннера
padding=2
width=$((length + 2 * padding + 2)) # +2 для границ "| " и " |"

# Печатаем верхнюю границу
printf "+%${width}s+\n" | sed 's/ /-/g'

# Печатаем строку с текстом
printf "| %s |\n" "$text"

# Печатаем нижнюю границу
printf "+%${width}s+\n" | sed 's/ /-/g'

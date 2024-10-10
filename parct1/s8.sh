#!/bin/bash




# ./archive_files.sh /path/to/directory txt my_archive.tar


# Проверка на правильное количество аргументов
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <directory> <extension> <archive_name>"
    exit 1
fi

# Параметры скрипта
directory="$1"
extension="$2"
archive_name="$3"

# Проверка существования указанной директории
if [ ! -d "$directory" ]; then
    echo "Ошибка: Директория $directory не существует."
    exit 1
fi

# Проверка на наличие файлов с заданным расширением
files=$(find "$directory" -type f -name "*.$extension")

if [ -z "$files" ]; then
    echo "Файлы с расширением .$extension не найдены в $directory."
    exit 1
fi

# Создание архива
tar -cvf "$archive_name" -C "$directory" $(basename -a $files)

# Проверка на успешное создание архива
if [ $? -eq 0 ]; then
    echo "Архив $archive_name успешно создан."
else
    echo "Ошибка при создании архива."
    exit 1
fi

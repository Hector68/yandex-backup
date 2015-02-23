#!/bin/bash

. ./config.sh

# очищаем корзину на яндекс диске
sh remote/clean_trash.sh

# удаляем старые архивы
sh ./rm_old_backup.sh

# делаем дамп базы данных
sh ./database.sh

# архивируем файлы $SRCFILES
sh ./file.sh
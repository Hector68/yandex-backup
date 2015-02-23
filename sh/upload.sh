#!/bin/bash

. ./config.sh

if [ -f "$1" ]
	then
		curl \
		--user $YA_USER:$YA_PASSWD \
		-T "$1" "https://webdav.yandex.ru/backups/$PROJ_NAME/$PREFIX/$2"
		echo "**** Done! File $1 uploaded. ****"
	else
		echo "**** Abort: file $1 dont exist. ****"
		exit 1
fi

exit 0

# USER:PASS		Данные для входа на Я.Диск
# -T "$1"		Закачка файла, указанного в 1 параметре при вызове скрипта
# Backups/$2	Папка Backups на удалённом диске и имя файла из 2 параметра
#!/bin/bash

. ./config.sh

# создаем локальную папку $PREFIX
if [ ! -d $DATADIR/$PREFIX/ ];
	then
		mkdir $DATADIR/$PREFIX/
		echo "**** Create local folder $PREFIX/ ****"
		
		# создаем папку на яндекс диске
		curl \
		-X "MKCOL /backups/$PROJ_NAME/$1 HTTP/1.1" \
		-H "Host: webdav.yandex.ru" \
		-H "Accept: */* Authorization: OAuth $OAUTH" \
		-u $YA_USER:$YA_PASSWD \
		https://webdav.yandex.ru/
		echo "**** Create webdav folder $PREFIX/ ****"		
	else
		echo "Abort: directory $PREFIX alredy exist."
		exit 1
fi

exit 0
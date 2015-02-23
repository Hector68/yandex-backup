#!/bin/bash

. ./config.sh

#создаем папку $PREFIX для бекапа
sh ./mkdir.sh $PREFIX

# делаем дамп базы данных $DB_NAME
echo "**** Start backup database ****"
mysqldump \
--user=$USER \
--password=$PASSWD \
--host=$HOST \
--default-character-set=$CHARSET \
$DB_NAME | gzip > $DATADIR/$PREFIX/$AR_FILE_NAME--$DATE.sql.gz
echo "**** Finish backup database ****"

# закачка на WebDAV диск
echo "**** Start upload database to webdav ****"
sh ./upload.sh $DATADIR/$PREFIX/$AR_FILE_NAME--$DATE.sql.gz $AR_FILE_NAME--$DATE.sql.gz
echo "**** Done! Finish upload database to webdav ****"
#!/bin/sh

. ./config.sh

#создаем папку для бекапа $PREFIX
sh ./mkdir.sh $PREFIX

# сохраняем в $BASEDIR все файлы из $SRCFILES
echo "**** Start files backup ****"
tar \
--exclude-from $PROJDIR/_backup/sh/exclude.list \
-czpf $DATADIR/$PREFIX/$AR_FILE_NAME--$DATE.tar.gz \
$SRCFILES 2> /dev/null
echo "**** Finish files backup ****"

# закачка на WebDAV диск
echo "**** Start upload files to webdav ****"
sh ./upload.sh $DATADIR/$PREFIX/$AR_FILE_NAME--$DATE.tar.gz $AR_FILE_NAME--$DATE.tar.gz
echo "**** Finish upload files to webdav ****"
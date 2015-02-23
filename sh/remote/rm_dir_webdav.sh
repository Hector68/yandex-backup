#!/bin/bash

. ./config.sh

#DELETE
curl \
-X "DELETE /backups/$PROJ_NAME/$1 HTTP/1.1" \
-H "Host: webdav.yandex.ru" \
-H "Accept: */* Authorization: OAuth $OAUTH" \
-u $YA_USER:$YA_PASSWD https://webdav.yandex.ru/
echo "[`date +%F--%H-%M`] Removing WebDav folders $1."

# PROPFIND
#curl -X "PROPFIND" \
#-u "$YA_USER:$YA_PASSWD" \
#-i --trace-ascii \
#-H "Content-Type: text/xml" \
#-H "Host: webdav.yandex.ru" \
#-H "Accept: */*" \
#-H "Depth: 1" \
#-H "Authorization: OAuth $OAUTH" \
#-d '<D:propfind xmlns:D="DAV:"><D:prop><D:quota-available-bytes/><D:quota-used-bytes/></D:prop></D:propfind>' \
#https://webdav.yandex.ru/backups/
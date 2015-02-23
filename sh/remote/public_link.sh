#!/bin/bash

. config.sh

#echo "$YA_USER, $OAUTH"

curl -i \
-u $YA_USER:$YA_PASSWD \
--request "PROPPATCH /git_tutorial.zip HTTP/1.1" \
--user-agent "my_application/0.0.1" \
--header "Host: webdav.yandex.ru" \
--header "Accept: Authorization: OAuth $OAUTH" \
--header "Content-Type: text/xml" \
--header "Content-Length: 158" \
--data '<propertyupdatexmlns="DAV:"><set><prop><public_urlxmlns="urn:yandex:disk:meta">true</public_url></prop></set></propertyupdate>' \
https://webdav.yandex.ru/
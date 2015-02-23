#!/bin/bash

. ./config.sh

#CLEAN TRASH
curl \
-H "Authorization: OAuth $OAUTH" \
-X "DELETE" \
"https://cloud-api.yandex.net/v1/disk/trash/resources/"
#!/bin/bash

. ./config.sh

#REST API DELETE FOLDER
REMOVE_PATH="/backups/$PROJ_NAME/2014-12-20/"

curl \
-H "Authorization: OAuth $OAUTH" \
-X "DELETE" \
"https://cloud-api.yandex.net/v1/disk/resources?path=$REMOVE_PATH"
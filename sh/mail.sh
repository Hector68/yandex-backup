#!/bin/bash

. ./config.sh

subject="Копия проекта $PROJ_NAME от $PREFIX"
from="support@zoran.ru"
to="$MAIL"
recipients="$MAIL, 1795978@gmail.com"

/usr/sbin/sendmail "$recipients" <<EOF
subject:$subject
from:$from
to:$to
Резервная копия доступна по ссылке: $SHORTLINK/$PREFIX/

Письмо сформировано роботом."
EOF

#mail="subject:$subject\nfrom:$from\nРезервная копия доступна по ссылке: $SHORTLINK/$PREFIX/\nПисьмо сформировано роботом."
#echo -e $mail | /usr/sbin/sendmail "$recipients"

# (echo "Subject:Копия проекта $PROJ_NAME от $PREFIX"; \
# echo "To:$MAIL"; \
# echo "Резервная копия доступна по ссылке: $SHORTLINK/$PREFIX/
# Письмо сформировано роботом.";) | \
# sendmail -F "zoran backup robot" support@zoran.ru
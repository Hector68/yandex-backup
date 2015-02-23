#!/bin/bash

. ./config.sh

#rm `ls -t | tail -n +6`
echo "**** start remove script ****"

# переходим в папку с бекапами
cd $DATADIR

# считаем количество папок с бекапами $PREFIX
COUNT=$(ls -d */ | wc -l)
echo "$COUNT backups available"

# если на диске больше 3 папок, удаляем самую старую
if [ "$COUNT" -gt "3" ]
then
	echo "**** need remove old backup ****"

	RUN=$(ls -t | tail -n 1)
	for i in $RUN
	do
		echo "**** remove $i ****"
		rm -rf $i
	done

	# удаляем папку с яндекса
	cd ../sh/
	sh remote/rest_delete_folder.sh $i
fi
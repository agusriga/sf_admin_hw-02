#!/bin/bash
#создать пользователей из списка users.txt с домашними папками
users=users.txt
for var in `cat $users | awk -F ' ' '{print $1}'`
  do
    useradd -m $var
  done
#задать им пароль из списка pass.txt
cat pass.txt | chpasswd
#Записать файл приветствия в домашней директории пользователя
for var in `cat $users | awk -F ' ' '{print $1}'`
  do
    cat message.txt >> /home/$var/.profile
  done
#С помощью sed заменить оболочку с /bin/sh на /bin/bash.
sed -i '/^user/s/sh/bash/g' /etc/passwd

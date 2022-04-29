#!/bin/bash
echo -ne "Введіть назву файлу для створення жорсткого зв'язку\n\t(не більше 24 символів і не більше 6 цифр підряд): "
read filename
if [[ -f $filename ]]
then
 if [[ ${#filename} -gt 24 || $filename =~ [0-9]{7,} ]]
 then
  echo "Помилка - назва файлу не відповідає вимогам"
 else
  echo -n "Введіть назву файлу-зв'язку: "
  read linkname
  if [[ -f $linkname ]]
  then
   echo "Помилка - такий файл вже існує"
  else
    if [[ ${#linkname} -gt 24 || $linkname =~ [0-9]{7,} ]]
    then 
     echo "Помилка - назва файлу не відповідає вимогам"
    else 
     ln "$filename" "$linkname"
    fi
  fi
 fi
else
  echo "Помилка - такого файлу не існує"
fi

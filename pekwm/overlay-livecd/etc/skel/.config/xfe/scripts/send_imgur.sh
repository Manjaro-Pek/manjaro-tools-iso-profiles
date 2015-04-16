#!/bin/sh

#Autor: pekman
#IRC: #manjaropek,#pekwm,#manjaro-br

TEXT=$(curl -F "image"=@"$1" -F "key"="a3793a1cce95f32435bb002b92e0fa5e" http://imgur.com/api/upload.xml | sed -e "s/.*<imgur_page>//" | sed -e "s/<.*//")
notify-send -h int:value:40 "Upload realizado com sucesso"; xmessage -title "Send" -buttons "Close" -center "$TEXT"
#yad --info --title="Imgur Upload" --text="$TEXT"

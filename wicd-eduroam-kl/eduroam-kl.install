#!/bin/sh

post_install(){
    echo Adding eduroam to active list...
    if grep eduroam-kl /etc/wicd/encryption/templates/active > /dev/null 
    then
        echo Eduroam was already installed!
    else
        echo eduroam-kl >> /etc/wicd/encryption/templates/active && echo Eduroam added to active list
    fi
}
post_remove(){
    export f=/etc/wicd/encryption/templates/active
    echo -n Deleting eduroam from active list...
    sed -e '/^eduroam-kl$/d' -i $f
    echo ' [DONE]'
}

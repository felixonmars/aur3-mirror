#!/bin/sh

post_install(){
    echo Adding eduroam-uu to active list...
    if grep eduroam-uu /etc/wicd/encryption/templates/active > /dev/null 
    then
        echo Eduroam-uu was already installed!
    else
        echo eduroam-uu >> /etc/wicd/encryption/templates/active && echo Eduroam-uu added to active list
    fi
}
post_remove(){
    export f=/etc/wicd/encryption/templates/active
    echo -n Deleting eduroam-uu from active list...
    sed -e 's/^eduroam-uu$//g' -i $f
    echo ' [DONE]'
}

post_remove


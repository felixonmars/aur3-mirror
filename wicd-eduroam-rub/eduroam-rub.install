#!/bin/sh

post_install()
{
    echo -n "Adding eduroam to active list... "
    grep -qE "^eduroam-rub$" /etc/wicd/encryption/templates/active
    if [ $? -eq 0 ]
    then
        echo -e "[FAIL]\nEduroam was already installed!"
        exit 1
    else
        echo "eduroam-rub" >> /etc/wicd/encryption/templates/active && echo "[DONE]"
    fi
}

post_remove()
{
    echo -n "Deleting eduroam from active list... "
    sed -e '/^eduroam-rub$/d' -i /etc/wicd/encryption/templates/active
    echo "[DONE]"
}



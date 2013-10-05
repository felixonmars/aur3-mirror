#!/bin/sh

post_install()
{
    echo -n "Adding eduroam-fct to active list... "
    grep -qE "^eduroam-fct$" /etc/wicd/encryption/templates/active
    if [ $? -eq 0 ]
    then
        echo -e "[FAIL]\nEduroam was already installed!"
        exit 1
    else
        echo "eduroam-fct" >> /etc/wicd/encryption/templates/active && echo "[DONE]"
    fi
}

post_remove()
{
    echo -n "Deleting eduroam from active list... "
    sed -e '/^eduroam-fct$/d' -i /etc/wicd/encryption/templates/active
    echo "[DONE]"
}



#! /bin/bash

# Please note: This script was not provided by the authors of Regain, but
# by the maintainer of the PKGBUILD - Frank Poehler <fp29129@googlemail.com>.
# It is released under the same license as Regain.
# For questions, suggestions or bug reports regarding this script,
# just drop me a line.


REGAIN_PATH="/opt/regain-desktop"
USER_PATH="/home/$USER/.local/share/regain-desktop"

install_in_userspace() {
    if ! test -e "$USER_PATH"; then
        mkdir -p "$USER_PATH"
        echo "Created user's Regain directory in '$USER_PATH'."
    else
        if ! test -d "$USER_PATH"; then
            save_ext=".saved_`date`"
            mv "$USER_PATH" "$USER_PATH$save_ext" || exit 1
            echo "Tried to create user's Regain directory in '$USER_PATH', but found something here that does not seem to belong to Regain Desktop Search."
            echo "Moved that to '$USER_PATH$save_ext'".
            mkdir -p "$USER_PATH"
            echo "Now created user's Regain directory in '$USER_PATH'."
        fi
    fi

    if ! test -e "$USER_PATH"/conf; then
        mkdir -p "$USER_PATH"/conf
        cp -R --preserve=mode "$REGAIN_PATH"/conf/default "$USER_PATH"/conf/
        echo "Copied default configuration into user's Regain directory."
        echo "For details about Regain configuration, see"
        echo "http://regain.murfman.de/wiki/doku.php?id=config"
    else
        if ! test -d "$USER_PATH"/conf; then
            save_ext=".saved_`date`"
            mv "$USER_PATH"/conf "$USER_PATH/conf$save_ext" || exit 1
            echo "Tried to copy default configuration files into '$USER_PATH/conf', but found something here that does seem to not belong to Regain Desktop Search."
            mkdir "$USER_PATH"/conf || exit 1
            cp -R --preserve=mode "$REGAIN_PATH"/conf/default "$USER_PATH"/conf/ || exit 1
            echo "Moved that to '$USER_PATH/conf$save_ext'".
            echo "Now copied default configuration files into '$USER_PATH'"
        fi
    fi

    for i in 'preparator' 'web' 'regain.jar'; do
        if ! test -e "$USER_PATH/$i"; then
            ln -s "$REGAIN_PATH/$i" "$USER_PATH"
            echo "Sym-linked '$REGAIN_PATH/$i' to '$USER_PATH/$i'."
        fi
    done
}

if [ `whoami` == "root" ] ; then
    USER_PATH="$REGAIN_PATH"
else
    install_in_userspace
fi

cd "$USER_PATH"
running=`lsof "$USER_PATH"/regain.jar 2>/dev/null`
if test -z "$running"; then
    echo "Starting Regain..."
    java -Djava.library.path=/usr/lib/jni -jar regain.jar
else
    echo
    echo "Regain is already running."
    echo "To stop it, do"
    echo "    lsof ""$USER_PATH"/regain.jar
    echo 'grab the PID and do'
    echo '    kill <PID>'
    echo 'To restart Regain, run this script again after you have killed the running instance of Regain as described above.'
    echo
    exit 1
fi 


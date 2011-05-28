#!/bin/sh
export LANG=zh_CN.UTF-8
export GDK_NATIVE_WINDOWS=true
export GTK_IM_MODULE=xim
if pacman -Q ibus > /dev/null 2>&1; then
    export XMODIFIERS="@im=ibus"
elif pacman -Q scim > /dev/null 2>&1; then
    export XMODIFIERS="@im=SCIM"
fi

cd /usr/share/tencent/qq
./qq

#!/bin/sh
# Lock screen

lock_screen()
{
    ## based on "/usr/bin/xflock4"
    if pgrep xscreensaver > /dev/null 2>&1; then
        XLOCK="xscreensaver-command -lock"
    elif pgrep gnome-screensav > /dev/null 2>&1; then
        XLOCK="gnome-screensaver-command --lock"
    elif pgrep -f startkde > /dev/null 2>&1; then
        XLOCK="dbus-send --session --dest=org.kde.krunner \
                  --type='method_call' --print-reply \
                  /ScreenSaver org.freedesktop.ScreenSaver.Lock"
    elif pgrep xautolock > /dev/null 2>&1; then
        XLOCK="xautolock -locknow"
    elif [ -x /usr/bin/i3lock ]; then
        XLOCK="i3lock"
    else
        XLOCK="xlock -mode blank $* &"
    fi

    ## based on "/etc/acpi/sleep.sh" and "/usr/share/acpi-support/power-funcs"
    for x in /tmp/.X11-unix/*; do
        displaynum=`echo $x | sed s#/tmp/.X11-unix/X##`
        user=`who | grep -m1 "(:$displaynum)" | awk '{print $1}'`
        if [ x"$user" = x"" ]; then
            user=`who | grep -m1 ":$displaynum" | awk '{print $1}'`
        fi
        if [ x"$user" != x"" ]; then
            export DISPLAY=":$displaynum"
            /bin/su -c "$XLOCK" "$user"
        fi
    done
}

case "$1" in
    hibernate|suspend)
        lock_screen
        ;;
esac

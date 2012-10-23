if [ "$BASH_VERSION" ] && [ -n "$PS1" ] && echo $SHELLOPTS | grep -v posix >>/dev/null; then
    if [ -f /etc/profile.d/systemd-shell-wrapper.bash ]; then
        source /etc/profile.d/systemd-shell-wrapper.bash
    fi
#elif [ "$ZSH_VERSION" ] && [ -n "$PS1" ]; then
#    if [ -f /etc/profile.d/ ]; then
#        source /etc/profile.d/
#    fi
fi

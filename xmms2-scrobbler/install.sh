##
## install.sh -- install script for xmms2-scrobbler
##

## post_upgrade NEW_VERSION OLD_VERSION
post_upgrade() {
    if test "$(vercmp "$2" 0.4.0)" -lt 0; then
        cat << __EOF__
    xmms2-scrobbler now supports multiple Audioscrobbler
    servers.  Update your configuration according to
    usr/share/doc/xmms2-scrobbler/README.
__EOF__
    fi
}


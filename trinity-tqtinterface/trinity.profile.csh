setenv TDEDIR /opt/trinity
setenv TDEDIRS /usr:$TDEDIR
setenv PATH $PATH:$TDEDIR/bin

if ( ! $?PKG_CONFIG_PATH ) then
 setenv PKG_CONFIG_PATH $TDEDIR/lib/pkgconfig
else
 setenv PKG_CONFIG_PATH $TDEDIR/lib/pkgconfig:$PKG_CONFIG_PATH
endif

if ( ! $?XDG_DATA_DIRS ) then
  setenv XDG_DATA_DIRS $TDEDIR/share
else
  setenv XDG_DATA_DIRS $TDEDIR/share:$XDG_DATA_DIRS
endif

if ( ! $?XDG_CONFIG_DIRS ) then
  setenv XDG_CONFIG_DIRS $TDEDIR/etc/xdg
else
  setenv XDG_CONFIG_DIRS $TDEDIR/etc/xdg:$XDG_CONFIG_DIRS
endif

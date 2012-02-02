export TDEDIR=/opt/trinity 
export TDEDIRS=$TDEDIR
export PATH=$PATH:$TDEDIR/bin
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:$TDEDIR/lib/pkgconfig
if [ ! -z $XDG_DATA_DIRS ]; then 
  export XDG_DATA_DIRS=$XDG_DATA_DIRS:$TDEDIR/share 
else 
  export XDG_DATA_DIRS=$TDEDIR/share 
fi 
if [ ! -z $XDG_CONFIG_DIRS ]; then 
  export XDG_CONFIG_DIRS=$XDG_CONFIG_DIRS:$TDEDIR/etc/xdg 
else 
  export XDG_CONFIG_DIRS=$TDEDIR/etc/xdg 
fi
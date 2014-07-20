
if [ ! -d "$HOME/.pride" ]; then
  mkdir "$HOME/.pride"
fi

if [ ! -f "$HOME/.pride/pride.rc" ]; then
  cp /opt/pride/pride/default.rc "$HOME/.pride/pride.rc"
  chmod 755 "$HOME/.pride/pride.rc"
fi

if [ ! -f "$HOME/.pride/pride.src" ]; then
  ln -s /opt/pride/pride/pride.src "$HOME/.pride/pride.src"
fi

if [ ! -d "$HOME/.pride/plate" ]; then
ln -s /opt/pride/pride/plate "$HOME/.pride/plate"
fi


if [ ! -d "$HOME/.pride/docs" ]; then
ln -s /opt/pride/pride/docs "$HOME/.pride/docs"
fi

if [ ! -d "$HOME/.pride/hold" ]; then
ln -s /opt/pride/pride/hold "$HOME/.pride/hold"
fi

source "$HOME/.pride/pride.rc"
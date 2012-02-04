# Contributor: ezzetabi <ezzetabi@gawab.com>
pkgname=iwbtg
pkgver=1.0.0.rev_B2.4
pkgrel=5
pkgdesc="A sardonic loveletter to the days of early videogaming, a nail-rippingly difficult platform game."
arch=(i686 x86_64)
depends=(wine)
url="http://kayin.pyoko.org/iwbtg"
license=('freeware')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
source=('iwbtg.exe::http://gamejolt.com/data/games/5/files/iwbtgbeta%28fs%29.exe' icons.tar.gz)
noextract=(icons.tar.gz)

build() {
  cd "$pkgdir"

  install -m755 -d usr/share/iwbtg usr/bin usr/share/applications usr/share/pixmaps
  install -m644 "$srcdir"/'iwbtg.exe' usr/share/iwbtg/iwbtg.exe

  cat << EOF >usr/bin/iwbtg
#!/bin/bash
set -e

export WINEARCH=win32
export WINEPREFIX="\$HOME"/.iwbtg/winefs
export WINEDLLOVERRIDES="mshtml="
export XDG_DATA_HOME=/dev/null
export WINEDEBUG=-all

if [ ! -d "\$HOME"/.iwbtg ] ; then
  mkdir -p "\$HOME"/.iwbtg
  cd "\$HOME"/.iwbtg
  ln -s /usr/share/iwbtg/iwbtg.exe "\$HOME"/.iwbtg
  wineboot -u
  [ -x /usr/bin/winetricks ] && winetricks sandbox
  cd winefs/dosdevices
  ln -s ../../ x:
fi

cd /
wine 'x:\iwbtg.exe' "\$@" &>/dev/null
EOF
  chmod 755 usr/bin/iwbtg || return 1

  cat <<EOF >usr/share/applications/iwbtg.desktop
[Desktop Entry]
Version=1.0
Exec=iwbtg
Icon=iwbtg
Type=Application
Categories=Game;ActionGame;
Name=I wanna be the guy!
GenericName=Platform game
Comment=Do YOU have what it takes to be The Guy?
StartupNotify=true
Terminal=false
EOF
  chmod 644 usr/share/applications/iwbtg.desktop

  tar xf "$srcdir"/icons.tar.gz || return 1
  find usr/share/icons -type d -exec chmod 755 {} \;
  find usr/share/icons -type f -exec chmod 644 {} \;

  ln -s /usr/share/icons/hicolor/48x48/apps/iwbtg.png usr/share/pixmaps/iwbtg.png || return 1
  return 0
}

md5sums=('15b8eb37c20c606162d71de3e0d3addf'
         '297cd0fa459e1a1c146f0bd0241eed55')

# vim:set ts=2 sw=2 et:

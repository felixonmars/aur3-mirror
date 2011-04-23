# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=tivion-bzr
pkgver=653
pkgrel=1
pkgdesc="A single player and recorder for streaming online television and radio channels composed of multicultural and international level."
url="http://www.shakaran.net/blog/tivion"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('gnome-python' 'gtk2' 'mplayer' 'sopcast')
[ "$CARCH" == "x86_64" ] && depends=('bin32-sopcast' 'gnome-python' 'gtk2' 'mplayer')
makedepends=('bzr')

_bzrmod=tivion
_bzrtrunk=lp:tivion

build() {
   cd $srcdir

  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod}
  else
    bzr up ${_bzrmod}
  fi

  msg "Connecting to the server...."

  cd ./tivion/src

  # Python2 fix
  for file in $(find . -name '*.py' -print); do
  sed -i 's_^#!.*/usr/bin/env python_#!/usr/bin/env python2_' $file
  done
  sed -i 's_^python_python2_' tivion   

  # Copying files
  mkdir -p $pkgdir/usr/{bin,share/tivion,share/applications}
  cp -r * $pkgdir/usr/share/tivion
 
  # Install startup file
  install -Dm755 tivion $pkgdir/usr/bin/tivion
  
  # Install Desktop Icon
  install -Dm644 tivion.desktop $pkgdir/usr/share/applications/tivion.desktop
  install -Dm644 ./data/img/tivion.png $pkgdir/usr/share/pixmaps/tivion.png
  cd  $pkgdir/usr/share/applications
  sed -i 's_^Icon=/usr/share/pixmaps/tivion-launcher.png_Icon=/usr/share/pixmaps/tivion.png_' tivion.desktop

  # Remove Mplayer Windows binary
  rm -rf $pkgdir/usr/share/tivion/bin

  # Remove sopcast from tivion and link to sopcast from system
  rm $pkgdir/usr/share/tivion/lib/sp-sc-auth 
  ln -s "/usr/bin/sp-sc-auth" "$pkgdir/usr/share/tivion/lib/sp-sc-auth"
}
# Contributor: Nuno Araujo <nuno.araujo at russo79.com>
pkgname=gimp-plugin-file-ora-git
pkgver=20110927
pkgrel=1
pkgdesc="OpenRaster support for GIMP 2.6+"
arch=('x86_64')
url="http://create.freedesktop.org/wiki/OpenRaster"
license=('GPL')
depends=('gimp>=2.6.0' 'gimp<=2.7.1' 'python2')
makedepends=('git')
provides=(gimp-plugin-file-ora)
conflicts=(gimp-plugin-file-ora)

_gitroot="git://gitorious.org/openraster/gimp-plugin-file-ora.git"
_gitname="gimp-plugin-file-ora"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname"
  sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' file-ora.py
} 

package() {
  cd "$srcdir/$_gitname"
  install -m 775 file-ora.py -D $pkgdir/usr/lib/gimp/2.0/plug-ins/file-ora.py
}

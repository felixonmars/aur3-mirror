# Contributor: William Rea <sillywilly@gmail.com>
pkgname=gnelib
pkgver=0.70
pkgrel=2
pkgdesc="Game Networking Engine"
arch=(i686 x86_64)
url="http://www.gillius.org/gne"
license="LGPL"
depends=('hawknl')
source=(http://dl.sourceforge.net/sourceforge/gnelib/gnelib-$pkgver.tar.bz2)
md5sums=('7c5b58144aa39c15e75e84039f84bff3')

build() {
  cd $startdir/src/gnelib-$pkgver
  chmod 755 include/gnelib.h
  find -name makefile.linux -exec sed -i "s|/usr/local|$startdir/pkg/usr|" {} \;
  sh fixlinux.sh
  make lib || return 1
  install -d $startdir/pkg/usr/include $startdir/pkg/usr/lib
  make DESTDIR=$startdir/pkg install
}

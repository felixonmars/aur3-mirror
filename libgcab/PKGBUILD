# Maintainer: Ludovic Fauvet <etix@l0cal.com>
pkgname=libgcab
_pkgshortname=gcab
pkgver=0.4
pkgrel=1
pkgdesc="GObject Introspection interface description for gcab"
arch=('i686' 'x86_64')
url="http://ftp.acc.umu.se/pub/GNOME/sources/gcab/"
license=('LGPL')
depends=('xz' 'zlib' 'glib2')
makedepends=('autoconf' 'automake' 'intltool')
source=(http://ftp.acc.umu.se/pub/GNOME/sources/gcab/$pkgver/$_pkgshortname-$pkgver.tar.xz)
sha256sums=('f907b16f1246fbde9397363d9c4ad2291f2a8a53dcd4f5979d3912bb856991b8')
options=(!libtool)

build() {
  cd $_pkgshortname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $_pkgshortname-$pkgver
  BIN=.libs/gcab
  if [ -f $BIN ];
  then
      cp $BIN .
  fi
  make DESTDIR=${pkgdir} install
}

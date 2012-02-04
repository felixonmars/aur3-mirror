# Contributor: jmtan <jmingtan@gmail.com>
pkgname=tpserver-cpp
pkgver=0.5.0
pkgrel=1
pkgdesc="The main server written in C++ for Thousand Parsec, a 4x strategy game framework."
arch=('i686')
url="http://www.thousandparsec.net/"
license=('GPL2')
depends=('guile' 'libtprl' 'boost')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
groups=()
options=()
install=
source=(http://www.thousandparsec.net/tp/downloads/tpserver-cpp/$pkgname-$pkgver.tar.gz minisec.diff tpserver.diff)
noextract=()
md5sums=('d8e31cc35021c77d74f5da8931e27918'
         '1e3c5f0c1e9bbfa0eb6a3b935d47b255'
         '4fb7414b3b92570e267cfcc0623ba6ec')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch modules/games/minisec/minisec.cpp $startdir/minisec.diff
  patch -d tpserver < $startdir/tpserver.diff
  ./configure --prefix=/opt/tpserver-cpp
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}


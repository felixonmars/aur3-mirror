# Contributor: Masse Nicolas <masse.nicolas@gmail.com>

pkgname=socket_plus_plus
pkgver=1.12.12
pkgrel=1
pkgdesc="C++ class library wrapping the berkeley sockets C API into C++ iostreams"
url="http://www.linuxhacker.at/socketxx"
makedepends=(make-info)
depends=(gcc glibc)
source=(http://src.linuxhacker.at/socket++/socket++-$pkgver.tar.gz)
md5sums=('b96e06129504ae2b4005a5834264c5a4')

build() {
  cd $startdir/src/$socket++-$pkgver
  ./autogen
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

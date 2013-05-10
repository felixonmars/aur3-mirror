# Contributor: Mikhail <mikhail.svetkin@gmail.com>

pkgname=libmodbus-3
pkgver=3.0.4
pkgrel=2
pkgdesc="A Modbus library for Linux (and OSX) wrote in C and which supports RTU and TCP communications. Last version"
arch=('i686' 'x86_64')
url="https://libmodbus.org"
license=('GPL')
groups=()
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=(https://github.com/stephane/libmodbus/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('0e58e25331f39dbc20b345c24aa04d19')

build() {
  cd "$srcdir/libmodbus-$pkgver"
  ./autogen.sh;
  ./configure --prefix=/usr
   make || return 1
   make DESTDIR="$pkgdir/" install
   rm $pkgdir/usr/lib/*.la
}

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Contributor: Your Name <youremail@domain.com>
pkgname=libmodbus3
pkgver=3.0.1
pkgrel=2
pkgdesc="A Modbus library for Linux (and OSX) wrote in C and which supports RTU and TCP communications."
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
source=(https://github.com/downloads/stephane/libmodbus/libmodbus-$pkgver.tar.gz)
noextract=()
md5sums=('7ad8afbd02a7a2afd70c5bb7271a593b')

build() {
  cd "$srcdir/libmodbus-$pkgver"
  ./configure --prefix=/usr
   make || return 1
   make DESTDIR="$pkgdir/" install
   rm $pkgdir/usr/lib/*.la
}

# vim:set ts=2 sw=2 et:

# Maintainer: Francois Boulogne <fboulogne at april dot org>

pkgname=libdivecomputer
pkgver=0.4.1
pkgrel=1
pkgdesc="library for communication with dive computers from various manufacturers"
arch=('i686' 'x86_64')
url="http://www.libdivecomputer.org"
license=('LGPL')
depends=()
optdepends=()
makedepends=('make')
provides=()
conflicts=()
source=("http://www.divesoftware.org/libdc/releases/libdivecomputer-${pkgver}.tar.gz")
md5sums=('7c57488d44c18881fde6ff887dd5764e')


build() {
  cd "$srcdir/libdivecomputer-${pkgver}"

  #Fix for automake > 1.12
  sed -i -e "s/# Initialize libtool\./m4_ifdef([AM_PROG_AR], [AM_PROG_AR])/" configure.ac
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/libdivecomputer-${pkgver}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:

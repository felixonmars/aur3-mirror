# Contributor: Andreas Baumann <abaumann@yahoo.com>

pkgname=nalfs
pkgver=1.2.6
pkgrel=2
pkgdesc="nALFS is a build tool (originally written to automatize the building of the LFS system)"
arch=('i686' 'x86_64')
url="http://www.linuxfromscratch.org/alfs/index.html"
license=('GPL')
depends=('libxml2' 'ncurses')
makedepends=('pkgconfig')
source=(http://www.linuxfromscratch.org/alfs/downloads/stable/nALFS-$pkgver.tar.bz2)
md5sums=('fd8446eedf41d00b5654a9db31c09bb8')

build() {
  cd $srcdir/nALFS-$pkgver
  ./configure --prefix=/usr || return 1
  # the automake/autoconf/libtool support is heavily broken in nALFS!
  # patching here..
  sed -i 's@-lm/libxml2.la@-lm -lxml2@' Makefile
  make || return 1
  make DESTDIR=$pkgdir install
}

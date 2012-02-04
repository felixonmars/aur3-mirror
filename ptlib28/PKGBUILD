# Maintainer: Dylan Ferris <dylan.ferris@gmail.com>
# This is my first package, so hopefully it's done properly!

pkgname=ptlib28
pkgver=2.8.2
pkgrel=1
pkgdesc="The Portable Tool Library is a C++ multi-platform abstraction library, part of the opalvoip project."
arch=('i686' 'x86_64')
url="http://www.opalvoip.org/"
license=('MPL')
provides=("ptlib=${pkgver}")
conflicts=('ptlib')
source=("http://downloads.sourceforge.net/project/opalvoip/v3.8%20Sirius/Stable%202/ptlib-$pkgver.tar.bz2")
md5sums=('3248cbea1af92439a10a4ef15824e9e3') #generate with 'makepkg -g'

build() {
  cd $srcdir/ptlib-$pkgver
  ./configure --prefix=/usr PTLIB_CONFIG=/usr/bin/ptlib-config
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}

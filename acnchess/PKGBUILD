# Contributor: Tocer Deng <tocer.deng@gmail.com>
pkgname=acnchess
pkgver=0.0.1
pkgrel=6
pkgdesc="another Chinese chess game coded by Alf"
arch=('i686' 'x86_64')
url="http://naihe2010.github.com/acnchess"
license=('GPL2')
depends=('gtk2>=2.6.0' 'openssl')
source=("https://github.com/downloads/naihe2010/acnchess/$pkgname-$pkgver.tar.gz")
md5sums=('4db844ea4c036cf51223c86b77cf3d1c')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p build
  cd build
  cmake .. 
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

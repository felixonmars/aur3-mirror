# Maintainer: Timur Antipin < mooxtim (at) yandex.ru >
pkgname=speedcrunch-alpha
pkgver=0.11
pkgrel=1
pkgdesc="A simple but powerful calculator using QT"
arch=('i686' 'x86_64')
url="http://speedcrunch.org/"
license=('GPL2')
depends=('qt>=4.3.0')
makedepends=('make' 'cmake')
conflicts=('speedcrunch')
source=("http://speedcrunch.googlecode.com/files/speedcrunch-${pkgver}-alpha.tar.gz")
md5sums=('36e5588cc7dd1f0d50ddad194d7743e7')

build() {
msg "Building and installing..."
  cd $srcdir/speedcrunch-$pkgver-alpha/src
  cmake . -DCMAKE_INSTALL_PREFIX=/usr || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}

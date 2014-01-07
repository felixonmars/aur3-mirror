# Maintainer: Alif Rachmawadi <subosito[at]gmail[dot]com>
pkgname=eqonomize-kde
arch=('i686' 'x86_64')
pkgver=0.6
pkgrel=7
pkgdesc="A personal accounting software, with focus on efficiency and ease of use for the small household economy."
url="http://eqonomize.sourceforge.net/"
license=('GPL')
depends=('kdelibs' 'oxygen-icons')
makedepends=('cmake' 'automoc4')
source=(https://github.com/subosito/$pkgname/archive/v$pkgver.$pkgrel.tar.gz)
md5sums=('f8fa960164d3e9d88ea81be0850fb9e1')

build() {
cd $srcdir/$pkgname-$pkgver.$pkgrel
cmake -D CMAKE_INSTALL_PREFIX=/usr .
make || return 1
make DESTDIR=$pkgdir install
}

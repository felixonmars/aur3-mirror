# Contributor: Rudanar <krisztian dot kad thething gmail dot com>
pkgname=eqonomize
arch=('i686' 'x86_64')
pkgver=0.6
pkgrel=1
pkgdesc="A personal accounting software, with focus on efficiency and ease of use for the small household economy."
url="http://eqonomize.sourceforge.net/"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
source=(http://downloads.sourceforge.net/sourceforge/eqonomize/$pkgname-$pkgver.tar.gz)
md5sums=('02d7c98c4ca822873c355fd9095a3268')

build() {
cd $startdir/src/$pkgname-$pkgver
cmake -D CMAKE_INSTALL_PREFIX=/usr .
make || return 1
make DESTDIR=$startdir/pkg install
} 
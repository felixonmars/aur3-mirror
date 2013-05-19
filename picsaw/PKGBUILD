# Maintainer: Simone Sclavi 'Ito' <darkhado@gmail.com>

pkgname=picsaw
pkgver=1.0.3
pkgrel=1
pkgdesc="Jigsaw puzzle game that uses your own photos to make puzzles"
arch=('i686' 'x86_64')
url="https://launchpad.net/picsaw"
license=('GPL3')
depends=('clutter-gtk' 'hicolor-icon-theme')
makedepends=('itstool' 'intltool')
source=(https://launchpad.net/picsaw/trunk/${pkgver}/+download/$pkgname-${pkgver}.tar.gz)
install=picsaw.install
md5sums=('cb00a031def31ef61dedb2ef07bb0777')

build() {
    cd $pkgname-$pkgver
    ./configure --prefix='/usr'
    make
}
package() {
    cd $pkgname-$pkgver
    make DESTDIR=$pkgdir install
}

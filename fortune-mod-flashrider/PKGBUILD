# Contributor : Kevin Thomas <hamgom95@googlemail.com>

pkgname=fortune-mod-flashrider
pkgver=1.10
pkgrel=1
pkgdesc="Fortune cookies (986) from pro-linux.de (513), linux-forum.de (205), german-bash.org (151) and some more"
url="http://www.nanolx.org/random/fortunesflashrider/"
arch=('any')
license=('Public Domain')
depends=('fortune-mod')
source=(http://www.pro-linux.de/files/fortunes-flashrider_1.10.tar.bz2)

build() {
    cd $srcdir/fortunes-flashrider_$pkgver
    make all
}
package() {
    cd $srcdir/fortunes-flashrider_$pkgver
    make PREFIX=$pkgdir/usr INSTALLDIR=/share/fortune install
}
sha256sums=('d807eae7a43b9ee4ee5ab8824d0b7eab81ae00ad9c8899f903ebf8cdb5987744')

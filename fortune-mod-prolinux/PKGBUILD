# Contributor : Alexander Duscheleit <jinks@huntemann.uni-oldenburg.de>

pkgname=fortune-mod-prolinux
pkgver=1.10
pkgrel=1
pkgdesc="Fortune cookies from the german site prolinux.de"
url="http://www.nanolx.org/random/fortunesflashrider/"
arch=('any')
license=('Public Domain')
depends=('fortune-mod')
source=("http://www.nanolx.org/downloads/Fortunes\:\:Flashrider/fortunes-flashrider_${pkgver}.tar.bz2")

build() {
    cd $srcdir/fortunes-flashrider_${pkgver}
    make all
}
package() {
    cd $srcdir/fortunes-flashrider_${pkgver}
    make PREFIX=$pkgdir/usr INSTALLDIR=/share/fortune install
}
sha256sums=('d807eae7a43b9ee4ee5ab8824d0b7eab81ae00ad9c8899f903ebf8cdb5987744')

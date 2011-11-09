# Contributor: Jiri Prochazka <ojirio@gmail.com>
pkgname=simlib
pkgver=3.02
pkgrel=1
pkgdesc="c++ SIMulation LIBrary for continuous, discrete, combined, 2D/3D vector, and fuzzy models."
arch=('i686' 'x86_64')
url="http://www.fit.vutbr.cz/~peringer/SIMLIB/"
license=('LGPL')
makedepends=('gcc')
depends=('gcc-libs')
source=('http://www.fit.vutbr.cz/~peringer/SIMLIB/source/simlib-3.02-20111030.tar.gz')
md5sums=('8f1ceab7cdeb2610b1fb8d85238dae25')

build() {
    cd $srcdir/$pkgname
    sed -i "s|ldconfig|#ldconfig|g" ./src/Makefile.generic || return 1
    make PREFIX=$pkgdir/usr/ || return 1
    make PREFIX=$pkgdir/usr/ install || return 1
}

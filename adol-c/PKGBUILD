# Maintainer: Akshay Srinivasan <akshaysrinivasan@gmail.com>
# Maintainer:  Thomas Zervogiannis <tzervo@gmail.com>

pkgname=adol-c
pkgver=2.5.2
pkgrel=1
pkgdesc="An open-source package for the automatic differentiation of C and C++ programs"
url="http://www.coin-or.org/projects/ADOL-C.xml"
arch=('i686' 'x86_64')
license=('GPL')
depends=(colpack)
source=(http://www.coin-or.org/download/source/ADOL-C/ADOL-C-$pkgver.tgz configure.patch libtool.m4.patch)
md5sums=('96f81b80e93cca57398066ea4afe28f0' 'b63a380caf9b89beb1d6d3102c1ddabf' '9e4edfda7507a7f485bcf715cdf78b99')


build() {
    cd ${srcdir}/ADOL-C-$pkgver
    patch ./configure ${srcdir}/configure.patch
    patch ./autoconf/libtool.m4 ${srcdir}/libtool.m4.patch
    ./configure --enable-sparse --with-colpack=/usr --prefix=/usr --enable-shared=no
    make
}

package() {
    cd ${srcdir}/ADOL-C-${pkgver}
    make DESTDIR="${pkgdir}" install
}

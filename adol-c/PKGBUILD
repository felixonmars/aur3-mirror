# Maintainer:  Thomas Zervogiannis <tzervo@gmail.com>

pkgname=adol-c
pkgver=2.2.1
pkgrel=1
pkgdesc="An open-source package for the automatic differentiation of C and C++ programs"
url="http://www.coin-or.org/projects/ADOL-C.xml"
arch=('any')
license=('GPL')
depends=()
optdepends=('colpack: efficient handling of sparse jacobians')
makedepends=(colpack)
source=(http://www.coin-or.org/download/source/ADOL-C/ADOL-C-$pkgver.tgz configure.patch aclocal.m4.patch)
md5sums=('5fe149865b47f77344ff910702da8b99' 'b63a380caf9b89beb1d6d3102c1ddabf' '1b633d1b948b7c7177d0b0802e5d50cd')


build() {
    cd ${srcdir}/ADOL-C-$pkgver
    patch ./configure ../../configure.patch
    patch ./aclocal.m4 ../../aclocal.m4.patch
    ./configure --enable-sparse --with-colpack=/usr --prefix=/usr --enable-shave=no
    make
}

package() {
    cd ${srcdir}/ADOL-C-${pkgver}
    make DESTDIR="${pkgdir}" install
}


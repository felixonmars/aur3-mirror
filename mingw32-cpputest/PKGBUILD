# Maintainer: Marcel Schneider marcel@coopmasters.de

pkgname=mingw32-cpputest
_pkgname=cpputest
pkgver=3.5
pkgrel=1
pkgdesc="unit testing and mocking framework for C/C++"
url="http://cpputest.org"
arch=('any')
license=('BSD')
depends=('mingw32-runtime')
provides=('cpputest')
options=('libtool' 'staticlibs' '!strip' '!buildflags' '!emptydirs')
source=("https://github.com/${_pkgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
md5sums=('546c44b23e512eb69f10cd06a0a55999')

build() {
    cd ${srcdir}/${_pkgname}-${pkgver}
  unset LDFLAGS
  unset CXXFLAGS
  unset CFLAGS
  export CXX=i486-mingw32-g++
  export CC=i486-mingw32-gcc
  sed -i -e's/^AC_FUNC_MALLOC/#AC_FUNC_MALLOC/' configure.ac
  sed -i -e's/^AC_FUNC_REALLOC/#AC_FUNC_REALLOC/' configure.ac
  autoreconf
   ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32 --build=i686-linux

    make
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}

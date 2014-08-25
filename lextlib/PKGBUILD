# submitter: perlawk
# Maintainer: perlawk

pkgname=lextlib
pkgver=1.0
pkgrel=1
pkgdesc="Lua extension library — Small bits of code that make writing Lua/C modules easier"
url="https://github.com/devurandom/lextlib"
arch=('any')
license=('GPLv3')
depends=( 'lua')
source=( "https://codeload.github.com/devurandom/lextlib/zip/master")
 
build() {
  cd "${srcdir}/lextlib-master"
  gcc -o liblextlib.so -fpic -shared lextlib.c ltypelib.c
}
 
package() {
  cd "${srcdir}/lextlib-master"
  mkdir -p "$pkgdir/usr/include"
  mkdir -p "$pkgdir/usr/lib"
  cp *.h "$pkgdir/usr/include/"
  cp liblextlib.so "$pkgdir/usr/lib/"
}
md5sums=('a4dbb5c82d5485422b80d8241d182f0d')

# Maintainer: Boohbah <boohbah at gmail dot com>
# Contributor: sudokode <sudokode at gmail dot com>

pkgname=american-fuzzy-lop-svn
pkgver=r41
pkgrel=2
pkgdesc="A fuzzer using a novel type of compile-time instrumentation (svn version)"
arch=('i686' 'x86_64')
url="https://code.google.com/p/american-fuzzy-lop/"
license=('Apache')
makedepends=('subversion')
provides=('american-fuzzy-lop')
conflicts=('american-fuzzy-lop')
source=("$pkgname::svn+http://american-fuzzy-lop.googlecode.com/svn/trunk/")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

prepare() {
  cd $pkgname
  # Fix paths because there is no configure script
  sed -i "s:/usr/local/bin:${pkgdir}/usr/bin:" Makefile
  sed -i "s:/usr/local/lib:${pkgdir}/usr/lib:" Makefile
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/{bin,lib,}
  make install
}

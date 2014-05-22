# Maintainer: perlawk

pkgname=dlx
pkgver=1.5
pkgrel=1
pkgdesc="A DLX processor simulator command line only."
arch=('i686' 'x86_64')
url="http://www.davidviner.com/dlx.html?name=DLX+Simulator"
license=('Apache')
options=('staticlibs')
depends=()
source=("http://www.davidviner.com/zip/dlx/dlx.zip")

build() {
  cd "$srcdir/dlx"
  make
}

package() {
  cd "$srcdir"/dlx
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/share/dlx"
  cp dasm masm mon "$pkgdir/usr/bin"
  cp MANUAL.TXT *.m *.a *.i "$pkgdir/usr/share/dlx"
}
md5sums=('97fde4baa0d00d7600dc7715878876f7')

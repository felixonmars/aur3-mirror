# Maintainer: SpepS <dreamspepser at yahoo dot it>

_ver=110615
pkgname=binmay
pkgver=0.3_15062011
pkgrel=1
pkgdesc="A Command Line Binary Search and Replace Tool."
arch=(i686 x86_64)
url="http://www.filewut.com/spages/page.php/software/binmay"
license=('GPL')
depends=('glibc')
source=("http://www.filewut.com/spages/pages/software/binmay/files/$pkgname-$_ver.tar.gz")
md5sums=('5bd65173445c0f838e4c4c15796a8b69')

build() {
  cd "$srcdir/$pkgname-$_ver"

  make clean
  make $pkgname
}

package() {
  cd "$srcdir/$pkgname-$_ver"

  # bin
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

  # doc
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 et:

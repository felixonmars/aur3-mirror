# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=mvsis
pkgver=3.0
pkgrel=1
pkgdesc="Fast binary synthesis algorithms, technology mapping and resynthesis procedures and engines for combinational and sequential equivalence checking."
arch=('i686' 'x86_64')
url="http://embedded.eecs.berkeley.edu/Respep/Research/mvsis/"
license=('GPL')
depends=('libbsd')
source=("${url}release/$pkgname-$pkgver.tar.gz"
        "$pkgname.patch")
md5sums=('76a813802c54962efb45d77c39957111'
         '1dad1468491d5a3a4b4f17cade545fab')

build() {
  cd "$srcdir/$pkgname-1.3"

  # add support for 64bit
  # and other compatibility fixes
  patch -p1 -i ../$pkgname.patch

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-1.3"

  # bin
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

  # examples
  install -d "$pkgdir/usr/share/$pkgname/examples"
  install -Dm644 examples/*.* "$pkgdir/usr/share/$pkgname/examples"
}

# vim:set ts=2 sw=2 et:

# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=xmlpatch
pkgver=0.2
pkgrel=1
pkgdesc="Simple utility to change XML files similar to the well known patch utility."
arch=(i686 x86_64)
url="http://malat.biz/view/Projects/XMLPatch"
license=('GPL')
depends=('libxmlpatch')
source=("https://github.com/petris/$pkgname/tarball/v$pkgver")
md5sums=('f3d53f58158a266b7e4ca0949b2b3369')

build() {
  cd "$srcdir/"*-$pkgname-*

  make
}

package() {
  cd "$srcdir/"*-$pkgname-*

  # prepare folders
  install -d "$pkgdir/usr/"{bin,share/man/man1}

  make PREFIX="$pkgdir/usr" install
}

# vim:set ts=2 sw=2 et:

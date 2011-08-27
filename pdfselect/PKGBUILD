# Contributor: ezzetabi <ezzetabi at gawab dot com>
pkgname=pdfselect
pkgver=1.10
pkgrel=1
pkgdesc="A page selector for pdf files."
arch=(i686 x86_64)
url="http://www.nosite.invalid/"
license=('GPL')
groups=()
depends=(tetex)
makedepends=(gcc)
source=(pdfselect pdfselect_i.c)

build() {
  cd "$srcdir"
  gcc -O2 -o pdfselect_i pdfselect_i.c || return 1
  cd ..
  install -d -m 755 "$pkgdir"/usr/bin
  install -m 755 "$srcdir"/pdfselect "$pkgdir"/usr/bin
  install -m 755 "$srcdir"/pdfselect_i "$pkgdir"/usr/bin
}

md5sums=('b2b4f22162c5338a392860e6469d0ab9'
         'd4b8b0c280e7a708017981eae5470e8e')


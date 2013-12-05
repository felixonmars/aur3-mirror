# Contributor: Doug Newgard <scimmia22 at outlook dot com>

pkgname=docfrac
pkgver=4.0.1
pkgrel=1
pkgdesc="converter between RTF, HTML and ASCII text"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/docfrac/"
license=('LGPL')
depends=('boost-libs' 'qt4')
makedepends=('boost')
options=('!makeflags')
source=("http://sourceforge.net/projects/docfrac/files/$pkgname/$pkgver/$pkgname-$pkgver.src.tar.gz")
sha1sums=('a4c12c21f26060e383c5326620cf6961f2881251')

prepare() {
  sed -i 's/qmake/qmake-qt4/g' "$srcdir/$pkgname-$pkgver/Makefile"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make ROOT="$pkgdir" install
}

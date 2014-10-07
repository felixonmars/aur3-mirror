# Maintainer: epsy <epsy nospace 46 at free dot fr>

pkgname=cfdg
pkgver=3.0.8
pkgrel=1
pkgdesc="A command-line tool for rendering CFDG design grammars."
arch=(i686 x86_64)
url="http://www.contextfreeart.org/"
license=('GPL')
groups=('')
depends=('libpng')
source=(http://www.contextfreeart.org/download/ContextFreeSource$pkgver.tgz)
md5sums=('f1c83909e1cc54c54067b77d977b83d7')

build() {
  cd "$srcdir/ContextFreeSource$pkgver"
  make
}

package () {
 cd "$srcdir/ContextFreeSource$pkgver"
 mkdir -p "$pkgdir/usr/bin"
 cp cfdg "$pkgdir/usr/bin"
}
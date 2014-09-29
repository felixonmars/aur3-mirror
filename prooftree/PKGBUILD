# Contributor: <predrg@gmail.com>

pkgname=prooftree
pkgver=0.12
pkgrel=1
pkgdesc="Proof-tree visualization during interactive theorem proof development. Currently for Coq and Proof General."
arch=('i686' 'x86_64')
url="http://askra.de/software/prooftree/"
license=('GPL3')
depends=('ocaml' 'lablgtk2')
makedepends=()
source=('http://askra.de/software/prooftree/releases/prooftree-0.12.tar.gz')
md5sums=('1ccae43094ae52a85a52bff0f9e22495')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix /usr
  make all
}

package () {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="${pkgdir}" install
  install -D -m644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -D -m644 COPYING "${pkgdir}/usr/share/licences/${pkgname}/COPYING"
}


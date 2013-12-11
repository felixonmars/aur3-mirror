# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
pkgname=python-freetype-py
pkgver=0.4.1
pkgrel=2
pkgdesc="FreeType Python bindings"
arch=('any')
url="https://code.google.com/p/freetype-py/"
license=('BSD')
groups=()
depends=('python2')
options=(!emptydirs)
install=
source=("https://${pkgname##python-}.googlecode.com/files/${pkgname##python-}-${pkgver}.tar.gz")
sha1sums=('27b737d14277b9a0b51400434b0efa378735fea3')

package() {
  cd "$srcdir/${pkgname##python-}-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  rm "$pkgdir/usr/Vera.ttf"
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname"
}

# vim:set ts=2 sw=2 et:

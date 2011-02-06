# Maintainer: Stephan Platz <arch@stephan-platz.de>
pkgname=scratchbox-devkit-doctools
pkgver=1.0.15
pkgrel=1
pkgdesc="document generation tools"
arch=('x86_64' 'i686')
url="http://www.scratchbox.org/"
license=('GPL')
source=(http://www.scratchbox.org/download/files/sbox-releases/hathor/tarball/$pkgname-$pkgver-i386.tar.gz)

build() {
  return 0
}

package() {
  cd "$srcdir"
  echo "Copy binaries..."
  cp -R scratchbox $pkgdir/
}

# vim:set ts=2 sw=2 et:
md5sums=('9ca92337b8273695aef67ba4546740b9')

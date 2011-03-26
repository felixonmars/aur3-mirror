# Maintainer: Stephan Platz <arch@stephan-platz.de>
pkgname=scratchbox-devkit-debian
pkgver=1.0.12
pkgrel=1
pkgdesc="environment and tools for Debian development"
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
md5sums=('7829eba96b113f1bd85ae56615cb3d75')

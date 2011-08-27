# Maintainer: Stephan Platz <arch@stephan-platz.de>
pkgname=scratchbox-toolchain-host-gcc
pkgver=1.0.24
pkgrel=1
pkgdesc="toolchain for the host system"
arch=('x86_64' 'i686')
url="http://www.scratchbox.org/"
license=('GPL')
source=(http://www.scratchbox.org/download/files/sbox-releases/hathor/tarball/$pkgname-$pkgver-i386.tar.gz)
md5sums=('5749a1544ca1e69792da50a93c40640e')

build() {
  return 0
}

package() {
  cd "$srcdir"
  echo "Copy binaries..."
  cp -R scratchbox $pkgdir/
}

# vim:set ts=2 sw=2 et:

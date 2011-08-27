# Maintainer: Stephan Platz <arch@stephan-platz.de>
pkgname=scratchbox-devkit-perl
pkgver=1.0.5
pkgrel=1
pkgdesc="additional Perl modules"
arch=('x86_64' 'i686')
url="http://www.scratchbox.org/"
license=('GPL')
source=(http://www.scratchbox.org/download/files/sbox-releases/hathor/tarball/$pkgname-$pkgver-i386.tar.gz)
md5sums=('61a87f69437fe52c9bf8ea95f02ab059')

build() {
  return 0
}

package() {
  cd "$srcdir"
  echo "Copy binaries..."
  cp -R scratchbox $pkgdir/
}

# vim:set ts=2 sw=2 et:

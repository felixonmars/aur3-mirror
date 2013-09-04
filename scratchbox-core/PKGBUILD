# Maintainer: Stephan Platz <arch@stephan-platz.de>

pkgname=scratchbox-core
pkgver=1.0.27
pkgrel=1
pkgdesc="environment, common tools and host compiler"
arch=('any')
url="http://www.scratchbox.org/"
license=('GPL')
depends=("scratchbox-libs=$pkgver")
optdepends=("scratchbox-devkit-debian: support for debian development"
  "scratchbox-devkit-doctools: document generation"
  "scratchbox-devkit-perl: perl support"
  "scratchbox-devkit-qemu: qemu support")
install="$pkgname.install"
source=(http://www.scratchbox.org/download/files/sbox-releases/hathor/tarball/$pkgname-$pkgver-i386.tar.gz)
md5sums=('ef8b26b233cd150e98cce2498ed66485')

package() {
  cp -R scratchbox $pkgdir/
}

# $Id$
# Maintainer: Thomas Bächler <thomas@archlinux.org>
pkgname=nspluginwrapper
pkgver=1.4.4
pkgrel=1
pkgdesc="Cross-platform NPAPI compatible plugin viewer"
arch=('i686')
url="http://nspluginwrapper.davidben.net/"
license=('GPL')
depends=('curl' 'libxt' 'gcc-libs' 'gtk2' )
makedepends=('gcc')
install="install"
source=(http://nspluginwrapper.davidben.net/download/$pkgname-$pkgver.tar.gz)
md5sums=('36f3e290fc4ce56f65ee695078961188')
build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make -j1 DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

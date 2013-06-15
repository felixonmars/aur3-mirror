# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Hauke Wesselmann <hauke@h-dawg.de>
# Contributor: Giorgio Lando <patroclo7@gmail.com>

pkgname=libsyncml
pkgver=0.5.4
pkgrel=1
pkgdesc="An implementation of the syncml protocol"
arch=('i686' 'x86_64')
url="http://libsyncml.opensync.org/"
license=('LGPL')
depends=('gnutls' 'libsoup' 'libwbxml' 'openobex')
makedepends=('cmake')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
sha256sums=('5ee4c48923ae78489fd13a4329d6a86bcb020bb777f9bc1b35d152f197b748ff')

build() {
  cd ${srcdir}

#building in source directory not allowed
  if [ -d ${srcdir}/build ]; then
    (cd build)
  else
    mkdir ${srcdir}/build && cd ${srcdir}/build
  fi

  cmake ../$pkgname-$pkgver -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd ${srcdir}/build

  make DESTDIR=${pkgdir} install
}

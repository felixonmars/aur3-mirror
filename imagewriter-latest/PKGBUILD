# Maintainer: Alexander Total <neocrust@gmail.com>

pkgname=imagewriter-latest
pkgver=1.9
_opensuse_rel=9.3
pkgrel=1
pkgdesc="SUSE Studio Imagewriter - Graphical image writer application"
url="http://kiwi.berlios.de"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('qt')
source=("http://download.opensuse.org/source/factory/repo/oss/suse/src/imagewriter-${pkgver}-${_opensuse_rel}.src.rpm")
sha512sums=('c70784b93c780a8889f82c6e30751c7faa69d8a0b33d6ae606c0d1027741f03624400f9ba93120c7ad771057ab2feca254b37d2506efaeac4bb4d232c33f72de')

build() {
  cd "${srcdir}"
  rm -vf imagewriter.spec
  tar zxvf imagewriter-${pkgver}.tar.gz
  cd "${srcdir}/imagewriter-${pkgver}"
  qmake PREFIX=/usr imagewriter.pro
  make CFLAGS="${CFLAGS} -DKIOSKHACK -Wno-unused-parameter"
}

package() {
  cd "${srcdir}/imagewriter-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:

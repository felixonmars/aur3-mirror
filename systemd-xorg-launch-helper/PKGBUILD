# Contributor: Alucryd <alucryd at gmail dot com>

pkgname=systemd-xorg-launch-helper
pkgver=3
pkgrel=1
pkgdesc="A wrapper in C to make XOrg function as a proper systemd unit."
url="https://github.com/sofar/xorg-launch-helper"
arch=('any')
license=('GPL2')
depends=(systemd xorg-server)
conflicts=(systemd-xorg-launch-helper-git)
source=(http://foo-projects.org/~sofar/xorg-launch-helper/xorg-launch-helper-3.tar.gz)
md5sums=('6a9fdde4d4b28fc775d0828f793edd52')

build () {
  cd "${srcdir}/xorg-launch-helper-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/xorg-launch-helper-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

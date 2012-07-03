# Contributor: Alucryd <alucryd at gmail dot com>

pkgname=systemd-user-session-units
pkgver=5
pkgrel=1
pkgdesc="A collection of units for the systemd user session."
url="https://github.com/sofar/user-session-units"
arch=('any')
license=('GPL3')
depends=(systemd dbus systemd-xorg-launch-helper)
conflicts=(systemd-user-session-units-git)
source=(http://foo-projects.org/~sofar/user-session-units/user-session-units-$pkgver.tar.gz)
md5sums=('865aa064fe616c3be1a591844b0b47de')

build () {
  cd "${srcdir}/user-session-units-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/user-session-units-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

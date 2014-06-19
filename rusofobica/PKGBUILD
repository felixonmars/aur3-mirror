# Contributor: Stein Krauz <steinkrauz@yahoo.com>
# Maintainer: Stein Krauz <steinkrauz@yahoo.com>
pkgname=rusofobica
pkgver=1.1
pkgrel=1
pkgdesc="Decent keyboard layout for Russian"
arch=(any)
license=('GPL')
url="https://bitbucket.org/steinkrauz/rusofobica"
depends=('xkeyboard-config')
source=(https://bitbucket.org/steinkrauz/rusofobica/downloads/rusofobica-${pkgver}.tar.gz)
md5sums=('c8c380ca0607c4b6e71f191b925c292f')
install=rusofobica.install

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 rf ${pkgdir}/usr/share/X11/xkb/symbols/rf
  install -D -m644 evdev.patch ${pkgdir}/usr/share/rusofobica/evdev.patch
}
# vim:set ts=2 sw=2 et:

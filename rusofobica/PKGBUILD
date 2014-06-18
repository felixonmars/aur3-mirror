# Maintainer: Stein Krauz steinkrauz@yahoo.com>
pkgname=rusofobica
pkgver=1.0
pkgrel=1
pkgdesc="Decent keyboard layout for Russian"
arch=(any)
license=('GPL')
url="http://lj.rossia.org/users/lookatmoron/162974.html"
depends=('xkeyboard-config')
source=(https://bitbucket.org/steinkrauz/rusofobica/downloads/rusofobica-${pkgver}.tar.gz)
md5sums=('aceb833a419d454b53233965af9b04d9')
install=rusofobica.install

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -D -m644 rf ${pkgdir}/usr/share/X11/xkb/symbols/rf
  install -D -m644 evdev.patch ${pkgdir}/usr/share/rusofobica/evdev.patch
}

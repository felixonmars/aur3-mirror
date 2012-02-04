# Maintainer: Thomas Weißschuh <thomas_weissschuh || lavabit || com>
pkgname=spring-cursed-maps
pkgver=1
pkgrel=1
pkgdesc="Maps for Cursed, a mod for the spring engine"
arch=(any)
url="http://azaremoth.supremedesign.org/"
license=("unknown")
depends=('spring-cursed')
source=("http://azaremoth.supremedesign.org/data/maps.zip")
sha1sums=('3c308a99e08cffbdbbcd32698a83add32ff3478f')

package(){
  mkdir -p ${pkgdir}/usr/share/spring/maps/
  cp ${srcdir}/maps/* ${pkgdir}/usr/share/spring/maps/
}
# vim: sw=2:ts=2 et:

# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=adesklet-weather
pkgver=0.0.5
pkgrel=2
pkgdesc="Desklet able to display the current weather conditions at any given location"
arch=('any')
url="http://adesklets.sourceforge.net/desklets.html"
license=('GPL2')
depends=('adesklets')
groups=('adesklet-desklets')
source=(http://downloads.sourceforge.net/sourceforge/adesklets/weather-${pkgver}.tar.bz2)
md5sums=('a57ce57937b09c63b420ed90d3f9e556')

package() {
  cd ${srcdir}/weather-$pkgver

#Python2 fix
  sed -i 's_env python_env python2_' weather.py

  install -d ${pkgdir}/usr/share/adesklets/weather
  cp -a ${srcdir}/weather-${pkgver}/* \
    ${pkgdir}/usr/share/adesklets/weather/
  chown root:adesklets ${pkgdir}/usr/share/adesklets/weather
  chmod 775 ${pkgdir}/usr/share/adesklets/weather
}

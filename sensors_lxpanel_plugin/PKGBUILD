# Maintainer: Rikard Falkeborn <rikard.falkeborn@gmail.com>
pkgname=sensors_lxpanel_plugin
pkgver=1.0
pkgrel=1
pkgdesc="Monitor temperature/voltages/fan speeds in LXDE through lm-sensors."
arch=('i686' 'x86_64')
url="http://danamlund.dk/sensors_lxpanel_plugin"
license=('GPL2')
groups=(lxde)
depends=('lm_sensors' 'lxpanel')
source=(http://danamlund.dk/sensors_lxpanel_plugin/${pkgname//_/-}-$pkgver.tar.gz)
md5sums=('949e9a8142872291c380e372b385920c')

build() {
  cd "$srcdir/${pkgname//_/-}-$pkgver"
  make
}

package() {
     install -Dm755 "$srcdir/${pkgname//_/-}-$pkgver/sensors.so" "$pkgdir/usr/lib/lxpanel/plugins/sensors.so"
}

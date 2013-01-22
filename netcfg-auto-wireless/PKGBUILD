# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=netcfg-auto-wireless
pkgver=2.1.0
url="https://github.com/intelfx/netcfg-auto-wireless"
pkgrel=1
pkgdesc="Extended automatic wireless management script based on netcfg"
license=("GPL3")
backup=(etc/conf.d/netcfg-auto-wireless)
depends=("netcfg" "wpa_supplicant" "wpa_actiond")
source=("${url}/archive/v${pkgver}.tar.gz")
arch=(any)

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" ./install.sh "$pkgver"
}

md5sums=('9af587e6fc6fba4e5b94ba531b9bde2d')

# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=netctl-auto-ng
pkgver=1.1.4
url="https://github.com/intelfx/${pkgname}"
pkgrel=1
pkgdesc="Extended automatic wireless management script using netctl"
license=("GPL3")
backup=(etc/conf.d/netctl-auto-ng)
depends=("netctl" "wpa_supplicant" "wpa_actiond")
source=("${url}/archive/v${pkgver}.tar.gz")
install="${pkgname}.install"
arch=(any)

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  DESTDIR="$pkgdir" ./install.sh "$pkgver"
}

md5sums=('4ce4ce6f5d3278e267250040ee88fff6')

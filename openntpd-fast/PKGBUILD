# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=openntpd-fast
pkgver=1.0
pkgrel=2
pkgdesc="Systemd script for openntpd that boots faster by not blocking while the time is updated"
arch=("any")
url="http://www.openntpd.org/"
license=('BSD')
depends=("openntpd")
source=("openntpd-fast.service" "disable-openntpd.conf")
md5sums=('70c27925b22c900ad41b5c31dd51531e'
         '261db98fde78d3f668d775b4d6425599')

package() {
  install -Dm644 "$srcdir/disable-openntpd.conf" \
    "$pkgdir/usr/lib/systemd/system/openntpd.service.d/disable.conf"
  install -Dm644 "$srcdir/openntpd-fast.service" \
    "$pkgdir/usr/lib/systemd/system/openntpd-fast.service"
}

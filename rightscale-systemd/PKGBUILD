# Maintainer: Chris Fordham <chris.fordham@rightscale.com>

pkgname=rightscale-systemd
pkgver=0.1.4
pkgrel=3
pkgdesc='RightScale/RightLink systemd support.'
arch=(any)
url=https://github.com/flaccid/rightscale-systemd
license=(Apache 2)
install=rightscale-systemd.install
depends=(rightscale-control util-linux)
makedepends=(git)
conflicts=(rightscale-sysvinit rightscale-deb)
source=("$pkgname"::'git://github.com/flaccid/rightscale-systemd.git')

md5sums=('SKIP')

package() {
	install -D "$srcdir/$pkgname/rightscale.service" "$pkgdir/usr/lib/systemd/system/rightscale.service"
	install -D "$srcdir/$pkgname/rightlink.service" "$pkgdir/usr/lib/systemd/system/rightlink.service"
  install -D "$srcdir/$pkgname/rightlink-decommission.service" "$pkgdir/usr/lib/systemd/system/rightlink-decommission.service"
}

# vim:syntax=sh
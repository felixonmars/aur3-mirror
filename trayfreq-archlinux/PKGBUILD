# Maintainer: David Phillips (aka phillid) <dbphillipsnz at _remove this part if you want_ gmail dot com>

pkgname=trayfreq-archlinux
pkgver=0.57
pkgrel=1
pkgdesc="Battery monitor and CPU governor controller which runs in the system tray"
arch=('i686' 'x86_64' 'armv6h')
url=(https://github.com/phillid/trayfreq-archlinux/)
license=('GPL')
depends=('gtk3' 'sudo')
makedepends=()
source=(http://phillid.tk/source/$pkgname-$pkgver-$pkgrel.tar.gz)
sha1sums=('a0a7a2c789a503d4570283f3319063c6a53c1ecd')
backup=('etc/trayfreq.conf')

build() {
	make --directory=$srcdir/$pkgname-stable
}

package() {
	make install DESTDIR=$pkgdir --directory=$srcdir/$pkgname-stable
}


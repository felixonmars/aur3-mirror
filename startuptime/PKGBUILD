# Maintainer: Kelvin Ng (qpalz) <kelvin9302104 at gmail dot com>

pkgname=startuptime
pkgver=6
pkgrel=1
pkgdesc="A simple tool to show the time taken to boot the OS and compare your time with others (Linux boot with systemd only)"
arch=('any')
url="https://github.com/Kelvin-Ng/startuptime-client"
license=('GPL')
depends=(systemd python2-gobject python2-cairo)
provides=(startuptime)
source=("https://github.com/Kelvin-Ng/startuptime-client/archive/v${pkgver}.tar.gz")
md5sums=('8e2639081b901a3f362d8e27d140d362')

build() {
	cd "$srcdir/$pkgname-client-$pkgver"

	msgfmt -o zh_TW/startuptime.mo zh_TW/startuptime.po
	msgfmt -o zh_CN/startuptime.mo zh_CN/startuptime.po
}

package() {
	cd "$srcdir/$pkgname-client-$pkgver"

	install -D -m755 startuptime.sh "${pkgdir}/usr/bin/startuptime.sh"
	install -D -m644 zh_TW/startuptime.mo "${pkgdir}/usr/share/locale/zh_TW/LC_MESSAGES/startuptime.mo"
	install -D -m644 zh_CN/startuptime.mo "${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES/startuptime.mo"
}


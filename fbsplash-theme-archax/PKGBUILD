# ax <aimara@slackware.eu>

pkgname=fbsplash-theme-archax
pkgver=2.0
pkgrel=0
pkgdesc="Arch Linux fbsplash theme minimal black logo"
arch=('i686' 'x86_64')
license="GPL"
url="http://linuax.altervista.org/"
depends=('fbsplash')
optdepends=('kernel26-fbcondecor: console background in verbose mode')
source=('archax.tar.gz')
install=${pkgname}.install
md5sums=('9619d76d2cbebad9d088fa834344bfbf')

build() {
	mkdir -p "${pkgdir}/etc/splash"
	cd "${pkgdir}/etc/splash"
	cp -a "${srcdir}/archax" .
}

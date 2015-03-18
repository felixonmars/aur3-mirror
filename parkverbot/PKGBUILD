# Maintainer: thomashipp@gmail.com

pkgname=parkverbot
pkgver=1.2
pkgrel=1
pkgdesc='Daemon to prevent hard disk head parking in rotational media'
url='http://sourceforge.net/projects/parkverbot/'
license=('GPL2')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('982ee8d75d951300b9c9ba65e8b34adca9a14a8090e1225fb33a35937e26e334')
arch=('i686' 'x86_64')
depends=('libhx')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm 644 ./src/parkverbot.sysconfig "${pkgdir}/etc/sysconfig/parkverbot"
}

# vim:set ft=sh:

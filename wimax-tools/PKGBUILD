# Maintainer: Ivan Shapovalov <intelfx100 at gmail dot com>
pkgname=wimax-tools
pkgver=1.4.5
pkgrel=2
pkgdesc="WiMAX Low-Level userspace tools"
arch=('i686' 'x86_64')
url="http://lists.linuxwimax.org/pipermail/wimax"
license=('custom')
depends=('libnl1')
source=('ftp://ftp.be.debian.org/pub/linux/kernel/people/inaky/wimax-tools-1.4.5.tar.bz2')

build() {
	cd "${srcdir}/wimax-tools-${pkgver}"
	./configure --mandir=/usr/share/man --prefix=/usr
	make
}

package() {
	cd "${srcdir}/wimax-tools-${pkgver}"
	make DESTDIR=${pkgdir} install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('910dd1459e71637d563f7f5290eedbf9')

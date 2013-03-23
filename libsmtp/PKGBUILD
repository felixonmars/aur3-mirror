pkgname=libsmtp
pkgver=0.8.5
pkgrel=1
pkgdesc='A small C library that enables developers to send mail directly via SMTP from a program'
url='http://libsmtp.berlios.de/'
license=('LGPL')
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm')
depends=('glib')
source=("http://sourceforge.net/projects/libsmtp.berlios/files/latest/download#")
sha1sums=('3ca0b497d6b9e4b0cc80a261cb54eee6ad2cad34')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure \
		--prefix=${pkgdir}/usr \
		--sysconfdir=${pkgdir}/etc \
		--mandir=${pkgdir}/usr/share/man \
		--infodir=${pkgdir}/usr/share/info

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/include"
	make install
}

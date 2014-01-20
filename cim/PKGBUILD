
# Maintainer: Luca Fulchir <luca@fulchir.it>

pkgname=cim
pkgver=3.37
pkgrel=2
pkgdesc="Simula compiler written in C"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/cim/"
license=('GPL')
source=(http://ftp.project.ifi.uio.no/cim/${pkgname}-${pkgver}.tar.gz)
md5sums=('b51068ab30f54aefeb86fc4a6289cc77')
sha1sums=('a1c4962c12d01472514de55dafebf294d6e95c1f')
sha256sums=('6bdebc2de4ff40409eb813b12666bd2c4465ec1a3690a53861f11899793c9349')

build() {
	cd "$srcdir/${pkgname}-${pkgver}"
	./configure
	./configure	--prefix=/usr \
			--exec_prefix=/usr \
			--infodir=/usr/share/info \
			--mandir=/usr/share/man \
			--sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/${pkgname}-${pkgver}"
	make DESTDIR=${pkgdir} install
}




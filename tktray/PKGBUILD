# Maintainer fdservices <andrew dot myers at fdservices dot co dot uk>
pkgname=tktray
pkgver=1.3
pkgrel=8
pkgdesc="Tray icon for Tk applications"
arch=('i686' 'x86_64')
license=('GPL')
depends=('tcl' 'tk')
url="http://tktray.googlecode.com"
source="http://tktray.googlecode.com/files/${pkgname}${pkgver}.${pkgrel}.tar.gz"

md5sums=('2b8ae603efe03f82c95148026406db18')

build() {
	cd ${srcdir}/${pkgname}${pkgver}.${pkgrel}
	./configure --prefix=/usr || return 1
	make all || return 1
	make DESTDIR=${pkgdir} install || return 1
}
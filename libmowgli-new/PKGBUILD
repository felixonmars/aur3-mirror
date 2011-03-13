# Contributor: Andrey Kemka <dr.andru@gmail.com>

pkgname=libmowgli-new
pkgver=0.9.50
pkgrel=1
pkgdesc="Class library containing performance and usability oriented extensions to C."
arch=('i686' 'x86_64')
url="http://www.atheme.org/project/mowgli"
license=('custom')
depends=('glibc' 'unzip')
makedepends=('pkgconfig')
conflicts=('libmowgli')
provides=('libmowgli')
source=(http://distfiles.atheme.org/libmowgli-0.9.50.tar.bz2)
md5sums=('104cafd29fe874377169cb7e81c7b50f')

build() {
	cd ${startdir}/src/libmowgli-${pkgver}
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install
}


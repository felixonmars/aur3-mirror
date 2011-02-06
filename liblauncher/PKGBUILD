# Contributor: twa022 <twa022 at gmail dot com>

pkgname=liblauncher
pkgver=0.3.6
pkgrel=1
pkgdesc='A library to build launchers'
arch=('i686' 'x86_64')
url='http://launchpad.net/liblauncher'
license=('GPL3')
source=(http://launchpad.net/${pkgname}/${pkgver%.*}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz)
depends=('wncksync')
makedepends=()
options=(!libtool)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr || return 1
	make || return 1
	make install DESTDIR=$pkgdir
}

md5sums=('ba3ea890473f69000d1c843cee471471')

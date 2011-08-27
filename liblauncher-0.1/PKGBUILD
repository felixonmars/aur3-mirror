# Old Contributor: sdellysse <sdellysse@radford.edu>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=liblauncher-0.1
_pkgname=liblauncher
pkgver=0.1.8
pkgrel=1
pkgdesc='A library to build launchers'
arch=('i686' 'x86_64')
url='http://launchpad.net/liblauncher'
license=('GPL3')
source=(http://launchpad.net/${_pkgname}/${pkgver%.*}/${pkgver}/+download/${_pkgname}-${pkgver}.tar.gz)
depends=()
makedepends=()
build() {
	cd $startdir/src/$_pkgname-$pkgver
	./configure --prefix=/usr || return 1
	make || return 1
	make install DESTDIR=$pkgdir
}
md5sums=('b220357aaccc581c05337d05c5a1356f')

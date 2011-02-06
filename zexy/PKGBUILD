# Contributor: farid abdelnour <farid at atelier-labs.org>

pkgname=zexy
pkgver=2.1
pkgrel=1
pkgdesc="the swiss army knife for Pd"
arch=('i686')
url="http://puredata.info/community/projects/software/zexy/"
depends=('puredata')
license=('GPL2')
source=(http://puredata.info/community/projects/software/zexy/releases/2.1.0/zexy-unix-2.1.tgz)
md5sums=('3f4c21f51d3d7f335dcf6c8f638f7585')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}/src
	autoconf	
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
}

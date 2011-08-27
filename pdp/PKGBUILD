# Contributor: farid abdelnour <farid at atelier-labs.org>

pkgname=pdp
pkgver=0.12.5
pkgrel=1
pkgdesc="An extension library for Pure Data, providing video and other media processing functionality."
arch=('i686')
url="http://zwizwa.be/pd/$pkgname/"
depends=('puredata' 'libpng' 'libquicktime' 'gsl')
license=('GPL2')
source=(http://zwizwa.be/pd/pdp/pdp-0.12.5.tar.gz)
md5sums=('1c5274e030255ae3b3b74cc66f01a083')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}
	./configure --prefix=/usr --enable-mmx
	make || return 1
	make DESTDIR=$startdir/pkg install
}

# Maintainer: Fr_nk <freec AT vi-di.fr>
pkgname=vstm
pkgver=1.0
pkgrel=2
pkgdesc="vstm is a simple todo manager who keeps your TODO things"
arch=('x86_64' 'i686')
url="http://git.vi-di.fr/vstm/"
license=('beerware')
depends=('glibc')
makedepends=('make')
provides=('vstm')
conflicts=()
source=(http://git.vi-di.fr/${pkgname}/src/${pkgname}-${pkgver}.tar.gz)
md5sums=('51f7f2c1a8880ef128740513a26c7259')

build() {
	cd ${pkgname}
	make
}

package() {
	cd ${pkgname}
	make PREFIX=/usr MANDIR=/usr/share/man DESTDIR=${pkgdir} install
}

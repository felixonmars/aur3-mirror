# Author: Andreas Zwinkau <beza1e1@web.de>
# maintainer: perlawk

pkgname=libfirm
pkgver=1.21.0
pkgrel=2
pkgdesc="a library that provides an intermediate representation and optimisations for compilers"
url="http://pp.ipd.kit.edu/firm/Index"
license=('GPL')
depends=()
makedepends=('python2' 'perl')
source=("http://switch.dl.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
arch=('i686' 'x86_64')

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	make -j4
}

package() {
	cd ${pkgname}-${pkgver}
	make install DESTDIR=${pkgdir}
}
md5sums=('8b58d6c73920e94f5abcadeb65f938ae')

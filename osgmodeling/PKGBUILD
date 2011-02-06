# Contributor: Dmitry Batenkov <dima dot batenkov at gmail dot com>

pkgname=osgmodeling
pkgver=0.1.1
pkgrel=1
pkgdesc="Modeling NodeKit for OpenSceneGraph"
arch=('i686' 'x86_64')
url="http://code.google.com/p/osgmodeling/"
depends=('openscenegraph>=2.6.0')
builddepends=('cmake>=2.4')
license=('GPL')
source=(http://${pkgname}.googlecode.com/files/osgModeling-${pkgver}-src.tar.gz osgmodeling.pc)
md5sums=('e91c821d34e7afb7e7c97f84a7b3e880'
         'b5ed08eb05f0c1bd93e359701eb5be89')

build(){
	cd ${srcdir}/osgModeling
	cmake . -DBUILD_EXAMPLES=OFF -DCMAKE_BUILD_TYPE=Release -DBUILD_PLUGINS=ON -DCMAKE_INSTALL_PREFIX="/usr"
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
	mkdir -p ${pkgdir}/usr/lib/pkgconfig
	cp ../../osgmodeling.pc ${pkgdir}/usr/lib/pkgconfig/
}

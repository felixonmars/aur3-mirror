# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=simox
pkgver=2.2.1
pkgrel=1
pkgdesc="A lightweight simulation and motion planning toolbox for C++"
arch=('x86_64' 'i686')
url="http://simox.sourceforge.net/"
license=('GPL2' 'LGPL2.1')
depends=('gcc-libs-multilib' 'boost-libs')
makedepends=('cmake' 'qt4'  'eigen3' 'boost' 'boost-libs' 'coin' 'findutils')
source=("https://downloads.sourceforge.net/project/${pkgname}/Release${pkgver}/${pkgname}_v${pkgver}.tar.gz")
sha256sums=('bb06e9bec1fdd9dcb8145cc31e7d0f71492727e71b66e0e0aa257b71de6a98e1')

build() {
   cd ${srcdir}/simox
	cmake ./ -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr"
	make
}

package() {
   cd ${srcdir}/simox
   #make INSTALL_ROOT="${pkgdir}/" install
	make DESTDIR="${pkgdir}" install

	mv ${pkgdir}/usr/data/ ${pkgdir}/usr/share/Simox/

	#find ${pkgdir}/usr/share/ -type f -exec chmod 644 {} \;
	#find ${pkgdir}/usr/include/ -type f -exec chmod 644 {} \;
	#find ${pkgdir}/usr/lib/ -type f -exec chmod 755 {} \;
	#find ${pkgdir}/usr/bin/ -type f -exec chmod 755 {} \;
	#find ${pkgdir}/usr/ -type d -exec chmod 755 {} \;
}


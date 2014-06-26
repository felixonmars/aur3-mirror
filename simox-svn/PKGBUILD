# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=simox-svn
pkgver=r607 
pkgrel=1
pkgdesc="A lightweight simulation and motion planning toolbox for C++"
arch=('x86_64' 'i686')
url="http://simox.sourceforge.net/"
license=('GPL2' 'LGPL2.1')
provides=('simox')
conflicts=('simox')
depends=('gcc-libs-multilib' 'boost-libs>=1.42' 'soqt>=1.5')
makedepends=('subversion' 'cmake>=2.8.3' 'qt4>=4.6' 'eigen>=3.0' 'boost>=1.42' 'coin>=3.1.3' 'soqt>=1.5')
source=("svn+https://svn.code.sf.net/p/simox/code/trunk")
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/trunk
   local ver="$(svnversion)"
   printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
   cd ${srcdir}/trunk
	cmake ./ -DCMAKE_BUILD_TYPE="Release" -DCMAKE_INSTALL_PREFIX="/usr"
	make
}

package() {
   cd ${srcdir}/trunk
   #make INSTALL_ROOT="${pkgdir}/" install
	make DESTDIR="${pkgdir}" install

	mv ${pkgdir}/usr/data/ ${pkgdir}/usr/share/Simox/

	#find ${pkgdir}/usr/share/ -type f -exec chmod 644 {} \;
	#find ${pkgdir}/usr/include/ -type f -exec chmod 644 {} \;
	#find ${pkgdir}/usr/lib/ -type f -exec chmod 755 {} \;
	#find ${pkgdir}/usr/bin/ -type f -exec chmod 755 {} \;
	#find ${pkgdir}/usr/ -type d -exec chmod 755 {} \;
}


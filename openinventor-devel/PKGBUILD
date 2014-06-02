# Maintainer: Daniel Spies <daniel dot spies at fuceekay dot com>

pkgname=openinventor-devel
pkgver=2.1.5
_pkgver_rel=10
pkgrel=2
pkgdesc="A C++ object oriented retained mode 3D graphics toolkit"
arch=('x86_64' 'i686')
url="http://oss.sgi.com/projects/inventor/"
license=('LGPL')
depends=('lib32-libxi' 'lib32-libxt' 'lib32-libxp' 'lib32-glu')
conflicts=('coin')
source=("ftp://oss.sgi.com/projects/inventor/download/sgi-OpenInventor-devel-${pkgver}-${_pkgver_rel}.i386.tar.gz")
sha256sums=('66094c097534ac35a8bd1d7984eece812c5a2fe369cf973278fe490f2eeba8fa')

package() {
	install -d -m755 ${pkgdir}/usr/share/man/man3
	install -d -m755 ${pkgdir}/usr/lib
	install -d -m755 ${pkgdir}/usr/include

	cp -R ${srcdir}/usr/man/man3/* ${pkgdir}/usr/share/man/man3/
	cp -R ${srcdir}/usr/lib/* ${pkgdir}/usr/lib/
	cp -R ${srcdir}/usr/include/* ${pkgdir}/usr/include/
}


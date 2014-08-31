# Maintainer: Mymaud <mymaud@gmail.com>

pkgname=qtvlm-svn
pkgver=2293
pkgrel=1
pkgdesc="QtVlm is a routing software for virtual and real sailing boats."
arch=('any')
url="http://wiki.virtual-loup-de-mer.org/index.php/QtVlm/en"
license=('GPL2')
depends=('qt5-multimedia' 'qt5-tools')
makedepends=('subversion')
provides=('qtvlm')
conflicts=('qtvlm')
source=("svn+http://svn.code.sf.net/p/qtvlm/code/trunk" "qtvlm" "qtvlm.png" "qtvlm.desktop")

md5sums=('SKIP ' 'c052365fe9d534a1b7e133cf797f1522' '83ce4d4dd1713b6edaf4a412ecffe777'  'b3f7f4e80b4a83ceaad9007d51d6c1d1')

pkgver() {
	cd "$SRCDEST/trunk"
	svnversion | tr -d [A-z]
}

build() {
	cd "$srcdir/trunk"
	make  	
}


package() {
	mkdir -p ${pkgdir}/usr/share/{qtvlm,pixmaps,applications}
	mkdir -p ${pkgdir}/usr/bin
	
	mv ${srcdir}/trunk/base_dir/* ${pkgdir}/usr/share/qtvlm/
	mv ${srcdir}/trunk/qtVlm  ${pkgdir}/usr/share/qtvlm/

	cp qtvlm  ${pkgdir}/usr/bin/
	cp qtvlm.png ${pkgdir}/usr/share/pixmaps/
	cp qtvlm.desktop ${pkgdir}/usr/share/applications/

	chmod 755 ${pkgdir}/usr/bin/qtvlm
	chmod 644 ${pkgdir}/usr/share/applications/qtvlm.desktop
}

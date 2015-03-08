# Maintainer: Nicky726 (Nicky726 <at> gmail <dot> com)

pkgname=rkward
pkgver=0.6.3
pkgrel=1
pkgdesc="Easy to use transparent frontend to R for KDE4"
arch=('i686' 'x86_64')
url="https://rkward.kde.org/"
license=('GPL')
depends=('kdebase-runtime' 'kdebase-katepart' 'r>=2.8.0' 'docbook-xml' 'docbook-xsl')
makedepends=('cmake' 'automoc4')
install="${pkgname}.install"
source=(http://download.kde.org/stable/${pkgname}/${pkgver}/src/${pkgname}-${pkgver}.tar.gz)
sha256sums=('911f7727a28b292428607c93e551f51b2d8fc2cb477de33a1276790210263c93')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	# Dir for rkward R package
	#mkdir -p "${pkgdir}/usr/lib/R/library"
	cmake -DCMAKE_INSTALL_PREFIX="/usr" \
		-DR_LIBDIR="/usr/lib/R/library"
	make 
}

package(){
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install

	# Some cleanup
	rm -vf "${pkgdir}/usr/lib/R/library/R.css"
	rm -vf "${pkgdir}/usr/share/apps/katepart/syntax/r.xml"
	rm -vf "${pkgdir}/usr/share/doc/kde/html/en/rkward/common"
}


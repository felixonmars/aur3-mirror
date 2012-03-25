# Maintainer: Bartosz Chmura <chmurli@gmail.com>

pkgname=cut2col
pkgver=0.34c
_pkgver=v34c
pkgrel=1
pkgdesc="utility for converting 2-column to 1-column PDF documents"
arch=('any')
url="http://www.cp.eng.chula.ac.th/~somchai/cut2col/"
license=('custom')
depends=('jdk7-openjdk')
install=$pkgname.install
source=(http://www.cp.eng.chula.ac.th/~somchai/cut2col/${pkgname}-${_pkgver}.jar
        cut2col.desktop)
md5sums=('d580289704cbabb97ea1f60caa26ca97'
         'ba6e9a37096fd336947e92c85fe6335c')

build () {

	mkdir -p ${pkgdir}/opt/${pkgname}
	
	cp ${pkgname}-${_pkgver}.jar ${pkgdir}/opt/${pkgname}/ || return 1

	
	install -d -m 755 ${pkgdir}/usr/share/applications || return 1
	install -m 644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications || return 1

}




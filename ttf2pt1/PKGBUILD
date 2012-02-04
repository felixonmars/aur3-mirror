# Contributor: Bob Fanger < bfanger(at)gmail >
pkgname=ttf2pt1
pkgver=3.4.4
pkgrel=1
pkgdesc="True Type Font to Postscript Type 1 Converter"
arch=('i686' 'x86_64')
url="http://ttf2pt1.sourceforge.net/"
license=('Multiple')
provides=()
depends=()
makedepends=()
source=(http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tgz)
md5sums=('cb143c07cc83167875ca09ea720d4932')

build() {

	compiledir=${srcdir}/${pkgname}-${pkgver}
  cd ${compiledir}

	sed -i "s@INSTDIR = /usr/local@INSTDIR = ${startdir}/pkg/usr@g" Makefile

	make all
#	make install
	bindir=${pkgdir}/usr/bin
	mkdir -p ${bindir}
	cp ${compiledir}/ttf2pt1 ${bindir}
}


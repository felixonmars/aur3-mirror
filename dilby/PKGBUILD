# Maintainer: Jesse Jaara <gmail.com: jesse.jaara>

pkgname=dilby
pkgver=0.1.1
pkgrel=1
pkgdesc="Qt5 app to display your daily Dilbert strip"
arch=('i686' 'x86_64')
url="https://github.com/Huulivoide/Dilby"
license=('Custom: MIT')
depends=('qt5-base')
source=(Dilby-${pkgver}.tar.gz::https://github.com/Huulivoide/Dilby/archive/v${pkgver}.tar.gz
        https://raw2.github.com/Huulivoide/Dilby/ce204b33236c791b05705365c8201b6a33cbc890/Dilby.desktop)

build() {
	cd "${srcdir}/Dilby-${pkgver}"

	lrelease Dilby.pro
	qmake Dilby.pro

	make
}


package()
{
	cd "${srcdir}/Dilby-${pkgver}"

	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/pixmaps/"
	mkdir -p "${pkgdir}/usr/share/applications/"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

	cp Dilby "${pkgdir}/usr/bin/"
	cp res/icons/logo_256.png "${pkgdir}/usr/share/pixmaps/Dilby.png"
	cp "${srcdir}/Dilby.desktop" "${pkgdir}/usr/share/applications/"
	cp LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('6be33cc697496187540c2695ed7f0eda'
         '1832e67afa6600a1d36d0121559493bc')

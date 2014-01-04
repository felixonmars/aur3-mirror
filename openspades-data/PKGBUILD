# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=openspades-data
pkgver=0.0.10
pkgrel=1
pkgdesc="A clone of Voxlap Ace of Spades 0.75"
arch=('any')
url="https://sites.google.com/a/yvt.jp/openspades/"
license=('GPL3')
makedepends=('imagemagick')
source=("https://codeload.github.com/yvt/openspades/tar.gz/v${pkgver}" "https://github.com/yvt/openspades/releases/download/v${pkgver}/OpenSpades-${pkgver}-Windows-winxp.zip")

package() {
	mkdir "${pkgdir}/usr"
	mkdir "${pkgdir}/usr/share"
	mkdir "${pkgdir}/usr/share/${pkgname}"
	mkdir "${pkgdir}/usr/share/pixmaps"

	cd "${srcdir}/openspades-${pkgver}"
	cp -r Resources "${pkgdir}/usr/share/${pkgname}"
	
	cd "${srcdir}/openspades-${pkgver}/Resources/Icons"
	convert OpenSpades.ico openspades.png
	cp openspades-7.png "${pkgdir}/usr/share/pixmaps/openspades.png"
	
	cd "${srcdir}/OpenSpades-${pkgver}-Windows/Resources"
	mv pak001-Sounds.pak pak002-Sounds.pak
	mv pak002-Models.pak pak001-Models.pak
	
	cd "${srcdir}/OpenSpades-${pkgver}-Windows"
	cp -r Resources "${pkgdir}/usr/share/${pkgname}"
	
	cd "${pkgdir}/usr/share/${pkgname}/Resources"
	rm mkpak.sh
}

md5sums=('873778a15d10bc3c6233f8738fe76814'
         '39e500efa5b01902ae2b6a23effe6fe6')

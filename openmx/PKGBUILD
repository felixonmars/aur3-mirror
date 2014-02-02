# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=openmx
pkgver=3.7.7
_pkgver=3.7
_patchdate=14Jan31
pkgrel=1
pkgdesc='A software package for nano-scale material simulations based on density functional theories'
arch=('i686' 'x86_64')
url="http://www.openmx-square.org/"
license=('GPL')
depends=('blas' 'fftw' 'lapack' 'openmpi')
source=("http://www.openmx-square.org/openmx${_pkgver}.tar.gz" "http://www.openmx-square.org/bugfixed/${_patchdate}/patch${pkgver}.tar.gz" "makefile.patch")
noextract=("patch${pkgver}.tar.gz")

prepare() {
	cp "${srcdir}/patch${pkgver}.tar.gz" "${srcdir}/openmx${_pkgver}/source"
	cd "${srcdir}/openmx${_pkgver}/source"
	tar zxvf patch${pkgver}.tar.gz
	patch < "${srcdir}/makefile.patch"
}

build() {
	cd "${srcdir}/openmx${_pkgver}/source"
	make
}

package() {
	cd "${srcdir}/openmx${_pkgver}/source"
	install -Dm755 openmx "${pkgdir}/usr/bin/openmx"
	cd "${srcdir}/openmx${_pkgver}"
	install -Dm644 "openmx${_pkgver}.pdf" "${pkgdir}/usr/share/doc/${pkgname}/openmx${_pkgver}.pdf"
	
	mkdir "${pkgdir}/usr/share/${pkgname}"
	cp -r "${srcdir}/openmx${_pkgver}/work" "$pkgdir/usr/share/${pkgname}"
	cp -r "${srcdir}/openmx${_pkgver}/DFT_DATA13" "$pkgdir/usr/share/${pkgname}"
}

md5sums=('085942c10bdb5933485304906966275b'
         '4dd8064773ed9e9b708ea3c479d2b462'
         'd3cc22bbbf54dac20b309fbf8ca9cc3b')

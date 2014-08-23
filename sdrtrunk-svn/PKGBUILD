# Maintainer: Kefused <Kefused at gmail dot com>

_pkgname=sdrtrunk
pkgname=${_pkgname}-svn
pkgver=152
pkgrel=1
pkgdesc="A software Defined Radio (SDR) trunked and digital radio decoder"
arch=('any')
url="https://code.google.com/p/sdrtrunk/"
license=('GPL')
depends=('jdk7-openjdk' 'libusb')
makedepends=('svn' 'apache-ant')
source=('SDRTrunk'
		"${_pkgname}::svn+http://sdrtrunk.googlecode.com/svn/trunk/")
sha256sums=('0dee3ad94de85dc0a097e0e2f5adbad8e3708f5f72a2d9b32897bf77e1209e20'
			'SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	svnversion
}

build() {
	cd "${srcdir}/${_pkgname}/build"
	ant
}

package() {
	install -dm755 "${pkgdir}/opt"
	cp --preserve=mode -r "${srcdir}/${_pkgname}/product/" \
			"${pkgdir}/opt/${_pkgname}/"
	rm -rf "${pkgdir}/opt/${_pkgname}/run_sdrtrunk_linux"
	rm -rf "${pkgdir}/opt/${_pkgname}/run_sdrtrunk_windows.bat"
	install -Dm755  "${srcdir}/SDRTrunk"  "${pkgdir}/usr/bin/SDRTrunk"
}
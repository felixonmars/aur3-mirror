# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
#
# This package installs libHalf.so.6, which is required by some
# closed-source, proprietary software.
#

pkgname=ilmbase102-libs
_pkgname=ilmbase
pkgver=1.0.2
pkgrel=1
pkgdesc="Base libraries from ILM for OpenEXR (provides libHalf.so.6, libIex.so.6, libIlmThread.so.6, and libImath.so.6)"
arch=('i686' 'x86_64')
url="http://www.openexr.com"
license=('custom')
options=('!libtool')
source=("http://download.savannah.nongnu.org/releases/openexr/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('5a1a0011ef43132f33832d2e322320abb81a0f495e921de52af8f6e9ee50e0bed63897a0054de228f4081cc2f6591cb99a686f908620e87bf86c9d2d689923cd')

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install

	# We're only installing the libraries, so get rid of the rest.
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/lib/pkgconfig"
	rm "${pkgdir}/usr/lib/libHalf.a"
	rm "${pkgdir}/usr/lib/libHalf.so"
	rm "${pkgdir}/usr/lib/libIex.a"
	rm "${pkgdir}/usr/lib/libIex.so"
	rm "${pkgdir}/usr/lib/libIlmThread.a"
	rm "${pkgdir}/usr/lib/libIlmThread.so"
	rm "${pkgdir}/usr/lib/libImath.a"
	rm "${pkgdir}/usr/lib/libImath.so"

	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

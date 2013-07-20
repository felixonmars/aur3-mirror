# Maintainer: Jason St. John <jstjohn .. purdue . edu>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
#
# This package installs libIlmImf.so.6, which is required by some
# closed-source, proprietary software.
#

pkgname=openexr170-libs
_pkgname=openexr
pkgver=1.7.0
pkgrel=1
pkgdesc="A high dynamic-range image file format library (provides libIlmImf.so.6)"
url="http://www.openexr.com/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('zlib' 'ilmbase')
options=('!libtool')
source=("http://download.savannah.nongnu.org/releases/${_pkgname}/${_pkgname}-${pkgver}.tar.gz"
        'gcc43.patch')
sha512sums=('1fb033f909961a9778b762241e09946d19c7e75bbade7b5a942bb159eec3af9200afd722c3170165ad4b1fa602d9dbe6938112aad1716e7c7e6b8c37ee3980e0'
            'a19adcf1a8dec253f8577f5905775ea56dc5d2de4edc454a71ec86fda8cadd10a31e473db2341a203ee49b22c5bb06d75b010077ad44766cdbaa9f56b5f6859c')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	patch -p0 -i "${srcdir}/gcc43.patch"
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install

	# We're only installing the libraries, so get rid of the rest.
	rm -rf "${pkgdir}/usr/share"
	rm -rf "${pkgdir}/usr/bin"
	rm -rf "${pkgdir}/usr/include"
	rm -rf "${pkgdir}/usr/lib/pkgconfig"
	rm "${pkgdir}/usr/lib/libIlmImf.so"
	rm "${pkgdir}/usr/lib/libIlmImf.a"

	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

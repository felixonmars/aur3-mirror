##
# Maintainer: Todd Harbour <aur @AT@ quadronyx .DOT. org>
# Comments: 
# Binary version available from: http://www.quadronyx.org/aur/
##

pkgname=ps3
pkgver=0.3.0
pkgrel=3
pkgdesc="A utility for monitoring process activity (think top) in a 3D bar chart"
arch=('i686')
depends=(
	'libpng'
	'sdl'
	'mesa'
	'libgl'
)
url="http://user.tninet.se/~uhu537u/"
license='unknown'

source=(
	"http://user.tninet.se/~uhu537u/${pkgname}-${pkgver}.tar.bz2"
	'ps3'
	'png_lib_fix.patch'
)

md5sums=(
	'00bda637cb9f360c008f46701c52b855'
	'eceaaca7b108de01af985b0e5a512a50'
	'910e6bb24a806d2f1d68e7fec84c5a6f'
)

build() {
	cd "${srcdir}/${pkgname}-${pkgver}/"
	patch -p0 <"${srcdir}/png_lib_fix.patch"
	make || return 1
	mkdir -p "${pkgdir}/usr/bin/" || return 1
	install -m 755 -o root -g root \
		"${pkgname}" "${pkgdir}/usr/bin/ps3-bin" || return 1
	install -m 755 -o root -g root \
		"${srcdir}/${pkgname}" "${pkgdir}/usr/bin/" || return 1
	mkdir -p "${pkgdir}/usr/share/${pkgname}"
	cp -r font "${pkgdir}/usr/share/${pkgname}/font"
}

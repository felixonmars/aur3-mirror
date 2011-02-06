# Maintainer: David Watzke <david@watzke.cz>
# PKGBUILD based on a Gentoo ebuild
# patches are from Gentoo and the .desktop file is based on that from Debian

pkgname=pouetchess
_realname=pouetChess
pkgver=0.2.0
pkgrel=2
pkgdesc="a small 3D chess game with pretty graphics"
url="http://pouetchess.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('sdl_image')
makedepends=('scons')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver%.*}/${pkgname}_src_${pkgver}.tar.gz"
	"${_realname}.desktop"
	"${pkgname}-${pkgver}-gcc43.patch"
	"${pkgname}-${pkgver}-nvidia_glext.patch"
	"${pkgname}-${pkgver}-segfaults.patch")
md5sums=('c0454aca11ead9be724d769c521120b1'
	'8e9c89f1287300966944476adb51b03b'
	'81134f46083e4e9a7f8b5b10509ae0a1'
	'65d18a3d457e64f6168ed2975cfa4b00'
	'fa5c2687e2eb55fa7728071e10975605')

build() {
	cd "${startdir}/src/${pkgname}_src_${pkgver}"

	patch -Np0 -i "${srcdir}/${pkgname}-${pkgver}-nvidia_glext.patch"
	patch -Np0 -i "${srcdir}/${pkgname}-${pkgver}-segfaults.patch"
	patch -Np0 -i "${srcdir}/${pkgname}-${pkgver}-gcc43.patch"

	# fix for libsdl >= 1.2.10 detection
	sed -i -e \
		"s:sdlver.split('.') >= \['1','2','8'\]:sdlver.split('.') >= [1,2,8]:" \
		pouetChess.py

	scons configure prefix="/usr" strip=true optimize=false \
		datadir="/usr/share/${_realname}"
	scons
}

package() {
	cd "${startdir}/src/${pkgname}_src_${pkgver}"

	install -D -m755 "bin/${_realname}" \
		"${pkgdir}/usr/bin/${_realname}"

	install -d -m755 "${pkgdir}/usr/share/${_realname}"
	cp -a data/* "${pkgdir}/usr/share/${_realname}/"

	install -D -m644 "data/icons/${_realname}.png" \
		"${pkgdir}/usr/share/pixmaps/${_realname}.png"

	install -D -m644 "${srcdir}/${_realname}.desktop" \
		"${pkgdir}/usr/share/applications/${_realname}.desktop"
}

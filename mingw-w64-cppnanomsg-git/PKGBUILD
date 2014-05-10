
# Maintainer: jellysheep <max.mail@dameweb.de>

_pkgname=cppnanomsg
pkgname=mingw-w64-cppnanomsg-git
pkgver=396a450
pkgrel=1
pkgdesc='Simple high-performance implementation of several "scalability protocols" (C++ binding, mingw-w64)'
url='http://nanomsg.org/'
license=('MIT')
source=('git://github.com/nanomsg/cppnanomsg.git')
md5sums=('SKIP')
arch=('any')
depends=('mingw-w64-crt' 'mingw-w64-nanomsg')
makedepends=('git')
provides=('mingw-w64-cppnanomsg')
options=('!strip' '!buildflags' 'staticlibs')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --always | sed 's|-|.|g'
}

package() {
	for _arch in ${_architectures}; do
		install -Dm644 "${srcdir}/${_pkgname}/nn.hpp" "${pkgdir}/usr/${_arch}/include/nanomsg/nn.hpp"
	done
	install -Dm644 "${srcdir}/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# Contributor: KokaKiwi <admin@kokaelkiwi.eu>
# Maintainer: jellysheep <max.mail@dameweb.de>

_pkgname=nanomsg
pkgname=mingw-w64-nanomsg-git
pkgver=0.4.beta.45.g4301988
pkgrel=1
pkgdesc='Simple high-performance implementation of several "scalability protocols" (mingw-w64)'
url='http://nanomsg.org/'
license=('MIT')
source=('git://github.com/250bpm/nanomsg.git'
		'nanomsg-fix-MAX_INT.patch'
		'nanomsg-fix-libraries.patch')
md5sums=('SKIP'
		'7ab17424587c50440087449caf5600ae'
		'eb4d32c29407d09781510c78a01ee308')
arch=('any')
depends=('mingw-w64-crt')
makedepends=('git' 'mingw-w64-gcc' 'mingw-w64-cmake')
provides=('mingw-w64-nanomsg')
options=('!strip' '!buildflags' 'staticlibs')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --always | sed 's|-|.|g'
}

prepare() {
	cd "${srcdir}/${_pkgname}"
	patch -p1 < "${srcdir}/nanomsg-fix-MAX_INT.patch"
	patch -p1 < "${srcdir}/nanomsg-fix-libraries.patch"
}

build() {
	unset LDFLAGS CFLAGS CXXFLAGS CPPFLAGS MAKEFLAGS
	export CFLAGS="-Wimplicit"
	cd "${srcdir}/${_pkgname}"
	for _arch in ${_architectures}; do
		mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-cmake ../
		make
		popd
	done
}

package() {
	for _arch in ${_architectures}; do
		cd "${srcdir}/${_pkgname}/build-${_arch}"
		make DESTDIR="${pkgdir}" install
		find "$pkgdir" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
		find "$pkgdir" -name '*.dll' -o -name '*.a' -exec ${_arch}-strip -g {} \;
	done
	install -Dm644 "${srcdir}/${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/$pkgname/COPYING"
}

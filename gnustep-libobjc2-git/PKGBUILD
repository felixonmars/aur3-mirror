# Maintainer : kusakata <e@kusakata.com>
pkgname='gnustep-libobjc2-git'
pkgver=20130203
pkgrel=1
pkgdesc='The GNUstep Objective-C runtime is designed as a drop-in replacement for the GCC runtime.'
arch=('i686' 'x86_64')
url='http://savannah.gnu.org/bugs/?group=gnustep'
license=('LGPL')
makedepends=('gnustep-make')
provides=('gnustep-libobjc2')

_gitroot='git://github.com/gnustep/gnustep-libobjc2.git'
_gitname='gnustep-libobjc2'

build () {
	cd "${srcdir}"
	if [ -d "${_gitname}" ] ; then
		msg "The files are updated"
	else
		git clone "${_gitroot}"
	fi
	cd "${_gitname}"
	mkdir build
	cd build
	export CC=clang
	export CXX=clang++
	export CFLAGS="${CLANGFLAGS} -g"
	export CXXFLAGS="${CLANGXXFLAGS} -g"
	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		..
	make -j8
}

package() {
	cd "${_gitname}"
	cd build
	make DESTDIR="${pkgdir}" install
}

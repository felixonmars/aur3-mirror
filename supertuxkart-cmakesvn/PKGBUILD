# Contributor: Lluixhi <lluixhi (at) Gmail (dot) com>

basename=supertuxkart
pkgname=${basename}-cmakesvn
pkgver=10996
pkgrel=1
pkgdesc="The Current SVN build of supertuxkart"
url="http://supertuxkart.sourceforge.net/"
license="GPL3"
arch=("any")
makedepends=("cmake" "svn")
depends=("freealut" "freeglut" "fribidi" "irrlicht-svn" "libgl" "libvorbis" "sdl>=1.2")
replaces=("supertuxkart-svn")
_svnroot="https://supertuxkart.svn.sourceforge.net/svnroot/supertuxkart/main/trunk/"
_svnname="${basename}"

build() {
	cd "${srcdir}"

	# Repository
	msg "Connecting to SVN server ..."
	if [ -d "${srcdir}/${_svnname}" ] ; then
		cd ${_svnname} && svn update
	else
		svn co "${_svnroot}" ${_svnname}
		cd ${_svnname}
	fi
	# Build
	if [ -d "Build" ]; then
		rm -rf Build
		mkdir Build
	else
		mkdir Build
	fi
	cd Build
	cmake .. -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd ${_svnname}

	# Install
	cd Build
	make DESTDIR=${pkgdir} install
}

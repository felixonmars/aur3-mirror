# Maintainer: Alireza Savand <alireza.savand@gmail.com>
# Contributors:
#	* Mikael Eriksson <mikael_miffe_eriksson@yahoo.se>
#	* Xavion <Xavion (dot) 0 (at) Gmail (dot) com>

pkgname=libflashsupport-pulse
pkgver=20121221
pkgrel=1
pkgdesc="Adds PulseAudio support to the Flash browser plugin"
url="http://git.0pointer.de/?p=libflashsupport.git;a=summary"
license=("GPL")
arch=("i686" "x86_64")
depends=("pulseaudio" "flashplugin")
makedepends=("git")
options=(!libtool)
source=()
sha1sums=()
_gitroot="git://repo.or.cz/libflashsupport-pulse.git"
_gitname="libflashsupport-pulse"

build() {
	cd "${srcdir}"

	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
	else
		git clone ${_gitroot} ${_gitname}
	fi

	rm -rf "${srcdir}"/${_gitname}-build
	git clone -l "${srcdir}"/${_gitname} "${srcdir}"/${_gitname}-build
	cd "${srcdir}"/${_gitname}-build

	# Patch
	sed -i 's|#define V4L1|//#define V4L1|g' "${srcdir}"/${_gitname}-build/flashsupport.c

	# Config
	[ ${CARCH} = 'x86_64' ] && CXXFLAGS="$CXXFLAGS -fPIC"

	NOCONFIGURE=1 ./bootstrap.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}"/${_gitname}-build

	make DESTDIR="${pkgdir}" install
	rm "${pkgdir}"/usr/lib/libflashsupport.la
	rm -rf "${srcdir}"/${_gitname}-build
}

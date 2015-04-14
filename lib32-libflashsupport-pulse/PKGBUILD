# Maintainer: 3onyc <3onyc@x3tech.com>
# Maintainer: Christopher Rosell <chrippa@tanuki.se>
# Contributor: Xavion <Xavion (dot) 0 (at) Gmail (dot) com>
# Contributor: Mikael Eriksson <mikael_miffe_eriksson@yahoo.se>

realname=libflashsupport
bename=pulse
pkgname=lib32-${realname}-${bename}
pkgver=20110620
pkgrel=2
pkgdesc="Adds PulseAudio support to the Flash browser plugin"
url="http://git.0pointer.de/?p=${realname}.git;a=summary"
license=("GPL")
arch=("x86_64")
depends=("lib32-libpulse" "flashplugin")
makedepends=("automake" "autoconf" "git" "pkg-config")
source=()
sha1sums=()
_gitroot="http://git.0pointer.de/${realname}.git"
_gitname="${realname}-${bename}"

build() {
	cd "${srcdir}"

	# Repository
	msg "Connecting to GIT server...."
	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi
	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf ""${srcdir}"/${_gitname}-build"
	git clone -l ""${srcdir}"/${_gitname}" ""${srcdir}"/${_gitname}-build"
	cd ""${srcdir}"/${_gitname}-build"

	# Patch
	sed -i 's|#define V4L1|//#define V4L1|g' ""${srcdir}"/${_gitname}-build/flashsupport.c"

	# Config
	[ ${CARCH} = 'x86_64' ] && CXXFLAGS="$CXXFLAGS -fPIC"

	export CC="gcc -m32"
	export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

	NOCONFIGURE=1 ./bootstrap.sh
	./configure --prefix=/usr --libdir=/usr/lib32 --libexecdir=/usr/lib32
	make
}

package() {
	cd ""${srcdir}"/${_gitname}-build"

	make DESTDIR="${pkgdir}" install
	rm "${pkgdir}"/usr/lib32/${realname}.la
	rm -rf ""${srcdir}"/${_gitname}-build"
}

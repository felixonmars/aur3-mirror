# Maintainer: Michal Donat <donny579 at gmail.com>
# Contributor: t3ddy  <t3ddy1988 "at" gmail {dot} com>
# Contributor: Lluixhi <lluixhi (at) Gmail (dot) com>

pkgname=supertuxkart-svn
pkgver=14248  
pkgrel=1
pkgdesc="A kart racing game featuring Tux and his friends - development version"
url="http://supertuxkart.sourceforge.net/"
license=("cc-by-sa-3.0")
arch=('i686' 'x86_64')
makedepends=("subversion" "cmake")
depends=("sdl>=1.2" "libvorbis" "freealut" "libgl" "glut" "fribidi")
conflicts=("supertuxkart")
replaces=("supertuxkart-cmakesvn")
source=("supertuxkart::svn+https://svn.code.sf.net/p/supertuxkart/code/main/trunk")
md5sums=('SKIP')
#options=(debug !strip)

pkgver() {
	cd "$SRCDEST/supertuxkart"
	svnversion | tr -d [A-z]
}

build() {
	cd "${srcdir}/supertuxkart"
	msg "Starting build..."

	# Build irrlicht
	cd lib/irrlicht/source/Irrlicht/
	NDEBUG=1 make

	cd -
	[ -d "build" ] && rm -r build
	mkdir build && cd build

	# Build stk
	cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd "supertuxkart/build"
	make DESTDIR=${pkgdir} install
}

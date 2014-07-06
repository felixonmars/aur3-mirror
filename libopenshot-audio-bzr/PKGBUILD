# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Foster McLane <fkmclane@gmail.com>
_pkgname=libopenshot-audio
_pkgver=0.0.1
_pkgrel=1
pkgname=$_pkgname-bzr
pkgver=r18
pkgrel=1
pkgdesc="A high-quality audio editing and playback library used by libopenshot."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('GPL3')
depends=('libx11' 'libxcursor' 'libxinerama' 'alsa-lib' 'freetype2')
makedepends=('cmake')
provides=("$_pkgname=$_pkgver-$_pkgrel")
conflicts=("$_pkgname")
source=('bzr+lp:~openshot.code/libopenshot/libopenshot-audio')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf 'r%s' "$(bzr revno)"
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir build
	cd build

	cmake ../
	make
}

package() {
	cd "$srcdir/$_pkgname/build"
	make DESTDIR="$pkgdir/" install
}

# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Foster McLane <fkmclane@gmail.com>
_pkgname=libopenshot
_pkgver=0.0.1
_pkgrel=1
pkgname=$_pkgname-bzr
pkgver=r382
pkgrel=1
pkgdesc="A high quality, open-source video editing, animation, and playback library for C++, Python, and Ruby."
arch=('i686' 'x86_64')
url="http://openshot.org/"
license=('GPL3')
depends=('imagemagick' 'ffmpeg' 'libx264' 'libopenshot-audio' 'qt5-base' 'qt5-multimedia' 'swig')
makedepends=('cmake' 'unittestpp')
provides=("$_pkgname=$_pkgver-$_pkgrel")
conflicts=("$_pkgname")
source=('bzr+lp:libopenshot')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	printf 'r%s' "$(bzr revno)"
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir build
	cd build

	cmake -DMAGICKCORE_HDRI_ENABLE=1 -DMAGICKCORE_QUANTUM_DEPTH=16 ../
	make
}

package() {
	cd "$srcdir/$_pkgname/build"
	make DESTDIR="$pkgdir/" install
}

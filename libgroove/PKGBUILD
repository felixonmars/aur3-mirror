# Maintainer: Jonjo McKay <jonjo@jonjomckay.com>
pkgname=libgroove
pkgver=3.0.7
pkgrel=2
pkgdesc="Audio dispatching library. Generic sink-based interface. Provides decoding, encoding, resampling, and gain adjustment."
arch=('i686' 'x86_64')
url="https://github.com/andrewrk/libgroove"
license=('MIT')
depends=('sdl2' 'lame' 'bzip2' 'ffmpeg')
makedepends=('cmake' 'yasm')
conflicts=('libgroove-git')
options=('strip' 'ccache')
source=("https://github.com/andrewrk/libgroove/archive/$pkgver.tar.gz")
md5sums=('817b7fe9871e46aba96bb0eb1f94b73b')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir build
}

build() {
	cd "$srcdir/$pkgname-$pkgver/build"
	cmake ../ \
		-DCMAKE_BUILD_TYPE=Release \
    	-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}

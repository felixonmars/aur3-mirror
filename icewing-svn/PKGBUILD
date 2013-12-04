# Maintainer: languiar <languitar at semipol dot de>
pkgname=icewing-svn
pkgrel=1
pkgdesc="a graphical plugin shell for image processing"
pkgver=0.r2361
url="http://icewing.sourceforge.net"
license=('GPL')
depends=(glibc gtk2 ffmpeg libjpeg-turbo zlib libpng v4l-utils opencv readline pkg-config libdc1394)
makedepends=()
arch=('x86_64' 'i686')
source=(icewing::svn+http://svn.code.sf.net/p/icewing/code/iceWing/trunk)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/icewing"
	local ver=$(svnversion)
	printf "0.r%s" "${ver//[[:alpha:]]}"
}

build() {
	mkdir -p $srcdir/icewing/build
	cd $srcdir/icewing/build

	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make || return 1
}

package() {
	cd $srcdir/icewing/build
	make DESTDIR=$pkgdir install
}

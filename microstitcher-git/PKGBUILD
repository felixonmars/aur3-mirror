# Maintainer: Alister.Hood (gmail)

pkgname=microstitcher-git
_gitname="microstitcher"
pkgver=2014.05.30
pkgrel=1
pkgdesc="Tiny tool capable of stitching hundreds images into one single image "
arch=('x86_64' 'i686')
url="http://sourceforge.net/p/microstitcher"
license=('Apache')
depends=('gcc-libs')
makedepends=('cmake' 'git')
source=("git://git.code.sf.net/u/hoodbild/microstitcher")
md5sums=('SKIP')

build() {
	cd $srcdir/$_gitname
	./build.sh
}

package() {
	install -Dm755 $srcdir/$_gitname/bin/MicroStitcher $pkgdir/usr/bin/$_gitname
}

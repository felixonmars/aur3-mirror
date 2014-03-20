# Maintainer: toha257 <toha257@gmail.com>

pkgname=libgcc-4.8-dev-armhf-cross-bin
pkgver=4.8.2
pkgrel=1
pkgdesc="GCC support library (development files)"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/trusty/libgcc-4.8-dev-armhf-cross"
license=('GPL2')
depends=('libasan0-armhf-cross-bin' 'libatomic1-armhf-cross-bin' 'libgcc1-armhf-cross-bin' 'libgomp1-armhf-cross-bin' 'libc6-dev-armhf-cross-bin')
provides=('libgcc-4.8-dev-armhf-cross')
conflicts=('libgcc-4.8-dev-armhf-cross')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-4.8-armhf-cross/libgcc-4.8-dev-armhf-cross_4.8.2-16ubuntu4cross0.11_all.deb")
md5sums=('09d74e8aa5a50405093bb638a14834ad')


package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

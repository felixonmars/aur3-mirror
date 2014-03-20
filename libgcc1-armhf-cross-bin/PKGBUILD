# Maintainer: toha257 <toha257@gmail.com>

pkgname=libgcc1-armhf-cross-bin
pkgver=4.8.2
pkgrel=1
pkgdesc="GCC support library"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/trusty/libgcc1-armhf-cross"
license=('GPL2')
depends=('libc6-armhf-cross-bin')
provides=('libgcc1-armhf-cross')
conflicts=('libgcc1-armhf-cross')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-4.8-armhf-cross/libgcc1-armhf-cross_4.8.2-16ubuntu4cross0.11_all.deb")
md5sums=('a96f1e852a83d4fa1c1f0606b70e324c')


package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

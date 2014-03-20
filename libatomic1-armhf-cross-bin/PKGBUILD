# Maintainer: toha257 <toha257@gmail.com>

pkgname=libatomic1-armhf-cross-bin
pkgver=4.8.2
pkgrel=1
pkgdesc="GCC support library"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/trusty/libatomic1-armhf-cross"
license=('GPL2')
depends=('libc6-armhf-cross-bin')
provides=('libatomic1-armhf-cross')
conflicts=('libatomic1-armhf-cross')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-4.8-armhf-cross/libatomic1-armhf-cross_4.8.2-16ubuntu4cross0.11_all.deb")
md5sums=('a3ad12300426a6783cf2d450ec7b8bbb')


package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

# Maintainer: toha257 <toha257@gmail.com>

pkgname=libgomp1-armhf-cross-bin
pkgver=4.8.2
pkgrel=1
pkgdesc="GCC support library"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/trusty/libgomp1-armhf-cross"
license=('GPL2')
depends=('libc6-armhf-cross-bin')
provides=('libgomp1-armhf-cross')
conflicts=('libgomp1-armhf-cross')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-4.8-armhf-cross/libgomp1-armhf-cross_4.8.2-16ubuntu4cross0.11_all.deb")
md5sums=('70ecb8e9cf0097288edffa571ad1f916')


package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

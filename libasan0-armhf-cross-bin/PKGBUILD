# Maintainer: toha257 <toha257@gmail.com>

pkgname=libasan0-armhf-cross-bin
pkgver=4.8.2
pkgrel=1
pkgdesc="AddressSanitizer -- a fast memory error detector"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/trusty/libasan0-armhf-cross"
license=('GPL2')
depends=('libc6-armhf-cross-bin' 'libgcc1-armhf-cross-bin')
provides=('libasan0-armhf-cross')
conflicts=('libasan0-armhf-cross')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-4.8-armhf-cross/libasan0-armhf-cross_4.8.2-16ubuntu4cross0.11_all.deb")
md5sums=('55ee7425fca18a885ad4d34d44817a90')

package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

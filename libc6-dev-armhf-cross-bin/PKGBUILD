# Maintainer: toha257 <toha257@gmail.com>

pkgname=libc6-dev-armhf-cross-bin
pkgver=2.19
pkgrel=1
pkgdesc="Embedded GNU C Library: Development Libraries and Header Files (for cross-compiling)"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/trusty/libc6-dev-armhf-cross"
license=('GPL2')
depends=('libc6-armhf-cross-bin' 'linux-libc-dev-armhf-cross-bin')
provides=('libc6-dev-armhf-cross')
conflicts=('libc6-dev-armhf-cross')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/a/armhf-cross-toolchain-base/libc6-dev-armhf-cross_2.19-0ubuntu2cross1.104_all.deb")
md5sums=('9942268c1d8d2ce50e609804c23020ac')


package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

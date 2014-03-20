# Maintainer: toha257 <toha257@gmail.com>

pkgname=libc6-armhf-cross-bin
pkgver=2.19
pkgrel=1
pkgdesc="Embedded GNU C Library: Shared libraries (for cross-compiling)"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/trusty/libc6-armhf-cross"
license=('GPL2')
provides=('libc6-armhf-cross')
conflicts=('libc6-armhf-cross')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/a/armhf-cross-toolchain-base/libc6-armhf-cross_2.19-0ubuntu2cross1.104_all.deb")
md5sums=('76602a7c49f9954a995cbf17e57222c7')

package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

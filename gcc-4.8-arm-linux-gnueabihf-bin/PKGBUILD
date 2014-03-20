# Maintainer: toha257 <toha257@gmail.com>

pkgname=gcc-4.8-arm-linux-gnueabihf-bin
pkgver=4.8.2
pkgrel=1
pkgdesc="GNU C compiler"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/trusty/gcc-4.8-arm-linux-gnueabihf"
license=('GPL2')
depends=('binutils-arm-linux-gnueabihf-bin' 'cpp-4.8-arm-linux-gnueabihf-bin' 'cloog' 'libgcc-4.8-dev-armhf-cross-bin' 'libc6-dev-armhf-cross-bin')
provides=('gcc-4.8-arm-linux-gnueabihf')
conflicts=('gcc-4.8-arm-linux-gnueabihf')
if [ "$CARCH" = "i686" ]; then
	source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-4.8-armhf-cross/gcc-4.8-arm-linux-gnueabihf_4.8.2-16ubuntu4cross0.11_i386.deb")
	md5sums=('259dfe84f99bc8171dc8f233e7bd7cdc')
elif [ "$CARCH" = "x86_64" ]; then
	source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-4.8-armhf-cross/gcc-4.8-arm-linux-gnueabihf_4.8.2-16ubuntu4cross0.11_amd64.deb")
	md5sums=('6321b4f2e7dc77c2360326e422abfecb')
fi

package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

# Maintainer: toha257 <toha257@gmail.com>

pkgname=binutils-arm-linux-gnueabihf-bin
pkgver=2.24
pkgrel=2
pkgdesc="GNU binary utilities, for arm-linux-gnueabihf target"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/binutils-arm-linux-gnueabihf"
license=('GPL2')
provides=('binutils-arm-linux-gnueabihf')
conflicts=('binutils-arm-linux-gnueabihf')
if [ "$CARCH" = "i686" ]; then
	source=("http://archive.ubuntu.com/ubuntu/pool/universe/b/binutils-armhf-cross/binutils-arm-linux-gnueabihf_2.24-2ubuntu3cross1.98_i386.deb")
	md5sums=('bf0d0a06be90229c68477aa4f802437d')
elif [ "$CARCH" = "x86_64" ]; then
	source=("http://archive.ubuntu.com/ubuntu/pool/universe/b/binutils-armhf-cross/binutils-arm-linux-gnueabihf_2.24-2ubuntu3cross1.98_amd64.deb")
	md5sums=('82f8e221d556c669dfba6afe1b466b3b')
fi

package() {
	cd $pkgdir
	tar xf $srcdir/data.tar.xz
}

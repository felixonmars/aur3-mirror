# Maintainer: toha257 <toha257@gmail.com>

pkgname=cpp-arm-linux-gnueabihf-bin
pkgver=4.8.2
pkgrel=1
pkgdesc="The GNU C preprocessor (cpp) for armhf architecture"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/cpp-arm-linux-gnueabihf"
license=('GPL2')
depends=('cpp-4.8-arm-linux-gnueabihf-bin')
provides=('cpp-arm-linux-gnueabihf')
conflicts=('cpp-arm-linux-gnueabihf')
if [ "$CARCH" = "i686" ]; then
	source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-defaults-armhf-cross/cpp-arm-linux-gnueabihf_4.8.2-1_i386.deb")
	md5sums=('edf56d1da846645a54fa68bdc0ed357d')
elif [ "$CARCH" = "x86_64" ]; then
	source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-defaults-armhf-cross/cpp-arm-linux-gnueabihf_4.8.2-1_amd64.deb")
	md5sums=('6f24c539f3d6bbb60ec79e907a4e6e88')
fi

package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

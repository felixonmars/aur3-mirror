# Maintainer: toha257 <toha257@gmail.com>

pkgname=gcc-arm-linux-gnueabihf-bin
pkgver=4.8.2
pkgrel=1
pkgdesc="The GNU C compiler for armhf architecture"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/gcc-arm-linux-gnueabihf"
license=('GPL2')
depends=('cpp-arm-linux-gnueabihf-bin' 'gcc-4.8-arm-linux-gnueabihf-bin' 'libc6-dev-armhf-cross-bin')
provides=('gcc-arm-linux-gnueabihf')
conflicts=('gcc-arm-linux-gnueabihf')
if [ "$CARCH" = "i686" ]; then
	source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-defaults-armhf-cross/gcc-arm-linux-gnueabihf_4.8.2-1_i386.deb")
	md5sums=('d49bcf427aa142ef267178d193444f93')
elif [ "$CARCH" = "x86_64" ]; then
	source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-defaults-armhf-cross/gcc-arm-linux-gnueabihf_4.8.2-1_amd64.deb")
	md5sums=('612d900163d73a2128978f05a2988cab')
fi

package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

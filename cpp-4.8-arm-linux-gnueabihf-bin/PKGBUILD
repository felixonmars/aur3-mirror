# Maintainer: toha257 <toha257@gmail.com>

pkgname=cpp-4.8-arm-linux-gnueabihf-bin
pkgver=4.8.2
pkgrel=1
pkgdesc="GNU C preprocessor"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/trusty/cpp-4.8-arm-linux-gnueabihf"
license=('GPL2')
depends=('glibc' 'cloog' 'gmp' 'isl' 'mpfr' 'zlib')
provides=('cpp-4.8-arm-linux-gnueabihf')
conflicts=('cpp-4.8-arm-linux-gnueabihf')
if [ "$CARCH" = "i686" ]; then
	source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-4.8-armhf-cross/cpp-4.8-arm-linux-gnueabihf_4.8.2-16ubuntu4cross0.11_i386.deb")
	md5sums=('356717db0471e9b8917f437caeb4e816')
elif [ "$CARCH" = "x86_64" ]; then
	source=("http://archive.ubuntu.com/ubuntu/pool/universe/g/gcc-4.8-armhf-cross/cpp-4.8-arm-linux-gnueabihf_4.8.2-16ubuntu4cross0.11_amd64.deb")
	md5sums=('930c0f7c603cd495713815a3155db98d')
fi

package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

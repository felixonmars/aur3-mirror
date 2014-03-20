# Maintainer: toha257 <toha257@gmail.com>

pkgname=linux-libc-dev-armhf-cross-bin
pkgver=3.13.0
pkgrel=1
pkgdesc="Linux Kernel Headers for development"
arch=('i686' 'x86_64')
url="http://packages.ubuntu.com/trusty/linux-libc-dev-armhf-cross"
license=('GPL2')
provides=('linux-libc-dev-armhf-cross')
conflicts=('linux-libc-dev-armhf-cross')
source=("http://archive.ubuntu.com/ubuntu/pool/universe/a/armhf-cross-toolchain-base/linux-libc-dev-armhf-cross_3.13.0-12.32cross1.104_all.deb")
md5sums=('64de4e6404e1d0d1af24a75bed89edf8')


package() {
	cd $pkgdir
	tar xpJf $srcdir/data.tar.xz
}

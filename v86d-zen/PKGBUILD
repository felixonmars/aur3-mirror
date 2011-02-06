# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

_kernver="2.6.24-zen"

pkgname="v86d-zen"
pkgver="0.1.3"
pkgrel="2"
pkgdesc="v86d is the userspace helper for uvesafb that runs x86 code in an emulated environment"
url="http://dev.gentoo.org/~spock/projects/uvesafb/"
license=("GPL2")
arch=("i686" "x86_64")
makedepends=("klibc-zen" "kernel26zen")
provides=("v86d")
install=v86d.install
source=(http://dev.gentoo.org/~spock/projects/uvesafb/archive/v86d-$pkgver.tar.bz2
        v86d)
md5sums=('1c26f40af343bcc465f5832e2c9548d6'
         'd7f3d69c47be1d28f2aa9398ed50bb7f')

build() {
	cd $startdir/src/v86d-$pkgver

	./configure --default --with-klibc
	make -j1 KDIR=/usr/src/linux-$_kernver || return 1
	make     DESTDIR=$startdir/pkg install || return 1

	install -D -m644 $startdir/src/v86d \
		$startdir/pkg/lib/initcpio/install/v86d
}

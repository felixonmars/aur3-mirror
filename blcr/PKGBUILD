pkgname=blcr
pkgver=0.8.4
pkgrel=3
pkgdesc="Berkeley Labs hybrid kernel/user implementation of checkpoint/restart"
url="https://ftg.lbl.gov/projects/CheckpointRestart/"
arch=('i686' 'x86_64')
license=("BSD")
md5sums=('541f535453e92abefb7ad755fd1fb9e0')
source=("https://ftg.lbl.gov/assets/projects/CheckpointRestart/downloads/$pkgname-$pkgver.tar.gz")
makedepends=('kernel26-lts-headers' 'kernel26-lts' 'curl')

build () {
	cd $srcdir/$pkgname-$pkgver
	LTSKERNELVER=`pacman -Q kernel26-lts | cut -d " " -f 2`
	./configure --with-linux=/usr/src/linux-$LTSKERNELVER-lts
	make
}
package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR="$pkgdir" install || return 1
}

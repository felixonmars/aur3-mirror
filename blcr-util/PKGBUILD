pkgname=blcr-util
pkgver=0.8.4
pkgrel=2
pkgdesc="Berkeley Labs hybrid kernel/user implementation of checkpoint/restart utils"
url="https://ftg.lbl.gov/projects/CheckpointRestart/"
arch=('i686' 'x86_64')
license=("BSD")
md5sums=('541f535453e92abefb7ad755fd1fb9e0')
source=("http://ftp.de.debian.org/debian/pool/main/b/blcr/blcr_$pkgver.orig.tar.gz")

# Unable to fetch original source because of invalid ssl-cert
# http://ftg.lbl.gov/assets/projects/CheckpointRestart/downloads/$pkgname-$pkgver.tar.gz

makedepends=('kernel26-blcr' 'kernel26-blcr-headers')

build () {
	cd $srcdir/blcr-$pkgver
	LTSKERNELVER=`pacman -Q kernel26-blcr | cut -d " " -f 2 | cut -d "." -f1-4`
	./configure --with-linux=/usr/src/linux-$LTSKERNELVER-blcr
	cd util
	make
}
package() {
	cd $srcdir/blcr-$pkgver/util
	make DESTDIR="$pkgdir" install || return 1
}

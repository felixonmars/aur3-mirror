# Contributor: Artiom MOLCHANOV

pkgname=vloopback
pkgver=1.3
pkgrel=2
pkgdesc="The video4linux loopback device is a device driver that generates video pipes. It lets a user program feed a video stream to another as if it were coming from an actual video4linux device."
url="http://www.lavrsen.dk/twiki/bin/view/Motion/VideoFourLinuxLoopbackDevice"
depends=("kernel26<2.6.33")
makedepends=('subversion' 'kernel26-headers')
conflicts=()
license=('GPL')
arch=('i686' 'x86_64')
source=(
http://ftp.de.debian.org/debian/pool/main/v/vloopback/vloopback_1.3.orig.tar.gz
http://ftp.de.debian.org/debian/pool/main/v/vloopback/vloopback_1.3-2.diff.gz
$pkgname.install )
install=$pkgname.install
md5sums=('72512e224bc1257a606833e23f581d7b'
         'ae8db91f597d6a16f0085b2e9a8db35b'
         'a1b019d93bad8aeb072e23bbc392b2d6')
build() {
	cd $startdir/src/$pkgname-$pkgver
	patch -p1 < $startdir/src/${pkgname}_${pkgver}-$pkgrel.diff || return 1
	make || return 1
	kernelver=`uname -r`
	mkdir -p $startdir/pkg/lib/modules/$kernelver/kernel/drivers/misc
	cp vloopback.ko $startdir/pkg/lib/modules/$kernelver/kernel/drivers/misc/.
}

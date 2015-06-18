# Maintainer: Victor Korobkovsky <vitkorob@gmail.com>
pkgname=libximc
pkgver=2.8.0
pkgrel=1
epoch=
pkgdesc="Library for controlling stepper and other motors.
It provides a simple C interface for controlling and configuring engine and controller.
It uses a common virtual serial port driver embedded in all OS."
arch=('i686')
url="https://en.xisupport.com/projects/enxisupport/wiki/Software"
license=('GPL' 'LGPL')
groups=()
depends=('glibc>=2.14')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
changelog=
source=("http://files.ximc.ru/$pkgname/ximc-$pkgver.tar.gz")
noextract=()
md5sums=('54a9d48ee9724fab6cb26fd04b843d62')

package() {
	cd "ximc-$pkgver/ximc/deb/"
	ar p ${pkgname}7_$pkgver-1_i386.deb data.tar.gz | tar zxv -C $pkgdir/
	cp -r $pkgdir/lib $pkgdir/usr/
	rm -r $pkgdir/lib
}

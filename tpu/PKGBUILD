# Maintainer: Arm the Homeless <ratm@archlinux.us>
# Contributer: Arm the Homeless <ratm@archlinux.us>

pkgname=tpu
pkgver=0.2
pkgrel=4
pkgdesc="Uploads files to TinyPic and prints the result urls. If directories are given they will be recursed for images."
url="http://tinypic.com/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('zenity' 'curl' 'file')

source=('tpu')
md5sums=('0364feb16832b435d70c099c1b226e2d')

build() {
	cd $srcdir
	mkdir $pkgdir/usr $pkgdir/usr/bin
	cp tpu $pkgdir/usr/bin
	chmod a+x $pkgdir/usr/bin/tpu
	return 0
}


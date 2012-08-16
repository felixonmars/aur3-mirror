# Maintainer: karabaja4 <karabaja4@gmail.com>

pkgname=nv50-thermal
pkgver=1.5
pkgrel=2
pkgdesc="NV50 thermal module"
arch=('i686' 'x86_64')
url="http://fly.srk.fer.hr/~dule/projects/thermal/"
license=('GPL')
depends=('linux')
makedepends=('linux-headers')
install=nv50-thermal.install
source=(http://fly.srk.fer.hr/~dule/projects/thermal/nv50_thermal.tar.gz)
md5sums=('5dd6441cf4250b81ded10b786fdfb4b2')
_kernver=`uname -r`

build() {
	cd $srcdir/nv50_thermal/
	make
	mkdir -p $pkgdir/lib/modules/$_kernver/kernel/drivers/misc/
	mv nv50_thermal.ko $pkgdir/lib/modules/$_kernver/kernel/drivers/misc/
	find "${pkgdir}" -name '*.ko' -exec gzip -9 {} \;
}

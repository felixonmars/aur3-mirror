# Maintainer Kovivchak Evgen <oneonfire@gmail.com>

pkgname=fsdetect
pkgver=2.1.5
pkgrel=5
pkgdesc="Program to detect filesystem on block device"
arch=('i686' 'x86_64')
url="http://www.filesystems.nm.ru/"
license=('GPL')
depends=(util-linux)
source=("http://www.filesystems.nm.ru/my/fsdetect.tar.gz")
sha256sums=('fe1560335c1a8c89e929e5cf20f887daec6b25568419f51d25131c17f45031dd')

package() {
	cd ${srcdir}/${pkgname}
	make 	
	install -Dm755 ${pkgname} ${pkgdir}/usr/sbin/${pkgname} 
	# license 	
	install -Dm644  src/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

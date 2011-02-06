pkgname=cfourcc
pkgver=0.1.2
pkgrel=1
pkgdesc="Console avi format fourcc modifier"
url="http://sarovar.org/projects/gfourcc/"
license=('GPL')
source=(http://sarovar.org/frs/download.php/551/cfourcc-0.1.2.tar.gz)
arch=('i686' 'x86_64')
md5sums=('50e68cd5e0ea96574cab7e36595b9ad9')

build() {
	cd "$srcdir/$pkgname"
	make
	install -D cfourcc $startdir/pkg/usr/bin/cfourcc
}

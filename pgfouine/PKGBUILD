# Maintainer: Andreas Baumann <abaumann@yahoo.com>

pkgname=pgfouine
pkgver=1.2
pkgrel=1
pkgdesc="a PostgreSQL log analyzer"
url="http://pgfouine.projects.postgresql.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('php')
source=("http://pgfoundry.org/frs/download.php/2575/${pkgname}-${pkgver}.tar.gz")
md5sums=('9d15056365cd3e6447887cc765008f07')

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	install -m 755 -d $pkgdir/usr/share/$pkgname
	install -m 755 -d $pkgdir/usr/bin

	# installing pgFouine
	for i in include version.php; do
	        cp -rp $i $pkgdir/usr/share/$pkgname/
	done

	install -m 755 pgfouine.php $pkgdir/usr/bin/
	install -m 755 pgfouine_vacuum.php $pkgdir/usr/bin

	echo "Add /usr/share/pgfouine/:/usr/share/pgfouine/include/ to 'include_path' in '/etc/php/php.ini'"
}

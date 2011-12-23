# Maintainer: Viliam Šimovič <vilosim@gmail.com>
# Contributor: Viliam Šimovič <vilosim@gmail.com>

pkgname=cvsgraph
pkgver=1.7.0
pkgrel=1
pkgdesc="Utility to make graphs of revisions and branches from CVS repositories"
arch=('i686' 'x86_64')
url="http://www.akhphd.au.dk/~bertho/cvsgraph/"
license=('GPL2')
depends=('gd')
makedepends=('gd')
source=("http://www.akhphd.au.dk/~bertho/cvsgraph/release/cvsgraph-${pkgver}.tar.gz")
md5sums=('8194c0c6f6837fcfa3ad0fab5dfc0597')

build() {
	cd "$srcdir/cvsgraph-${pkgver}"

	./configure --prefix=/usr --sysconfdir=/etc --with-gd

	make

	gzip cvsgraph.1
	gzip cvsgraph.conf.5
}

package() {
	cd "$srcdir/cvsgraph-${pkgver}"

	install -D cvsgraph $pkgdir/usr/bin/cvsgraph
	install -D -m 644 cvsgraph.1.gz $pkgdir/usr/share/man/man1/cvsgraph.1.gz
	install -D -m 644 cvsgraph.conf.5.gz $pkgdir/usr/share/man/man5/cvsgraph.conf.5.gz
	install -D -m 644 cvsgraph.conf $pkgdir/etc/cvsgraph.conf
}

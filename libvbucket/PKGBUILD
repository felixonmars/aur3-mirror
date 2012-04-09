pkgname=libvbucket
pkgver=1.8.0.3
pkgrel=1
pkgdesc="Couchbase connection library"
url='http://www.couchbase.com/develop/c/current'
arch=('i686' 'x86_64')
license=('Apache 2.0')
depends=('perl')
source=(http://packages.couchbase.com/clients/c/${pkgname}-${pkgver}.tar.gz)
md5sums=('828050443cb47735816ff8e296e65a7f')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir/" install
	install -Dm644 ${srcdir}/${pkgname}-${pkgver}/LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

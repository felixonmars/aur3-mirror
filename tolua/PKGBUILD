# Maintainer: Andreas Baumann <abaumann@yahoo.com>

pkgname=tolua
pkgver=5.2.0
pkgrel=1
pkgdesc="tool for integration of C/C++ code with Lua"
url="http://webserver2.tecgraf.puc-rio.br/~celes/tolua/"
license=('custom')
arch=('i686' 'x86_64')
depends=('lua')
options=('staticlibs')
source=("http://webserver2.tecgraf.puc-rio.br/~celes/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('c5b4084f3a828d35646e08282050afbd')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make

	install -d -m 0755 $pkgdir/usr/bin
	install -d -m 0755 $pkgdir/usr/include
	install -d -m 0755 $pkgdir/usr/lib
	install -d -m 0755 $pkgdir/usr/share/licenses/$pkgname

	sed -n '/tolua is freely/,/ modifications./p' README > LICENSE
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	install -m 0755 bin/tolua $pkgdir/usr/bin
	install -m 0644 include/tolua.h $pkgdir/usr/include
	install -m 0644 lib/libtolua.a $pkgdir/usr/lib
	install -m 0644 LICENSE $pkgdir/usr/share/licenses/$pkgname
}

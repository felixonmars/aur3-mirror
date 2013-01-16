# Maintainer: CRT <crt.011@gmail.com>
# Contributor: Mathieu Gauthier <mathgl@freesurf.fr>
pkgname=mysqltcl
pkgver=3.052
pkgrel=1
pkgdesc="Tcl Mysql Interface."
arch=('i686' 'x86_64')
url="http://www.xdobry.de/mysqltcl/"
license=('BSD')
md5sums=('3ee7962f7f994cb1e217236a11d0cf4c')
depends=('libmysqlclient' 'tcl')
source=("http://www.xdobry.de/${pkgname}/${pkgname}-${pkgver}.tar.gz")

build(){
	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr --enable-threads --enable-shared
	make 
	make DESTDIR="${pkgdir}/" install	
	pushd "${pkgdir}/usr"
	rm -r bin
	rm -r include
	popd
}

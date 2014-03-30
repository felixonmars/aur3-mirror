#maintainer perlawk

pkgname=csvdb
pkgver=0.5.1
pkgrel=1
pkgdesc="csvdb is an SQL engine for csv,allowing files to be searched and modified as if they were database tables."
url="http://code.google.com/p/csvfix/"
arch=('i686' 'x86_64')
license=('custom')
depends=('gcc-libs')
source=( "https://github.com/darkrose/csvdb/archive/master.zip" )
#csvdb-master.zip)
build() {
	cd "$pkgname-master"
	autoreconf -i
	./configure --prefix=/usr
	make 
}

package() {
	cd "$pkgname-master"
	#install -D -m 0755 "${pkgname}/src/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	#install -D -m 0755 "${pkgname}/src/.lib/libcsvdb.so*" "${pkgdir}/usr/bin/"
	make DESTDIR="$pkgdir/" install
}

md5sums=('74d07360b5b910bd6d0d49b92a340dc0')

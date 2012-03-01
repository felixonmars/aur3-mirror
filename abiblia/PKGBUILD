# Contributor: André Vitor de Lima Matos <andre.vmatos@gmail.com>
pkgname=abiblia
pkgver=2.4
pkgrel=1
pkgdesc="Biblia Sagrada versao Joao Ferreira de Almeida"
url="http://www.comunidadeabiblia.net"
license="GPL"
arch=('i686' 'x86_64')
depends=('sqlite3' 'qt>=4.6')
makedepends=('cmake>=2.8')
source=("http://sourceforge.net/projects/abiblia/files/aBiblia%20Software/${pkgver}/${pkgname}-${pkgver}.0.tar.gz")
md5sums=("1d89dae7da65e09de7acc4db36fa650a")

build() {
	cd ${srcdir}/${pkgname}
	rm -rf build
	mkdir build
	cd build
	cmake ..
	make
	make DESTDIR=${pkgdir} install
}

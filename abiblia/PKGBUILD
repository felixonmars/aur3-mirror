# Contributor: André Vitor de Lima Matos <andre.vmatos@gmail.com>
pkgname=abiblia
pkgver=2.2
pkgrel=2
pkgdesc="Biblia Sagrada versao Joao Ferreira de Almeida"
url="http://www.comunidadeabiblia.net"
license="GPL"
arch=('i686' 'x86_64')
depends=('sqlite3' 'qt>=4.6.2')
source=("http://release.comunidadeabiblia.net/${pkgver}/abiblia-${pkgver}-${pkgrel}-source.tar.gz")
md5sums=("a03d9735e387706785eae60a77be5d89")

build() {
	cd ${srcdir}/${pkgname}
	./configure -p ${pkgdir}
	make
	make install
}


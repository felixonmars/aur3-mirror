# Contributor: André Vitor de Lima Matos <andre.vmatos@gmail.com>
pkgname=abiblia
pkgver=2.3
pkgrel=1
pkgdesc="Biblia Sagrada versao Joao Ferreira de Almeida"
url="http://www.comunidadeabiblia.net"
license="GPL"
arch=('i686' 'x86_64')
depends=('sqlite3' 'qt>=4.6.2')
source=("http://release.comunidadeabiblia.net/${pkgver}/abiblia-${pkgver}-source.tar.gz")
md5sums=("d7e6f3a4a49c78e831e36e76d117481d")

build() {
	cd ${srcdir}/${pkgname}
	./configure -p ${pkgdir}
	make
	make install
}


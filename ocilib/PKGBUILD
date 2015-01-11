# Maintainer: Milos Negovanovic <milos.negovanovic@gmail.com>

pkgname=ocilib
pkgver=4.0.0
pkgrel=1
pkgdesc='OCILIB (C and C++ Driver for Oracle)'
arch=('i686' 'x86_64')
url='http://orclib.sourceforge.net/'
license=('GNU LESSER GENERAL PUBLIC LICENSE Version 2.1')
source=("http://downloads.sourceforge.net/project/orclib/OCILIB%20Sources/4.0.0/ocilib-4.0.0-gnu.tar.gz")
md5sums=('a19063c775eadb4c0d22edbd82280ac2')

build() {
	if ! env | grep -q ^ORACLE_HOME=
	then
		echo ORACLE_HOME is not exported
		exit 1
	fi
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
}

package() {
	cd ${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install
}

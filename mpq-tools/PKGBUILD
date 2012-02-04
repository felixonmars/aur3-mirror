# Contributor: Paolo Giangrandi <peoro.noob@gmail.com>
#Maintainer: Nathan O <ndowens.aur at gmail dot com>
pkgname=mpq-tools
pkgver=0.4.2
pkgrel=4
pkgdesc="A few tools to manipulate mpq archives and to show libmpq usage."
arch=('i686' 'x86_64')
url="https://libmpq.org/"
license="GPL"
depends=('glibc' 'libmpq')
options=('!libtool')
source=(http://libmpq.org/download/${pkgname}-${pkgver}.tar.bz2)
md5sums=('68fe3081dd1992fd533a583eb11428b7')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./autogen.sh 
	./configure --prefix=/usr 
	make 
}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR=${pkgdir} install 
}


# Contributor: Paolo Giangrandi <peoro.noob@gmail.com>
# Maintainer: Nathan O <ndowens.aur at gmail dot com>

pkgname=libmpq
pkgver=0.4.2
pkgrel=4
pkgdesc="A library which can be easily used in applications and a set of tools for manipulating mpq archives."
arch=('i686' 'x86_64')
url="https://libmpq.org/"
license="GPL2"
depends=('zlib' 'sh' 'bzip2')
options=('!libtool')
source=(http://libmpq.org/download/${pkgname}-${pkgver}.tar.bz2)
md5sums=('54ec039b9654ba1662485e1bc9682850')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	export PYTHON=python2
	./autogen.sh 
	./configure --prefix=/usr 
	make 

}
package() {
    cd ${srcdir}/${pkgname}-${pkgver}
		make DESTDIR=${pkgdir} install
}


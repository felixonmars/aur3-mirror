#Contributor: MCMic <come.bernigaud@laposte.net>

pkgname=libeo
pkgver=1.3.1
pkgrel=2
pkgdesc="Evolving Objects is a template-based, ANSI-C++ evolutionary computation library which helps you to write your own stochastic optimization algorithms insanely fast."
arch=('i686' 'x86_64')
url="http://eodev.sourceforge.net/"
license=('LGPL')
depends=()
makedepends=('make' 'cmake')
conflicts=()
source=("http://sourceforge.net/projects/eodev/files/eo/$pkgver/EO-${pkgver}.zip/download" 
        "remove_warning.patch")
md5sums=('99ebeff7bc7cab2db7b7ec0bff2289ca'
         '7e4825f830b976ca42e8be3fae9b8de6')

build() {
	cd $srcdir/eo

    patch -p1 < ../remove_warning.patch

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release .
	make
}

package() {
	cd $srcdir/eo

	make install DESTDIR=$pkgdir
}


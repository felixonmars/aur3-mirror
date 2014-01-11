# Maintainer: Joel Teichroeb <joel@teichroeb.net>

pkgname=oovcde-svn
pkgver=20140110
pkgrel=1
pkgdesc="C++ build, class and sequence design and diagram tool"
arch=(i686 x86_64)
url="http://oovcde.sourceforge.net/"
license=('GPL2')
depends=('clang' 'gtk3')
makedepends=('svn' 'cmake')
source=(svn://svn.code.sf.net/p/oovcde/code/trunk)
sha1sums=('SKIP')

build() {
	cd trunk
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make
}

package() {
	cd trunk/build
	make DESTDIR=${pkgdir} install

}

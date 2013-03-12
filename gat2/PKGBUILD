pkgname=gat2
pkgver=20130313
pkgrel=1
pkgdesc="Easy counter and timer."
arch=('i686' 'x86_64')
url="https://github.com/opamp/gat2"
license=('BSD')
depends=('qt5-base' 'qt5-xmlpatterns' 'qt5-multimedia' 'qt5-imageformats' 'qt5-tools')
makedepends=('cmake' 'git')

_gitroot="git://github.com/opamp/gat2.git"
_gitname="gat2"


build() {
	cd ${srcdir}
	msg "git clone from ${_gitroot}"
	git clone ${_gitroot} $pkgname
	cd $pkgname 
	git checkout -b build 2.6.0 &&mkdir build &&cd build
	
	msg "run CMake command."
	cmake -DCMAKE_INSTALL_PREFIX=/usr ../ 
	msg "start building"
	make
}

package() {
	cd $srcdir/$pkgname/build
	make DESTDIR="$pkgdir" install
}

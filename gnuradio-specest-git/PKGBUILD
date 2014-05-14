# Maintainer: Stephen Zhang<zsrkmyn@gmail.com>
pkgname=gnuradio-specest-git
_pkgname=gr-specest
pkgver=0.110.093bc21
pkgrel=1
pkgdesc="gr-specest modules for GnuRadio"
arch=('x86_64' 'i686')
url="https://github.com/kit-cel/gr-specest"
license=('GPL3')
depends=('gnuradio'
	'swig'
	'libuhd')
makedepends=('gcc-fortran' 'cmake')
source=("git+https://github.com/kit-cel/gr-specest.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd "$srcdir/$_pkgname"
	mkdir build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr/" ..
	make
}

package() {
	cd "$srcdir/$_pkgname/build"
	make install
}

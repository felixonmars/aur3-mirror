# Maintainer: docwild <jacksawild at hotmail dot co dot uk>

pkgname=poly2tri-hg
pkgver=1.0
pkgrel=1
pkgdesc="Polygon Triangulation C++ Library"
arch=('i686' 'x86_64')
url="https://code.google.com/p/poly2tri/"
license=('New BSD License')
makedepends=('cmake' 'mercurial')
source=( "CMakeLists.txt") 
md5sums=('8e76b9b81aa72fe6049dac1a31ea17bd')
_hgroot="https://code.google.com/p/poly2tri/"


build() {
	cd ${srcdir}
	echo ${srcdir}
	msg "Downloading source from ${_hgroot}"

	if [ -d poly2tri ] ; then
		cd poly2tri
		hg pull -q "${_hgroot}" || return 1
	else
		hg clone -q "${_hgroot}" || return 1
		cd poly2tri
	fi
	cd ${srcdir}
	#mv ../CMakeLists.txt .
	cmake -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
  cd "$srcdir/"
  make DESTDIR="$pkgdir" install
  
}
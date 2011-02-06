 
# Maintainer: (were_vire) Jonathan Fine <were.Vire@gmail.com>

pkgname=cmaked
pkgver=29
pkgrel=1
pkgdesc="CMakeD is a CMake module for the D programming language."
arch=('i686' 'x86_64')
url="http://www.dsource.org/projects/cmaked"
license=('custom')
makedepends=('cmake')
source=("http://www.dsource.org/projects/cmaked/changeset/29/trunk?old_path=%2F&format=zip")
md5sums=("67750f2d42b04ef591e414d8baf8a894")
optdepends=('dmd: required to compile D source files' 'gdc: alternative to dmd')

build(){
	cd $srcdir/trunk/cmaked
	cmake CMakeLists.txt || return 1
	make || return 1
	make DESTDIR="$pkgdir/" install || return 1
}
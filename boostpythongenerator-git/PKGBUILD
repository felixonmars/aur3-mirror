# Contributor: Douglas Soares de Andrade <douglas@archlinux.org>

pkgname=boostpythongenerator-git
_pkgname=boostpythongenerator
pkgver=20090819
pkgrel=1
pkgdesc="Python binding generator based on Boost.Python"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://www.pyside.org"
depends=('apiextractor-git' 'python' 'qt')
makedepends=('cmake' 'git' 'automoc4')
conflicts=()

_gitroot='git://gitorious.org/pyside/boostpythongenerator.git'
_gitname='boostpythongenerator'

build() {
	cd "$srcdir"

	msg "Connecting to gitorious GIT server...."

	if [ -d ${srcdir}/$_gitname ] ; then
		cd $_gitname
		git pull . master
		git submodule update --init
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
		cd $_gitname
		git submodule update --init
	fi

	msg "GIT checkout done."

	cd ..
	if [ -d build ] ; then
		rm -rf build
	fi
	mkdir build
	cd build
	cmake ${srcdir}/$_gitname \
	-DCMAKE_INSTALL_PREFIX=/usr || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install
}



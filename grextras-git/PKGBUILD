# Maintainer: qs9rx < that nick at enjoys döt it>
pkgname=grextras-git
pkgver=20121111
pkgrel=1
pkgdesc="A set of extensions and features to the GNU Radio Project"
url="https://github.com/guruofquality/grextras"
depends=('gnuradio' 'python')
optdepends=('libuhd')
makedepends=('git' 'cmake' 'swig' 'boost-libs')
arch=('i686' 'x86_64')
license=('unknown')

_gitroot=git://github.com/guruofquality/grextras.git
_gitname=grextras

build() {
	export PYTHON=python2
	cd ${srcdir}
	if [ -d $_gitname ]; then
		cd $_gitname && git reset HEAD --hard && git clean -x -d -f && git pull origin
		msg "Updated the local files."
	else
		git clone $_gitroot
		msg "GIT checkout done or server timeout"
		cd $_gitname
	fi
	msg "Starting build."
	mkdir build
	cd build
	cmake -DPYTHON_EXECUTABLE=$(which python2) -DCMAKE_INSTALL_PREFIX=/usr ../
	make $MAKEFLAGS
}

check()
{
	cd ${srcdir}/$_gitname/build
	export PYTHON=python2
	#make test
}

package()
{
	msg "Replacing filenames to use python2."
	sed -i -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $(find ${srcdir} -name '*.py') $(find ${srcdir} -name 'grcc')
	cd ${srcdir}/$_gitname/build
	make DESTDIR=${pkgdir} install
}
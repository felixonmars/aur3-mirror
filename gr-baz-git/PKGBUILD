# Maintainer: Adam Nielsen <a.nielsen@shikadi.net>
# Contributor: Alain Kalker <a.c.kalker@gmail.com>
# Based on: gnuradio-git by Moritz Fischer <moritz.fischer@student.kit.edu>
pkgname=gr-baz-git
pkgver=20150405
pkgrel=1
pkgdesc="Balint Seeber's collection of new blocks for GNU Radio"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gnuradio')
makedepends=('git')
provides=('gr-baz')
url="http://wiki.spench.net/wiki/Gr-baz"
source=("git://github.com/balint256/gr-baz.git")
md5sums=("SKIP")

build() {
	cd "${srcdir}/gr-baz"
	mkdir -p build
	cd build
	export PYTHON=python2
	cmake \
		-DPYTHON_EXECUTABLE=$(which python2) \
		-DPYTHON_INCLUDE_DIR=$(echo /usr/include/python2*) \
		-DPYTHON_LIBRARY=$(echo /usr/lib/libpython2.*.so) \
		-DCMAKE_INSTALL_PREFIX=/usr -Wno-dev ../
	make
}

package()
{
	cd "${srcdir}/gr-baz/build"
	make DESTDIR=${pkgdir} install
	msg "Replacing filenames to use python2."
	sed -i -e "s|#![ ]*/usr/bin/env python\s*$|#!/usr/bin/env python2|" $(find $pkgdir -name '*.py')
}

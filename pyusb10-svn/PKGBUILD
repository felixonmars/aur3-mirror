# Maintainer: Tim Hatch <tim@timhatch.com>
# Contributor: Jason Giangrande <jgiangrande@clarku.edu>

pkgname=pyusb10-svn
pkgver=91
pkgrel=1
pkgdesc="A native Python module written in C which provides USB access."
arch=('i686' 'x86_64')
url="http://pyusb.berlios.de/"
license=('GPL')
depends=('python' 'libusb')
conflicts=('pyusb' 'pyusb10')
source=()
md5sums=()


_svntrunk="https://pyusb.svn.sourceforge.net/svnroot/pyusb/"
_svnmod="pyusb"

build() {

	cd ${srcdir}

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co https://pyusb.svn.sourceforge.net/svnroot/pyusb $_svnmod
	fi

	cd ${srcdir}/${_svnmod}/trunk/

	# python2 fix
	for file in `find ./ -name "*.py"`; do
	    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
	    sed -i 's_#!/usr/bin/python_#!/usr/bin/python2_' $file
	done

	python2 setup.py install --root=${pkgdir} || return 1

}

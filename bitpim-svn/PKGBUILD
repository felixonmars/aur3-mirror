# Maintainer: Matthew Bauer <mjbauer95@gmail.com>

pkgname=bitpim-svn
pkgver=4835
pkgrel=1
pkgdesc="A program to view and manipulate data on many CDMA phones from LG, Samsung, Sanyo, etc (SVN)."
arch=('i686' 'x86_64')
url="http://www.bitpim.org/"
license=('GPL')
depends=('python' 'gtk2' 'libusb' 'libstdc++5' 'gmp' 'libsm' 'libxxf86vm' 'python-pyserial' 'python-apsw' 'wxpython')
makedepends=('subversion')
source=('usr-bin' 'desktop-shortcut')
provides=('bitpim')
md5sums=('b0eb7983a25e47d1056f6b827bf4ea16'
         '3b81f536725f336186084323ee193fd1')

_svntrunk=https://bitpim.svn.sourceforge.net/svnroot/bitpim/trunk/bitpim/
_svnmod=bitpim

build() {
	cd ${srcdir}

	mkdir -p ${pkgdir}/usr/bin
	install -m 755 usr-bin ${pkgdir}/usr/bin/bitpim

	mkdir -p ${pkgdir}/usr/share/applications
	cp desktop-shortcut ${pkgdir}/usr/share/applications/bitpim.desktop

	if [ -d $_svnmod/.svn ]; then
		(cd $_svnmod && svn up -r $pkgver)
	else
		svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
	fi

	cd $_svnmod

	mkdir -p ${pkgdir}/usr/share/bitpim
	cp -r help helpers resources src ${pkgdir}/usr/share/bitpim

        sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
               -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
          $(find $pkgdir -name '*.py')
}

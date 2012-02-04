# Maintainer: Christian Waldherr <woodghost@online.de>
pkgname=kontrollerlab-svn
pkgver=168
pkgrel=1
pkgdesc="The KontrollerLab is an IDE for developing software for Atmel(r) AVR(c) 
microcontrollers using the avr-gcc compiler, the uisp and the avrdude upload 
software."
arch=(i686)
url="http://sourceforge.net/projects/kontrollerlab/"
license="GNU General Public License (GPL)"
depends=('kdelibs' 'gcc-avr')
source=()
md5sums=()

_svntrunk=https://kontrollerlab.svn.sourceforge.net/svnroot/kontrollerlab/trunk
_svnmod=kontrollerlab
_revnumber=$pkgver

build() {
	cd $startdir/src/
	touch ~/.subversion
	msg "Connecting to sourceforge.net SVN server...."
	svn co $_svntrunk --config-dir ./ -r $_revnumber $_svnmod
	cd $_svnmod
	make -f Makefile.cvs
	./configure --prefix=/opt/kde
	make || return 1
	make prefix=$startdir/pkg/opt/kde install
}

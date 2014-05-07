# Maintainer: Andrew Boktor

pkgname=eepe-svn
pkgver=405
pkgrel=1
pkgdesc="EEPROM Editor for er9x FW"
arch=('i686' 'x86_64')
url="http://code.google.com/p/eepe/"
license=('GPLv2')
depends=('qt4' 'avrdude')
makedepends=('subversion' 'qt4' 'make')
conflicts=('eepe')
provides=('eepe')

source=("$pkgname"::'svn+http://eepe.googlecode.com/svn/trunk/'
		'rm.patch')
sha1sums=('SKIP'
		'b0b6860734e69e1ece707d4e7665f8d518909c74')

pkgver() {
	cd $pkgname
	local ver="$(svnversion)"
	printf "%s" "${ver//[[:alpha:]]}"
}

build() {
	cd $pkgname/src
	patch -p1 -i $srcdir/rm.patch
	qmake-qt4 eepe.pro
	make
}

package() {
	cd $pkgname/src
	make INSTALL_ROOT="$pkgdir" install
}

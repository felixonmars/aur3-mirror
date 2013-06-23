# Maintainer: lobotomius at gmail dot com
# Contributor: lobotomius at gmail dot com

pkgname=64tass-svn
pkgver=488  
pkgrel=1
pkgdesc="6502/65C02/R65C02/W65C02/65CE02/65816/DTV/65EL02 Turbo Assembler"
arch=('i686' 'x86_64')
url='http://tass64.sourceforge.net'
license=('GPL')
makedepends=('subversion')
source=('svn+http://svn.code.sf.net/p/tass64/code/trunk')
md5sums=('SKIP')
sha1sums=('SKIP')

pkgver() {
	cd trunk
	svnversion | tr -d [A-z]
}

build() {
	cd "$srcdir/trunk"
	make
}

package() {
	cd "$srcdir/trunk"
	mkdir -p "$pkgdir/usr/bin"
	install -m 755 64tass "$pkgdir/usr/bin"
}

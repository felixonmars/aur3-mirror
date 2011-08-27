# Contributor: Arlekino <arlekino.zirk@gmail.com>

pkgname=ecomorph
pkgver=6.2
pkgrel=2
pkgdesc="Compiz effects for E17. This package is made to run alongside Arch's E17 snapshots without overwriting them." 
arch=('i686' 'x86_64')
url="http://code.google.com/p/itask-module/wiki/Stuff" 
license=('GPL') 
depends=('libxslt' 'mesa' 'e-svn')
makedepends=('intltool' 'git' 'automake' 'pkgconfig')
options=(!libtool)
source=()
md5sums=()

build() { 

	git clone git://github.com/jeffdameth/ecomp.git
	git clone git://github.com/jeffdameth/ecomorph.git

	cd $srcdir/ecomp
	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install || return 1

	cd $srcdir/ecomorph
	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=$pkgdir install || return 1

}

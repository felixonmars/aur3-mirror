 #!/bin/bash
# Maintainer: Alireza Savand < alireza.savand with love gmail :|>

pkgname=yodownet-git
pkgver=20140223
pkgrel=1
pkgdesc="yoDownet, The Previous Generation Graphical Download Manager, Implemented on Qt"
arch=(any)
url="http://sourceforge.net/projects/yodownet"
license=("GPL3")
makedepends=('git' 'qt5-base' 'qt5-translations' 'make')
depends=('qt5-base')
provides=("yodownet")
conflicts=("yodownet")

_gitroot="https://github.com/Alir3z4/yoDownet.git"
_gitname=yodownet

build() {
	cd "$srcdir"
	
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
	else
		git clone $_gitroot $_gitname
	fi

	rm -rf "$srcdir/$_gitname-build"
	git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
	cd "$srcdir/$_gitname-build"

	lrelease yoDownet.pro || return 1
	qmake -config release || return 1
	make || return 1
}

package() {
	cd "$srcdir/$_gitname-build"
	make install INSTALL_ROOT=$pkgdir || return 1
}

# Maintainer: Alireza Savand < alireza.savand@gmail.com>

pkgname=qdjango-git
pkgver=7bfd84f9a8
pkgrel=1
pkgdesc="QDjango, a Qt-based C++ web framework"
arch=(any)
url="https://github.com/jlaine/qdjango/"
license=("GPLv3")
makedepends=('git' 'cmake' 'make')
depends=("qt4")
provides=("qdjango")
conflicts=("qdjango")

_gitroot="git@github.com:jlaine/qdjango.git"
_gitname=qdjango

build() {
	cd "$srcdir"
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
	else
		git clone $_gitroot $_gitname
	fi
	
	mkdir -p "$srcdir/$_gitname/build"
	cd "$srcdir/$_gitname/build"
	qmake PREFIX=/usr .. 
	make -j12
}

package() {
	cd "$srcdir/$_gitname/build"
	make install INSTALL_ROOT=$pkgdir
	rm -rf $pkgdir/tests $pkgdir/usr/tests
}

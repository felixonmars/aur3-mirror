# Maintainer: Andreas B. Wagner <AndreasBWagner@pointfree.net>
# Contributor: Simo Leone <neotuli@gmail.com>
pkgname=xpp
pkgver=1.5
pkgrel=8
pkgdesc="X Printing Panel"
arch=('i686' 'x86_64')
url="http://cups.sourceforge.net/xpp"
license=('GPL2')
depends=('cups>=1.1.9' 'fltk>=1.0.7')
options=('!makeflags')
makedepends=('fltk')
source=("http://download.sourceforge.net/cups/$pkgname-$pkgver.tar.gz"
        'xpp-1.5.patch'
        'fltk-1.3_fix.patch'
        'xpp-error-fixes.patch')
md5sums=('775fd69c464515da0c3295d04d0c747f'
         '924bf76fb414a328a6e7d64549b26ef0'
         '20dffc33ed8ccb0b517d42b2699977f6'
         '938efa0bb22db39d579b83b62c6c9003')

build() {
	cd $srcdir/$pkgname-$pkgver
	patch < ../xpp-1.5.patch
	patch < ../fltk-1.3_fix.patch
	patch cupshelper.cxx < ../xpp-error-fixes.patch

	# libcups 1.5.0 compatibility fix -- as in gtklp PKGINFO
	sed -i "30i#include <cups/ppd.h>" $pkgname.h

	# because of compile error: cupshelper.cxx:155:58: error: ‘sprintf’ was not declared in this scope
	sed -i "38i#include <stdio.h>" cupshelper.cxx

	export CXXFLAGS="$CXXFLAGS -D_IPP_PRIVATE_STRUCTURES"
	export CFLAGS="$CFLAGS -D_IPP_PRIVATE_STRUCTURES"
	./configure --prefix=/usr
}

package() {
	cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir/ install
}


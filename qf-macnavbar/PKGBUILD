# Maintainer: Piotr Maliński <riklaunim@gmail.com>
# Contributor: Piotr Maliński <riklaunim@gmail.com>

pkgname=qf-macnavbar
pkgver=0.0.1
pkgrel=1
pkgdesc="QfMacNavBar is a Qt4 widget designed to be similar to Mac OS X 10.5 Sidebar used in Applications like Finder, Mail."
url="http://www.qt-apps.org/content/show.php/show.php?content=78749"
depends=('qt')
makedepends=('qt')
arch=('x86_64 i686')
source=("http://www.qt-apps.org/CONTENT/content-files/78749-qf-macnavbar.tar.bz2")
md5sums=('9100b188ee54e1dc6bf33bd9bb045a4a')
license=('GPL')

build() {
	cd $startdir/src/MacNavBar
	qmake
	make || return 1
	mkdir -p $startdir/pkg/usr/include/qf-macnavbar
	cp include/*.h $startdir/pkg/usr/include/qf-macnavbar/
	
	patch -p0 $startdir/src/MacNavBar/example/main.cpp <${startdir}/icon.patch
	cd $startdir/src/MacNavBar/example
	qmake
	make || return 1
	cd $startdir/src/MacNavBar
	mkdir -p $startdir/pkg/usr/bin
	cp example/example $startdir/pkg/usr/bin/qf-macnavbar-example
	
	mkdir -p $startdir/pkg/usr/lib
	cp bin/libMacNavBar.so.1.0.0 $startdir/pkg/usr/lib/
	pushd $startdir/pkg/usr/lib/
		ln -s libMacNavBar.so.1.0.0 libMacNavBar.so.1.0
		ln -s libMacNavBar.so.1.0.0 libMacNavBar.so.1
		ln -s libMacNavBar.so.1.0.0 libMacNavBar.so
	popd
	
	mkdir -p $startdir/pkg/usr/share/qf-macnavbar/icons/
	cp example/icons/* $startdir/pkg/usr/share/qf-macnavbar/icons/
}

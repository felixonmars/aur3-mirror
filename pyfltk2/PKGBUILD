# Contributor: David Baumgarten <David_Baumgarten@gmx.net>

pkgname=pyfltk2
pkgver=1.0.0b1
pkgrel=1
_origpkgname=pyFltk2
pkgdesc="Python wrapper for Fast Light Tool Kit cross-platform GUI library"
url="http://pyfltk.sourceforge.net"
license=('LGPL')
arch=('i686')
depends=('mesa' 'libgl' 'fltk2-static-svn>=r5940' 'python>=2.4')
makedepends=('python>=2.4' 'swig>=1.3.30')
source=(http://downloads.sourceforge.net/pyfltk/pyFltk2-$pkgver.tar.gz)
md5sums=('37cbab21f7fa0ea0da200f1cac675bbc')

build() {
	mkdir -p $startdir/pkg/usr/share/pyfltk2/docs/
	cp -R $startdir/src/$_origpkgname-$pkgver/fltk2/docs/* $startdir/pkg/usr/share/pyfltk2/docs/ 
	mkdir -p $startdir/pkg/usr/share/pyfltk2/test/
	cp -R $startdir/src/$_origpkgname-$pkgver/fltk2/test/* $startdir/pkg/usr/share/pyfltk2/test/ 
	cd $startdir/src/$_origpkgname-$pkgver/python
	python MakeSwig.py
	cd $startdir/src/$_origpkgname-$pkgver
	python setup.py build install --prefix=/usr --root=$startdir/pkg/
}

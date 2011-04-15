# Maintainer: Qi Wenmin <qiwenmin(at)gmail(dot)com>, Mat <matlinuxer2@gmail.com>
pkgname=openvanilla-modules
pkgver=0.9.1
pkgrel=1
pkgdesc="openvanilla modules for ucimf."
arch=("i686" "x86_64")
license=('New BSD License, http://openvanilla.googlecode.com/svn/trunk/License/LICENSE.txt')
url="http://code.google.com/p/ucimf/"
depends=()
source=("http://ucimf.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('3c209d90dbc6b681145ee167b89f118c')

build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make DESTDIR=${startdir}/pkg install || return 1
}

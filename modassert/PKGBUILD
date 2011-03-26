# Contributor: bountykiller <masse.nicolas@gmail.com>
pkgname=modassert
pkgver=2.0.1
pkgrel=1
pkgdesc="Advanced assertion framework for C++"
arch=(i686 x86_64)
url="http://modassert.sourceforge.net/"
license=('wxwindows')
depends=('wxgtk' 'richbool>=2.0.1')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('f5aebae5f7202a571e98d7d7562e41b7')
build () {
	cd $startdir/src/$pkgname-$pkgver/
	./configure --prefix=/usr
	make
	make DESTDIR=$startdir/pkg install
}

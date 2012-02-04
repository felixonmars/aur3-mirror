# Contributor: bountykiller <masse.nicolas@gmail.com>
pkgname=richbool
pkgver=2.0.1
pkgrel=1
pkgdesc="An advanced portable C++ library of over 50 boolean-like macros that hold an analysis if the condition fails, to help debugging"
arch=(i686 x86_64)
url="http://modassert.sourceforge.net/"
license=('wxwindows')
depends=('gcc')
source=(http://downloads.sourceforge.net/rich-booleans/$pkgname-$pkgver.tar.bz2)
md5sums=('631c3af2a57098999314495f0ae0f289')
build () {
	cd $startdir/src/$pkgname-$pkgver/
	./configure --prefix=/usr
	make
	make DESTDIR=$startdir/pkg install
}

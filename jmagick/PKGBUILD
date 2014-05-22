# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: Artyom Olshevskiy <siasiamail@gmail.com>
pkgname=jmagick
pkgver=6.4.0
pkgrel=2
pkgdesc="Open source Java interface of ImageMagick"
url="http://www.jmagick.org"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('imagemagick' 'java-environment')
makedepends=('java-environment')
source=(http://downloads.$pkgname.org/$pkgver/$pkgname-$pkgver-src.tar.gz)
md5sums=('c364aeb7a0a002605fb1fc72cb545360')
build() {
	cd $srcdir/$pkgver/
	./configure --prefix=/usr
	make || return 1
}

package() {
	cd $srcdir/$pkgver/
	make DESTDIR="$pkgdir/" install
	cd $pkgdir/usr/lib
	ln -snf libJMagick-$pkgver.so libJMagick.so

}

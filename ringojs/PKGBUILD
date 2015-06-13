# $Id: pkgbuild-mode.el,v 1.23 2007/10/20 16:02:14 juergen Exp $
# Maintainer: perlawk

pkgname=ringojs
pkgver=0.11
pkgrel=1
pkgdesc="A rhino derived javascript"
url="http://ringojs.org/"
arch=(x86_64 i686)
license=('GPL')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("http://ringojs.org/downloads/${pkgname}-${pkgver}.tar.gz")

package() {
	# echo http://github.com/downloads/ringo/ringojs/
	mkdir -p $pkgdir/opt/
	mkdir -p $pkgdir/usr/bin
	cp -a $srcdir/$pkgname-$pkgver/ $pkgdir/opt/$pkgname
	cd $pkgdir/usr/bin
	ln -s ../../opt/$pkgname/bin/ringo
	ln -s ../../opt/$pkgname/bin/ringo-admin
	ln -s ../../opt/$pkgname/bin/ringo-web
	ln -s ../../opt/$pkgname/bin/narwhal
} 
md5sums=('f4dc0c2d0ba77293bcba55b595025c82')
